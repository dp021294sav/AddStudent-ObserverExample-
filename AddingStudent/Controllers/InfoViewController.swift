//
//  InfoViewController.swift
//  AddingStudent
//
//  Created by Андрей Сергиенко on 10/27/18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Properties
    var student: Student?
    
    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    @IBOutlet private weak var facultyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = student?.name
        surnameLabel.text = student?.surname
        facultyLabel.text = student?.faculty
    }

}
