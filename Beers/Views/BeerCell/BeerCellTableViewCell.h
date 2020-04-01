//
//  BeerCellTableViewCell.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageImageViewActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

NS_ASSUME_NONNULL_END
