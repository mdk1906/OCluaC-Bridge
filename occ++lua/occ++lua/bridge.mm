//
//  bridge.cpp
//  occ++lua
//
//  Created by 马定坤 on 2020/6/17.
//  Copyright © 2020 mdkmdk. All rights reserved.
//
#import <UIKit/UIKit.h>
#include "bridge.hpp"
#include <stdio.h>
#include <string>
#include <vector>
#include <unordered_map>
#include <sys/mount.h>

bridge *bridge::instance = nullptr;

bridge* bridge::getInstance() {
    if (instance == NULL) {
        instance = new bridge();
    }
    
    return instance;
}

void bridge::sayHello(){
    printf("hello from OC");
}

std::string bridge::getFreeDiskSpaceInBytes(){
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    
//    std::string str = std::to_string(freeSpace/1024/1024);
    
     NSString *str = [NSString stringWithFormat:@"%0.2lld ",freeSpace/1024/1024];
    return [str UTF8String];
}

