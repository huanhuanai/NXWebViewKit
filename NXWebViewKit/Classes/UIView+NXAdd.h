//
//  UIView+NXAdd.h
//  Pods
//
//  Created by kepuna on 2017/10/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (NXAdd)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

- (void)setCorner:(UIRectCorner)rectCorner cornerSize:(CGSize)size;

@end
