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

func updateWeight(){
    // 1. Construct an HKSampleType for weight
    let sampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    // 2. Call the method to read the most recent weight sample
    self.healthManager?.readMostRecentSample(sampleType, completion: { (mostRecentWeight, error) -> Void in
        if( error != nil )
        {
            println("Error reading weight from HealthKit Store: \(error.localizedDescription)")
            return;
        }
        var weightLocalizedString = self.kUnknownString;
        // 3. Format the weight to display it on the screen
        self.weight = mostRecentWeight as? HKQuantitySample;
        if let kilograms = self.weight?.quantity.doubleValueForUnit(HKUnit.gramUnitWithMetricPrefix(.Kilo)) {
            let weightFormatter = NSMassFormatter()
            weightFormatter.forPersonMassUse = true;
            weightLocalizedString = weightFormatter.stringFromKilograms(kilograms)
        }
        // 4. Update UI in the main thread
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.updateBMI() 
        });
    });
}

func updateHeight(){
    // 1. Construct an HKSampleType for Height
    let sampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
    // 2. Call the method to read the most recent Height sample
    self.healthManager?.readMostRecentSample(sampleType, completion: { (mostRecentHeight, error) -> Void in
        if( error != nil )
        {
            println("Error reading height from HealthKit Store: \(error.localizedDescription)")
            return;
        }
        var heightLocalizedString = self.kUnknownString;
        self.height = mostRecentHeight as? HKQuantitySample;
        // 3. Format the height to display it on the screen
        if let meters = self.height?.quantity.doubleValueForUnit(HKUnit.meterUnit()) {
            let heightFormatter = NSLengthFormatter()
            heightFormatter.forPersonHeightUse = true;
            heightLocalizedString = heightFormatter.stringFromMeters(meters);
        }
        // 4. Update UI. HealthKit use an internal queue. We make sure that we interact with the UI in the main thread
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.updateBMI()
        });
    })
}

func updateBMI(){
    if weight != nil && height != nil {
        // 1. Get the weight and height values from the samples read from HealthKit
        let weightInKilograms = weight!.quantity.doubleValueForUnit(HKUnit.gramUnitWithMetricPrefix(.Kilo))
        let heightInMeters = height!.quantity.doubleValueForUnit(HKUnit.meterUnit())
        // 2. Call the method to calculate the BMI
    var bmi  = calculateBMIWithWeightInKilograms(weightInKilograms, heightInMeters: heightInMeters)
    }
    // 3. Show the calculated BMI
    var bmiString = kUnknownString
    if bmi != nil {
        BMILabel.text =  NSString(format: "%.02f", bmi!)
    }
}

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


