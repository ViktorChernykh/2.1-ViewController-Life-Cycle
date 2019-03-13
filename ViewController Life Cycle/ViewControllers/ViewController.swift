//
//  ViewController.swift
//  ViewController Life Cycle
//
//  Created by Viktor on 12/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addMessage()
    }
    
    deinit {
        addMessage()
    }
    
    func addMessage(_ function: String = #function) {
        let date = Date()
        let localCurrentTime = DateFormatter()
        localCurrentTime.timeStyle = .medium
        localCurrentTime.dateStyle = .none
        let timeString = localCurrentTime.string(from: date)
        messages.append("\(timeString) \(title ?? ""): \(function)")
    }
    
    func appearMessage() {
        textView.isEditable = false
        let text = messages.joined(separator: "\n")
        textView.text = text
        
        if !text.isEmpty {
            let range = NSRange(location: text.count - 1, length: 1)
            textView.scrollRangeToVisible(range)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addMessage()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addMessage()
        appearMessage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addMessage()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addMessage()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addMessage()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addMessage()
        appearMessage()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        addMessage()
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        addMessage()
    }
}

