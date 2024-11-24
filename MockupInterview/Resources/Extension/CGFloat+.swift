//
//  CGFloat+.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import CoreFoundation

extension CGFloat {
    func expectWidth() -> CGFloat {
        CGFloat.minimum(self, self * Constants.widthDevice / Constants.widthStandard).rounded()
    }
}
