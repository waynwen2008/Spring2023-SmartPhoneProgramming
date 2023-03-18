//
//  DetailsViewController.swift
//  sevenwonders
//
//  Created by Wayne Wen on 3/18/23.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var detailsText: UITextView!
    var desText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsText.text = desText

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
