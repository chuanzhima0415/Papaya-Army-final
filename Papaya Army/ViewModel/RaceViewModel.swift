//
//  RaceViewModel.swift
//  Papaya Army
//
//  Created by chuanzhima on 2025/9/28.
//

import Foundation

/// 某场正赛 view 需要展示的数据
class RaceViewModel: Observable {
    var raceResults: [RaceResult]?
    var isLoading: Bool = true
}
