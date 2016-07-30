//
//  ConsentDocument.swift
//  Ache!
//
//  Created by 彭靖杰 on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//

import Foundation
import ResearchKit


//public var ConsentDocument:ORKConsentDocument{
class ConsentDocument:ORKConsentDocument{
    
   // let consentDocument = ORKConsentDocument()
 //   consentDocument.title = "知情同意书"
    
    let ipsum = [
        "本项目是一类医疗类的研究项目，我们真挚的邀请您参加一项关于消化系统的调查研究. 大量资料、实验研究和临床观察结果表明，身心疾病在医院就诊人群中占有相当大的比例，心理因素已成为消化系统疾病的重要病因之一，消极情绪会直接加重患者病情。本知情同意书提供给您一些信息，在您决定是否参加这项研究之前，请尽可能仔细阅读以下内容。",
        "调查项目的选项和数据将直接由用户生成. 我们不会在您不知情和不同意的情况下收集您的个人数据。",
        "在研究期间，您的姓名、性别等个人资料将用代号或数字代替，并予以严格的保密. 只有相关的医生知道您的资料，您的隐私权会得到很好的保护。研究结果可能会在杂志上发表，但不会泄露您个人的任何资料。如果您同意参加本项研究，您所有的医疗资料都将被发起此研究的研发单位的有关人员、相关权威机构查阅或被独立的伦理委员会查阅，以检查研究的操作是否恰当。如果您签署了知情同意书，也就意味着您同意接受上述人员的查阅。",
        "您的数据将只被用于医学研究并被严格保密. 可能使用到的数据有：您的调查问卷，性别，诊断情况，BMI，心率，睡眠时间等健康指标。如果您签署了知情同意书，也就意味着您同意接受上述研究数据的查阅",
        "您可随时了解与本研究有关的信息资料和研究进展. 如果您有与本研究有关的问题，请联系电话号码17773110681及研究者彭靖杰。如果您在研究过程需要了解关于本项研究参加者权益方面的问题您可以联系中南大学湘雅医学院药理学系。",
        "本调查项目采用SCL-90心理问卷调查表，对研究调查对象进行心理健康测量评分比较. 首轮问卷采用焦虑自评表(SAS)，稍后还会采用抑郁自评表(SDS)、生活满意度指数B量表(LSIB)评定两组焦虑、抑郁和生活满意度情况。研究将同时采用t检验和χ2检验进行统计分析。",
        "我们希望借此探究多种消化系统与心理健康状况的相互关系. 通过回归分析，探求相关度，以探求在某些消化系统疾病的治疗之中，引用心理治疗能否改善病人的体验以及改善预后。",
        "您可以选择不参加本项研究，或者有权在试验的任何阶段无需任何理由退出. 一旦您决定参加本项研究，请您签署此知情同意书表明同意。如果您选择参加本项研究，我们希望您能够坚持完成全部研究过程。"
    ]

    override init() {
        super.init()
        
        title = NSLocalizedString("Research Health Study Consent Form", comment: "")
    
    
    let consentSectionTypes:[ORKConsentSectionType] = [
        
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    
    ]
//        let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
//        let consentSection = ORKConsentSection(type: contentSectionType)
//        consentSection.summary = "本研究将帮助我们了解不同消化系统疾病对心理状况的影响"
//        consentSection.content = "调查将不占用超过您2分钟的时间，您一共需要回答十道题"
        
//        return consentSection

    
//    }
    
        sections = zip(consentSectionTypes, ipsum).map { sectionType, ipsum in
        let section = ORKConsentSection(type: sectionType)
        
        let localizedIpsum = NSLocalizedString(ipsum, comment: "")
        let localizedSummary = localizedIpsum.componentsSeparatedByString(".")[0] + "."
        
        section.summary = localizedSummary
        section.content = localizedIpsum
        
        return section
    }
        
        
        let signature = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        addSignature(signature)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







   // consentDocument.sections = consentSections
  //  consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
  //  return consentDocument
    






