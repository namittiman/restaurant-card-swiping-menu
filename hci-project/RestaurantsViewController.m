//
//  RestaurantsViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "RestaurantsViewController.h"

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
    
    r.name = @"Brio Tuscan Grille";
    r.filename = @"0";
    r.notes = @"Italian, Mediterranean";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Pho Vietnam";
    r.filename = @"1";
    r.notes = @"Vietnamese";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Sushi Iwa";
    r.filename = @"2";
    r.notes = @"Asian, Sushi, Thai";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"The Palace International";
    r.filename = @"3";
    r.notes = @"African, Caribbean, Vegetarian";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Sunrise Biscuit Kitchen";
    r.filename = @"4";
    r.notes = @"American, Breakfast";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"One Restaurant";
    r.filename = @"5";
    r.notes = @" American, International";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"The Cowfish Sushi Burger Bar";
    r.filename = @"6";
    r.notes = @"Burger, Sushi, Fusion";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Lantern";
    r.filename = @"7";
    r.notes = @" Asian, Japanese, Thai";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Dame's Chicken & Waffles";
    r.filename = @"8";
    r.notes = @"Vietnamese";
    [restaurants addObject:r];
    
    r = [[Restaurant alloc] init];
    r.name = @"Cristo's NY Style Pizza";
    r.filename = @"9";
    r.notes = @"Italian, Pizza";
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
