//
//  BeerDetailsViewController.m
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "BeerDetailsViewController.h"

@interface BeerDetailsViewController ()

@end

@implementation BeerDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BeerDetailsHeaderCell" bundle:nil] forCellReuseIdentifier:@"BeerDetailsHeaderCell" ];
    
        [self.tableView registerNib:[UINib nibWithNibName:@"BeerDetailsDetailCell" bundle:nil] forCellReuseIdentifier:@"BeerDetailsDetailCell" ];
    
    
        
    self.title = self.beerAsModel.name;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 1 section for header
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // header
    if(indexPath.section == 0){
        BeerDetailsHeaderCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BeerDetailsHeaderCell" forIndexPath:indexPath];
        [cell.beerImageView setImage:self.beerAsModel.image];
        cell.titleLabel.text = self.beerAsModel.name;
        return cell;
    }
    
    
    BeerDetailsDetailCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BeerDetailsDetailCell" forIndexPath:indexPath];
    
    
    switch (indexPath.row) {
        case 0:
            cell.titleLabel.text = @"Name";
            cell.containerLabel.text = self.beerAsModel.name;
            break;
            
        case 1:
            cell.titleLabel.text = @"Tagline";
            cell.containerLabel.text = self.beerAsModel.tagline ?: @"---";
            break;
        case 3:
            cell.titleLabel.text = @"Description";
            cell.containerLabel.text = self.beerAsModel.description ?: @"---" ;
            break;
        case 4:
            cell.titleLabel.text = @"Brewers Tips";
            cell.containerLabel.text = self.beerAsModel.brewersTips ?: @"---";
            break;
        default:
            break;
    }
       
    
    
    return cell;
}


@end
