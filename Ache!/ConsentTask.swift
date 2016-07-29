//
//  ConsentTask.swift
//  Ache!
//
//  Created by 彭靖杰 on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    var steps = [ORKStep]()
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as ORKConsentSignature!
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]


    
    //2lan var 改为 let
    
    
    
    
    
    
    
    
    return ORKOrderedTask(identifier:"ConsentTask", steps:steps)

}