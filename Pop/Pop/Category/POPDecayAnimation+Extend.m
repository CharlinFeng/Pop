//
//  POPDecayAnimation+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "POPDecayAnimation+Extend.h"
#import "PopAnimParamModel.h"

@implementation POPDecayAnimation (Extend)

/*
 *  传递模型
 */
-(void)setDecayParamModel:(PopAnimParamModel *)paramModel{
    
    //起点值
    if(paramModel.fromValue != nil) self.fromValue = paramModel.fromValue;
    
    //速率
    if(paramModel.velocity != nil) self.velocity = paramModel.velocity;
    
    //完成
    self.completionBlock = paramModel.completeBlock;
}

@end
