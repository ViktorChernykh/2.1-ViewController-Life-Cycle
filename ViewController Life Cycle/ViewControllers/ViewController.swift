//
//  ViewController.swift
//  ViewController Life Cycle
//
//  Created by Viktor on 12/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private var delegate: MessageData!

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!

    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = Message.shared
        delegate.addMessage(#function, title: title)
    }
    
    deinit {
        delegate.addMessage(#function, title: title)
    }
    
    // MARK: - Life cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.addMessage(#function, title: title)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate.addMessage(#function, title: title)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate.addMessage(#function, title: title)
        appearMessage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate.addMessage(#function, title: title)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate.addMessage(#function, title: title)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        delegate.addMessage(#function, title: title)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        delegate.addMessage(#function, title: title)
        appearMessage()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        delegate.addMessage(#function, title: title)
    }
    
    // MARK: - Custom private methods
    private func appearMessage() {
        textView.isEditable = false
        let text = delegate!.readMessage()
        textView.text = text
        
        // scroll to end
        if !text.isEmpty {
            let range = NSRange(location: text.count - 1, length: 1)
            textView.scrollRangeToVisible(range)
        }
    }
    
    // MARK: - @IBAction
    @IBAction func unwind(segue: UIStoryboardSegue) {
        delegate.addMessage(#function, title: title)
    }

}

