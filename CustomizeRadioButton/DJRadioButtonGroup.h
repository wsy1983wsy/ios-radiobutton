//
//  DJRadioButtonGroup.h
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DJRadioButton;
@interface DJRadioButtonGroup : NSObject
@property (strong, nonatomic) NSMutableArray *childs;
@property (assign, nonatomic) int selectedIndex;

- (void)addChild:(DJRadioButton *)child;

@end
