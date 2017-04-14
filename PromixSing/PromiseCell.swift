//
//  PromiseCell.swift
//  PromixSing
//
//  Created by Hyunsoo Park on 4/14/17.
//  Copyright © 2017 Hyunsoo Park. All rights reserved.
//

import UIKit
import Material

class PromiseCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var card: Card!
    @IBOutlet weak var toolBar: Toolbar!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var bottomBar: Bar!
    
    fileprivate var dateFormatter: DateFormatter!
    fileprivate var dateLabel: UILabel!
    fileprivate var moreButton: IconButton!
    fileprivate var favoriteButton: IconButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prepareDateFormatter()
        prepareDateLabel()
        prepareFavoriteButton()
        prepareMoreButton()
        prepareToolbar()
        prepareContentView()
        prepareBottomBar()
        prepareImageCard()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    fileprivate func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.grey.base
        dateLabel.text = dateFormatter.string(from: Date.distantFuture)
    }
    
    fileprivate func prepareFavoriteButton() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    
    fileprivate func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.grey.base)
    }
    
    fileprivate func prepareToolbar() {
        toolBar.rightViews = [moreButton]
        toolBar.title = "Material"
        toolBar.titleLabel.textAlignment = .left
        
        toolBar.detail = "Build Beautiful Software"
        toolBar.detailLabel.textAlignment = .left
        toolBar.detailLabel.textColor = Color.grey.base
    }
    
    fileprivate func prepareContentView() {
        contentLabel.numberOfLines = 0
        contentLabel.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentLabel.font = RobotoFont.regular(with: 14)
    }
    
    fileprivate func prepareBottomBar() {
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [dateLabel]
    }
    
    fileprivate func prepareImageCard() {

        card.toolbar = toolBar
        card.toolbarEdgeInsetsPreset = .square1
        card.toolbarEdgeInsets.bottom = 0
        
        card.contentView = contentLabel
        card.contentViewEdgeInsetsPreset = .wideRectangle2
        
        card.bottomBar = bottomBar
        card.bottomBarEdgeInsetsPreset = .wideRectangle1
        
        layout(card).vertically(top: 4, bottom: 4).center()
        layout(card).horizontally(left: 8, right: 8).center()
    }
    
}
