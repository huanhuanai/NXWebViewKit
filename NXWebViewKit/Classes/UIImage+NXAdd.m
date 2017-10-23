//
//  UIImage+NXAdd.m
//  Pods
//
//  Created by kepuna on 2017/10/12.
//
//

#import "UIImage+NXAdd.h"

@implementation UIImage (NXAdd)

+ (instancetype)ff_imagePathWithName:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass {
    
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:targetClass];
    NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
    NSString *dir = [NSString stringWithFormat:@"%@.bundle",bundle];
    NSString *path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
    return path ? [UIImage imageWithContentsOfFile:path] : nil;
}

@end
