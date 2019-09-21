//
//  PodCastController..swift
//  Apple itunes
//
//  Created by Al Wefaq on 9/21/19.
//  Copyright © 2019 Al Wefaq. All rights reserved.
//

import UIKit
import Alamofire

class PodCastsController : UITableViewController {
    
      let cellId = "cellId"
    var podCasts = [Result]()
  
    let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
   
    override func viewDidLoad() {
         super.viewDidLoad()
         setTitletTOnavigationController()
        setupTableView()
        APIService.shared.getdataFromAPi { (podcasts) in
            self.podCasts = podcasts
            self.tableView.reloadData()
        }
   
    }
    
   
    //MARK:- UITABLE VIEW WORK
    fileprivate func setupTableView() {
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return podCasts.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? EpisodeCell else {return UITableViewCell()}
        let podCast = podCasts[indexPath.row]
          cell.podCast = podCast
//        cell.textLabel?.text = "\(podCast.name)\n\(podCast.artistName)"
//        cell.textLabel?.numberOfLines = 0
        //cell.imageView?.image = #imageLiteral(resourceName: "Simulator Screen Shot - iPhone Xʀ - 2019-09-19 at 14.12.11")
        return cell
    }
    
    
  
    //MARK:- NAVIGATION BAR WORK
    fileprivate  func setTitletTOnavigationController(){
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Coming Soon"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    

}

    
    

    
