//
//  DJRadioButton.h
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJRadioButtonGroup;

typedef  enum {
    DJRadioButtonTextAlignmentLeft,
    DJRadioButtontTextAlignmentRight
}DJRadioButtonTextAlignment;

@interface DJRadioButton : UIControl
@property (strong, nonatomic) UIImageView *radioButtonImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) Boolean checked;
@property (assign, nonatomic) DJRadioButtonTextAlignment textAlignment;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIFont *textFont;
@property (assign, nonatomic) CGRect imageSize;
@property (strong, nonatomic) DJRadioButtonGroup *group;
@property (assign, nonatomic) int index;

- (id)init;
- (id)initWithTitle:(NSString *)title;
- (id)initWithFrame:(CGRect)frame;
- (void)autoFitWidthToText;
- (void)autoFitFontToHeight;
- (void)setTextAlignment:(DJRadioButtonTextAlignment)textAlignment;
- (void)setTitle:(NSString *)title;
- (void)setState:(Boolean)state;
- (float)getNeededHeight;
- (float)getNeededWidth;
@end
