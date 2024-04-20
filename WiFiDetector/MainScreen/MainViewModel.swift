//
//  MainViewModel.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 19.04.24.
//

import Foundation

final class MainViewModel {

	let cells: [ActionCellModel] = [
		ActionCellModel(cellType: .bluetooth, title: "Bluetooth\nDetection", imageStr: "bluetooth"),
		ActionCellModel(cellType: .infrared, title: "Infrared\nDetection", imageStr: "infrared"),
		ActionCellModel(cellType: .magnetic, title: "Magnetic\nDetection", imageStr: "magnetic"),
		ActionCellModel(cellType: .tips, title: "Antispy\nTips", imageStr: "tips")
	]

	init() {

	}

	func showSearch() {
		
	}

}

struct ActionCellModel {
	let cellType: CellType
	let title: String
	let imageStr: String
}
