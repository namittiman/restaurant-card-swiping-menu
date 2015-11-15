//
//  RestaurantsViewController.h
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "Item.h"
#import "RestaurantCollectionViewCell.h"
#import "SwipeViewController.h"

@interface RestaurantsViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray* searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, assign) bool isFiltered;
@end
