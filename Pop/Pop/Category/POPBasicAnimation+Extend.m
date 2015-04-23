//
//  POPBasicAnimation+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "POPBasicAnimation+Extend.h"
#import "PopAnimParamModel.h"

@implementation POPBasicAnimation (Extend)

/*
 *  传递模型
 */
-(void)setBasicParamModel:(PopAnimParamModel *)paramModel{
    
    //起点值
    if(paramModel.fromValue != nil) self.fromValue = paramModel.fromValue;
    
    //终点值
    if(paramModel.toValue != nil) self.toValue = paramModel.toValue;
    
    //持续时长
    if(self.duration) self.duration = paramModel.duration;
    
    //时间函数
    if(paramModel.timingFunction != nil) self.timingFunction = paramModel.timingFunction;
    
    //完成
    self.completionBlock = paramModel.completeBlock;
}


@end
