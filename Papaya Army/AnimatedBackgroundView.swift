//
//  AnimatedBackgroundView.swift
//  Papaya Army
//
//  Created by 马传智 on 2025/5/5.
//

import SwiftUI

// 环境 key - 用于控制 MeshGradient 动画是否启用
fileprivate struct AnimationEnabledKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(true)
}

extension EnvironmentValues {
    var meshAnimationEnabled: Binding<Bool> {
        get { self[AnimationEnabledKey.self] }
        set { self[AnimationEnabledKey.self] = newValue }
    }
}

// 优化后 - 3x3 网格 + 平滑动画 + 智能暂停
struct AnimatedBackgroundView: View {
	@State private var colorIndex = 0
	@Environment(\.meshAnimationEnabled) private var isAnimating
	// 每 8 秒更新一次，给动画足够时间完成
	private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

	var body: some View {
        let _ = Self._printChanges()
		MeshGradient(
			width: 3,  // 3x3 网格，减少 44% 渲染压力
			height: 3,
			points: MeshGradientData.points,
			colors: MeshGradientData.precomputedSchemes[colorIndex]
		)
		.onReceive(timer) { _ in
			if isAnimating.wrappedValue {
				// 缓慢的动画过渡，更优雅
				withAnimation(.easeInOut(duration: 3)) {
					colorIndex = (colorIndex + 1) % MeshGradientData.precomputedSchemes.count
				}
			}
		}
		.ignoresSafeArea()
	}
}

#Preview {
    AnimatedBackgroundView()
}
