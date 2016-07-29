//
//  SurveyTask.swift
//  Ache!
//
//  Created by 彭靖杰 on 7/29/16.
//  Copyright © 2016 MidnightHoot. All rights reserved.
//  问卷信息都在这里

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //TODO: add instructions step
    
    //TODO: add name question
    
    let questQuestionStep_1 = "神经过敏,感到不踏实"
    let textChoices_1 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
    ]

    let questAnswerFormat1: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_1)
    let questQuestionStep1 = ORKQuestionStep(identifier: "TextChoiceQuestionStep1", title: questQuestionStep_1, answer: questAnswerFormat1)
    steps += [questQuestionStep1]
    
    let questQuestionStep_2 = "发抖"
    let textChoices_2 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat2: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_2)
    let questQuestionStep2 = ORKQuestionStep(identifier: "TextChoiceQuestionStep2", title: questQuestionStep_2, answer: questAnswerFormat2)
    steps += [questQuestionStep2]
    
    
    
    let questQuestionStep_3 = "无缘无故的突然感到害怕"
    let textChoices_3 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat3: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_3)
    let questQuestionStep3 = ORKQuestionStep(identifier: "TextChoiceQuestionStep3", title: questQuestionStep_3, answer: questAnswerFormat3)
    steps += [questQuestionStep3]

    let questQuestionStep_4 = "感到害怕"
    let textChoices_4 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat4: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_4)
    let questQuestionStep4 = ORKQuestionStep(identifier: "TextChoiceQuestionStep4", title: questQuestionStep_4, answer: questAnswerFormat4)
    steps += [questQuestionStep4]
    
    
    let questQuestionStep_5 = "心跳得很厉害"
    let textChoices_5 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat5: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_5)
    let questQuestionStep5 = ORKQuestionStep(identifier: "TextChoiceQuestionStep5", title: questQuestionStep_5, answer: questAnswerFormat5)
    steps += [questQuestionStep5]
    
    let questQuestionStep_6 = "感到紧张或容易紧张"
    let textChoices_6 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat6: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_6)
    let questQuestionStep6 = ORKQuestionStep(identifier: "TextChoiceQuestionStep6", title: questQuestionStep_6, answer: questAnswerFormat6)
    steps += [questQuestionStep6]
    
    let questQuestionStep_7 = "一阵阵恐惧或惊恐"
    let textChoices_7 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat7: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_7)
    let questQuestionStep7 = ORKQuestionStep(identifier: "TextChoiceQuestionStep7", title: questQuestionStep_7, answer: questAnswerFormat7)
    steps += [questQuestionStep7]
    
    let questQuestionStep_8 = "感到坐立不安心神不定"
    let textChoices_8 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat8: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_8)
    let questQuestionStep8 = ORKQuestionStep(identifier: "TextChoiceQuestionStep8", title: questQuestionStep_8, answer: questAnswerFormat8)
    steps += [questQuestionStep8]
    
    let questQuestionStep_9 = "感到熟悉的东西变得陌生或不像真的"
    let textChoices_9 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat9: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_9)
    let questQuestionStep9 = ORKQuestionStep(identifier: "TextChoiceQuestionStep9", title: questQuestionStep_9, answer: questAnswerFormat9)
    steps += [questQuestionStep9]
    
    let questQuestionStep_10 = "感到要很快把事情做完"
    let textChoices_10 = [
        ORKTextChoice(text: "从无", value: 0),
        ORKTextChoice(text: "轻度", value: 1),
        ORKTextChoice(text: "中度", value: 2),
        ORKTextChoice(text: "偏重", value: 3),
        ORKTextChoice(text: "严重", value: 4),
        ]
    let questAnswerFormat10: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices_10)
    let questQuestionStep10 = ORKQuestionStep(identifier: "TextChoiceQuestionStep10", title: questQuestionStep_10, answer: questAnswerFormat10)
    steps += [questQuestionStep10]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "问卷结束。"
    summaryStep.text = "感谢您的配合！"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}