//
//  BeerDetailsViewController.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerModel.h"

#import "BeerDetailsHeaderCellTableViewCell.h"
#import "BeerDetailsDetailCellTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerDetailsViewController : UIViewController <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property BeerModel *beerAsModel;
@end

NS_ASSUME_NONNULL_END
