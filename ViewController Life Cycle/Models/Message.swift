//
//  Message.swift
//  ViewController Life Cycle
//
//  Created by Viktor on 15/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

import UIKit

protocol MessageData {
    func addMessage(_ function: String, title: String?)
    func readMessage() -> String
}

class Message: MessageData {
    
    // MARK: - Static Properties
    static let shared = Message()
    
    // MARK: - Properties
    private var messages = [String]()
    
    private init() {}
    
    // MARK: - Delegate methods
    func addMessage(_ function: String, title: String?) {

        let date = Date()
        let localCurrentTime = DateFormatter()
        //        localCurrentTime.timeStyle = .medium
        //        localCurrentTime.dateStyle = .none
        localCurrentTime.locale = Locale(identifier: "ru_RU")
        localCurrentTime.dateFormat = "HH:mm:ss"
        
        let timeString = localCurrentTime.string(from: date)
        
        messages.append("\(timeString)  \(title ?? ""): \(function)")
    }
    
    func readMessage() -> String {
        let text = messages.joined(separator: "\n")
        return text
    }
    
}
