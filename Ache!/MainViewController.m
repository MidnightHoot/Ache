//
//  MainViewController.m
//  Ache!
//
//  Created by Departures on 7/26/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    HKSampleType *sampleType=[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    //NSSortDescriptiors用来告诉healthstore如何将结果排序
    NSSortDescriptor *start=[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end=[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
    //查询的基类是HKQuery,这是一个抽象类，能够实现每一种查询目标，这里我们需要查询的步数是一个
    //HKSample类所以对应的查询类是HKSampleQuery
    //下面limit参数传1表示查询最近一条数据，查询多条数据只要设置limit的参数值就可以了
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc]initWithSampleType:sampleType predicate:nil limit:1 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //打印查询结果
        NSLog(@"resultCount = %ld result = %@",results.count,results);
        //把结果转换为字符串
        HKQuantitySample *result = results[0];
        HKQuantity *quantity = result.quantity;
        NSString *stepStr = (NSString *)quantity;
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            
            //查询在多线程中进行，要对UI刷新，要回到主线程
            self.stepsTitleLabel.text = [NSString stringWithFormat:@"%@",stepStr];
            
        }];
        
    }];
    //执行查询
    [self.healthStore executeQuery:sampleQuery];
}


- (IBAction)reportButtonDidPress:(id)sender {
}

- (IBAction)acheButtonDidPress:(id)sender {
}

- (IBAction)imageButtonDidPress:(id)sender {
}

@end
