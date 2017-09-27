//
//  Header.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 03/07/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

class Header: UIView, UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var rearScrollView: UIScrollView!
    @IBOutlet weak var foreScrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let foreImg = UIImageView.init(image: UIImage(named: "fore"))
        foreImg.frame = CGRect(x: 0, y: 0, width: foreImg.frame.width, height: foreScrollView.bounds.height)
        foreScrollView.contentSize = foreImg.frame.size
        foreScrollView.addSubview(foreImg)
        
        let rearImg = UIImageView.init(image: UIImage(named: "rear"))
        rearImg.frame = CGRect(x: 0, y: 0, width: rearImg.frame.width, height: rearScrollView.bounds.height)
        rearScrollView.contentSize = rearImg.frame.size
        rearScrollView.addSubview(rearImg)
    }

    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let foreSpan = foreScrollView.bounds.width - foreScrollView.contentSize.width
        let foreRatio = scrollView.contentOffset.x / foreSpan
        let rearSpan = rearScrollView.bounds.width - rearScrollView.contentSize.width
        rearScrollView.setContentOffset(
            CGPoint(x: foreRatio * rearSpan, y: 0),
            animated: false)
    }

}
