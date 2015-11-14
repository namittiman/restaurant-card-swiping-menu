//
//  Item.h
//  hci-project
//
//  Created by Namit Sharma on 11/13/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *photo_filename;
@property (nonatomic) int spicy;
@property (nonatomic) BOOL veg;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSString *category;
@end
