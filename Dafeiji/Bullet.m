//
//  bullet.m
//  Dafeiji
//
//  Created by sjpsega on 13-12-1.
//  Copyright (c) 2013年 sjp. All rights reserved.
//

#import "Bullet.h"

static CGFloat W = 5;
static CGFloat H = 5;

@implementation Bullet

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

#pragma mark - implment bullet.h
-(id)initWithSpeed:(CGFloat)speed{
    self = [self init];
    if(self){
        self.speed = speed;
        self.frame = CGRectMake(0, 0, W, H);
    }
    return self;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
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
