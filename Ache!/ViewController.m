//
//  ViewController.m
//  Ache!
//
//  Created by Departures on 7/23/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置为圆角
    [self.reportButton.layer setCornerRadius:17];
    [self.acheButton.layer   setCornerRadius:17];
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reportButtonDidPress:(id)sender {
}

- (IBAction)acheButtonDidPress:(id)sender {
}

- (IBAction)imageButtonDidPress:(id)sender {
}
@end
