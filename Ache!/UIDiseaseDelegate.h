//
//  UIDiseaseDelegate.h
//  Ache!
//
//  Created by Departures on 7/31/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIDiseaseDelegate <NSObject>

-(NSMutableArray * )getQuestionWithPageNum:(int) pageNum;

@end
