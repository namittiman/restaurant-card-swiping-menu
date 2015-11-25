//
//  ItemDetailsViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/13/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *notes;
@property (weak, nonatomic) IBOutlet UIImageView *spice_image;

@end


@implementation ItemDetailsViewController
@synthesize i;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.label setText:i.name];
    [self.image setImage:[UIImage imageNamed: i.photo_filename]];
    [self.notes setText: i.notes];
    
    [self.spice_image setImage:[UIImage imageNamed:[ NSString stringWithFormat:@"spicy%d",i.spicy ]]];

    

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
