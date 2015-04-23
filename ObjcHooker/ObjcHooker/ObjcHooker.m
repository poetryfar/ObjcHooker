//
//  ObjcHooker.m
//  WaxPatch
//
//  Created by 彭碧 on 15/4/6.
//  Copyright (c) 2015年 dianping.com. All rights reserved.
//

#import "ObjcHooker.h"
#import <objc/objc.h>
#import <objc/runtime.h>
@implementation ObjcHooker


+ (void)addTargetClass:(Class)tarClass
          targetMethod:(SEL)tarSel
           originClass:(Class)orgClass
          originMethod:(SEL)orgSel
      isInstanceMethod:(BOOL)isInstance{
    IMP originImp  = class_getMethodImplementation(orgClass, orgSel);
    
    Method originMethod = NULL;
    if (isInstance) {
        originMethod = class_getInstanceMethod(orgClass, orgSel);
    }else{
        originMethod = class_getClassMethod(orgClass, orgSel);
    }
    const char  *originParam = method_getTypeEncoding(originMethod);
    BOOL ret = class_addMethod(tarClass, tarSel, originImp, originParam);
    if (!ret) {
   //--(target method 已经有实现了)method has  origin Implementation
        Method targetMethod = NULL;
        if (isInstance) {
            targetMethod = class_getInstanceMethod(tarClass, tarSel);
        }else{
            targetMethod = class_getClassMethod(tarClass, tarSel);
        }
        method_setImplementation(targetMethod, originImp);
    }
}

+ (void)exchangeTargetClass:(Class)tarClass
               targetMethod:(SEL)tarSel
                originClass:(Class)orgClass
               originMethod:(SEL)orgSel
           isInstanceMethod:(BOOL)isInstance{
    
    Method originMethod = NULL;
    if (isInstance) {
        originMethod = class_getInstanceMethod(tarClass, tarSel);
    }else{
        originMethod = class_getClassMethod(tarClass, tarSel);
    }
    NSAssert(originMethod != NULL, @"two method can be null");
    IMP imp = class_getMethodImplementation(orgClass, orgSel);
    const char*originParam = method_getTypeEncoding(originMethod);
    class_replaceMethod(tarClass, tarSel,imp , originParam);
}


@end

@implementation ObjcHooked

- (void)methodToHook{
    NSLog(@"methodHook");
//way NO.1
    [self  performSelector:@selector(viewDidLoad2)];
    
    
}

@end
