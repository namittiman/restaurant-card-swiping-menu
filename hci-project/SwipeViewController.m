//
//  SwipeViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/9/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "SwipeViewController.h"
#import "ActionSheetPicker.h"

@interface SwipeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *menu;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
@end

@implementation SwipeViewController
@synthesize r;
@synthesize current_category_index    ;
- (IBAction)thumps_up:(id)sender {
    [self.dvb swipeRight];
}
- (IBAction)thumps_down:(id)sender {
    [self.dvb swipeLeft];
}
- (IBAction)redo:(id)sender {

}

- (IBAction)filter:(id)sender {
    
    
    //NSArray *colors = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", @"Orange", nil];
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select a Category"
                                            rows:r.categories
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           NSLog(@"Picker: %@", picker);
                                           NSLog(@"Selected Index: %d", (int)selectedIndex);
                                           NSLog(@"Selected Value: %@", selectedValue);
                                           //self.current_category_index = (int)selectedIndex;
                                           
                                          // DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame: self.view.frame andRestaurant:r withCategory: (int)selectedIndex];
                                           //self.dvb = draggableBackground ;
                                          // [self.view addSubview:draggableBackground];
                                           
                                           
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         NSLog(@"Block Picker Canceled");
                                     }
                                          origin:sender];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.menu setText:r.name];
    [[self navigationItem] setTitle:r.name];
    CGRect frame = self.view.frame;
    //frame.origin.y = -self.view.frame.size.height; //optional: if you want the view to drop down
    self.current_category_index = 0;
    
    Restaurant * x=r;
    
    NSLog(x.name);    NSLog(x.filename); NSLog(x.notes);
    Item * i =( Item *)[x.menu_items objectAtIndex:0];
    NSLog(@"this is it\n");
    NSLog( i.name);
    i =( Item *)[x.menu_items objectAtIndex:1];
    NSLog(@"this is it\n");
    NSLog( i.name);
    i =( Item *)[x.menu_items objectAtIndex:2];
    NSLog(@"this is it\n");
    NSLog( i.name);
    i =( Item *)[x.menu_items objectAtIndex:3];
    NSLog(@"this is it\n");
    NSLog( i.name);
    i =( Item *)[x.menu_items objectAtIndex:4];
    NSLog(@"this is it\n");
    NSLog( i.name);

    
    
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:frame andRestaurant:r withCategory:0];
    self.dvb = draggableBackground ;
    
    [self.view addSubview:draggableBackground];
    
    //optional: animate down and in
    /*
    [UIView animateWithDuration:0.5 animations:^{
        draggableBackground.center = self.view.center;
        draggableBackground.alpha = 1;
    }];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"sequeToDetails"])
    {
        if(self.r.menu_items.count <= (int)self.dvb.currentItemIndex)
        return NO;
    }
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"sequeToDetails"])
    {
        ItemDetailsViewController* idvc = [segue destinationViewController];
    
    
        idvc.i = [self.r.menu_items objectAtIndex:(int)self.dvb.currentItemIndex];
    }
    
    if([segue.identifier isEqualToString:@"sequeToShortList"])
    {
        ShortListViewController* slvc = [segue destinationViewController];
        
        NSLog([NSString stringWithFormat:@"Count of menuitems : %d",(int)self.dvb.myShortList.menu_items.count]);
        
        slvc.myShortList = self.dvb.myShortList;
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
