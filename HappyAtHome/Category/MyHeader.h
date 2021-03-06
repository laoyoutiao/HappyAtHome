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
#define TagView(y) 500 + y

//Label of Tag
#define TagLabel(z) 100 + z

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

//Block Weak
#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;

//SetFrame Label
#define LabelSetFrame(a,b,c,d) [[UILabel alloc] initWithFrame:CGRectMake(a, b, c, d)]

//SetFrame Button
#define ButtonSetFrame(a,b,c,d) [[UIButton alloc] initWithFrame:CGRectMake(a, b, c, d)]

//SetFrame View
#define ViewSetFrame(a,b,c,d) [[UIView alloc] initWithFrame:CGRectMake(a, b, c, d)]

//SetFrame ImageView
#define ImageViewSetFrame(a,b,c,d) [[UIImageView alloc] initWithFrame:CGRectMake(a, b, c, d)]

#endif /* MyHeader_h */
