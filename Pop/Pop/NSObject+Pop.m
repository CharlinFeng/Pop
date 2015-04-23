//
//  POPAnimation+Extend.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/21.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "NSObject+Pop.h"
#import "POPAnimation+Extend.h"

@implementation NSObject (Pop)



/**
 *  pop动画
 *
 *  @param animType     动画类型
 *  @param propertyType 动画属性类型
 *  @param paramModel   参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_anim:(PopAnimType)animType propertyType:(PopAnimPropertyType)propertyType paramModelBlock:(PopAnimParamModel *(^)())paramModelBlock{
    
    PopAnimParamModel *paramModel = paramModelBlock();
    
    if(PopAnimPropertyTypeCustom == propertyType){
        
        if(paramModel.writeBlock==nil || paramModel.readBlock==nil){
            
            NSLog(@"错误：请传入属性的读或写block");return nil;
        }
        
        if(paramModel.fromValue==nil || paramModel.toValue==nil){
            
            NSLog(@"错误：请传入属性的起点值或终点值");return nil;
        }
    }
    
    POPAnimation *popAnim = nil;
    
    //1.弹力动画
    //1.1 弹力动画：缺省
    if(PopAnimPropertyTypeNormal == propertyType){
        
        if(paramModel.name==nil){
            NSLog(@"错误：请传入缺省参数名");return nil;
        }
        
        popAnim = [self pop_SpringNormalAnim:paramModel];
    }
    //1.2 弹力动画：自定义属性
    if(PopAnimTypeSpring == animType && PopAnimPropertyTypeCustom == propertyType) popAnim = [self pop_SpringPropertyAnim:paramModel];
    
    //2.衰减动画
    if(PopAnimTypeDecay == animType){
        if(paramModel.velocity == nil){
            
            NSLog(@"错误：请传入速度");return nil;
        }
    }
    //2.1 衰减动画：缺省
    if(PopAnimTypeDecay == animType && PopAnimPropertyTypeNormal == propertyType) popAnim = [self pop_DecayNormalAnim:paramModel];
    //2.2 衰减动画：自定义属性
    if(PopAnimTypeDecay == animType && PopAnimPropertyTypeCustom == propertyType) popAnim = [self pop_DecayPropertyAnim:paramModel];
    
    //3.基本动画
    //3.1 基本动画：缺省
    if(PopAnimTypeBasic == animType && PopAnimPropertyTypeNormal == propertyType) popAnim = [self pop_BasicNormalAnim:paramModel];
    //3.2 基本动画：自定义属性
    if(PopAnimTypeBasic == animType && PopAnimPropertyTypeCustom == propertyType) popAnim = [self pop_BasicPropertyAnim:paramModel];
    
    return popAnim;
}





/**
 *  弹力动画：普通
 *
 *  @param paramModel    动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_SpringNormalAnim:(PopAnimParamModel *)paramModel{
    
    //新建一个弹力动画
    POPSpringAnimation *springAnim =[POPSpringAnimation animationWithPropertyNamed:paramModel.name];
    
    //动画统一入口：普通
    [self normalAnim:springAnim paramModel:paramModel];
    
    return springAnim;
}



/**
 *  弹力动画：自定义属性
 *
 *  @param paramModel    动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_SpringPropertyAnim:(PopAnimParamModel *)paramModel{
    
    //新建一个弹力动画
    POPSpringAnimation *springAnim =[POPSpringAnimation animation];
    
    //动画统一入口：自定义属性
    [self propertyAnim:springAnim paramModel:paramModel];
    
    return springAnim;
}


-(POPAnimatableProperty *)animtableProperty:(PopAnimParamModel *)paramModel{
    
    POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"animtableProperty" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock =paramModel.writeBlock;
        prop.readBlock =paramModel.readBlock;
    }];
    
    return property;
}





/**
 *  衰减动画：普通
 *
 *  @param paramModel 动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_DecayNormalAnim:(PopAnimParamModel *)paramModel{
    
    //创建普通衰减动画
    POPDecayAnimation *decayAnim = [POPDecayAnimation animationWithPropertyNamed:paramModel.name];
    
    //动画统一入口：普通
    [self normalAnim:decayAnim paramModel:paramModel];
    
    return decayAnim;
}





/**
 *  衰减动画：自定义属性
 *
 *  @param paramModel 动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_DecayPropertyAnim:(PopAnimParamModel *)paramModel{
    
    //创建自定义属性衰减动画
    POPDecayAnimation *decayAnim = [POPDecayAnimation animation];
    
    //动画统一入口：自定义属性
    [self propertyAnim:decayAnim paramModel:paramModel];
    
    return decayAnim;
}






/**
 *  基本动画：普通
 *
 *  @param paramModel 动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_BasicNormalAnim:(PopAnimParamModel *)paramModel{
    
    //创建普通衰减动画
    POPBasicAnimation *basicAnim = [POPBasicAnimation animationWithPropertyNamed:paramModel.name];
    
    //动画统一入口：普通
    [self normalAnim:basicAnim paramModel:paramModel];
    
    return basicAnim;
}




/**
 *  基本动画：自定义属性
 *
 *  @param paramModel 动画参数模型
 *
 *  @return 动画实例
 */
-(POPAnimation *)pop_BasicPropertyAnim:(PopAnimParamModel *)paramModel{
    
    //创建自定义属性衰减动画
    POPBasicAnimation *basicAnim = [POPBasicAnimation animation];
    
    //动画统一入口：自定义属性
    [self propertyAnim:basicAnim paramModel:paramModel];
    
    return basicAnim;
}










/*
 *  动画统一入口：普通
 */
-(void)normalAnim:(POPAnimation *)anim paramModel:(PopAnimParamModel *)paramModel{
    
    //传递模型配置动画
    [anim setParamModel:paramModel];
    
    //向动画载体添加动画
    [self pop_addAnimation:anim forKey:paramModel.name];
}



/*
 *  动画统一入口：自定义属性
 */
-(void)propertyAnim:(POPAnimation *)anim paramModel:(PopAnimParamModel *)paramModel{
    
    //获取自定义属性
    POPAnimatableProperty *property = [self animtableProperty:paramModel];
    
    //设置自定义属性
    [anim setValue:property forKeyPath:@"property"];
    
    //传递模型配置动画
    [anim setParamModel:paramModel];
    
    //向动画载体添加动画
    [self pop_addAnimation:anim forKey:@"propertyAnim"];
}


@end
