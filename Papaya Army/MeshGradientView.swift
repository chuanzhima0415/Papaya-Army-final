//
//  MeshGradientView.swift
//  Papaya Army
//
//  Created by 马传智 on 2025/5/9.
//

import SwiftUI

//enum MeshGradientData {
////	static var points: [SIMD2<Float>] = [
////		.init(0.00, 0.00),.init(0.50, 0.00),.init(1.00, 0.00),
////		.init(0.00, 1.00),.init(0.50, 1.00),.init(1.00, 1.00)
////	]
//
//	static var points: [SIMD2<Float>] = [
//		.init(0.00, 0.00), .init(0.33, 0.00), .init(0.67, 0.00), .init(1.00, 0.00),
//		.init(0.00, 0.50), .init(0.29, 0.51), .init(0.67, 0.51), .init(1.00, 0.50),
//		.init(0.00, 1.00), .init(0.33, 1.00), .init(0.67, 1.00), .init(1.00, 1.00)
//	]
//
//	static var colors: [Color] = [
//		.black,
//		.black,
//		Color(red: ConstructorColor.mclaren.red, green: ConstructorColor.mclaren.green, blue: ConstructorColor.mclaren.blue),
//		Color(red: ConstructorColor.mclaren.red, green: ConstructorColor.mclaren.green, blue: ConstructorColor.mclaren.blue),
//		Color(red: ConstructorColor.mclaren.red, green: ConstructorColor.mclaren.green, blue: ConstructorColor.mclaren.blue)
//	]
//
////	static func randomColors() -> [Color] {
////		(0 ..< 6).map { _ in colors.randomElement()! }
////	}
//
//	static func randomColors() -> [Color] {
//		(0 ..< 12).map { _ in colors.randomElement()! }
//	}
//}
//
//struct MeshGradientView: View {
//	var body: some View {
////		MeshGradient(width: 3, height: 2, points: MeshGradientData.points, colors: MeshGradientData.randomColors())
////			.ignoresSafeArea()
//		MeshGradient(
//			width: 4,
//			height: 3,
//			points: MeshGradientData.points,
//			colors: MeshGradientData.randomColors(),
//			smoothsColors: true
//		)
//		.ignoresSafeArea()
//	}
//}

// 优化前
enum MeshGradientData {
	static var points: [SIMD2<Float>] = [
		[0, 0], [0.33, 0], [0.67, 0], [1, 0],
		[0, 0.33], [0.33, 0.33], [0.7, 0.33], [1, 0.33],
		[0, 0.67], [0.33, 0.67], [0.7, 0.67], [1, 0.67],
		[0, 1], [0.33, 1], [0.7, 1], [1, 1],
	]
	
	static var colors: [Color] = [
		.black,
		Color(
			red: ConstructorColor.mclaren.red,
			green: ConstructorColor.mclaren.green,
			blue: ConstructorColor.mclaren.blue
		),
	]
	
	static var randomColors: [Color] {
		(0 ..< 16).map { _ in colors.randomElement()! }
	}
}

struct MeshGradientView: View {
	var body: some View {
		MeshGradient(width: 4, height: 4, points: MeshGradientData.points, colors: MeshGradientData.randomColors)
			.ignoresSafeArea()
	}
}

#Preview {
	MeshGradientView()
}
