//
//  ObjcHooker.h
//  WaxPatch
//
//  Created by 彭碧 on 15/4/6.
//  Copyright (c) 2015年 dianping.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ObjcHooker : NSObject
/**  给一个目标类增加一个函数
@param tarClass 要执行的子定义函数的类
@param tarSel   要执行的自定义函数的SEL
@param tarSel   hook的函数的类
@param tarSel   hook的函数对应的SEL
@param isInstance   函数是否实例函数
 */
+ (void)addTargetClass:(Class)tarClass
          targetMethod:(SEL)tarSel
           originClass:(Class)orgClass
          originMethod:(SEL)orgSel
      isInstanceMethod:(BOOL)isInstance;

/**  替换一个类的函数的实现
 @param tarClass 要执行的子定义函数的类
 @param tarSel   要执行的自定义函数的SEL
 @param tarSel   hook的函数的类
 @param tarSel   hook的函数对应的SEL
 @param isInstance   函数是否实例函数
 */
+ (void)exchangeTargetClass:(Class)tarClass
               targetMethod:(SEL)tarSel
                originClass:(Class)orgClass
               originMethod:(SEL)orgSel
           isInstanceMethod:(BOOL)isInstance;
@end

@interface ObjcHooked : NSObject

@end