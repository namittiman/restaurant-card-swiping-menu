//
//  RestaurantCollectionViewCell.m
//  hci-project
//
//  Created by Namit Sharma on 11/9/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "RestaurantCollectionViewCell.h"
@implementation RestaurantCollectionViewCell
@synthesize rating;
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

    }
    return self;
}
- (void)awakeFromNib
{
    rating.layer.masksToBounds = YES;
    rating.layer.cornerRadius = 5.0;
}

@end
