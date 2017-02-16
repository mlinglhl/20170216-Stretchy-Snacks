//
//  SnackViewController.swift
//  20170216 Stretchy Snacks
//
//  Created by Minhung Ling on 2017-02-16.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

import UIKit

class SnackViewController: UIViewController {
    
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var navViewHeight: NSLayoutConstraint!
    var 💩: NSLayoutConstraint?
    var 👑: NSLayoutConstraint?
    var 🐬: NSLayoutConstraint?
    var 🍉: NSLayoutConstraint?
    var 🍨: NSLayoutConstraint?
    var 🎈: NSLayoutConstraint?
    var 💛 = false
    var 🇨🇦 = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        🇨🇦.translatesAutoresizingMaskIntoConstraints = false
        🇨🇦.distribution = UIStackViewDistribution.fillProportionally
        🇨🇦.alignment = UIStackViewAlignment.bottom
        navView.addSubview(🇨🇦)
        🍨 = 🇨🇦.heightAnchor.constraint(equalToConstant: 100)
        🎈 = 🇨🇦.heightAnchor.constraint(equalToConstant: 0)
        🎈?.isActive = true
        🐬 = 🇨🇦.widthAnchor.constraint(equalTo: navView.widthAnchor)
        🍉 = 🇨🇦.widthAnchor.constraint(equalToConstant: 0)
        🍉?.isActive = true
        🇨🇦.bottomAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        💩 = 🇨🇦.leadingAnchor.constraint(equalTo: navView.leadingAnchor)
        👑 = 🇨🇦.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: navView.frame.size.width/2)
        👑?.isActive = true
        let image1 = UIImageView.init(image: #imageLiteral(resourceName: "oreos"))
        let image2 = UIImageView.init(image: #imageLiteral(resourceName: "pizza_pockets"))
        let image3 = UIImageView.init(image: #imageLiteral(resourceName: "pop_tarts"))
        let image4 = UIImageView.init(image: #imageLiteral(resourceName: "popsicle"))
        let image5 = UIImageView.init(image: #imageLiteral(resourceName: "ramen"))
        🇨🇦.addArrangedSubview(image1)
        🇨🇦.addArrangedSubview(image2)
        🇨🇦.addArrangedSubview(image3)
        🇨🇦.addArrangedSubview(image4)
        🇨🇦.addArrangedSubview(image5)
    }
    @IBOutlet weak var animateButton: UIButton!
    
    @IBAction func plusIconPressed(_ sender: Any) {
        💛 = !💛
        if 💛 {
            self.🎈?.isActive = false
            self.🍨?.isActive = true
            self.🍉?.isActive = false
            self.🐬?.isActive = true
            self.👑?.isActive = false
            self.💩?.isActive = true
            UIView.animate(withDuration: 1, animations: {
                self.navView.layoutIfNeeded()
            })
            self.navViewHeight.constant = 200
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 15, options: UIViewAnimationOptions.curveLinear, animations: {
                self.navView.layoutIfNeeded()
            }, completion: { _ in
            })
            UIView.animate(withDuration: 1.5, animations: {
                let rotate = CGAffineTransform(rotationAngle: CGFloat(M_PI_2/2))
                self.animateButton.transform = rotate
            })
        } else {
            self.🍨?.isActive = false
            self.🎈?.isActive = true
            self.🐬?.isActive = false
            self.🍉?.isActive = true
            self.💩?.isActive = false
            self.👑?.isActive = true
            UIView.animate(withDuration: 1, animations: {
                self.navView.layoutIfNeeded()
            })
            self.navViewHeight.constant = 66
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.navView.layoutIfNeeded()
            }, completion: { _ in
            })
            UIView.animate(withDuration: 1.5, animations: {
                self.animateButton.transform = CGAffineTransform.identity
            })
        }
    }
}
