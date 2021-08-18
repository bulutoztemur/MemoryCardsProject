//
//  ScoreboardView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 18.08.2021.
//

import UIKit

class ScoreboardView: UIView {
    
    var timer: Timer?
    
    var timeLabel: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    var mismatchLabel: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func startTimer() {
        
    }
    
    private func stopTimer() {
        
    }
}
