//
//  POPAnimation+Extend.h
//  Carpenter
//
//  Created by 冯成林 on 15/4/21.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopAnimParamModel.h"
#import "POP.h"

/*
 *  动画类型
 */
typedef enum{
    
    //弹性动画
    PopAnimTypeSpring=0,
    
    //衰减动画
    PopAnimTypeDecay,
    
    //基本动画
    PopAnimTypeBasic,
    
}PopAnimType;


/*
 *  动画属性类型
 */
typedef enum{
    
    //缺省属性
    PopAnimPropertyTypeNormal,
    
    //自定义属性
    PopAnimPropertyTypeCustom,
    
}PopAnimPropertyType;








@class POPAnimation;


@interface NSObject (Pop)




/**
 *  pop动画
 *
 *  @param animType     动画类型
 *  @param propertyType 动画属性类型
 *  @param paramModel   参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_anim:(PopAnimType)animType propertyType:(PopAnimPropertyType)propertyType paramModelBlock:(PopAnimParamModel *(^)())paramModelBlock;








@end
