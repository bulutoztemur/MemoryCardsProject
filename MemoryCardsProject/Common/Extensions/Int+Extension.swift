//
//  Int+Extension.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 4.10.2021.
//

extension Int {
    func stringFromTimeInterval() -> String {
        let myTime = self / 1000
        let hours = (myTime / 3600)
        let minutes = (myTime / 60) % 60
        let seconds = myTime % 60
        let ms = self % 1000
        return String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
    }
}
