//
//  QueryViewController.h
//  Ache!
//
//  Created by Departures on 7/28/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipSquaresNavigationController.h"
#import "CubeNavigationController.h"
@interface QueryViewController :FlipSquaresNavigationController




/**
 *  显示问题的Label
 */
@property (weak, nonatomic) IBOutlet UILabel *queryLabel;

/**
 *  显示问题Tips的Label
 */
@property (weak, nonatomic) IBOutlet UILabel *anotationLabel;

/**
 *  选项一，位于（1，1）位置
 */
@property (weak, nonatomic) IBOutlet UIButton *answerButton01;

/**
 *  选项二，位于（2，1）位置
 */
@property (weak, nonatomic) IBOutlet UIButton *answerButton02;

/**
 *  选项三，位于（2，1）位置
 */
@property (weak, nonatomic) IBOutlet UIButton *answerButton03;

/**
 *  选项四，位于（2，2）位置
 */
@property (weak, nonatomic) IBOutlet UIButton *answerButton04;


/**
 *  四个选项Button的选择均会触发
 *
 *  @param sender 感觉并没有什么卵用
 */
- (IBAction)answerButtonDidPress:(id)sender;

-(id)initViewController;
@end
