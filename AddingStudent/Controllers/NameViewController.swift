//
//  NameViewController.swift
//  AddingStudent
//
//  Created by Андрей Сергиенко on 10/27/18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    var surname: String?
    
    // MARK: - Outlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showFacultyVC" else {return}
        guard let destVC = segue.destination as? FacultyViewController else {return}
        destVC.name = name
        destVC.surname = surname
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if nameTextField.text?.isEmpty == true || surnameTextField.text?.isEmpty == true {
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
        name = nameTextField.text
        surname = surnameTextField.text
    }
    
    // MARK: - Objc Methods
    @objc private func keyboardWillShow(_ notification: Notification) {
        view.backgroundColor = .lightGray
        continueButton.isEnabled = false
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        view.backgroundColor = .white
        continueButton.isEnabled = true
        if nameTextField.text?.isEmpty == true || surnameTextField.text?.isEmpty == true {
            continueButton.isEnabled = false
        }
    }
    
 }
