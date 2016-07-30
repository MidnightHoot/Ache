//
//  ConsentTask.swift
//  Ache!
//
//  Created by 彭靖杰 on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

import Foundation
import ResearchKit
 private enum Identifier {
    case ConsentDocumentParticipantSignature
    case ConsentDocumentInvestigatorSignature
    case VisualConsentStep
}

private var consentDocument: ORKConsentDocument {
    let consentDocument = ORKConsentDocument()
    
    consentDocument.title = NSLocalizedString("知情同意书", comment: "")
    

    consentDocument.signaturePageTitle = NSLocalizedString("Consent", comment: "")
    

    consentDocument.signaturePageContent = NSLocalizedString("我同意参加本项调查研究", comment: "")
    
    /*
     Add the participant signature, which will be filled in during the
     consent review process. This signature initially does not have a
     signature image or a participant name; these are collected during
     the consent review step.
     */
    let participantSignatureTitle = NSLocalizedString("Participant", comment: "")
    let participantSignature = ORKConsentSignature(forPersonWithTitle: participantSignatureTitle, dateFormatString: nil, identifier: String(Identifier.ConsentDocumentParticipantSignature))
    
    consentDocument.addSignature(participantSignature)
    
    /*
     Add the investigator signature. This is pre-populated with the
     investigator's signature image and name, and the date of their
     signature. If you need to specify the date as now, you could generate
     a date string with code here.
     
     This signature is only used for the generated PDF.
     */
    let signatureImage = UIImage(named: "signature")!
    let investigatorSignatureTitle = NSLocalizedString("Investigator", comment: "")
    let investigatorSignatureGivenName = NSLocalizedString("Jonny", comment: "")
    let investigatorSignatureFamilyName = NSLocalizedString("Appleseed", comment: "")
    let investigatorSignatureDateString = "3/10/15"
    
    let investigatorSignature = ORKConsentSignature(forPersonWithTitle: investigatorSignatureTitle, dateFormatString: nil, identifier: String(Identifier.ConsentDocumentInvestigatorSignature), givenName: investigatorSignatureGivenName, familyName: investigatorSignatureFamilyName, signatureImage: signatureImage, dateString: investigatorSignatureDateString)
    
    consentDocument.addSignature(investigatorSignature)
    
    /*
     This is the HTML content for the "Learn More" page for each consent
     section. In a real consent, this would be your content, and you would
     have different content for each section.
     
     If your content is just text, you can use the `content` property
     instead of the `htmlContent` property of `ORKConsentSection`.
     */
    let htmlContentString = "<ul><li>Lorem</li><li>ipsum</li><li>dolor</li></ul><p>\(loremIpsumLongText)</p><p>\(loremIpsumMediumText)</p>"
    
    /*
     These are all the consent section types that have pre-defined animations
     and images. We use them in this specific order, so we see the available
     animated transitions.
     */
    let consentSectionTypes: [ORKConsentSectionType] = [
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    ]
    
    /*
     For each consent section type in `consentSectionTypes`, create an
     `ORKConsentSection` that represents it.
     
     In a real app, you would set specific content for each section.
     */
    var consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        
        consentSection.summary = loremIpsumShortText
        
        if contentSectionType == .Overview {
            consentSection.htmlContent = htmlContentString
        }
        else {
            consentSection.content = loremIpsumLongText
        }
        
        return consentSection
    }
    
    /*
     This is an example of a section that is only in the review document
     or only in the generated PDF, and is not displayed in `ORKVisualConsentStep`.
     */
    let consentSection = ORKConsentSection(type: .OnlyInDocument)
    consentSection.summary = NSLocalizedString(".OnlyInDocument Scene Summary", comment: "")
    consentSection.title = NSLocalizedString(".OnlyInDocument Scene", comment: "")
    consentSection.content = loremIpsumLongText
    
    consentSections += [consentSection]
    
    // Set the sections on the document after they've been created.
    consentDocument.sections = consentSections
    
    return consentDocument
}

private var loremIpsumText: String {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
}

private var loremIpsumShortText: String {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
}

private var loremIpsumMediumText: String {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam adhuc, meo fortasse vitio, quid ego quaeram non perspicis. Plane idem, inquit, et maxima quidem, qua fieri nulla maior potest. Quonam, inquit, modo?"
}

private var loremIpsumLongText: String {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam adhuc, meo fortasse vitio, quid ego quaeram non perspicis. Plane idem, inquit, et maxima quidem, qua fieri nulla maior potest. Quonam, inquit, modo? An potest, inquit ille, quicquam esse suavius quam nihil dolere? Cave putes quicquam esse verius. Quonam, inquit, modo?"
}



/*
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


        
    
    
    
    
    
    return ORKOrderedTask(identifier:"ConsentTask", steps:steps)

}
 */