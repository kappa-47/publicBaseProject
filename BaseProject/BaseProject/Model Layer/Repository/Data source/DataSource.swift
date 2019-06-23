//
//  DataSource.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/11/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import Foundation

final class DataSource : DataSourceProtocol {
    
    static var shared: DataSourceProtocol = DataSource()
    
    lazy var remoteDataSource:DataSourceProtocol = RemoteDataSource()
    lazy var localDataSource = LocalDataSource()
    
    func getLMSStudent(sectionId: Int, success: (([LMSStduentModel]) -> Void)?, failure: ((NSError) -> Void)?) {
        remoteDataSource.getLMSStudent(sectionId: sectionId, success: { (students) in
            success?(students)
        }, failure: failure)
    }
    
    
}
