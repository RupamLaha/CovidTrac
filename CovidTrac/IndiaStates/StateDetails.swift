//
//  StateDetails.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 17/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StateDetails: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var navTitle = ""
    
    var DistricsArray = [String]()
    var confirmedS = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navTitle
        apiCalling()
    
    }
    
        func apiCalling() {
            
            let url = "https://api.covid19india.org/v2/state_district_wise.json"
            
            Alamofire.request(url, method: .get).responseJSON{ response in
                
                if let data = response.result.value{
                    
                    let json = JSON(data)
                    
    //                print(json["statewise"].count)
    //                print(json["statewise"][3]["state"].stringValue
                    for i in 0...(json.count) - 1{
                        if (json[i]["state"].stringValue == self.navTitle){
                            for j in 0...(json[i]["districtData"].count - 1){
                                let dist = json[i]["districtData"][j]["district"].stringValue
                                let conf = json[i]["districtData"][j]["confirmed"].stringValue
                                self.DistricsArray.append(dist)
                                self.confirmedS.append(conf)
                            }
                            
                        }
                    }
                    self.table.reloadData()
                    //print(self.statesArray)
                }
                
                else{
                    print(response.error?.localizedDescription as Any)
                }
                
            }
            
        }

}

extension StateDetails: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DistricsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StateDetailsTableViewCell
        
        cell.districsNames.text = DistricsArray[indexPath.row]
        cell.activeInDistrics.text = confirmedS[indexPath.row]
        
        return cell
    }
    
    
    
}
