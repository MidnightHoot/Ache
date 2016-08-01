//
//  BodyViewController.h
//  Ache!
//
//  Created by Departures on 7/30/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryViewController.h"
#import "UIWindowDelegate.h"
@interface BodyViewController : UIViewController<UIWindowDelegate>

@property (strong ,nonatomic) UIWindow *queryWindow;

@property QueryViewController *queryViewController;

/**
 *  返回MainViewController
 */
@property (weak, nonatomic) IBOutlet UIButton *backButton;

/**
 *  选择部位是胃
 */
- (IBAction)stomachButtonDidPress:(id)sender;


@end
