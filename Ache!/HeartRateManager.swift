//
//  HeartRate.swift
//  Ache!
//
//  Created by 龙飞 on 16/7/31.
//  Copyright © 2016年 MidnightHoot. All rights reserved.
//

import Foundation
import HealthKit

class HeartRateManager:NSObject{
    static let healthKitStore = HKHealthStore()
    static func authorizeHealthKit() {
        let healthKitTypes:Set = [
         HKObj]
    }
}

