//
//  RectTouchImageView.m
//  ChildrenLocation
//
//  Created by szalarm on 15/9/2.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "RectTouchImageView.h"

@implementation RectTouchImageView

-(id) initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
    }
    return self;
}

//重载一下
-(id) init
{
    if(self=[super init]){
        self.userInteractionEnabled=YES;
        self.backgroundColor =[UIColor clearColor];
        
    }
    return  self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder:aDecoder]){
        self.userInteractionEnabled=YES;
        
    }
    return  self;
}
//添加事件
- (void)addTarget:(id)target action:(SEL)action{
    self.target=target;
    self.action=action;
}
//开始事件
-(void)addTargetStart:(id)targetStart action:(SEL)actionStart
{
    self.targetStart=targetStart;
    self.actionStart=actionStart;
}
//结束事件
-(void)addTargetEnd:(id)targetEnd action:(SEL)actionEnd
{
    self.targetEnd=targetEnd;
    self.actionEnd=actionEnd;
}
//开始之后事件
-(void)addTargetStartAfter:(id)targetStartAfter action:(SEL)actionStartAfter
{
    self.targetStartAfter=targetStartAfter;
    self.actionStartAfter=actionStartAfter;
}
//结束之后事件
-(void) addTargetEndAfter:(id)targetEndAfter action:(SEL)actionEndAfter
{
    self.targetEndAfter=targetEndAfter;
    self.actionEndAfter=actionEndAfter;

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches Begin");
    self.imageViewFrame=self.frame;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.targetStart performSelector:self.actionStart withObject:self];
    [self.targetStartAfter performSelector:self.actionStartAfter withObject:self afterDelay:0.01];
#pragma clang diagnostic pop
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches ended begin");
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=self.imageViewFrame;
    } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
        [self.targetEnd performSelector:self.actionEnd withObject:self];
        [self.targetEndAfter performSelector:self.actionEndAfter withObject:self afterDelay:0.01];
#pragma clang diagnostic pop
    }];
    
}


@end
