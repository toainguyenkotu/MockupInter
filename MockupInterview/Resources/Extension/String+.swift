//
//  String+.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

extension String {
    init(typeName thing: Any.Type) {
        let describingString = String(describing: thing)
        let name = describingString.components(separatedBy: ".").last ?? ""

        self.init(stringLiteral: name)
    }

    var isNotEmpty: Bool {
        !isEmpty
    }
}
