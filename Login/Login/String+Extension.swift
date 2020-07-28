//
//  String+Extension.swift
//  Login
//
//  Created by Khanna, Videh Rakesh Rakesh on 28/07/20.
//  Copyright © 2020 Khanna, Videh Rakesh Rakesh. All rights reserved.
//

import Foundation

extension String {
      
    var isValidEmail: Bool {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            , options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: .zero, length: count)) != nil
    }
    
    var isValidPassword: Bool {
        let password = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%^*#?()&.])[A-Za-z\\d@!$%^*#?()&.]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
}
