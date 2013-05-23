//
//  DJRadioButtonGroup.m
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import "DJRadioButtonGroup.h"
#import "DJRadioButton.h"

@implementation DJRadioButtonGroup
@synthesize childs;
@synthesize selectedIndex;
- (id)init{
    self = [super init];
    if(self != nil){
        childs = [[NSMutableArray alloc]init];
        selectedIndex = NSIntegerMin;
    }
    return self;
}

- (void)setSelectedIndex:(int)index{
    if(selectedIndex != index){
        selectedIndex = index;
        for(DJRadioButton *radioButton in childs){
            if(radioButton.index != selectedIndex){
                [radioButton setState:FALSE];
            }
        }
    }
}

- (void)addChild:(DJRadioButton *)child{
    [childs addObject:child];
    child.group = self;
}
@end
