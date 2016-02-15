//
//  CircleLongPressImage.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/29.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 圆形
 */
@interface CircleLongPressImage : UIImageView
@property(nonatomic)CGRect imageViewFrame;
@property(nonatomic) id target;
@property(nonatomic)SEL action;
//开始事件
@property(nonatomic) id targetStart;
@property(nonatomic)SEL actionStart;
//结束事件
@property(nonatomic) id targetEnd;
@property(nonatomic)SEL actionEnd;
//@property(nonatomic,)
-(void)addTarget:(id)target action:(SEL)action;
-(void)addTargetStart:(id)targetStart action:(SEL)actionStart;
-(void)addTargetEnd:(id)targetEnd action:(SEL)actionEnd;
@end
