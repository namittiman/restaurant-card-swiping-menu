//
//  SwipeViewController.h
//  hci-project
//
//  Created by Namit Sharma on 11/9/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "Item.h"
#import "DraggableViewBackground.h"
#import "ItemDetailsViewController.h"
#import "ShortListViewController.h"


@interface SwipeViewController : UIViewController
@property (nonatomic) Restaurant *r;
@property (nonatomic) DraggableViewBackground *dvb;
@property (weak, nonatomic) IBOutlet UIButton *thumps_up;
@property (weak, nonatomic) IBOutlet UIButton *thumps_down;
@property (weak, nonatomic) IBOutlet UIButton *redo;

@end
