//
//  bullet.h
//  Dafeiji
//
//  Created by sjpsega on 13-12-1.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bullet : UIView
@property(assign,nonatomic) CGFloat speed;
-(id)initWithSpeed:(CGFloat)speed;
-(void)setOrigin:(CGPoint)origin;

+(CGFloat)W;
+(CGFloat)H;
@end
