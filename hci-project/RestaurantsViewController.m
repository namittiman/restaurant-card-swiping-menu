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
    Restaurant *r;
    Item * i;
    
//********************************************
    r = [[Restaurant alloc] init];
    r.name = @"Cristo's NY Style Pizza";
    r.filename = @"0";
    r.notes = @"Italian, Pizza";
    
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
//********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Brio Tuscan Grille";
    r.filename = @"1";
    r.notes = @"Italian, Mediterranean";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Pho Vietnam";
    r.filename = @"2";
    r.notes = @"Vietnamese";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];

//********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Sushi Iwa";
    r.filename = @"3";
    r.notes = @"Asian, Sushi, Thai";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"The Palace International";
    r.filename = @"4";
    r.notes = @"African, Caribbean, Vegetarian";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"Sunrise Biscuit Kitchen";
    r.filename = @"5";
    r.notes = @"American, Breakfast";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"One Restaurant";
    r.filename = @"6";
    r.notes = @" American, International";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"The Cowfish Sushi Burger Bar";
    r.filename = @"7";
    r.notes = @"Burger, Sushi, Fusion";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"Lantern";
    r.filename = @"8";
    r.notes = @" Asian, Japanese, Thai";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************

    
    r = [[Restaurant alloc] init];
    r.name = @"Dame's Chicken & Waffles";
    r.filename = @"9";
    r.notes = @"Vietnamese";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
//********************************************
    
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
    // cell.notes.text = [current notes];
    
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
