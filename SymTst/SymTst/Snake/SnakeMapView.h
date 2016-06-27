//
//  SnakeMapView.h
//  SymTst
//
//  Created by zhangshupeng on 16/6/27.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYSnake.h"

typedef enum {
    MapType1 = 2,//160x160
    MapType2 = 4,//80x80
    MapType3 = 5,//64x64
}MapType;

@interface SnakeMapView : UIView


@property (nonatomic, assign) MapType mapType;
@property (nonatomic, assign, readonly)NSInteger coordinateMax;

- (void)drawMap:(NSArray *)points;
- (void)createMap;

@end
