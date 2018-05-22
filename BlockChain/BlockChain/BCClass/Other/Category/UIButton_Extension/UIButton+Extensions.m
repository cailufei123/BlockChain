//
//  UIButton+Extensions.m
//  BodyIntellect1.2
//
//  Created by 李静波 on 16/11/3.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import "UIButton+Extensions.h"
#import <objc/runtime.h>

@implementation UIButton (Extensions)

@dynamic hitEdgeInsets;

static const NSString *KEY_HIT_EDGE_INSETS = @"HitEdgeInsets";

-(void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}
@end
