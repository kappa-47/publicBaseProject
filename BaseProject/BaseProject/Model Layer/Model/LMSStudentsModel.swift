//
//  LMSStudentsModel.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/11/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import Foundation

class LMSStduentModel: Codable {
    var id:String?
    var studentNumber:String?
    var name:String?
    var nameEn:String?
    var profileImg:String?
    var mark:Double?
    var attendances:Double??
    //    var notes:String?
    func getStudentName() -> String {
        if name == nil || nameEn == nil {
            return ""
        }
        return (AppLanguageManager.shared.currentLanguage == .ar ? name : nameEn)!
    }
}
