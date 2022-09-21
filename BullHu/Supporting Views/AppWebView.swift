//
//  AppWebView.swift
//

import SwiftUI
import WebKit

struct AppWebView: UIViewRepresentable {
    
    typealias Context = UIViewRepresentableContext<Self>
    typealias UIViewType = WKWebView
    
    let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        uiView.load(request)
    }
    
    // MARK: - delegate
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: AppWebView
        
        init(_ parent: AppWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            activityIndicator.stopAnimating()
        }
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//            activityIndicator.stopAnimating()
        }
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print(error.localizedDescription)
//            activityIndicator.stopAnimating()
            
        }
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print(error.localizedDescription)
//            activityIndicator.stopAnimating()
            
        }
        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//            activityIndicator.stopAnimating()
        }
    }
}
