//
//  QueryViewController.m
//  Ache!
//
//  Created by Departures on 7/28/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "QueryViewController.h"

@implementation QueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
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


-(instancetype)initViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"QueryViewController"];
    return self;
}


- (IBAction)answerButtonDidPress:(id)sender {
    QueryViewController *test = [[QueryViewController alloc]initViewController];
    [self.navigationController pushViewController:test animated:YES];
}




@end
