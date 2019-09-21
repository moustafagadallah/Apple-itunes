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
        return cell
    }
    
    
  
    //MARK:- NAVIGATIONBAR WORK
    fileprivate  func setTitletTOnavigationController(){
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Coming Soon"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    

}

    
    

    
