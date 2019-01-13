//
//  ERAlert.h
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/30/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ERAlert : NSObject

typedef void(^ERAlertResponse)(BOOL isAllowed);


+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withHandler:(ERAlertResponse)response;
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitle:(NSString *)buttonTitle withHandler:(ERAlertResponse)response;
+ (void)showAlertWithCanceButton: (NSString *)cancelButtonTitle OKButton:(NSString *)okButtonTitle Title:(NSString *)title andMessage:(NSString *)message withHandler:(ERAlertResponse)response;


@end


