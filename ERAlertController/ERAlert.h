//
//  ERAlert.h
//  PhotoBlend
//
//  Created by Mahmudul Hasan on 5/30/17.
//  Copyright © 2017 Mahmudul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ERAlertDelegate <NSObject>

@required

@optional
- (void)cancelButtonPressed;
- (void)okButtonPressed;


@end

@interface ERAlert : NSObject

@property (nonatomic, weak) id<ERAlertDelegate> delegate;

+ (ERAlert *)sharedInstance;

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
- (void)showAlertWithCanceButton: (NSString *)cancelButtonTitle OKButton:(NSString *)okButtonTitle Title:(NSString *)title andMessage:(NSString *)message;


@end


