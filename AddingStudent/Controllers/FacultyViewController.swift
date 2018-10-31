//
//  FacultyViewController.swift
//  AddingStudent
//
//  Created by Андрей Сергиенко on 10/27/18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class FacultyViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    var surname: String?
    var faculty: String?
    var student: Student?
    
    // MARK: - Outlets
    @IBOutlet private weak var facultyTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showInfoVC" else {return}
        guard let destVC = segue.destination as? InfoViewController else {return}
        destVC.student = student
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if facultyTextField.text?.isEmpty == true {
            continueButton.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction private func continuePressed(_ sender: Any) {
        faculty = facultyTextField.text
        student = Student(name: name ?? "", surname: surname ?? "", faculty: faculty ?? "")
    }
    
    // MARK: - Objc Methods
    @objc private func keyboardWillShow(_ notification: Notification) {
        view.backgroundColor = .lightGray
        continueButton.isEnabled = false
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        view.backgroundColor = .white
        continueButton.isEnabled = true
        if facultyTextField.text == "" {
            continueButton.isEnabled = false
        }
    }
    
}
