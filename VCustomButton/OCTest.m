//
//  OCTest.m
//  VCustomButton
//
//  Created by Leaf on 2018/4/12.
//  Copyright © 2018年 leaf. All rights reserved.
//

#import "OCTest.h"
#import "VCustomButton-Swift.h"

@implementation OCTest

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)callSwift {
    VNormalButton *button = [[VNormalButton alloc] init];
    NSLog(@"OC文件中使用Swift类：%@", button);
}

@end
