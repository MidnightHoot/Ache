//
//  MainViewController.m
//  Ache!
//
//  Created by Departures on 7/26/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <ASProgressPopUpViewDataSource,UIViewControllerTransitioningDelegate>

@end

@implementation MainViewController

@synthesize dataMutableArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(![HKHealthStore isHealthDataAvailable])   //查看HealthKit是否在设备上可用，iPad并不支持HK
    {
        NSLog(@"设备不支持HealthKit");
        
    }
    
    //创建HealthStore实例对象
    self.healthStore=[[HKHealthStore alloc] init];
    
    //设置需要获取的权限 步数
    HKObjectType *stepCount = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSSet *healthSet = [NSSet setWithObjects:stepCount, nil];
    
    //从健康应用中获取权限
    [self.healthStore requestAuthorizationToShareTypes:nil readTypes:healthSet completion:^(BOOL success, NSError * _Nullable error) {
   
       if(success)
       {
           NSLog(@"获取步数权限成功");
           //调用获取步数的方法
           [self readStepCount];
       }
       else
       {
           NSLog(@"获取步数权限失败");
       }
    }];
    
    
    NSMutableArray *dateMutableArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    NSMutableArray *dataMutableArray = [NSMutableArray array];
    for (int count = 0; count < 5; count ++) {
        NSNumber *number = [NSNumber numberWithDouble:rand() % 100];
        [dataMutableArray addObject:number ];
    }
    
    [self drawLineChartWithDateMutableArray:dateMutableArray andDataMutableArray:dataMutableArray];
    
    
//    [self drawSleepTimeProgressView:0.5];
    self.sleepTimeProgressView.progress = 0.8;
    self.sleepTimeProgressView.tintColor  = [UIColor greenColor];
    
    
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

//查询数据
-(void)readStepCount
{
    int limitCount = 5;
    
    HKSampleType *sampleType=[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    //NSSortDescriptiors用来告诉healthstore如何将结果排序
    NSSortDescriptor *start=[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end=[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
    //查询的基类是HKQuery,这是一个抽象类，能够实现每一种查询目标，这里我们需要查询的步数是一个
    //HKSample类所以对应的查询类是HKSampleQuery
    //下面limit参数传1表示查询最近一条数据，查询多条数据只要设置limit的参数值就可以了
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc]initWithSampleType:sampleType predicate:nil limit:limitCount sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //打印查询结果
        
        NSLog(@"resultCount = %ld result = %@",results.count,results);
        //把结果转换为字符串
        
        if (results.count >0 ) {
            for (int countNum = 0; countNum < results.count; countNum ++) {
            HKQuantitySample *result = results[0];
            HKQuantity *quantity = result.quantity;
            NSString *stepStr = (NSString *)quantity;
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
//                [self.dataMutableArray addObject:[NSNumber numberWithInt:[stepStr intValue]]];
                //查询在多线程中进行，要对UI刷新，要回到主线程
                if (countNum == 0) {
                    self.stepsTitleLabel.text = [NSString stringWithFormat:@"%@",stepStr];

                }
                }];
         
            
            

            }
        }
        
        
    }];
    //执行查询
    [self.healthStore executeQuery:sampleQuery];//暂时注释掉，继续进行动画，在results为NULL会报错
    
}




-(void)drawLineChartWithDateMutableArray:(NSMutableArray *) dateMutableArray andDataMutableArray:(NSMutableArray*)dataMutableArray{
    CGFloat lineChartX = 20;
    CGFloat lineChartY = self.imageButton.bounds.origin.y + self.imageButton.bounds.size.height + 100;
    CGFloat lineChartWidth = [UIScreen mainScreen].applicationFrame.size.width - 2*lineChartX;
    CGFloat lineChartHeight = self.heartRateLabel.bounds.origin.y - lineChartY - 20;
    NSArray *dateArray = [dateMutableArray copy];
    
    FSLineChart *lineChart = [[FSLineChart alloc]initWithFrame:CGRectMake(lineChartX, lineChartY, lineChartWidth, 200)];
    
    lineChart.labelForIndex = ^(NSUInteger item) {
        return dateArray[item];
    };
    
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.1f", value];
    };
    
    [lineChart setChartData:dataMutableArray];
    [self.view addSubview:lineChart];
}



-(void)drawSleepTimeProgressView:(double)sleepTimePercent{
    
//    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:26];
    self.sleepTimeProgressView.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    self.sleepTimeProgressView.popUpViewCornerRadius = 16.0;
    
    
    [self.sleepTimeProgressView showPopUpViewAnimated:YES];
    float progress = self.sleepTimeProgressView.progress;
    if ( progress < sleepTimePercent) {
        
        progress += 0.1;
        
        [self.sleepTimeProgressView setProgress:progress animated:false];
        
        
        [NSTimer scheduledTimerWithTimeInterval: 0.05
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }

}








- (IBAction)reportButtonDidPress:(id)sender {
}

- (IBAction)acheButtonDidPress:(id)sender {
}

- (IBAction)imageButtonDidPress:(id)sender {
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *controller = segue.destinationViewController;
    controller.transitioningDelegate = self;
    controller.modalTransitionStyle = UIModalPresentationCustom;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transition.transitionMode = BubbleTransitionModePresent;
    self.transition.startingPoint = self.acheButton.center;
    self.transition.bubbleColor = [UIColor colorWithRed:80/255 green:244/255 blue:155/255 alpha:1];
    return self.transition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.transitionMode = BubbleTransitionModeDismiss;
    self.transition.startingPoint = self.acheButton.center;
    self.transition.bubbleColor = [UIColor colorWithRed:241/255 green:128/255 blue:126/255 alpha:1];
    return self.transition;
}

-(BubbleTransition *)transition
{
    if (!_transition) {
        _transition = [[BubbleTransition alloc] init];
    }
    return _transition;
}

-(instancetype)initViewController{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    MainViewController *viewController = [story instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    return viewController;

}


@end
