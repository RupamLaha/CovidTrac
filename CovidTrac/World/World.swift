//
//  World.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 17/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class World: UIViewController {

    @IBOutlet weak var totalWorld: UILabel!
    @IBOutlet weak var recoveredWorld: UILabel!
    @IBOutlet weak var deathsWorld: UILabel!
    @IBOutlet weak var tableWorld: UITableView!
    @IBOutlet weak var lastUpdated: UILabel!
    
    var countryArray = [String]()
    var recoveredArray = [Int]()
    var activeArray = [Int]()
    var deathsArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiCalling()
    }
    
    func apiCalling() {
            
            let url = "https://bing.com/covid/data"
        
        let actInd = UIActivityIndicatorView(style: .large)
        actInd.color = UIColor.gray
        self.view.addSubview(actInd)
        actInd.frame = self.view.frame
        actInd.center = self.view.center
        actInd.startAnimating()
            
            Alamofire.request(url, method: .get).responseJSON{ response in
                
                if let data = response.result.value{
                    
                    let json = response.result.value as! [String:Any]
                    let areas = json["areas"] as! [[String:Any]]
                    
                    
                    self.totalWorld.text = String(json["totalConfirmed"] as! Int)
                    self.recoveredWorld.text = String(json["totalRecovered"] as! Int)
                    self.deathsWorld.text = String(json["totalDeaths"] as! Int)
                    self.lastUpdated.text = "Last Updated: " + (json["lastUpdated"] as! String)
                    
//                      print(json["totalConfirmed"].stringValue)
//                      print(json["areas"][0]["displayName"].stringValue)
                DispatchQueue.global(qos: .background).async {
                    for i in areas{
                        let state = i["displayName"] as! String
                        let ac = i["totalConfirmed"] as? Int ?? 0
                        let re = i["totalRecovered"] as? Int ?? 0
                        let de = i["totalDeaths"] as? Int ?? 0
                        self.countryArray.append(state)
                        self.activeArray.append(ac)
                        self.recoveredArray.append(re)
                        self.deathsArray.append(de)
//                        debugPrint(self.countryArray)
//                        self.tableWorld.reloadData()
                        }
                    }
//                    for i in 0...(json["areas"].count)-1{
//                    let ac = json["areas"][i]["totalConfirmed"].stringValue
//                    self.activeArray.append(ac)
//                    }
//                    for i in 0...(json["areas"].count)-1{
//                    let re = json["areas"][i]["totalRecovered"].stringValue
//                    self.recoveredArray.append(re)
//                    }
//                    for i in 0...(json["areas"].count)-1{
//                    let de = json["areas"][i]["totalDeaths"].stringValue
//                    self.deathsArray.append(de)
//                    }
//                    }
                    DispatchQueue.main.async {
                        
                    self.tableWorld.reloadData()
                        actInd.stopAnimating()
//                    //print(self.statesArray)
                    }
                }
                
                else{
                    print(response.error?.localizedDescription as Any)
                }
                
        }
        
//        actInd.stopAnimating()
            
    }

}

extension World: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorldTableViewCell
        
        cell.countrieNames.text = countryArray[indexPath.row]
        cell.activeCasesCountries.text = String(activeArray[indexPath.row])
        cell.recoveredCountries.text = String(recoveredArray[indexPath.row])
        cell.deathsCountries.text = String(deathsArray[indexPath.row])
        
        return cell
    }
    
    
}
