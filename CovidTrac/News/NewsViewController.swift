//
//  NewsViewController.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 21/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SafariServices
import SDWebImage

class NewsViewController: UIViewController{

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var firstVIew: UIView!
    @IBOutlet weak var secondView: UIView!
    
//    @IBOutlet weak var table: UITableView!
    var titleArray = [String]()
    var contentArray = [String]()
    var imgUrlArray = [NSURL]()
    var sourceUrlArray = [NSURL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func segAction(_ sender: UISegmentedControl) {
        
        if seg.selectedSegmentIndex == 0{
            self.firstVIew.alpha = 1
            self.secondView.alpha = 0
        }
        
        else{
            self.firstVIew.alpha = 0
            self.secondView.alpha = 1
        }
        
    }
    
//    @IBAction func segAction(_ sender: UISegmentedControl) {
//
//        if seg.selectedSegmentIndex == 0{
//
//            let url = "http://newsapi.org/v2/top-headlines?country=in&q=corona&q=covid19&q=covid&q=coronavirus&apiKey=f2209aa52ab44682b244dc0c2643d077"
//
//            Alamofire.request(url).responseJSON{ response in
//
//                if let data = response.result.value {
//
//                    let json = JSON(data)
//
//                    for i in 0...(json["articles"].count) - 1{
//
//                        let title = json["articles"][i]["title"].stringValue
//                        let content = json["articles"][i]["description"].stringValue
//                        let imgUrl = json["articles"][i]["urlToImage"].url
//                        let sourceUrl = json["articles"][i]["url"].url
//
//
//                        self.titleArray.append(title)
//                        self.contentArray.append(content)
//                        self.imgUrlArray.append(imgUrl! as NSURL)
//                        self.sourceUrlArray.append(sourceUrl! as NSURL)
//                    }
//
//                    self.table.reloadData()
//                }
//
//                else{
//                    print(response.error?.localizedDescription as Any)
//                }
//
//            }
//
//
//        }
//
//        else if seg.selectedSegmentIndex == 1{
//
//            let url = "http://newsapi.org/v2/top-headlines?q=corona&q=covid19&q=covid&q=coronavirus&sortBy=popularity&apiKey=f2209aa52ab44682b244dc0c2643d077"
//
//            Alamofire.request(url).responseJSON{ response in
//
//                if let data = response.result.value {
//
//                    let json = JSON(data)
//
//                    for i in 0...(json["articles"].count) - 1{
//
//                        let title = json["articles"][i]["title"].stringValue
//                        let content = json["articles"][i]["description"].stringValue
//                        let imgUrl = json["articles"][i]["urlToImage"].url
//                        let sourceUrl = json["articles"][i]["url"].url
//
//
//                        self.titleArray.append(title)
//                        self.contentArray.append(content)
////                        self.imgUrlArray.append(imgUrl! as? NSURL ?? nil)
//                        self.sourceUrlArray.append(sourceUrl! as NSURL)
//                    }
//
//                    self.table.reloadData()
//                }
//
//                else{
//                    print(response.error?.localizedDescription as Any)
//                }
//
//            }
//
//        }
//    }
    
    
}

//extension NewsViewController: UITableViewDelegate,UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 440
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titleArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
//
//        cell.title.text = titleArray[indexPath.row]
//        cell.newsDescription.text = contentArray[indexPath.row]
////        cell.newsImg.sd_setImage(with: imgUrlArray[indexPath.row] as URL)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let sf = SFSafariViewController(url: sourceUrlArray[indexPath.row] as URL)
//
//        present(sf, animated: true)
//    }
//
//
//}
