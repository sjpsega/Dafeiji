//
//  ViewController.m
//  Dafeiji
//
//  Created by sjpsega on 13-11-30.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import "ViewController.h"
#import "MyPlane.h"
#import "EnemyPlane.h"
#import "Bullet.h"

const int emenyNum = 4;
CGFloat W;
CGFloat H;

@interface ViewController (){
    MyPlane *myPlane;
    NSMutableArray *enemyPlanes;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect bounds = [[UIScreen mainScreen]applicationFrame];
    W = CGRectGetWidth(bounds);
    H = CGRectGetHeight(bounds);
    
    [self addMyPlane];
    
    enemyPlanes = [NSMutableArray arrayWithCapacity:emenyNum];
    
    NSTimer *newTimer = [NSTimer timerWithTimeInterval:1.0/60
                                                target:self
                                              selector:@selector(timerLoop:)
                                              userInfo:nil
                                               repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:newTimer forMode:NSDefaultRunLoopMode];
}

- (void) timerLoop:(NSTimer *)paramTimer{
    
    [self addEmeny];
    
    for (EnemyPlane *plane in enemyPlanes) {
        [plane update];
    }
    
    [self removeEmenyIfOutScreen];
    
    [self hitByEnemy];
    
    [self hitEnemy];
    
    [myPlane update];
}

-(void)addMyPlane{
    myPlane = [[MyPlane alloc]initWithSpeed:0.0f];
    [myPlane setOrigin:CGPointMake(W/2, H)];
    myPlane.backgroundColor = [UIColor blueColor];
    [self.view addSubview:myPlane];
}

-(void)addEmeny{
    if((arc4random() % 10)>8 && enemyPlanes.count < emenyNum){
        EnemyPlane *enemyPlane = [[EnemyPlane alloc]initWithSpeed:3.0f];
        [enemyPlane setOrigin:CGPointMake(arc4random()%280, 1)];
        enemyPlane.backgroundColor = [UIColor redColor];
        [enemyPlanes addObject:enemyPlane];
        [self.view addSubview:enemyPlane];
    }
}

-(void)removeEmenyIfOutScreen{
    [enemyPlanes enumerateObjectsUsingBlock:^(Plane *plane, NSUInteger idx, BOOL *stop) {
        if([self isOutScreen:plane.frame.origin]){
            [enemyPlanes removeObject:plane];
            [plane die];
        }
    }];
}

-(BOOL)isOutScreen:(CGPoint)origin{
    if(origin.y > H || origin.x > W){
        return YES;
    }
    return NO;
}

-(void)hitByEnemy{
    [enemyPlanes enumerateObjectsUsingBlock:^(Plane *enemyPlane, NSUInteger planeIdx, BOOL *stop) {
        if(CGRectIntersectsRect(enemyPlane.frame, myPlane.frame)){
            [self hitByEnemyHandler];
            [enemyPlane die];
            NSLog(@"hit");
        }
        NSMutableArray *bullets = enemyPlane.bullets;
        
        [bullets enumerateObjectsUsingBlock:^(Bullet *bullet, NSUInteger bulletIdx, BOOL *stop) {
            CGRect convertRect = [self.view convertRect:bullet.frame fromView:enemyPlane];
            if(CGRectIntersectsRect(convertRect, myPlane.frame)){
                [enemyPlane removeBullet:bullet];
                [self hitByEnemyHandler];
                NSLog(@"hit by bullet");
            }
        }];

    }];
}

-(void)hitByEnemyHandler{
    [myPlane hurt:1];
    if(myPlane.Hp <= 0){
//        [myPlane die];
    }
}

-(void)hitEnemy{
    NSMutableArray *bullets = myPlane.bullets;
    [bullets enumerateObjectsUsingBlock:^(Bullet *bullet, NSUInteger bulletIdx, BOOL *stop) {
        CGRect convertRect = [self.view convertRect:bullet.frame fromView:myPlane];
        [enemyPlanes enumerateObjectsUsingBlock:^(Plane *enemyPlane, NSUInteger planeIdx, BOOL *stop) {
            if(CGRectIntersectsRect(convertRect, enemyPlane.frame)){
                [myPlane removeBullet:bullet];
                [enemyPlane hurt:1];
                if(enemyPlane.Hp<=0){
                    [enemyPlanes removeObject:enemyPlane];
                }
                NSLog(@"hit emeny!!!");
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
