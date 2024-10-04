//
//  Extensions.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 04/10/2024.
//

import Foundation

extension Encodable {
    func asDictionnary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
            
            
            
        }
        
    }
}//END extension

