//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "ViewController.h"
#import "DraggableViewBackground.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    printf("%ld %ld %ld %ld",self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.height,self.view.frame.size.width);
    [self.view addSubview:draggableBackground];
}

@end
