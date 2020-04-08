//
//  BeersListViewController.m
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "BeersListViewController.h"

@interface BeersListViewController ()

@end

@implementation BeersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"BeerCell" bundle:nil] forCellReuseIdentifier:@"BeerCell" ];
    [self.tableView registerNib:[UINib nibWithNibName:@"LoadingCell" bundle:nil] forCellReuseIdentifier:@"LoadingCell" ];
    viewModel = [BeersViewModel new];
        
    self.title = @"Beers";
    self.loadingLabel.hidden = !(self.tableView.hidden = self->viewModel.isLoading);
        
    

    [viewModel fetchList:viewModel.currentPage itemsPerPage:viewModel.itemsPerPage sucessHandler:^(NSArray *beers){
        
        [self.tableView reloadData];
        self.loadingLabel.hidden = !(self.tableView.hidden = self->viewModel.isLoading);
        
    } errorHandler:^(NSError *errors){
       self.loadingLabel.hidden = YES;
    }];
    
    
}


#pragma mark - ViewModel triggers






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 1 section for loading cell
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 1 ? 1 : [viewModel.beers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // not sure if that's how it is supposed to be implemented but it works.
    if(indexPath.section == 1){
        LoadingCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadingCell" forIndexPath:indexPath];
        
        if(viewModel.hasReachedtheEnd){
            cell.reachedBottomLabel.hidden = NO;
        }else{
            cell.activityIndicator.hidden = NO;
            [cell.activityIndicator startAnimating];
        }
        
        //cell.hidden = YES;
        
        cell.selectionStyle = 0;
        return cell;
    }
    
    BeerCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell" forIndexPath:indexPath];
    
    
    BeerModel *beer = viewModel.beers[indexPath.row];
    
    cell.titleLabel.text = beer.name;
    cell.descriptionLabel.text = beer.description;
    
    
    if(beer.image){
        cell.imageImageView.image = beer.image;
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:beer.imageUrl]];
            beer.image = [UIImage imageWithData:imageData];
            cell.imageImageView.image = beer.image;
            cell.imageImageViewActivityIndicator.hidden = YES;
        });
    }

            
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1)
        return;
    
    
    BeerDetailsViewController *beerDetailsViewController = [ self.storyboard instantiateViewControllerWithIdentifier:@"BeerDetailsViewController"];
   
    // not sure if this is anti-pattern in MVVM :/
    beerDetailsViewController.beerAsModel = viewModel.beers[indexPath.row];
    
    [self.navigationController pushViewController:beerDetailsViewController animated:YES];

}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;

    // if get to loading section...
    if (!viewModel.isLoading && self.tableView.indexPathsForVisibleRows.lastObject.section == 1){
        NSLog(@"INIFINE scroll loading");
        
        viewModel.currentPage += 1;
        [viewModel fetchList:viewModel.currentPage itemsPerPage:viewModel.itemsPerPage sucessHandler:^(NSArray *beers){
            [self.tableView reloadData];
        } errorHandler:^(NSError *error){
            
        }];
    }
}


@end
