//
//  ViewController.m
//  Pop
//
//  Created by 冯成林 on 15/4/20.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Pop.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


    [self.redView pop_anim:PopAnimTypeBasic propertyType:PopAnimPropertyTypeCustom paramModelBlock:^PopAnimParamModel *{

        PopAnimParamModel *paramModel = [[PopAnimParamModel alloc] init];
        
        paramModel.fromValue=@(0);
        paramModel.toValue=@(50);
        
        paramModel.duration=5;
        
        paramModel.writeBlock=^(id obj,const CGFloat values[]){

            _countLabel.text = [NSString stringWithFormat:@"%@",@(values[0])];
        };


        paramModel.readBlock=^(id obj,CGFloat values[]){

            values[0] =[_countLabel.text floatValue];
        };

        return paramModel;
    }];

}



@end
