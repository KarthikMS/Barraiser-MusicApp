//
//  Request.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

struct Request<Response> {
    enum HTTPMethod {
        case get
    }
    
    let method: HTTPMethod
    let endPoint: String
}


extension Music {

    static var fetchList: Request<[Music]> {
        Request(method: .get, endPoint: "/list")
    }
    
}
