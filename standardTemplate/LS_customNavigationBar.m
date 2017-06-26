//
//  LS_customNavigationBar.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/23.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "LS_customNavigationBar.h"
#import "UIView+LS_frame.h"

@implementation LS_customNavigationBar{
    float _originSmallCenterX;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleMargin=25;
        _lineMargin=10;
        
        _bigTitleLFontSize=16;
        _smallTitleLFontSize=30;
        
        [self addSubview:self.backB];
        [self addSubview:self.smallTitleL];
        [self addSubview:self.bigTitleL];
        [self addSubview:self.lineView];
        
        self.lineView.frame = CGRectMake(0, frame.size.height - 1, ScreenWidth, 1);
        self.smallTitleL.frame = CGRectMake(25, self.backB.bottom, (ScreenWidth - 25 *2), frame.size.height - self.backB.bottom);
        self.bigTitleL.frame = CGRectMake(0, ScreenStatusBottom, frame.size.width, frame.size.height);
    }
    return self;
}

-(UIButton *)backB{
    if (!_backB) {
        
//        CGFloat btnWidth=44;
//        CGFloat firstY=[UIApplication sharedApplication].statusBarFrame.origin.y + [UIApplication sharedApplication].statusBarFrame.size.height;
        
        //在上下翻动的过程中，button的frame并没有发生实际的变化，不需要做改变
        _backB = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenStatusBottom, LS_BACKB_WIDTH, LS_BACKB_WIDTH)];
        [_backB setTitle:@"返回" forState:UIControlStateNormal];
        [_backB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _backB;
}

-(UILabel *)smallTitleL{
    if (!_smallTitleL) {
        _smallTitleL = [[UILabel alloc] init];
        _smallTitleL.font = [UIFont systemFontOfSize:_smallTitleLFontSize];
    }
    return _smallTitleL;
}

-(UILabel *)bigTitleL{
    if (!_bigTitleL) {
        _bigTitleL = [[UILabel alloc] init];
        _bigTitleL.alpha = 0;
        _bigTitleL.textAlignment = NSTextAlignmentCenter;
        _bigTitleL.font = [UIFont systemFontOfSize:_bigTitleLFontSize];
    }
    return _bigTitleL;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

-(void)setTitle:(NSString *)title{
    _title = title;

    _smallTitleL.text = title;
    _bigTitleL.text = title;
    
    [_smallTitleL sizeToFit];
    //记录小视图的起始的centerX
    _originSmallCenterX = _smallTitleL.center.x;
}

-(void)navigationBarAnimationScales:(CGFloat)scales{
    
    switch (self.customNavigationBarType) {
        
        case LS_customNavigationBarTypeFade:{
            CGRect frame = self.frame;
            frame.origin.y = (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            frame.size.height =NavigationBarNormalHeight - (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            self.frame = frame;
            
            self.bigTitleL.font = [UIFont systemFontOfSize:_smallTitleLFontSize - (_smallTitleLFontSize - _bigTitleLFontSize)*scales];
            self.bigTitleL.centerX = self.center.x;
            [self.bigTitleL sizeToFit];
            
            //0 - 0.5 小视图显示  0.5 - 1 大视图显示
            self.smallTitleL.alpha = 1-scales *2;
            self.bigTitleL.alpha = 1- (1- scales)*2;

            break;
        }
        case LS_customNavigationBarTypeScale:{
            
            CGRect frame = self.frame;
            frame.origin.y = (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            frame.size.height =NavigationBarNormalHeight - (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            self.frame = frame;

            //对于smalltitleL做一个线性的属性变化 字体和标签高度 scale 为x变量
            self.smallTitleL.font = [UIFont systemFontOfSize:_smallTitleLFontSize - (_smallTitleLFontSize - _bigTitleLFontSize)*scales];
            [self.smallTitleL sizeToFit];
            
            self.smallTitleL.height = (NavigationBarNormalHeight - self.backB.bottom) - ((NavigationBarNormalHeight - self.backB.bottom) - self.backB.height)*scales;
    
            break;
        }
        case LS_customNavigationBarTypeScaleToCenter:{
            
            CGRect frame = self.frame;
            frame.origin.y = (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            frame.size.height =NavigationBarNormalHeight - (NavigationBarNormalHeight - ScreenStatusBottom - 44)*scales;
            self.frame = frame;
            
            self.smallTitleL.font = [UIFont systemFontOfSize:_smallTitleLFontSize - (_smallTitleLFontSize - _bigTitleLFontSize)*scales];
            [self.smallTitleL sizeToFit];
            
            self.smallTitleL.height = (NavigationBarNormalHeight - self.backB.bottom) - ((NavigationBarNormalHeight - self.backB.bottom) - self.backB.height)*scales;

//            CGPoint center = self.smallTitleL.center;
//            center.x = _originSmallCenterX - (_originSmallCenterX - self.center.x)*scales;
//            self.smallTitleL.center = center;
            
            self.smallTitleL.centerX = _originSmallCenterX - (_originSmallCenterX - self.center.x)*scales;
            
            break;
        }
        default:
            break;
    }
}

//当view的size变化的时候 会调用layoutsubview  在此保证其三个子视图按照原有的大小进行变化
-(void)layoutSubviews{
    [super layoutSubviews];
    self.smallTitleL.bottom = self.height;
    self.bigTitleL.height = self.height - self.bigTitleL.top;
    self.lineView.bottom = self.height;
}

//设置小视图的左侧距离
-(void)setTitleMargin:(CGFloat)titleMargin{
    _titleMargin = titleMargin;
    self.smallTitleL.left = titleMargin;
    self.smallTitleL.width = ScreenWidth - titleMargin * 2;
}



@end
