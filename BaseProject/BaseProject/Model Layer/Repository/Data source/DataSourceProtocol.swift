//
//  DataSourceProtocol.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/11/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
    
    func getLMSStudent(sectionId:Int,success:(([LMSStduentModel])->Void)? , failure:((NSError)->Void)?)
    
}
