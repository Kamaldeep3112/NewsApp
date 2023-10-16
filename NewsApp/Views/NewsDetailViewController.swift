//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Kamaldeep on 13/10/23.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {

    private let webView = WKWebView(frame: CGRect.zero, configuration: WKWebViewConfiguration())
    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        } else {
            // Log errors properly
            print("Bad URL - \(urlString)")
        }
    }

    // MARK: - Private Methods

    private func setupUI() {
        webView.uiDelegate = self
        webView.navigationDelegate = self

        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - WKUIDelegate

extension NewsDetailViewController: WKUIDelegate {

}

// MARK: - WKNavigationDelegate

extension NewsDetailViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        // Avoid navigation to any other website in webview
        guard let url = navigationAction.request.url,
              url.absoluteString.contains(urlString) else {
            return .cancel
        }
        return .allow
    }
}
