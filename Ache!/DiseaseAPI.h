//
//  DiseaseAPI.h
//  Ache!
//
//  Created by Departures on 7/31/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIDiseaseDelegate.h"



@interface DiseaseAPI : NSObject<UIDiseaseDelegate>

/**
 *  部位
 */
@property int location;

/**
 *  Plist的内容
 */
@property NSMutableDictionary *resultMutableDictionary;

/**
 *  获取自己的问题和答案以及Tips
 *
 *  @param location 疼痛部位
 *  @param pageNum  问题的顺序，第几个问题 ,不需要-1 ，内部已经自动-1了，最小是1
 *
 *  @return 索引从零开始，分别是问题，Tip，答案1，答案2...........
 */
-(NSMutableArray * )getQuestionWithPageNum:(int) pageNum;


/**
 *  使一开始就各种就绪
 *
 *  @return 这一点并没有什么卵用
 */
-(instancetype)initWithLocation:(int) location;


/**
 *
 *
 *  @return Plist路径
 */
-(NSMutableDictionary *)getPrepared;






/**
 *  测试偷懒用打印Dictionary,(防乱码版)
 *
 *  @param dic 要打印的dictionary
 */
- (void)logDic:(NSDictionary *)dic;


@end
