//
//  WSColorHelper.h
//  ClientMarket
//
//  Created by 王岁康 on 2017/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#ifndef WSkColorHelper_h
#define WSkColorHelper_h

#define WSKCOLOR_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
#define WSkPink_Color [UIColor colorWithRed:218/255.0 green:156/255.0 blue:191/255.0 alpha:1]
#define WSkRed_Color [UIColor colorWithRed:202/255.0 green:113/255.0 blue:162/255.0 alpha:1]
#endif /* WSColorHelper_h */
