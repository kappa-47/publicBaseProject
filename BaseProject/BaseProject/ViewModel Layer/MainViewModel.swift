//
//  MainViewModel.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/11/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import Foundation

class MainViewModel {
    
    
    var students = [LMSStduentModel]()
    
    var count:Int {
        return students.count
    }
    
    func getStudents(studentID:Int, success: @escaping ()->Void,failure: @escaping (NSError)->Void){
        DataSource.shared.getLMSStudent(sectionId: studentID, success: { (result) in
            self.students = result
            success()
        }, failure: failure)
    }
    
}
