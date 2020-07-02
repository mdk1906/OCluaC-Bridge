//
//  ViewController.m
//  occ++lua
//
//  Created by 马定坤 on 2020/6/17.
//  Copyright © 2020 mdkmdk. All rights reserved.
//



#import "ViewController.h"

#import "bridge.hpp"
#import "ViewController2.h"
#include <string>
#include <vector>
#include <unordered_map>
#include <sys/mount.h>


@interface ViewController ()


{
    UIButton* _skipBtn;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // insert code here...
    bridge::sayHello();
    
    std::string str = bridge::getFreeDiskSpaceInBytes();
    NSLog(@"剩余内存 = %@",[NSString stringWithUTF8String:str.c_str()]);
    
    [self createNewSkipBtnWithishidden:nil orientation:@"0" width:nil height:nil frame:@"1"];
    
}

-(void)btnclick{
    ViewController2 *vc = [ViewController2 new];
    [self.navigationController pushViewController:vc animated:true];
}
//    ishidden 0=false 1=true  是否显示
//    orientation 0 = 正常 1 = 顺时针旋转90° 2 = 顺时针旋转180° 3 = 顺时针旋转270° 旋转度数
//    width 宽度
//    height 高度
//    frame 0 = 左上角 1 = 右上角 2 = 左下角 3 = 右下角 默认竖屏
-(void)createNewSkipBtnWithishidden:(NSString *)ishiddenstr orientation:(NSString*)orientationstr width:(NSString *)widthstr height:(NSString *)heightstr frame:(NSString *)framestr{

    NSString *ishidden = ishiddenstr!=nullptr ? ishiddenstr:@"";
    NSString * orientation= orientationstr!=nullptr ? orientationstr:@"";
    NSString * width= widthstr!=nullptr ? widthstr:@"";
    NSString * height= heightstr!=nullptr ? heightstr:@"";
    NSString * frame= framestr!=nullptr ? framestr:@"";

    if (_skipBtn != nullptr) {
        [_skipBtn removeFromSuperview];
        _skipBtn = nullptr;
    }
    
    _skipBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    _skipBtn.frame = CGRectMake(self.view.frame.size.width - 134*0.6, 0, 134.0*0.6, 60.0*0.6);
    _skipBtn.backgroundColor = [UIColor clearColor];
    
    [_skipBtn setBackgroundImage:[UIImage imageNamed:@"videoskip.png"] forState:UIControlStateNormal];
    [_skipBtn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_skipBtn];
    //自定义skipbtn
    if ([ishidden isEqualToString:@"0"]) {
        //不显示
        [_skipBtn removeFromSuperview];
        _skipBtn = nullptr;
    }
    if ([orientation isEqualToString:@"1"]||[orientation isEqualToString:@"2"]||[orientation isEqualToString:@"3"]) {
        //顺时针旋转
        float angle = [orientation intValue] * 0.5;
        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*angle);
        _skipBtn.transform = transform;
    }
    //设置原始宽高
    int widthint = ![width isEqualToString:@""]? [width intValue] : 134.0*0.6;
    int heightint = ![height isEqualToString:@""]? [height intValue] : 60*0.6;
    if ([orientation isEqualToString:@"1"] || [orientation isEqualToString:@"3"]) {
        widthint ^= heightint;
        heightint ^= widthint;
        widthint ^= heightint;
    }
    if (![frame isEqualToString:@""]) {
        //设置了具体位置
        int frameint = [frame intValue];
        switch (frameint) {
            case 0:
                //左上角
                [_skipBtn setFrame:CGRectMake(0, 84, widthint, heightint)];
                break;
            case 1:
                //右上角
                [_skipBtn setFrame:CGRectMake(self.view.frame.size.width-widthint, 84, widthint, heightint)];
                break;
            case 2:
                //左下角
                [_skipBtn setFrame:CGRectMake(0, self.view.frame.size.height-heightint, widthint, heightint)];
                break;
            case 3:
                //右下角
                [_skipBtn setFrame:CGRectMake(self.view.frame.size.width-widthint, self.view.frame.size.height-heightint, widthint, heightint)];
                break;
            default:
                break;
        }
    }
    else{
        //没设置具体位置 默认右上角
        [_skipBtn setFrame:CGRectMake(self.view.frame.size.width-widthint, 84, widthint, heightint)];
    }
    
}





@end

