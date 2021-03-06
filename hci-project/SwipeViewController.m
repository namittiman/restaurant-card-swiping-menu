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

@end

@implementation SwipeViewController
@synthesize r;
@synthesize current_category_index    ;
@synthesize myShortList;
- (IBAction)thumps_up:(id)sender {
    [self.dvb swipeRight];
}
- (IBAction)thumps_down:(id)sender {
    [self.dvb swipeLeft];
}
- (IBAction)redo:(id)sender {
    
    //This will roll back to start and not just one back
    NSLog(@"from redo");
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 150) andRestaurant:r withCategory:(int)self.current_category_index andShortList:self.myShortList];
    self.dvb = draggableBackground ;
    
    [self.view addSubview:draggableBackground];

    
}

- (IBAction)filter:(id)sender {
    
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Category"
                                            rows:r.categories
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           NSLog(@"Picker: %@", picker);
                                           NSLog(@"Selected Index: %d", (int)selectedIndex);
                                           NSLog(@"Selected Value: %@", selectedValue);
                                           self.current_category_index = (int)selectedIndex;
                                           
                                           DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 150) andRestaurant:r withCategory:(int)selectedIndex andShortList:self.myShortList];
                                           self.dvb = draggableBackground ;
                                           
                                           [self.view addSubview:draggableBackground];
                                           
                                           
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         NSLog(@"Block Picker Canceled");
                                     }
                                          origin:sender];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationItem] setTitle:r.name];
    CGRect frame = self.view.frame;

    self.current_category_index = 0;
    
    self.myShortList = [[MyShortList alloc] init];
    self.myShortList.menu_items = [[NSMutableArray alloc] init];
    
    Restaurant *x=r;
    
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

    
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height - 150) andRestaurant:r withCategory:0 andShortList:self.myShortList];
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
        if(self.dvb.currentItemIndex >= self.dvb.exampleCardLabels.count  )
        return NO;
    }
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"sequeToDetails"])
    {
       
            ItemDetailsViewController* idvc = [segue destinationViewController];
            idvc.i = [self.dvb.exampleCardLabels objectAtIndex:(int)self.dvb.currentItemIndex];

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
