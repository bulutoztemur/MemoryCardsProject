//
//  CardView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 18.08.2021.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    override var reuseIdentifier: String? {
        return "MyCardCell"
    }
    
    var backImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(named: "brain")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var frontImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(named: "bus")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        backgroundColor = .brown
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(frontImageView)
        addSubview(backImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            frontImageView.topAnchor.constraint(equalTo: topAnchor),
            frontImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            frontImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            frontImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func flipUp(speed: TimeInterval = 0.3) {
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
    }
    
    func flipDown(speed: TimeInterval = 0.3, delay: TimeInterval = 0.5) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
    }


}
