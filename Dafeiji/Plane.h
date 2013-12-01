//
//  Plane.h
//  Dafeiji
//
//  Created by sjpsega on 13-11-30.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Bullet;

@protocol GetNewBulletProtocol <NSObject>
-(Bullet *)getNewBullet;
@end

@interface Plane : UIView<GetNewBulletProtocol>
@property(assign,nonatomic) CGFloat speed;
@property(strong,nonatomic) NSMutableArray *bullets;
@property(assign,nonatomic) int Hp;
-(id)initWithSpeed:(CGFloat)speed;
-(void)setOrigin:(CGPoint)origin;
-(void)sendBullet;
-(void)updateBulletState;
-(void)update;
-(void)removeBullet:(Bullet *)bullet;
-(void)hurt:(int)damage;
-(void)die;

+(CGFloat)W;
+(CGFloat)H;
@end
