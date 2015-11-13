//
//  ProductCell.m
//  CollectionDemo
//
//  Created by Simon Allardice on 2/9/13.
//  Copyright (c) 2013 Simon Allardice. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.backgroundView = bg;
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        
        UIView *sbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.selectedBackgroundView = sbg;
        self.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
