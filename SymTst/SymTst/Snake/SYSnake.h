//
//  SYSnake.h
//  SymTst
//
//  Created by zhangshupeng on 16/6/24.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import <Foundation/Foundation.h>

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

- (void)forward:(SnakeDirection)direction;

- (void)eat;

- (BOOL)die;

@end
