//
//  SettingsViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/24/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *spice_preference;
@property (weak, nonatomic) IBOutlet UITextField *cuisine_pref1;
@property (weak, nonatomic) IBOutlet UITextField *cuisine_pref3;
@property (weak, nonatomic) IBOutlet UITextField *cuisine_pref2;
@property (weak, nonatomic) IBOutlet UITextField *diet_pref;

@end

@implementation SettingsViewController
@synthesize spice_levels;
@synthesize cuisines;
@synthesize diets;

@synthesize selectedIndex;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.spice_levels = @[@"No Spice", @"Mild", @"Regular", @"Spicy", @"Extra Spicy", @"Extra Extra Spicy"];
    
    
    self.cuisines =  @[@"American Cuisine",@"Australian Cuisine",@"Brazilian Cuisine",@"Caribbean Cuisine",@"Chinese Cuisine",@"Filipino Cuisine",@"French Cuisine",@"German Cuisine",@"Greek Cuisine",@"Indian Cuisine",@"Indonesian Cuisine",@"Italian Cuisine",@"Japanese Cuisine",@"Korean Cuisine",@"Lebanese Cuisine",@"Mexican Cuisine",@"Scottish Cuisine",@"South African Cuisine",@"Spanish Cuisine",@"Thai Cuisine"];
    
        self.diets =  @[@"Vegetarian",@"Non Vegetarian",@"Vegan"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)set_spice_preference:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Select Spice Preference"
                                            rows:self.spice_levels
                                initialSelection:0
                                          target:self successAction:@selector(spice_level_WasSelected:element:)
                                    cancelAction:@selector(actionPickerCancelled:)
                                          origin:sender];

}
- (IBAction)set_cuisine_pref1:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Select Cuisine Preference 1"
                                            rows:self.cuisines
                                initialSelection:0
                                          target:self successAction:@selector(cuisine_pref1_WasSelected:element:)
                                    cancelAction:@selector(actionPickerCancelled:)
                                          origin:sender];
}
- (IBAction)set_cuisine_pref2:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Select Cuisine Preference 2"
                                            rows:self.cuisines
                                initialSelection:0
                                          target:self successAction:@selector(cuisine_pref2_WasSelected:element:)
                                    cancelAction:@selector(actionPickerCancelled:)
                                          origin:sender];
}
- (IBAction)set_cuisine_pref3:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Select Cuisine Preference 3"
                                            rows:self.cuisines
                                initialSelection:0
                                          target:self successAction:@selector(cuisine_pref3_WasSelected:element:)
                                    cancelAction:@selector(actionPickerCancelled:)
                                          origin:sender];
}


- (IBAction)set_dietary_pref:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Select Dietary Preference"
                                            rows:self.diets
                                initialSelection:0
                                          target:self successAction:@selector(diet_was_selected:element:)
                                    cancelAction:@selector(actionPickerCancelled:)
                                          origin:sender];

}

- (void)spice_level_WasSelected:(NSNumber *)selectedIndex element:(id)element {
    self.selectedIndex = [selectedIndex intValue];
    self.spice_preference.text = (self.spice_levels)[(NSUInteger) self.selectedIndex];}
- (void)cuisine_pref1_WasSelected:(NSNumber *)selectedIndex element:(id)element {
    self.selectedIndex = [selectedIndex intValue];
    self.cuisine_pref1.text = (self.cuisines)[(NSUInteger) self.selectedIndex];
}
- (void)cuisine_pref2_WasSelected:(NSNumber *)selectedIndex element:(id)element {
    self.selectedIndex = [selectedIndex intValue];
    self.cuisine_pref2.text = (self.cuisines)[(NSUInteger) self.selectedIndex];
}
- (void)cuisine_pref3_WasSelected:(NSNumber *)selectedIndex element:(id)element {
    self.selectedIndex = [selectedIndex intValue];
    self.cuisine_pref3.text = (self.cuisines)[(NSUInteger) self.selectedIndex];
}

- (void)diet_was_selected:(NSNumber *)selectedIndex element:(id)element {
    self.selectedIndex = [selectedIndex intValue];
    self.diet_pref.text = (self.diets)[(NSUInteger) self.selectedIndex];
}



- (void)actionPickerCancelled:(id)sender {
    NSLog(@"Delegate has been informed that ActionSheetPicker was cancelled");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
