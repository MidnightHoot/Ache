//
//  MainViewController.h
//  Ache!
//
//  Created by Departures on 7/26/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

/**
 *  健康报告Button
 */
@property (weak, nonatomic) IBOutlet UIButton *reportButton;

/**
 *  AcheButton
 */
@property (weak, nonatomic) IBOutlet UIButton *acheButton;

/**
 *  标题的那个步数label
 */
@property (weak, nonatomic) IBOutlet UILabel *stepsTitleLabel;

/**
 *  那个神奇的头像Button
 */
@property (weak, nonatomic) IBOutlet UIButton *imageButton;





/**
 *  健康报告Button触发，跳转至健康报告页面，ReportViewController
 *
 *  @param sender 并没有什么作用需要特别说明
 */
- (IBAction)reportButtonDidPress:(id)sender;

/**
 *  AcheButton触发，跳转至BodyViewController
 *
 *  @param sender 并没有什么作用需要特别说明
 */
- (IBAction)acheButtonDidPress:(id)sender;

/**
 *  imageButton触发，跳转至个人界面，ProfileViewController
 *
 *  @param sender 并没有什么作用需要特别说明
 */
- (IBAction)imageButtonDidPress:(id)sender;

@end
