//
//  RectTouchImageView.h
//  ChildrenLocation
//
//  Created by szalarm on 15/9/2.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 原始图片按钮
 */
@interface RectTouchImageView : UIImageView
@property(nonatomic)CGRect imageViewFrame;
@property(nonatomic) id target;
@property(nonatomic)SEL action;
//开始事件
@property(nonatomic) id targetStart;
@property(nonatomic)SEL actionStart;
//开始之后事件
@property(nonatomic) id targetStartAfter;
@property(nonatomic)SEL actionStartAfter;
//结束事件
@property(nonatomic) id targetEnd;
@property(nonatomic)SEL actionEnd;
//结束之后事件
@property(nonatomic) id targetEndAfter;
@property(nonatomic)SEL actionEndAfter;

//@property(nonatomic,)
-(void)addTarget:(id)target action:(SEL)action;
-(void)addTargetStart:(id)targetStart action:(SEL)actionStart;
-(void)addTargetStartAfter:(id)targetStartAfter action:(SEL)actionStartAfter;
-(void)addTargetEnd:(id)targetEnd action:(SEL)actionEnd;
-(void)addTargetEndAfter:(id)targetEndAfter action:(SEL)actionEndAfter;
@end
