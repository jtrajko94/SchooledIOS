//
//  UITextFieldExtensions.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = MyPickerView(pickerData: data, dropdownField: self)
    }
}
