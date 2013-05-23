//
//  DJViewController.m
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import "DJViewController.h"
#import "DJRadioButton.h"
#import "DJRadioButtonGroup.h"

@interface DJViewController ()

@end

@implementation DJViewController

@synthesize radio1;
@synthesize radio2;
@synthesize radio3;
@synthesize radio4;
@synthesize radioGroup;
@synthesize radioGroup2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    radioGroup = [[DJRadioButtonGroup alloc]init];
    radioGroup2 = [[DJRadioButtonGroup alloc]init];
    
    self.radio1 = [[DJRadioButton alloc]initWithTitle:@"aaaaaB"];
    radio1.index = 1;
    radio1.frame = CGRectMake(5, 5, [radio1 getNeededWidth], [radio1 getNeededHeight]);
    [radioGroup addChild:radio1];
    [self.view addSubview:radio1];

    self.radio2 = [[DJRadioButton alloc]initWithTitle:@"你好"];
    radio2.index = 2;
    radio2.frame = CGRectMake(5, 50, [radio2 getNeededWidth], [radio2 getNeededHeight]);
    [radioGroup addChild:radio2];
    [self.view addSubview:radio2];
    
    
    self.radio3 = [[DJRadioButton alloc]initWithTitle:@"aaaaaB"];
    radio3.frame = CGRectMake(5, 80, [radio3 getNeededWidth], [radio3 getNeededHeight]);
    radio3.index = 1;
    [radioGroup2 addChild:radio3];
    [self.view addSubview:radio3];

    self.radio4 = [[DJRadioButton alloc]initWithTitle:@"你好"];
    radio4.index = 2;
    radio4.frame = CGRectMake(5, 120, [radio4 getNeededWidth], [radio4 getNeededHeight]);
    [radioGroup2 addChild:radio4];
    [self.view addSubview:radio4];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
