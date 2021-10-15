//
//  ResultView.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 4.10.2021.
//

import UIKit

class ResultView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mistakeLabel: UILabel!
    
    
    func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ResultView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    private func initView() {
        xibSetup()
        layer.cornerRadius = 12
        layer.masksToBounds = true
        backgroundColor = UIColor(white: 0, alpha: 0.85)
    }
}
