//
//  ProductCell.swift
//  Apple itunes
//
//  Created by Al Wefaq on 9/21/19.
//  Copyright © 2019 Al Wefaq. All rights reserved.
//

import UIKit
import SDWebImage
class EpisodeCell : UITableViewCell {
    
    var podCast : Result!{
        didSet{
             nameLabel.text = podCast.name
            mediaTypeLabel.text = podCast.artistName
            guard let url = URL(string: podCast.artworkUrl100 ) else {return}
            artistImage.sd_setImage(with: url, completed: nil)
         
        }
    }
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 3
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        return lbl
    }()
   
    private let mediaTypeLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let artistImage : UIImageView = {
        let imgView = UIImageView(image: nil)
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 25
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.borderWidth = 1
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameLabel)
        self.addSubview(mediaTypeLabel)
        self.addSubview(artistImage)
         artistImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        
         nameLabel.anchor(top: topAnchor, left: artistImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
         mediaTypeLabel.anchor(top: nameLabel.bottomAnchor, left: artistImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

