//
//  TagLayout.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 20/06/24.
//

import SwiftUI

struct Tagslayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        <#code#>
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        <#code#>
    }
    
    
    var alignment: Alignment = .center
    var spacing: CGFloat = 10
    
//    func sizeThatFits(proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGSize {
//        let maxWidth = proposal.width ?? 0
//        var height: CGFloat = 0
//        let rows = generateRows(maxWidth, proposal, subviews)
//        
//        for (index, row) in rows.enumerated() {
//            /// Finding max Height in each row and adding it to the view's Total Height
//            if index == rows.count - 1 {
//                /// Since there is no spacing needed for the last item
//                height += row.maxHeight(proposal)
//            } else {
//                height += row.maxHeight(proposal) + spacing
//            }
//        }
//        
//        return .init(width: maxWidth, height: height)
//    }
//    
//    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
//        /// Placing views
//        var origin = bounds.origin
//        let maxWidth = bounds.width
//        let rows = generateRows(maxWidth, proposal, subviews)
//        
//        for row in rows {
//            /// Rese
//            origin.x = 0
//            for view in row {
//                let viewSize = view.sizeThatFits(proposal)
//                view.place(at: origin, proposal: proposal)
//                /// Updating Origin X
//                origin.x += (viewSize.width + spacing)
//            }
//        }
//    }
    
    func generateRows(_ maxWidth: CGFloat, _ proposal: ProposedViewSize, _ subviews: Subviews) -> [[LayoutSubviews.Element]] {
        var row: [LayoutSubviews.Element] = []
        var rows:  [[LayoutSubviews.Element]] = []
        
        /// Origin
        var origin = CGRect.zero.origin
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            
            /// Pushing to new row
            if (origin.x + viewSize.width + spacing) > maxWidth {
                rows.append(row)
                row.removeAll()
                /// Resetting X origin since it needs to start from left to right
                origin.x = 0
                row.append(view)
                origin.x += (viewSize.width + spacing)
            } else {
                /// Adding item to same row
                row.append(view)
                origin.x += (viewSize.width + spacing)
                
            }
        }
        
        if !row.isEmpty {
            rows.append(row)
            row.removeAll()
        }
        
        return rows
    }
}

extension [LayoutSubviews.Element] {
    func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
        return self.compactMap { view in
            return view.sizeThatFits(proposal).height
        }.max() ?? 0
    }
}
