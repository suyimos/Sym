//
//  SYSnake.m
//  SymTst
//
//  Created by zhangshupeng on 16/6/24.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import "SYSnake.h"

@implementation SYSnake

- (instancetype)init{
    if (self = [super init]) {
        self.body = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)forward:(SnakeDirection)direction {
    SYSnakeBodyPoint *newPoint = [[SYSnakeBodyPoint alloc]init];
    SYSnakeBodyPoint *snakeHead = [self.body firstObject];
    
    
    switch (self.direction) {
        case SnakeDirectionLeft:
        {
            newPoint.x = snakeHead.x - 1;
            newPoint.y = snakeHead.y;
        }
            break;
        case SnakeDirectionRight:
        {
            newPoint.x = snakeHead.x + 1;
            newPoint.y = snakeHead.y;
        }
            break;
        case SnakeDirectionTop:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y - 1;
        }
            break;
        case SnakeDirectionBottom:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y + 1;
        }
            break;
            
        default:
            break;
    }
    /**
     *  前进了一个点
     */
    [self.body addObject:newPoint];
    /**
     *  移除最后一个点
     */
    [self.body removeLastObject];
    /**
     *  判断是否死亡
     */
    [self die];
}
- (void)eat {
    SYSnakeBodyPoint *newPoint = [[SYSnakeBodyPoint alloc]init];
    SYSnakeBodyPoint *snakeHead = [self.body firstObject];
    switch (self.direction) {
        case SnakeDirectionLeft:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y - 1;
        }
            break;
        case SnakeDirectionRight:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y - 1;
        }
            break;
        case SnakeDirectionTop:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y - 1;
        }
            break;
        case SnakeDirectionBottom:
        {
            newPoint.x = snakeHead.x;
            newPoint.y = snakeHead.y - 1;
        }
            break;
            
        default:
            break;
    }
    /**
     *  吃下食物
     */
    [self.body addObject:newPoint];
}

- (BOOL)die{
    SYSnakeBodyPoint *snakeHead = [self.body firstObject];
    NSArray * snakeBody = [self.body subarrayWithRange:NSMakeRange(1, self.body.count - 1)];
    if ([snakeBody containsObject:snakeHead]) {
        return YES;
    }
    return NO;
}


@end


@implementation SYSnakeBodyPoint

- (BOOL)isEqual:(SYSnakeBodyPoint *)object {
    if (object.x == self.x&&self.y==object.y) {
        return YES;
    }else{
        return NO;
    }
}



@end
