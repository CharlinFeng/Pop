//
//  POPSpringAnimation+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "POPSpringAnimation+Extend.h"
#import "PopAnimParamModel.h"





@implementation POPSpringAnimation (Extend)




/*
 *  传递模型
 */
-(void)setSpringParamModel:(PopAnimParamModel *)paramModel{
    
    //起点值
    if(paramModel.fromValue != nil) self.fromValue = paramModel.fromValue;
    
    //终点值
    if(paramModel.toValue != nil) self.toValue = paramModel.toValue;
    
    //速度
    if(paramModel.speed>0) self.springSpeed =paramModel.speed;
    
    //质量
    if(paramModel.mass>0) self.dynamicsMass = paramModel.mass;
    
    //完成
    self.completionBlock = paramModel.completeBlock;
}





@end
