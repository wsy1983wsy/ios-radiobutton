//
//  DJRadioButton.m
//  CustomizeRadioButton
//
//  Created by wang songye on 13-5-23.
//  Copyright (c) 2013年 DianJin. All rights reserved.
//

#import "DJRadioButton.h"
#import "DJRadioButtonGroup.h"

#define kCheckedImage   @"radio_checked.png"
#define kUncheckedImage @"radio_normal.png"

@implementation DJRadioButton
@synthesize radioButtonImageView;
@synthesize titleLabel;
@synthesize checked;
@synthesize textAlignment;
@synthesize textColor;
@synthesize textFont;
@synthesize imageSize;
@synthesize index;
@synthesize group;

- (id)init{
    UIImage *image = [UIImage imageNamed:kUncheckedImage];
    imageSize = CGRectMake(0, 0, image.size.width, image.size.height);
    self =  [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    return self;
}

- (id)initWithTitle:(NSString *)title{
    UIImage *image = [UIImage imageNamed:kUncheckedImage];
    imageSize = CGRectMake(0, 0, image.size.width, image.size.height);
    self = [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if(self){
        titleLabel.text = title;
        [self autoFitWidthToText];
        [self layoutSubviews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    UIImage *image = [UIImage imageNamed:kUncheckedImage];
    imageSize = CGRectMake(0, 0, image.size.width, image.size.height);
    self = [super initWithFrame:frame];
    if (self) {
        checked = FALSE;
        textAlignment = DJRadioButtontTextAlignmentRight;
        textColor = [UIColor blackColor];
        textFont = [UIFont systemFontOfSize:20.0f];
        
        radioButtonImageView = [[UIImageView alloc]initWithImage:image];
        radioButtonImageView.frame = CGRectMake(0, 0, imageSize.size.width, imageSize.size.height);
        [radioButtonImageView sizeToFit];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageSize.size.width + 2,0, 100, imageSize.size.height)];
        titleLabel.textColor = textColor;
        titleLabel.font = textFont;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:radioButtonImageView];
        [self addSubview:titleLabel];
        self.clipsToBounds = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//调整titlelabe的font大小
- (void)autoFitFontToHeight{
    CGFloat height = self.frame.size.height;
    CGFloat fontSize = 20;
    CGFloat tempHeight = MAXFLOAT;
    NSString *title = titleLabel.text;
    do{
        fontSize -= 1;
        UIFont *font = [UIFont fontWithName:titleLabel.font.fontName size:fontSize];
        CGSize labelSize;
        if(title){
            labelSize = [title sizeWithFont:font];
        } else {
            labelSize = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" sizeWithFont:font];
        }
        tempHeight = labelSize.height;
    }while (tempHeight >= height);
    titleLabel.font = [UIFont fontWithName:titleLabel.font.fontName size:fontSize];
}

- (void)autoFitWidthToText{
    CGSize labelSize = [titleLabel.text sizeWithFont:titleLabel.font];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width + 2 + self.imageSize.size.width, self.imageSize.size.height);
    [self layoutSubviews];
}

- (void)layoutSubviews{
    //文字在左边
    if(textAlignment == DJRadioButtonTextAlignmentLeft){
        titleLabel.frame = CGRectMake(0, 0, self.frame.size.width - 2 - imageSize.size.width, self.frame.size.height);
        radioButtonImageView.frame = CGRectMake(self.frame.size.width - imageSize.size.width, 0, imageSize.size.width, imageSize.size.height);
    } else {
        titleLabel.frame = CGRectMake(imageSize.size.width + 2, 0, self.frame.size.width - 2 - imageSize.size.width, self.frame.size.height);
        radioButtonImageView.frame = CGRectMake(0, 0, imageSize.size.width, imageSize.size.height);
    }
}

- (void)setState:(Boolean)state{
    //状态需要修改
    if(checked != state){
        checked = state;
        UIImage *image = [UIImage imageNamed:kCheckedImage];
        if(state == FALSE){
            image = [UIImage imageNamed:kUncheckedImage];
        }
        if(state == TRUE && group != nil){
            [group setSelectedIndex:self.index];
        }
        [radioButtonImageView setImage:image];
    }
}

- (void)setTextAlignment:(DJRadioButtonTextAlignment)alignment{
    textAlignment = alignment;
    [self autoFitWidthToText];
    [self layoutSubviews];
}

-(void)setTitle:(NSString *)title{
    titleLabel.text = title;
    [self autoFitWidthToText];
    [self layoutSubviews];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    [self setState:TRUE];
    return YES;
}

- (float)getNeededHeight{
    float height = imageSize.size.height;
    UIFont *font = [UIFont fontWithName:titleLabel.font.fontName size:20];
    NSString *title = titleLabel.text;
    CGSize labelSize;
    if(title){
        labelSize = [title sizeWithFont:font];
    } else {
        labelSize = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" sizeWithFont:font];
    }
    if(labelSize.height > height){
        height = labelSize.height;
    }
    return height;
}

- (float)getNeededWidth{
    NSString *title = titleLabel.text;
    if(title){
        CGSize labelSize = [titleLabel.text sizeWithFont:titleLabel.font];
        return labelSize.width + 2 + self.imageSize.size.width;
    } else {
        return self.imageSize.size.width + 2;
    }
}
@end
