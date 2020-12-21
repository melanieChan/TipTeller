//
//  SettingsViewController.swift
//  TipTeller
//
//  Created by Melanie Chan on 12/18/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // changes color of nav bar
    @IBAction func switchTheme(_ sender: Any) {
        if (themeSwitch.isOn) {
            //colorLabel.textColor = UIColor.gray
            
            // darker theme
            navigationController?.navigationBar.barTintColor = UIColor.darkGray
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]


        } else {
            //colorLabel.textColor = UIColor.black
            
            let green = UIColor.init(red: 124/255, green: 188/255, blue: 156/255, alpha: 1)
            
            // lighter theme
            navigationController?.navigationBar.barTintColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: green]

        }
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
