//
//  bridge.hpp
//  occ++lua
//
//  Created by 马定坤 on 2020/6/17.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#ifndef bridge_hpp
#define bridge_hpp
#include <string.h>
#include <stdio.h>
#include <vector>
class bridge {
    
public:
    static bridge* getInstance();
     static void sayHello();
    //获取手机剩余空间 单位MB
     static std::string getFreeDiskSpaceInBytes();
    
    
private:
    static bridge* instance;

    
};


#endif /* bridge_hpp */
