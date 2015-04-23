//
//  POPAnimation+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "POPAnimation+Extend.h"
#import "POPSpringAnimation+Extend.h"
#import "POPDecayAnimation+Extend.h"
#import "POPBasicAnimation+Extend.h"

@implementation POPAnimation (Extend)


/*
 *  传递模型
 */
-(void)setParamModel:(PopAnimParamModel *)paramModel{
    
    if([self isKindOfClass:[POPSpringAnimation class]]){//弹性动画
        
        __weak POPSpringAnimation *springAnim = (POPSpringAnimation *)self;
        
        [springAnim setSpringParamModel:paramModel];
        
    }else if([self isKindOfClass:[POPDecayAnimation class]]){//衰减动画
        
        __weak POPDecayAnimation *decayAnim = (POPDecayAnimation *)self;
        
        [decayAnim setDecayParamModel:paramModel];
        
    }else if ([self isKindOfClass:[POPBasicAnimation class]]){//基本动画
        
        __weak POPBasicAnimation *basicAnim = (POPBasicAnimation *)self;
        
        [basicAnim setBasicParamModel:paramModel];
    }
    
    self.removedOnCompletion = YES;
}

@end
