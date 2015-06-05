//
//  SCPlaceholderTextView.m
//  PNRSeller
//
//  Created by Ray on 14/4/29.
//  Copyright (c) 2015年 Ray. All rights reserved.
//

#import "RGPlaceholderTextView.h"

#define kPlaceholderX       4
#define kPlaceholderY       7

@interface RGPlaceholderTextView (){
    BOOL hasEnteredContent;
}

@end

@implementation RGPlaceholderTextView

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [self setup];
}

- (void)setup{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didBeginEditing:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didEndEditing:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeEditing:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
}

- (void)didBeginEditing:(NSNotification *)notification{
    [self setNeedsDisplay];
}

- (void)didEndEditing:(NSNotification *)notification{
    [self setNeedsDisplay];
}

- (void)didChangeEditing:(NSNotification *)notification{
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)aPlaceholder{
    _placeholder = aPlaceholder;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //检测到内容为空时，则设置placeholder string显示。
    if (self.text.length >0){
        return;
    }
    
    UIColor *color = [UIColor colorWithRed:199/255.0 green:199/255.0 blue:205/255.0 alpha:1.0];
    
    CGRect placeholdRect = rect;
    placeholdRect.origin.x = kPlaceholderX;
    placeholdRect.origin.y = kPlaceholderY;
    
    [self.placeholder drawInRect:placeholdRect withAttributes:@{NSFontAttributeName:self.font, NSForegroundColorAttributeName:color}];
}

@end
