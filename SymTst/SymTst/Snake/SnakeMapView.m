//
//  SnakeMapView.m
//  SymTst
//
//  Created by zhangshupeng on 16/6/27.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import "SnakeMapView.h"

@interface SnakeMapView ()
{
    
}

@property (nonatomic, strong) NSMutableSet *points;

@end

@implementation SnakeMapView

- (instancetype)init{
    if (self = [super init]) {
        self.mapType = MapType1;
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
- (void)createMap{
    
    
}

- (NSInteger)coordinateMax{
    return 320/self.mapType;
}

- (void)drawMap:(NSArray *)points{
    for (UIView * sub in self.subviews) {
        //等待重用
        [self.points addObject:sub];
        //移除
        [sub removeFromSuperview];
    }
    
    for (int i = 0;i < points.count;i++) {
        SYSnakeBodyPoint *point = points[i];
        UIView *pointView = [self getMapPoint];
        pointView.center = CGPointMake(self.mapType/2 + self.mapType*point.x, self.mapType/2 + self.mapType*point.y);
        [self addSubview:pointView];
    }
    
}

- (UIView *)getMapPoint{
    UIView *point = [self.points anyObject];
    if (point == nil) {
        point = [[UIView alloc]init];
        point.backgroundColor = [UIColor greenColor];
        point.bounds = CGRectMake(0, 0, self.mapType, self.mapType);
    }else{
        [self.points removeObject:point];
    }
    return point;
}

- (NSMutableSet *)points{
    if (_points == nil) {
        _points = [NSMutableSet setWithCapacity:0];
    }
    return _points;
}

@end
