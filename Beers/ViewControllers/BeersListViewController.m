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
    viewModel = [BeersViewModel new];
        
    self.title = @"Beers";
    self.loadingLabel.hidden = !(self.tableView.hidden = self->viewModel.isLoading);
        
    [viewModel fetchList:viewModel.currentPage itemsPerPage:viewModel.itemsPerPage sucessHandler:nil errorHandler:nil];
    
    [viewModel listenEvent:@"isLoadingChange" callback:^(id param){
        self.loadingLabel.hidden = !(self.tableView.hidden = self->viewModel.isLoading);
          // do not show large title if loading labes is active
        self.navigationController.navigationBar.prefersLargeTitles = !self->viewModel.isLoading;
    }];
    
    
    [viewModel listenEvent:@"updateBeerList" callback:^(id param){
        [self.tableView reloadData];
    }];
    
    
  
    
}


#pragma mark - ViewModel triggers






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [viewModel.beers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeerCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell" forIndexPath:indexPath];
    
    BeerModel *beer = viewModel.beers[indexPath.row];
    
    cell.titleLabel.text = beer.name;
    cell.descriptionLabel.text = beer.description;
    NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:beer.imageUrl]];

    cell.imageImageView.image = [UIImage imageWithData:imageData] ;
            
    return cell;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;

    if (!viewModel.isLoading && endScrolling >= scrollView.contentSize.height){
        viewModel.currentPage += 1;
        [viewModel fetchList:viewModel.currentPage itemsPerPage:viewModel.itemsPerPage sucessHandler:nil errorHandler:nil];
    }
}


@end
