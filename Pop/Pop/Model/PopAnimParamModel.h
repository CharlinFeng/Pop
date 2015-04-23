//
//  PopAnimParamModel.h
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//  Pop动画参数模型

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class POPAnimation;







@interface PopAnimParamModel : NSObject




/*
 *  公共属性
 */

/*
 *  公共属性：缺省
 */
@property (nonatomic,strong) id fromValue;

/** 终点值 */
@property (nonatomic,strong) id toValue;

/** 属性名 */
@property (nonatomic,copy) NSString *name;


/** 完成回调Block */
@property (nonatomic,copy) void(^completeBlock)(POPAnimation *anim, BOOL finished);



/*
 *  公共属性：自定义属性
 */
/** 读 */
@property (nonatomic, copy) void (^readBlock)(id obj, CGFloat values[]);

/** 写 */
@property (nonatomic, copy) void (^writeBlock)(id obj, const CGFloat values[]);





/*
 *  弹力动画
 */


/*
 *  弹力动画：缺省属性
 */
/** 反弹－影响动画作用的参数的变化幅度 */
@property (nonatomic,assign) CGFloat bounciness;

/** 动画速度 */
@property (nonatomic,assign) CGFloat speed;

/** 拉力－影响回弹力度以及速度 */
@property (nonatomic,assign) CGFloat tension;

/** 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止 */
@property (nonatomic,assign) CGFloat friction;

/** 质量－细微的影响动画的回弹力度以及速度 */
@property (nonatomic,assign) CGFloat mass;









/*
 *  衰减动画
 */

/*
 *  衰减动画：缺省属性
 */
/** 速率，如果此值是负值，那么就会反向递减 */
@property (nonatomic,strong) id velocity;

/** 负加速度，是一个你会很少用到的值，默认是就是我们地球的 0.998，如果你开发给火星人用，那么这个值你使用 0.376 会更合适 */
@property (nonatomic,assign) CGFloat deceleration;





/*
 *  基本动画
 */

/*
 *  基本动画：缺省属性
 */
/** 持续时长 */
@property (nonatomic,assign) CGFloat duration;

/** 时间函数 */
@property (nonatomic,strong) CAMediaTimingFunction *timingFunction;









@end
