//
//  HistoryItem.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/8.
//

import SwiftUI

struct HistoryItem: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(alignment: .center) {
            Image("ic_dollar")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Transaction ID: ")
                        .font(.appFont(.regular, size: 16))
                    Text(transaction.reference)
                        .font(.primaryBold)
                }
                HStack {
                    Text("Date: ")
                        .font(.appFont(.regular, size: 16))
                    Text(Utils.shared.getDateFrom(transaction.paidAt))
                        .font(.primaryBold)
                }
            }
            
            Spacer()
            
            Text("₦\(Int(transaction.amount)!/100)")
                .font(.appFont(.extraBold, size: 20))
        }
        .padding()
        .background(Color.appGrayLight)
        .cornerRadius(16)
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItem(transaction: Transaction.default)
    }
}
