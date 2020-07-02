//
//  ViewController2.m
//  occ++lua
//
//  Created by 马定坤 on 2020/6/17.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#import "ViewController2.h"
#import "lauxlib.h"

#import "lua.h"

#import "lualib.h"

#import "LuaBridge.h"

@interface ViewController2 ()
{
    lua_State* L;
}
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    
    L = [[LuaBridge instance] L];
    NSString *luaPath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"lua"];
    if (luaL_dofile(L, [luaPath UTF8String])) {
        NSLog(@"lua error :%s",lua_tostring(L, -1));
    }

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
