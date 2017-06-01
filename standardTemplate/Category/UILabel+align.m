//
//  UILabel+align.m
//  labelAlignProject
//
//  Created by 李小帅 on 2017/2/16.
//  Copyright © 2017年 神州腾达. All rights reserved.
//

#import "UILabel+align.h"

@implementation UILabel (align)

- (void)alignTop {
    
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    
    double finalWidth = self.frame.size.width;//expected width of label
    
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    int newLinesToPad = (self.frame.size.height  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++){
        self.text = [self.text stringByAppendingString:@"\n "];
    }
    self.numberOfLines = 0;
    NSLog(@"self.text is %@",self.text);
}

- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];

    double finalWidth = self.frame.size.width;    //expected width of label

    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;

    int newLinesToPad = (self.frame.size.height  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++){
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
    }
    self.numberOfLines = 0;
    NSLog(@"self.text is %@",self.text);

}

@end
