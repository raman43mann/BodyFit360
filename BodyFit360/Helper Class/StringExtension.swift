//
//  StringExtension.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh 


import Foundation


extension String {
    
}

// Extension for NSMutableAttributedString to add attributes to a substring
extension NSMutableAttributedString {
    func addAttributesTo(substring: String, attributes: [NSAttributedString.Key: Any]) {
        // Finding the range of the substring
        let range = (self.string as NSString).range(of: substring, options: .caseInsensitive)
        // Applying the attributes to the range if it exists
        if range.location != NSNotFound {
            self.addAttributes(attributes, range: range)
        }
    }
}
