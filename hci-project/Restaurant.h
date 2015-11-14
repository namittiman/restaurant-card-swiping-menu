//
//  Restaurant.h
//  hci-project
//
//  Created by Namit Sharma on 11/9/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *filename;
@property (nonatomic) NSString *cuisine;
@property (nonatomic) NSString *location;
@property (nonatomic) double rating;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSMutableArray *menu_items;//Array of Item

@end
