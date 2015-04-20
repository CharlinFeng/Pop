//
//  ViewController.m
//  Pop
//
//  Created by 冯成林 on 15/4/20.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //弹力动画
    POPSpringAnimation *springAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewSize];
    
    //起点值
    springAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
    
    //终点值
    springAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(200, 200)];
    
    springAnim.dynamicsMass = 5;
    
    springAnim.dynamicsFriction=24;
    
//    springAnim.dynamicsTension = 200;
    
    [self.redView pop_addAnimation:springAnim forKey:@"springAnim"];
}



@end
