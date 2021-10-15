//
//  ScoreboardView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 18.08.2021.
//

import UIKit

class ScoreboardView: UIView {
    
    var timer: Timer?
    
    var timerLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name:"HelveticaNeue-Medium", size: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var mismatchLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Mistake: 0"
        lbl.font = UIFont(name:"HelveticaNeue-Medium", size: 16.0)
        lbl.textColor = UIColor(red: 220 / 255, green: 0, blue: 0, alpha: 1)
        return lbl
    }()
    
    var milliseconds = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(timerLabel)
        addSubview(mismatchLabel)
        setupConstraints()
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: topAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            mismatchLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mismatchLabel.topAnchor.constraint(equalTo: topAnchor),
            timerLabel.trailingAnchor.constraint(lessThanOrEqualTo: mismatchLabel.leadingAnchor, constant: -20),
            
            timerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            mismatchLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func timerFired() {
        milliseconds += 1
        timerLabel.text =  milliseconds.stringFromTimeInterval()
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
}

