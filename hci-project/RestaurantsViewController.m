//
//  RestaurantsViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "RestaurantsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RestaurantsViewController ()
{
    NSMutableArray *restaurants;
}
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (strong,nonatomic) NSArray *searchResults;

@end

@implementation RestaurantsViewController
@synthesize myCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    
    
    
    
    
    self.searchResults = [[NSArray alloc] init];
    
    restaurants = [[NSMutableArray alloc] init];
    
    Restaurant *r = [[Restaurant alloc] init];
    
    r = [[Restaurant alloc] init];
    r.name = @"Cristo's NY Style Pizza";
    r.filename = @"0";
    r.notes = @"Italian, Pizza";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r0-1",@"r0-2",@"r0-3",@"r0-4",@"r0-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Brio Tuscan Grille";
    r.filename = @"1";
    r.notes = @"Italian, Mediterranean";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r1-1",@"r1-2",@"r1-3",@"r1-4",@"r1-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Pho Vietnam";
    r.filename = @"2";
    r.notes = @"Vietnamese";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r2-1",@"r2-2",@"r2-3",@"r2-4",@"r2-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Sushi Iwa";
    r.filename = @"3";
    r.notes = @"Asian, Sushi, Thai";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r3-1",@"r3-2",@"r3-3",@"r3-4",@"r3-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"The Palace International";
    r.filename = @"4";
    r.notes = @"African, Caribbean, Vegetarian";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r4-1",@"r4-2",@"r4-3",@"r4-4",@"r4-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Sunrise Biscuit Kitchen";
    r.filename = @"5";
    r.notes = @"American, Breakfast";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r5-1",@"r5-2",@"r5-3",@"r5-4",@"r5-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"One Restaurant";
    r.filename = @"6";
    r.notes = @" American, International";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r6-1",@"r6-2",@"r6-3",@"r6-4",@"r6-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"The Cowfish Sushi Burger Bar";
    r.filename = @"7";
    r.notes = @"Burger, Sushi, Fusion";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r7-1",@"r7-2",@"r7-3",@"r7-4",@"r7-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Lantern";
    r.filename = @"8";
    r.notes = @" Asian, Japanese, Thai";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r8-1",@"r8-2",@"r8-3",@"r8-4",@"r8-5", nil];
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Dame's Chicken & Waffles";
    r.filename = @"9";
    r.notes = @"Vietnamese";
    r.menu_items = [[NSMutableArray alloc] initWithObjects:@"r9-1",@"r9-2",@"r9-3",@"r9-4",@"r9-5", nil];
    [restaurants addObject:r];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantCollectionViewCell *cell = (RestaurantCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 8;
    
    //[cell setBackgroundColor:[UIColor redColor]];
    // int restaurantNumber = indexPath.row % 10;
    
    Restaurant *current = [restaurants objectAtIndex:indexPath.row%10];
    // Photo *current = [photos objectAtIndex:indexPath.row];
    cell.restaurantNameLabel.text = [current name];
    
    cell.imageView.image = [UIImage imageNamed:current.filename];
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"sequeToSwipe"])
    {
        RestaurantCollectionViewCell  *cell = (RestaurantCollectionViewCell *) sender;
        NSIndexPath *indexPath = [self.myCollectionView indexPathForCell:cell];
        SwipeViewController *svc = (SwipeViewController*)[segue destinationViewController];
        Restaurant *r = [[Restaurant alloc] init];
        r=restaurants[indexPath.row%10];
        NSLog(r.name);
        svc.r = r;
    }
    
    //NSIndexPath *path = [self.collectionView indexPathForSelectedRow];
    //Restaurant *r = restaurants[2];
    //svc.r = r;
}


@end
