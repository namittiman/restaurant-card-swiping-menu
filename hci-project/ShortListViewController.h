//
//  ShortListViewController.h
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyShortList.h"
#import "Item.h"
#import "ProductCell.h"
#import "ItemDetailsViewController.h"



@interface ShortListViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic) MyShortList *myShortList;
@property (nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end
