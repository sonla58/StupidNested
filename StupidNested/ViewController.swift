//
//  ViewController.swift
//  StupidNested
//
//  Created by Anh Son Le on 10/4/18.
//  Copyright © 2018 Anh Son Le. All rights reserved.
//

import UIKit
import NestedChecker

class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tvInput: UITextView!
    @IBOutlet weak var lblResult: UILabel!
    
    // MARK: - Declare
    
    // MARK: - Define
    
    // MARK: - Set up
    
    func setUpView() {
        updateResult()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Life's view controller

    override func viewDidLoad() {
        super.viewDidLoad()
        tvInput.inputView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpView()
    }
    
    func updateResult() {
        if NestedChecker.shared.check(str: tvInput.text) {
            lblResult.text = "TRUE"
            lblResult.textColor = UIColor.green
        } else {
            lblResult.text = "FALSE"
            lblResult.textColor = UIColor.red
        }
    }
    
    // MARK: - Action

    @IBAction func btnInputs(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        tvInput.text.append(button.titleLabel?.text ?? "")
        updateResult()
    }
    
    @IBAction func clearInputTaped(_ sender: Any) {
        tvInput.text = ""
        updateResult()
    }
    
    @IBAction func deleteTaped(_ sender: Any) {
        _ = tvInput.text.popLast()
        updateResult()
    }
}
