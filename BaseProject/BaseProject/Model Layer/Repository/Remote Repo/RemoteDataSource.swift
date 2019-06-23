//
//  RemoteDataSource.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/11/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import Foundation
import Alamofire

class RemoteDataSource : DataSourceProtocol {
    
    //MARK:-Proparties
    lazy var remoteContext = RemoteContext(baseURL: ApiEndPoints.baseUrl)
    
    func getLMSStudent(sectionId: Int, success: (([LMSStduentModel]) -> Void)?, failure: ((NSError) -> Void)?) {
       
            let url = String(format: ApiEndPoints.getLMSStudents.rawValue, "\(sectionId)")
            
            let endpoint = EndPoint(address: url, httpMethod: .get, headers: ["Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMDAyIiwianRpIjoiMGIyZWZlNWItZDU2Ny00MmM5LTg2MGYtYTk5OWVlYTA2ZmE1IiwiaWF0Ijo2MzY4NTEzNDg3MTAwMzY0OTEsIklkIjoiNmY1ZmM3M2EtZGZmZC00OTExLTgyOTMtNmFlM2M5NDc4MDFhIiwiTmFtZSI6IjAwMDIiLCJuYmYiOjE1NDk1MzgwNzEsImV4cCI6MTU0OTYyNDQ3MSwiaXNzIjoiVGlhIiwiYXVkIjoiVGlhIn0.o3Lq_VVfErqqIBA8a1FZRtZeUAVh_je43WBFRr67SEc","Filters":"{\"schoolId\":\(7),\"academicYearId\":\(1),\"academicProgramId\":\(1),\"educationalProgramId\":\(1),\"academicSemesterId\":\(1)}"])
            
            remoteContext.request(endPoint: endpoint, parameters: nil) { (result, data) in
                guard result else {
                    //Failure
                    let error = data as? NSError
                    print("Error occured while authenticating user. In \(#function). \(error!.localizedDescription)")
                    failure?(error!)
                    return
                }
                
                let decoder = JSONDecoder()
                
                do{
                    let model = try decoder.decode([LMSStduentModel].self, from: data as! Data)
                    success?(model)
                }catch let err{
                    failure?(err as NSError)
                }
                
            }
        }
    }
    
    

