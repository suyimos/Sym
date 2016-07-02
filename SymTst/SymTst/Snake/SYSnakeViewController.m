//
//  SYSnakeViewController.m
//  SymTst
//
//  Created by zhangshupeng on 16/6/24.
//  Copyright © 2016年 nanw. All rights reserved.
//

#import "SYSnakeViewController.h"
#import "SYSnake.h"
#import "SnakeMapView.h"

@interface SYSnakeViewController ()
{
    NSTimer *_timer;
}
@property (nonatomic, strong) NSMutableSet *points;

@property (nonatomic, strong) SYSnake *snake;

@property (nonatomic, strong) SnakeMapView *mapView;

@property (nonatomic, strong) NSMutableArray *foods;

@end

@implementation SYSnakeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.mapView.frame = CGRectMake(0, 0, 320, 320);
    self.mapView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:self.mapView];
    
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refreshMap) userInfo:nil repeats:YES];
    
}


- (void)refreshMap{
    //移动之前判断蛇前面有没有食物
    if ([self array:self.foods ContainPoint:self.snake.nextPoint]) {
        [self.snake eat:self.snake.nextPoint];
        [self makeFood];
    }
    
    //爬行一段距离
    if ([self.snake forward]) {
        [_timer invalidate];
    }
    
    NSMutableArray * mapPoints = [NSMutableArray arrayWithArray:self.snake.body];
    [mapPoints addObjectsFromArray:self.foods];
    [self.mapView drawMap:mapPoints];
}


- (IBAction)control:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0) {
        
        self.snake.direction = SnakeDirectionTop;
    }else if(button.tag == 1){
        self.snake.direction = SnakeDirectionLeft;
    }else if(button.tag == 2){
        self.snake.direction = SnakeDirectionBottom;
    }else if(button.tag == 3){
        self.snake.direction = SnakeDirectionRight;
    }
}

- (SYSnakeBodyPoint *)getMapPoint{
    SYSnakeBodyPoint *point = [self.points anyObject];
    if (point == nil) {
        point = [[SYSnakeBodyPoint alloc]init];
    }else{
        [self.points removeObject:point];
    }
    return point;
}

- (SYSnake *)snake{
    if (_snake == nil) {
        _snake = [[SYSnake alloc]init];
        _snake.boundary = self.mapView.coordinateMax;
        _snake.direction = SnakeDirectionBottom;
        //给蛇一个初始的身体
        for (int i = 0; i<4; i++) {
            SYSnakeBodyPoint *point =[[SYSnakeBodyPoint alloc]init];
            point.x = 10;
            point.y = i;
            [_snake.body insertObject:point atIndex:0];
        }
    }
    return _snake;
}

- (SnakeMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[SnakeMapView alloc]init];
        _mapView.mapType = MapType2;
    }
    return _mapView;
}

- (NSMutableSet *)points{
    if (_points == nil) {
        _points = [NSMutableSet setWithCapacity:0];
    }
    return _points;
}

- (NSMutableArray *)foods{
    if (_foods == nil) {
        _foods = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i<6; i++) {
            
            [self makeFood];
        }
    }
    return _foods;
}

- (void)makeFood{
    SYSnakeBodyPoint *point = [self getMapPoint];
    point.x = random()%self.mapView.coordinateMax;
    point.y = random()%self.mapView.coordinateMax;
    if (![self array:self.foods ContainPoint:point]) {
        [self.foods addObject:point];
    }else{
        
        [self makeFood];
    }
}

- (BOOL)array:(NSMutableArray *)arr ContainPoint:(SYSnakeBodyPoint *)point{
    BOOL isContain = NO;
    SYSnakeBodyPoint *food;
    for (SYSnakeBodyPoint * p in arr) {
        if ([point isEqual:p]) {
            isContain = YES;
            food = p;
            break;
        }
    }
    [arr removeObject:food];
    return isContain;
}

@end
