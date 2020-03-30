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
    viewModel = [BeersViewModel new];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BeerCell" bundle:nil] forCellReuseIdentifier:@"BeerCell" ];
   
    
    
    [viewModel listenEvent:@"isLoadingChange" callback:^(id param){
        self.tableView.hidden = !(self.loadingView.hidden = self->viewModel.isLoading);
    }];
    
    
}


#pragma mark - ViewModel triggers






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return viewModel.beers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeerCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell" forIndexPath:indexPath];
    
    cell.titleLabel = viewModel.beers[indexPath.row]; // TODO: set title
    
    cell.titleLabel = viewModel.beers[indexPath.row]; // TODO: set description
    
    return cell;
}


@end
