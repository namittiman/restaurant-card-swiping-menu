//
//  SwipeViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/9/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "SwipeViewController.h"
@interface SwipeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *menu;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
@end

@implementation SwipeViewController
@synthesize r;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.menu setText:r.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
