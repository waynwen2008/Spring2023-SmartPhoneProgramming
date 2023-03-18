//
//  ViewController.swift
//  APiCall
//
//  Created by Wayne Wen on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var stockText: UITextField!

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func getStockInfo(_ sender: Any) {
        guard let symbol = stockText.text else {return}

        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"

        SwiftSpinner.show("Getting Stock info for \(symbol)")

        AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in

                    switch response.result {

                    case .success(let json):
                        print(json)
                        DispatchQueue.main.async {

                            print("Finish Fetching Info!")
                            SwiftSpinner.hide()
                            if response.error != nil {
                                  print("Error in response")
                                  return
                            }
                            guard let rawData = response.data else {return}
                            guard let jsonArray = JSON(rawData).array else {return}
                            guard let stock = jsonArray.first else {return}

                            print(stock)
                            let companyName = stock["companyName"].stringValue
                            let price = stock["price"].doubleValue
                            let website = stock["website"].stringValue

                            self.priceLbl.text = "Price: \(price) $"
                            self.nameLbl.text = "Company Name: \(companyName)"
                            self.websiteLbl.text = "Website: \(website)"

                       }
                    case .failure(let error):
                        print(error)
                    }
            }
    }



}

