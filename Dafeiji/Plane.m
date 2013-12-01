//
//  Plane.m
//  Dafeiji
//
//  Created by sjpsega on 13-11-30.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import "Plane.h"
#import "Bullet.h"

static CGFloat W = 30;
static CGFloat H = 40;
@interface Plane(){
    
}
@end

@implementation Plane

+(CGFloat)W{
    return W;
}

+(CGFloat)H{
    return H;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - implment Plane.h
-(id)initWithSpeed:(CGFloat)speed{
    self = [self init];
    if(self){
        self.speed = speed;
        self.frame = CGRectMake(0, 0, W, H);
        self.layer.borderWidth=1.0f;
        self.layer.borderColor=[[UIColor blackColor] CGColor];
    }
    return self;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(void)update{
    CGRect frame = self.frame;
    frame.origin.y +=self.speed;
    self.frame = frame;
}

-(void)sendBullet{
    if(self.bullets == nil){
        self.bullets = [[NSMutableArray alloc]init];
    }
    Bullet *bullet = [self getNewBullet];
    [self.bullets addObject:bullet];
    [self addSubview:bullet];
}

-(void)updateBulletState{
    for (Bullet *bullet in self.bullets) {
        [bullet setOrigin:CGPointMake(bullet.frame.origin.x, bullet.frame.origin.y + bullet.speed)];
    }
}

-(void)removeBullet:(Bullet *)bullet{
    [self.bullets removeObject:bullet];
    [bullet removeFromSuperview];
}

-(void)hurt:(int)damage{
    self.Hp-=damage;
    if(self.Hp <= 0){
        [self die];
    }
}

-(void)die{
    for (Bullet *bullet in self.bullets) {
        [bullet removeFromSuperview];
    }
    [self.bullets removeAllObjects];
    self.bullets = nil;
    [self removeFromSuperview];
}

#pragma mark - implment GetNewBulletProtocol
-(Bullet *)getNewBullet{
    Bullet *bullet = [[Bullet alloc]initWithSpeed:self.speed];
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
