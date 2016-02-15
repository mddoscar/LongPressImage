//
//  CircleImageView.m
//  ChildrenLocation
//
//  Created by szalarm on 15/9/2.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView

-(id) initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=YES;
        self.layer.borderWidth=1.0;
        self.layer.borderColor=[UIColor grayColor].CGColor;//[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=self.frame.size.width/2+1;
        
        self.layer.backgroundColor=[UIColor whiteColor].CGColor;
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
-(void) drawRect:(CGRect)rect{
    float Radus= self.frame.size.width/2;
    //用bezier曲线画遮罩层
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter: CGPointMake(self.center.x-self.frame.origin.x, self.center.y-self.frame.origin.y) radius:Radus startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAShapeLayer *shape=[CAShapeLayer layer];
    shape.path=path.CGPath;
    self.layer.mask=shape;
    
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder:aDecoder]){
        self.userInteractionEnabled=YES;
        self.layer.borderWidth=1.0;
        self.layer.borderColor=[UIColor grayColor].CGColor;//[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=self.frame.size.width/2+1;
        
        self.layer.backgroundColor=[UIColor whiteColor].CGColor;
        
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches Begin");
    self.imageViewFrame=self.frame;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.targetStart performSelector:self.actionStart withObject:self];
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
#pragma clang diagnostic pop
    }];
    
}


@end
