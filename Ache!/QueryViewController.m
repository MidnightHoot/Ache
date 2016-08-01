//
//  QueryViewController.m
//  Ache!
//
//  Created by Departures on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "QueryViewController.h"
#import "MainViewController.h"
@implementation QueryViewController

@synthesize pushingVC;

@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES ];
   
    
}










-(instancetype)initViewController{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    QueryViewController *nextQueryViewController = [story instantiateViewControllerWithIdentifier:@"QueryViewController"];
    
    NSLog(@"Window");
    NSLog(@"Window");
    NSLog(@"Window");
    NSLog(@"Window");
    NSLog(@"Window");
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);

    return nextQueryViewController;
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

- (IBAction)answerButtonDidPress:(id)sender{
    
    QueryViewController *nextQueryViewController = [[QueryViewController alloc]initViewController];
    nextQueryViewController.delegate = self.delegate;
    [self.navigationController pushViewController:nextQueryViewController animated:YES];
    
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");
    NSLog(@"WindowCounts");


    NSLog(@"%lu",(unsigned long)[UIApplication sharedApplication].windows.count);

    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *controller = segue.destinationViewController;
    controller.transitioningDelegate = self;
    controller.modalTransitionStyle = UIModalPresentationCustom;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transition.transitionMode = BubbleTransitionModePresent;
    self.transition.startingPoint = self.backButton.center;
    self.transition.bubbleColor = [UIColor colorWithRed:80/255 green:244/255 blue:155/255 alpha:1];
    return self.transition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.transitionMode = BubbleTransitionModeDismiss;
    self.transition.startingPoint = self.backButton.center;
    self.transition.bubbleColor = [UIColor colorWithRed:241/255 green:128/255 blue:126/255 alpha:1];
    return self.transition;
}

- (IBAction)backButtonDidPress:(id)sender {
    
//        if([delegate respondsToSelector:@selector(releaseCurrentWindow)])
//        {
    
            [delegate releaseCurrentWindow];
            
//        }
    
    
}

-(BubbleTransition *)transition
{
    if (!_transition) {
        _transition = [[BubbleTransition alloc] init];
    }
    return _transition;
}


@end
