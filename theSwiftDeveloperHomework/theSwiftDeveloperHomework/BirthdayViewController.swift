//
//  BirthdayViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 18.07.2022.
//

import UIKit


class BirthdayViewController: UIViewController {



    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var daysToBirthday: UILabel!


    

    var age = ""
    var name = ""
    var newDateLabel = ""
    var newDaysForBirthdayLabel = ""
    var photo: UIImage? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        dateLabel.text = newDateLabel
        photoImageView.image = photo
        ageLabel.text = age
        daysToBirthday.text = newDaysForBirthdayLabel
    }

    



}

