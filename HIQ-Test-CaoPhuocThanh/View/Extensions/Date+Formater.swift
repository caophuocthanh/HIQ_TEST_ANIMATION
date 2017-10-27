//
//  Date+Formater.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/27/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension Date {

    static func hourNow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: Date())
    }

}
