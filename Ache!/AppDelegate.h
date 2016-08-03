//
//  AppDelegate.h
//  Ache!
//
//  Created by Departures on 7/23/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryViewController.h"
#import "MainViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong,nonatomic) QueryViewController *queryViewController;

@end

