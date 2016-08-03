//
//  BodyViewController.m
//  Ache!
//
//  Created by Departures on 7/30/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "BodyViewController.h"

@interface BodyViewController ()

@end

@implementation BodyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [UIView animateWithDuration:0.5f animations:^{
//        self.backButton.transform = CGAffineTransformMakeRotation(-M_PI_4*3.0f);
//    }];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.backButton.transform = CGAffineTransformIdentity;
    }];
}


- (IBAction)stomachButtonDidPress:(id)sender {
    
    self.queryWindow =  [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.queryViewController = [[QueryViewController alloc] initViewController];
    
    self.queryWindow.rootViewController = [[FlipSquaresNavigationController alloc]initWithRootViewController:self.queryViewController];
    self.queryWindow.windowLevel = UIWindowLevelAlert+1;
    [self.queryWindow makeKeyAndVisible];
    self.queryViewController.delegate = self;
    
}

-(void)releaseCurrentWindow{
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"get");
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);

    [[UIApplication sharedApplication].keyWindow resignKeyWindow];
    [self.queryWindow resignKeyWindow];
    self.queryWindow = nil;
    [self.view.window makeKeyAndVisible];
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");
    NSLog(@"Finished");

    
}
@end
