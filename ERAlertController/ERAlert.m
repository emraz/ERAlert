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

+ (ERAlert *)sharedInstance {
    static ERAlert *sharedMyInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyInstance = [[self alloc] init];
    });
    return sharedMyInstance;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    
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

- (void)showAlertWithCanceButton: (NSString *)cancelButtonTitle OKButton:(NSString *)okButtonTitle Title:(NSString *)title andMessage:(NSString *)message {
    
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
                             
                             if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonPressed)]) {
                                 [self.delegate okButtonPressed];
                             }
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:cancelButtonTitle
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alertController dismissViewControllerAnimated:YES completion:nil];
                                 alertWindow.hidden = YES;
                                 alertWindow = nil;
                                 
                                 if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonPressed)]) {
                                     [self.delegate cancelButtonPressed];
                                 }
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
