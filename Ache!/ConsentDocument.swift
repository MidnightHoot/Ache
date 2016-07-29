//
//  ConsentDocument.swift
//  Ache!
//
//  Created by 彭靖杰 on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument:ORKConsentDocument{
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Survey Consent"
    
    
    let consentSectionTypes:[ORKConsentSectionType] = [
    .Custom

        
    
    
    ]
        let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "本研究将帮助我们了解不同消化系统疾病对心理状况的影响"
        consentSection.content = "调查将不占用超过您2分钟的时间，您一共需要回答十道题"
        
        return consentSection

    
    }
    
    
    consentDocument.sections = consentSections
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
    







}
