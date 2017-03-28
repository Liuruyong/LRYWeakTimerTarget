//
//  LRYWeakTimerTarget.h
//  LRYWeakTimerTarget
//
//  Created by mac on 28/03/2017.
//  Copyright © 2017 liuruyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRYWeakTimerTarget : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(nonnull SEL)sel;

@end
