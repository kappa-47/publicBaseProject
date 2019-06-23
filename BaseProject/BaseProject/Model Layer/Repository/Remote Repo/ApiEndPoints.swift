//
//  TIAApiEndPoints.swift
//  TiaIOS
//
//  Created by Qais Alnammari on 1/27/19.
//  Copyright © 2019 NSIT. All rights reserved.
//

import Alamofire

//MARK: - ApiEndPoints
public enum ApiEndPoints: String{
    static let baseUrl = "http://192.168.1.21/api/"
   
   
    case getLMSStudents =  "Curriculum/GetStudentsBySectionSubjectId/%@"
    
}

//MARK: - Endpoint
protocol EndPointProtocol {
    var address: String { get set }
    var httpMethod: HTTPMethod { get set }
    var headers: [String:String]? { get set }
}

struct EndPoint: EndPointProtocol {
    
    
    //MARK: - Properties
    var address: String
    var httpMethod: HTTPMethod
    var headers: [String:String]?
    //MARK: - Initializers
    
    /// Initializes an Endpoint object.
    ///
    /// - Parameters:
    ///   - address: TIAApiEndPoints Enum
    ///   - httpMethod: HTTPMethod
    ///   - headers: [[String: String]], Optional with nil as default value.
    init(address: ApiEndPoints, httpMethod: HTTPMethod, headers: [String:String]? = nil) {
        self.address = address.rawValue
        self.httpMethod = httpMethod
        self.headers = headers
    }
    
    init(address: String, httpMethod: HTTPMethod, headers: [String:String]? = nil) {
        self.address = address
        self.httpMethod = httpMethod
        self.headers = headers
    }
}
