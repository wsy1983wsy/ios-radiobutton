//
//  DJViewController.h
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJRadioButton;
@class DJRadioButtonGroup;

@interface DJViewController : UIViewController
@property (strong, nonatomic) DJRadioButton *radio1;
@property (strong, nonatomic) DJRadioButton *radio2;

@property (strong, nonatomic) DJRadioButton *radio3;
@property (strong, nonatomic) DJRadioButton *radio4;
@property (strong, nonatomic) DJRadioButtonGroup *radioGroup;
@property (strong, nonatomic) DJRadioButtonGroup *radioGroup2;
@end
