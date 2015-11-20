//
//  MyHeader.h
//  OldMan
//
//  Created by 玉文辉 on 15/9/23.
//  Copyright © 2015年 玉文辉. All rights reserved.
//

#import "UIColor+Hex.h"

#ifndef MyHeader_h
#define MyHeader_h

//Button of Tag
#define TagButton(x) 1000 + x

//View of Tag
#define TagView(y) 100 + y

//Screen of window
#define ScreenSize [UIScreen mainScreen].bounds.size

//Log string
#define NSLogStr(x) NSLog(@"%@",x);

//Log int (8)
#define NSLogInt(x) NSLog(@"%d",x);

//Log integer (16)
#define NSLogInteger(x) NSLog(@"%ld",x);

//Log float (8)
#define NSLogFloat(x) NSLog(@"%f",x);

//Log cgfloat (16)
#define NSLogCGFloat(x) NSLog(@"%lf",x);

//Log bool
#define NSLogBool(x) NSLog(@"%u",x);

//Log string in array by chinese (json)
#define NSLogArray(format, ...) do {                                        \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

#endif /* MyHeader_h */
