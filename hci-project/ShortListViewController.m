//
//  ShortListViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "ShortListViewController.h"

@interface ShortListViewController ()

@end

@implementation ShortListViewController
@synthesize myShortList ;
@synthesize index;
@synthesize myCollectionView;

- (IBAction)editAction:(id)sender {
    NSLog(@"test");
    NSLog(self.edit.title);
    
    if([self.edit.title isEqualToString: @"Edit"])
    {
        self.edit.title = @"Done";
        //Loop through all the cells and set the cell.deleteButton.hidden=false;
        
        for(ProductCell* cell in [[self myCollectionView] visibleCells]){
                        cell.deleteButton.hidden = false;
        }
        
        
    }
    else if([self.edit.title isEqualToString: @"Done"])
    {
        for(ProductCell* cell in [[self myCollectionView] visibleCells]){
            cell.deleteButton.hidden = true;
        }
        self.edit.title = @"Edit";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"viewdidload");
    //NSLog([NSString stringWithFormat:@"%d!!!!",   index]);

    NSLog([NSString stringWithFormat:@"%lu!!!!",   (unsigned long)myShortList.menu_items.count]);
    for (int i=0; i<myShortList.menu_items.count; i++) {
        NSLog([[myShortList.menu_items objectAtIndex:i] name]);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Item %i in section %i", indexPath.row, indexPath.section);
    //UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //cell.contentView.backgroundColor = [UIColor lightGrayColor];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //cell.contentView.backgroundColor = [UIColor whiteColor];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return myShortList.menu_items.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCell *cell = [collectionView
                         dequeueReusableCellWithReuseIdentifier:@"demoCell"
                         forIndexPath:indexPath];
    
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 8;
    cell.cellTitle.text = [[myShortList.menu_items objectAtIndex:indexPath.row%myShortList.menu_items.count] name];
    cell.itemImage.image = [UIImage imageNamed:[[myShortList.menu_items objectAtIndex:indexPath.row%myShortList.menu_items.count] photo_filename]];
    
    
  //  [cell.deleteButton addTarget:self action:@selector(self deleteAction:cell)forControlEvents:UIControlEventTouchUpInside];
    
    [[cell.deleteButton layer] setValue:[NSNumber numberWithInteger:indexPath.row] forKey:@"index"];
    [cell.deleteButton addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];

    
    return cell;
    
}

-(void)deleteAction:(id)sender
{
    NSNumber *anInt = [[sender layer] valueForKey:@"index"];
   
    int index =[anInt intValue];
    
    [myShortList.menu_items removeObjectAtIndex:index];
    [self.myCollectionView reloadData];

    NSLog(@"%i", index);
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"sequeFromShortList"])
    {
        ProductCell  *cell = (ProductCell *) sender;
        NSIndexPath *indexPath = [self.myCollectionView indexPathForCell:cell];
        ItemDetailsViewController *idvc = (ItemDetailsViewController*)[segue destinationViewController];
        
        idvc.i = [myShortList.menu_items objectAtIndex:indexPath.row];
    }
}


@end
