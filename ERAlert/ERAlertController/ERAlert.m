//
//  ERAlert.m
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/30/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import "ERAlert.h"
#import <UIKit/UIKit.h>

@implementation ERAlert

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withHandler:(ERAlertResponse)response {
    
    __block UIWindow *alertWindow;
    
    
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:title
                                           message:message
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alertController dismissViewControllerAnimated:YES completion:nil];
                             alertWindow.hidden = YES;
                             alertWindow = nil;
                             if (response)
                                 response(YES);
                         }];

    [alertController addAction:ok];
    
    
    alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        // we inherit the main window's tintColor
        alertWindow.tintColor = delegate.window.tintColor;
    }
    
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [alertWindow makeKeyAndVisible];
    [alertWindow.rootViewController presentViewController:alertController animated:true completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitle:(NSString *)buttonTitle withHandler:(ERAlertResponse)response {
    
    __block UIWindow *alertWindow;
    
    
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:title
                                           message:message
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:buttonTitle
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alertController dismissViewControllerAnimated:YES completion:nil];
                             alertWindow.hidden = YES;
                             alertWindow = nil;
                             if (response)
                                 response(YES);
                         }];
    
    [alertController addAction:ok];
    
    
    alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        // we inherit the main window's tintColor
        alertWindow.tintColor = delegate.window.tintColor;
    }
    
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [alertWindow makeKeyAndVisible];
    [alertWindow.rootViewController presentViewController:alertController animated:true completion:nil];
}

+ (void)showAlertWithCanceButton: (NSString *)cancelButtonTitle OKButton:(NSString *)okButtonTitle Title:(NSString *)title andMessage:(NSString *)message withHandler:(ERAlertResponse)response {
    
    __block UIWindow *alertWindow;
    
    
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:title
                                           message:message
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:okButtonTitle
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alertController dismissViewControllerAnimated:YES completion:nil];
                             alertWindow.hidden = YES;
                             alertWindow = nil;

                             if (response)
                                 response(YES);
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:cancelButtonTitle
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alertController dismissViewControllerAnimated:YES completion:nil];
                                 alertWindow.hidden = YES;
                                 alertWindow = nil;
                                 if (response)
                                     response(NO);
                             }];
    [alertController addAction:cancel];
    [alertController addAction:ok];
    
    
    alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        // we inherit the main window's tintColor
        alertWindow.tintColor = delegate.window.tintColor;
    }
    
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [alertWindow makeKeyAndVisible];
    [alertWindow.rootViewController presentViewController:alertController animated:true completion:nil];
}

@end
