//
//  LRYWeakTimerTarget.m
//  LRYWeakTimerTarget
//
//  Created by mac on 28/03/2017.
//  Copyright © 2017 liuruyong. All rights reserved.
//

#import "LRYWeakTimerTarget.h"
#import <UIKit/UIDevice.h>

#define iOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

@interface LRYWeakTimerTarget ()

@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL selector;

@end

@implementation LRYWeakTimerTarget

- (instancetype)initWithTarget:(id)target selector:(SEL)sel {
    self = [super init];
    if (self) {
        self.target = target;
        self.selector = sel;
    }
    return self;
}

- (void)timerDidFire:(NSTimer *)timer {
    if(self.target)
    {
        [self.target performSelector:self.selector withObject:timer];
    }
    else
    {
        [timer invalidate];
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)sel {
    
    NSTimer * timer;
    
    if (iOS10) {
        __weak id weakTarget = target;
        timer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer* t) {
            id _Nullable strongTarget = weakTarget;
            [strongTarget performSelector:sel];
        }];
    }else {
        LRYWeakTimerTarget * weakTarget = [[self alloc]initWithTarget:target selector:sel];
        timer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakTarget selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
    }

    return timer;
}

@end
