//
//  SelectableItem.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 14.10.2021.
//

import UIKit
import RxTheme

class SelectableItem: UIView {
        
    var flagImageView: UIImageView = {
        let imageView = UIImageView()
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
        addSubview(flagImageView)
        setupConstraints()
    }

    func addBorderCircle() {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 2
        layer.theme.borderColor = themeResource { $0.tintColor.cgColor }
    }
    
    func removeBorderCircle() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            flagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            flagImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            flagImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
    }
}
