//
//  BeersListViewController.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeersViewModel.h"
#import "BeerCellTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeersListViewController : UIViewController <UITableViewDelegate>
{
    BeersViewModel *viewModel;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@end

NS_ASSUME_NONNULL_END
