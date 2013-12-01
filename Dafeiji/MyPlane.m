//
//  MyPlane.m
//  Dafeiji
//
//  Created by sjpsega on 13-12-1.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import "MyPlane.h"
#import "Bullet.h"

@interface MyPlane (){
    int bulletCount;//子弹计数器
}
@end

@implementation MyPlane

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
        bulletCount = 0;
        self.Hp = 3;
    }
    return self;
}

#pragma mark - implment GetNewBulletProtocol
-(Bullet *)getNewBullet{
    Bullet *bullet = [[Bullet alloc]initWithSpeed:self.speed-3.0f];
    [bullet setOrigin:CGPointMake(Plane.W/2-Bullet.W/2, 0.0f)];
    bullet.backgroundColor = [UIColor yellowColor];
    return bullet;
}

-(void)update{
    [super update];
    
    if((bulletCount % 5) == 0){
        [self sendBullet];
    }
    bulletCount++;
    
    [self updateBulletState];
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
