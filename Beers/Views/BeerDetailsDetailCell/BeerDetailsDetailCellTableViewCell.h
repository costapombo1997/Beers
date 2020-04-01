//
//  BeerDetailsDetailCellTableViewCell.h
//  Beers
//
//  Created by Pedro Costa on 01/04/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerDetailsDetailCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *containerLabel;

@end

NS_ASSUME_NONNULL_END
