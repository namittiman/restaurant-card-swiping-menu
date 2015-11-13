//
//  ProductCell.h
//  CollectionDemo
//
//  Created by Simon Allardice on 2/9/13.
//  Copyright (c) 2013 Simon Allardice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

@end
