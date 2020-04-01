//
//  LoadingCellTableViewCell.h
//  Beers
//
//  Created by Pedro Costa on 31/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *reachedBottomLabel;

@end

NS_ASSUME_NONNULL_END
