//
//  MyProfileRequest.swift
//  finalProject
//
//  Created by Anita Souv on 3/4/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import Foundation

import FacebookCore

struct MyProfileRequest: GraphRequestProtocol {
    
    struct Response: GraphResponseProtocol {
        var name: String?
        var id: String?
        var gender: String?
        var email: String?
        var profilePictureUrl: String?
        var events: Any?
        
        init(rawResponse: Any?) {
            // Decode JSON from rawResponse into other properties here.
            guard let response = rawResponse as? Dictionary<String, Any> else {
                return
            }
            
            if let name = response["name"] as? String {
                self.name = name
            }
            
            if let id = response["id"] as? String {
                self.id = id
            }
            
            if let gender = response["gender"] as? String {
                self.gender = gender
            }
            
            if let email = response["email"] as? String {
                self.email = email
            }
            
            if let event = response["events"] {
                self.events = event
            }
            
            if let picture = response["picture"] as? Dictionary<String, Any> {
                
                if let data = picture["data"] as? Dictionary<String, Any> {
                    if let url = data["url"] as? String {
                        self.profilePictureUrl = url
                    }
                }
            }
        }
    }
    
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name, events"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}
