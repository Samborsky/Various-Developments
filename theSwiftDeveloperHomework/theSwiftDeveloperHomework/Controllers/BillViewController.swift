//
//  BillViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit


class BillViewController: UIViewController {


    @IBOutlet weak var fioLabel: UILabel!
    
    @IBOutlet weak var guestLabel: UILabel!
    
    @IBOutlet weak var tableLabel: UILabel!


    var fioLabelNew = ""
    var guestLabelNew = ""
    var tableLabelNew = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        fioLabel.text = fioLabelNew
        guestLabel.text = guestLabelNew
        tableLabel.text = tableLabelNew


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
