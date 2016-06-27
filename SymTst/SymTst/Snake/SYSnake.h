//
//  SYSnake.h
//  SymTst
//
//  Created by zhangshupeng on 16/6/24.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SYSnakeBodyPoint;

typedef enum {
    SnakeDirectionTop,
    SnakeDirectionBottom,
    SnakeDirectionLeft,
    SnakeDirectionRight,
}SnakeDirection;

@interface SYSnakeBodyPoint : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (BOOL)isEqual:(SYSnakeBodyPoint *)object;

@end

@interface SYSnake : NSObject

@property (nonatomic, strong) NSMutableArray * body;

@property (nonatomic, assign) SnakeDirection direction;

@property (nonatomic, strong, readonly) SYSnakeBodyPoint* head;

@property (nonatomic, strong, readonly) SYSnakeBodyPoint* nextPoint;

- (void)forward;

- (void)eat:(SYSnakeBodyPoint *)food;

- (BOOL)die;

@end
