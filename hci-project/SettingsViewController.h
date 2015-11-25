//
//  SettingsViewController.h
//  hci-project
//
//  Created by Namit Sharma on 11/24/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionSheetStringPicker.h"

@interface SettingsViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) NSArray *spice_levels;
@property (nonatomic, strong) NSArray *cuisines;
@property (nonatomic, assign) NSInteger selectedIndex;

@end
