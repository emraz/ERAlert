//
//  ViewController.m
//  ERAlert
//
//  Created by Mahmudul Hasan R@zib on 1/13/19.
//  Copyright © 2019 Mohammad Mahmudul Hasan. All rights reserved.
//

#import "ViewController.h"
#import "ERAlertController/ERAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)commonButtonAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 101:
            [ERAlert showAlertWithTitle:@"Hey!" andMessage:@"Its a simple alert message" withHandler:nil];
            break;
            
        case 102:
            [ERAlert showAlertWithTitle:@"Hey!" andMessage:@"Please press the button to start any other process." andButtonTitle:@"Prees Me!" withHandler:^(BOOL isAllowed) {
                if (isAllowed) {
                    NSLog(@"Button pressed");
                }
            }];
            break;
            
        case 103:
            [ERAlert showAlertWithCanceButton:@"NO" OKButton:@"YES" Title:@"Hi.." andMessage:@"Does it help you a little?" withHandler:^(BOOL isAllowed) {
                if (isAllowed)
                    NSLog(@"YES pressed");
                else
                    NSLog(@"NO pressed");
            }];
            break;
            
        default:
            break;
    }
}




@end
