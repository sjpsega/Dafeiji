//
//  EmenyPlane.m
//  Dafeiji
//
//  Created by sjpsega on 13-12-1.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import "EnemyPlane.h"
#import "Bullet.h"
@implementation EnemyPlane

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    self = [super init];
    if(self){
        self.Hp = 5;
    }
    return self;
}

-(void)update{
    [super update];
    
    if((arc4random()%100)>90){
        [self sendBullet];
    }
    [self updateBulletState];
}

#pragma mark - implment GetNewBulletProtocol
-(Bullet *)getNewBullet{
    Bullet *bullet = [[Bullet alloc]initWithSpeed:self.speed+3.0f];
    [bullet setOrigin:CGPointMake(Plane.W/2-Bullet.W/2, Plane.H)];
    bullet.backgroundColor = [UIColor blackColor];
    return bullet;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
