//
//  HorizontalItemSelectionView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 11.10.2021.
//

import UIKit

class HorizontalItemSelectionView: UIView {
    
    var turkeyFlagContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var turkeyFlag: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "turkey"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var ukFlagContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var ukFlag: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "uk"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(turkeyFlagContainerView)
        addSubview(turkeyFlag)
        addSubview(ukFlagContainerView)
        addSubview(ukFlag)
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        turkeyFlagContainerView.layer.cornerRadius = turkeyFlagContainerView.frame.width / 2
        turkeyFlagContainerView.layer.borderWidth = 2
        turkeyFlagContainerView.layer.borderColor = UIColor.red.cgColor
        ukFlagContainerView.layer.cornerRadius = ukFlagContainerView.frame.width / 2
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            turkeyFlag.topAnchor.constraint(equalTo: turkeyFlagContainerView.topAnchor, constant: 5),
            turkeyFlag.leadingAnchor.constraint(equalTo: turkeyFlagContainerView.leadingAnchor, constant: 5),
            turkeyFlag.trailingAnchor.constraint(equalTo: turkeyFlagContainerView.trailingAnchor, constant: -5),
            turkeyFlag.bottomAnchor.constraint(equalTo: turkeyFlagContainerView.bottomAnchor, constant: -5),
            
            ukFlag.topAnchor.constraint(equalTo: ukFlagContainerView.topAnchor, constant: 5),
            ukFlag.leadingAnchor.constraint(equalTo: ukFlagContainerView.leadingAnchor, constant: 5),
            ukFlag.trailingAnchor.constraint(equalTo: ukFlagContainerView.trailingAnchor, constant: -5),
            ukFlag.bottomAnchor.constraint(equalTo: ukFlagContainerView.bottomAnchor, constant: -5),

            
            turkeyFlagContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ukFlagContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            turkeyFlagContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            turkeyFlagContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            turkeyFlagContainerView.trailingAnchor.constraint(equalTo: ukFlagContainerView.leadingAnchor, constant: -5),
            ukFlagContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

    
}

