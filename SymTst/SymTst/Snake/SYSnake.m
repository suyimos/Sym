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

- (BOOL)forward {
    SYSnakeBodyPoint *newPoint = [self nextFood];
//    SYSnakeBodyPoint *snakeHead = [self.body firstObject];
    
    


    /**
     *  前进了一个点
     */
    [self.body insertObject:newPoint atIndex:0];
    /**
     *  移除最后一个点
     */
    [self.body removeLastObject];
    /**
     *  判断是否死亡
     */
    return [self die];
}
- (void)eat:(SYSnakeBodyPoint *)food{

    /**
     *  吃下食物
     */
    [self.body insertObject:food atIndex:0];
}

- (BOOL)die{
    SYSnakeBodyPoint *snakeHead = [self head];
    NSArray * snakeBody = [self.body subarrayWithRange:NSMakeRange(1, self.body.count - 1)];
    for (SYSnakeBodyPoint *body in snakeBody) {
        if ([body isEqual:snakeHead]) {
            return YES;
        }
    }
    return NO;
}

- (SYSnakeBodyPoint *)head{
    
    return [self.body firstObject];
}

- (SYSnakeBodyPoint *)nextFood{
    SYSnakeBodyPoint *newPoint = [[SYSnakeBodyPoint alloc]init];
    SYSnakeBodyPoint *snakeHead = [self head];
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
    _nextPoint = newPoint;
    return newPoint;
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

- (NSString *)description{
    return [NSString stringWithFormat:@"%ld====%ld",self.x,self.y];
}

@end
