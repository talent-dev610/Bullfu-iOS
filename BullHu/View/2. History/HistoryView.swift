//
//  HistoryView.swift
//  BullHu
//
//  Created by Good Developer on 2022/6/7.
//

import SwiftUI

struct HistoryView: View {
    
    @State private var transactions = [Transaction]()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    var body: some View {
        NavigationView {
            
            List(transactions) { transaction in
                HistoryItem(transaction: transaction)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle(Text("Transaction History"))

        }
        .accentColor(.appPrimary)
        .navigationViewStyle(.stack)
        .onAppear {
            NetworkManager.shared.allTransactions { success, data in
                if success {
                    self.transactions = data
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
