//
//  UIViewController+ScrollBackgroud.h
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/23.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LS_UIViewControllerBackGroundScrollDelegate <NSObject>

/**
 viewcontroller的view上的scrollview开始滚动的代理，通知navigationbar开始做相应的动画

 @param scrollView view的scrollview
 */
-(void)ls_scrollViewDidScroll:(UIScrollView*)scrollView;

@end

@interface LSBackGroundScrollView : UIScrollView

@end

@interface LSBackGroundView : UIView<LS_UIViewControllerBackGroundScrollDelegate>

@property (nonatomic,strong) LSBackGroundScrollView *backGroundScroll;
@property (nonatomic,weak) id<LS_UIViewControllerBackGroundScrollDelegate> delegate;

@end

@interface UIScrollView (ScrollBakckGround)

@property (nonatomic,assign) CGPoint ls_lastContentOffset;

@end

@interface UIView (ScrollBackground)

/**
 被添加到self.view上的视图是否可以悬浮 如果可以悬浮 加在self.view 上  不能悬浮 加在self.view.backGroundScroll上
 */
@property (nonatomic,assign) BOOL isSuspension;

@end


@interface UIViewController (ScrollBackgroud)<LS_UIViewControllerBackGroundScrollDelegate>

/**
 设置是否允许self.view支持滚动  默认YES
 */
@property(nonatomic,assign)BOOL ls_enableScrollBackground;
/**
 设置是否允许self.view的ContentSize
 */
@property(nonatomic,assign)CGSize ls_scrollBackgroundContentSize;
/**
 设置是否允许self.view的弹性 默认NO
 */
@property(nonatomic,assign)BOOL ls_scrollBackgroundBounces;

@property(nonatomic,weak)id<LS_UIViewControllerBackGroundScrollDelegate> ls_scrollBackgroundDelgate;






@end
