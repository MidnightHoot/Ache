//
//  DiseaseAPI.m
//  Ache!
//
//  Created by Departures on 7/31/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import "DiseaseAPI.h"

@implementation DiseaseAPI

@synthesize location;

-(NSMutableArray *)getQuestionWithPageNum:(int)pageNum{
    //结果
    
    NSMutableArray *mutableArray = [self.resultMutableDictionary objectForKey:[NSString stringWithFormat:@"%d",location]];
    NSMutableArray *resultMutableArray = [mutableArray objectAtIndex:pageNum-1];
    
    
    
//    NSString *tempStr1 = [[resultMutableArray description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
//    
//    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
//    
//    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
//    
//    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSString *str = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
//    
//    NSLog(@"dic:%@",str);
//
//    
//    
//    
    return resultMutableArray;
    
}



-(NSMutableDictionary *)getPrepared{
    
    //获取Plist文件路径
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"DiseasePlist" ofType:@"plist"];
    NSMutableDictionary *resultMutableDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    return resultMutableDictionary;
    
    
}


-(instancetype)initWithLocation:(int)location{
    if([super init] != NULL){
        self.resultMutableDictionary = [self getPrepared];
        self.location = location;
    }
    return self;
}





- (void)logDic:(NSDictionary *)dic

{
    
    NSString *tempStr1 = [[dic description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *str = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    
    NSLog(@"dic:%@",str);
    
}

@end
