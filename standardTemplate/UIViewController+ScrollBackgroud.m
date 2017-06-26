//
//  UIViewController+ScrollBackgroud.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/23.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "UIViewController+ScrollBackgroud.h"
#import <objc/runtime.h>

@implementation LSBackGroundScrollView

@end

@interface LSBackGroundView ()<UIScrollViewDelegate>

@end

@implementation LSBackGroundView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backGroundScroll];
    }
    return self;
}

-(void)addSubview:(UIView *)view{
    if (view.isSuspension) {
        [super addSubview:view];
    }else{
        [self.backGroundScroll addSubview:view];
    }
}

-(LSBackGroundScrollView*)backGroundScroll{
    if (!_backGroundScroll) {
        _backGroundScroll = [[LSBackGroundScrollView alloc] initWithFrame:self.bounds];
        _backGroundScroll.showsVerticalScrollIndicator = NO;
        _backGroundScroll.showsHorizontalScrollIndicator = NO;
        _backGroundScroll.isSuspension = YES;
        _backGroundScroll.delegate = self;
    }
    return _backGroundScroll;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_delegate && ([_delegate respondsToSelector:@selector(ls_scrollViewDidScroll:)])) {
        [_delegate ls_scrollViewDidScroll:scrollView];
    }
}
@end

@implementation UIScrollView (ScrollBakckGround)

static const void *ls_lastContentOffsetKey = &ls_lastContentOffsetKey;

-(void)setLs_lastContentOffset:(CGPoint)ls_lastContentOffset{
    objc_setAssociatedObject(self, ls_lastContentOffsetKey, [NSValue valueWithCGPoint:ls_lastContentOffset], OBJC_ASSOCIATION_ASSIGN);
}

-(CGPoint)ls_lastContentOffset{
    return [objc_getAssociatedObject(self, ls_lastContentOffsetKey) CGPointValue];
}

@end

@implementation UIView (ScrollBackground)

static const void* ls_isSuspension = &ls_isSuspension;

-(void)setIsSuspension:(BOOL)isSuspension{
    
    //该关联对象判断加到sell.view上的视图是否可以悬浮 如果可以悬浮 ，将它加到self.view上  如果不可以 将他加载到 self.view.backGroundScroll上。
    objc_setAssociatedObject(self, ls_isSuspension, @(isSuspension), OBJC_ASSOCIATION_ASSIGN);
    
    //如果该view 由不能悬浮变成可以悬浮 变成 可以悬浮， 要将其在scrollview上的frame转化成在 self.view上的frame
    if (isSuspension && [self.superview isKindOfClass:[LSBackGroundScrollView class]]) {
        self.frame = [self.superview convertRect:self.frame toView:self.superview.superview];
        [self.superview.superview addSubview:self];
    }
    
    //由可以悬浮变成不能悬浮
    if (!ls_isSuspension&&[self.superview isKindOfClass:[LSBackGroundView class]] &&![self.superview isKindOfClass:[LSBackGroundScrollView class]]) {
        self.frame = [self.superview convertRect:self.frame toView:((LSBackGroundView*)(self.superview)).backGroundScroll];
        [((LSBackGroundView*)(self.superview)).backGroundScroll addSubview:self];
    }
}

-(BOOL)isSuspension{
    return [objc_getAssociatedObject(self, ls_isSuspension) boolValue];
}


@end


@implementation UIViewController (ScrollBackgroud)

static const void *ls_scrollEnabledKey = &ls_scrollEnabledKey;

-(void)setLs_enableScrollBackground:(BOOL)ls_enableScrollBackground{
    
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        ((LSBackGroundView*)self.view).backGroundScroll.scrollEnabled = ls_enableScrollBackground;
    }
    objc_setAssociatedObject(self, ls_scrollEnabledKey, @(ls_enableScrollBackground), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)ls_enableScrollBackground{
    return [objc_getAssociatedObject(self, ls_scrollEnabledKey) boolValue];
}

-(void)setLs_scrollBackgroundContentSize:(CGSize)ls_scrollBackgroundContentSize{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        ((LSBackGroundView*)self.view).backGroundScroll.contentSize = ls_scrollBackgroundContentSize;
    }
}

-(CGSize)ls_scrollBackgroundContentSize{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        return ((LSBackGroundView*)self.view).backGroundScroll.contentSize;
    }
    return CGSizeZero;
}

-(void)setLs_scrollBackgroundBounces:(BOOL)ls_scrollBackgroundBounces{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        ((LSBackGroundView*)self.view).backGroundScroll.bounces = ls_scrollBackgroundBounces;
    }
}

-(BOOL)ls_scrollBackgroundBounces{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        return ((LSBackGroundView*)self.view).backGroundScroll.bounces;
    }
    return NO;
}



-(void)setLs_scrollBackgroundDelgate:(id<LS_UIViewControllerBackGroundScrollDelegate>)ls_scrollBackgroundDelgate{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        ((LSBackGroundView*)self.view).delegate = self;
    }
}


-(id<LS_UIViewControllerBackGroundScrollDelegate>)ls_scrollBackgroundDelgate{
    if ([self.view isKindOfClass:[LSBackGroundView class]]) {
        return ((LSBackGroundView*)self.view).delegate;
    }
    return nil;
}

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(view);
        SEL swizzledSelector = @selector(ls_view);
        
        Method originalM = class_getInstanceMethod(class, originalSelector);
        Method swizzledM = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledM), method_getTypeEncoding(swizzledM));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalM), method_getTypeEncoding(originalM));
        }else{
            method_exchangeImplementations(originalM, swizzledM);
        }
    });
}

-(UIView*)ls_view{
    UIView *tempView = [self ls_view];
    if (self.ls_enableScrollBackground) {
        if (![tempView isKindOfClass:[LSBackGroundView class]]) {
            tempView = [[LSBackGroundView alloc] initWithFrame:tempView.frame];
            tempView.backgroundColor = [UIColor whiteColor];
            [self setView:tempView];
        }
        return tempView;
    }else{
        return tempView;
    }
}






@end
