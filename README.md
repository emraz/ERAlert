# ERAlert
ERAlert, very simple alert view controller.
# How To Use
To show alert message with a button----

[[ERAlert sharedInstance] showAlertWithTitle:@"Error!" andMessage:@"Write Your Message Here"]; 


To show alert message with a YES/NO option ----
    
    [ERAlert sharedInstance].delegate = self;
    
    [[ERAlert sharedInstance] showAlertWithCanceButton:@"NO" OKButton:@"YES" Title:@"Alert!" andMessage:@"Write Your Message Here"];
