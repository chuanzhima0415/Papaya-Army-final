//
//  MeshGradientView.swift
//  Papaya Army
//
//  Created by 马传智 on 2025/5/9.
//

import SwiftUI

// 优化后 - 降低网格复杂度 (3x3) + 预计算颜色方案
struct MeshGradientData {
    // 从 4x4 (16点) 降低到 3x3 (9点)，减少约 44% 计算量
    static var points: [SIMD2<Float>] = [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1],
    ]

    static var colors: [Color] = [
        .black,
        Color(red: ConstructorColor.mclaren.red, green: ConstructorColor.mclaren.green, blue: ConstructorColor.mclaren.blue),
    ]

    // 运行时随机生成（保留用于兼容）
    static var randomColors: [Color] {
        (0..<9).map { _ in colors.randomElement()! }
    }

    // 预计算的 6 个颜色方案，避免运行时随机计算
    static let precomputedSchemes: [[Color]] = {
        (0..<6).map { _ in
            (0..<9).map { _ in colors.randomElement()! }
        }
    }()
}

struct MeshGradientView: View {
    var body: some View {
        MeshGradient(width: 3, height: 3, points: MeshGradientData.points, colors: MeshGradientData.randomColors)
            .ignoresSafeArea()
    }
}

#Preview {
    MeshGradientView()
}
