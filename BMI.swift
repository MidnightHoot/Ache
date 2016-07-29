//
//  BMI.swift
//  Ache!
//
//  Created by 龙飞 on 16/7/29.
//  Copyright © 2016年 MidnightHoot. All rights reserved.
//

import Foundation
import HealthKit

let healthKitStore:HKHealthStore = HKHealthStore()
var height,weight:HKQuantitySample?

func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!)
{
    // 1. Set the types you want to read from HK Store
    let healthKitTypesToRead = NSSet(array:[  HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth),
        HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType),
        HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight),
        HKObjectType.workoutType()
        ])
    // 2. Set the types you want to write to HK Store
    let healthKitTypesToWrite = NSSet(array:[
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex),
        HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned),   HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning),
        HKQuantityType.workoutType()
        ])
    // 3. If the store is not available (for instance, iPad) return an error and don't go on.
    if !HKHealthStore.isHealthDataAvailable()
    {
        let error = NSError(domain: "com.raywenderlich.tutorials.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
        if( completion != nil )
        {
            completion(success:false, error:error)
        }
        return;
    }
    // 4.  Request HealthKit authorization
    healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite, readTypes: healthKitTypesToRead) { (success, error) -> Void in
        if( completion != nil )
        {
            completion(success:success,error:error)
        }
    }
}

class HealthManager{
    func readMostRecentSample(sampleType:HKSampleType , completion: ((HKSample!, NSError!) -> Void)!)
    {
        // 1. Build the Predicate
        let past = NSDate.distantPast() as NSDate
        let now   = NSDate()
        let mostRecentPredicate = HKQuery.predicateForSamplesWithStartDate(past, endDate:now, options: .None)
        // 2. Build the sort descriptor to return the samples in descending order
        let sortDescriptor = NSSortDescriptor(key:HKSampleSortIdentifierStartDate, ascending: false)
        // 3. we want to limit the number of samples returned by the query to just 1 (the most recent)
        let limit = 1
        // 4. Build samples query
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: mostRecentPredicate, limit: limit, sortDescriptors: [sortDescriptor])
        { (sampleQuery, results, error ) -> Void in
            if let queryError = error {
                completion(nil,error)
                return;
            }
            // Get the first sample
            let mostRecentSample = results.first as? HKQuantitySample
            // Execute the completion closure
            if completion != nil {
                completion(mostRecentSample,nil)
            }
        }
        // 5. Execute the Query
        self.healthKitStore.executeQuery(sampleQuery)
    }
    
}


