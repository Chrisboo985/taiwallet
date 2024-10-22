// Copyright (c). Gem Wallet. All rights reserved.

import SwiftUI

struct ApplicationModel {
    var title: String?
    var icon: String?
    var content: String?
    var link: String?
}

struct WalletModel {
    let id: String = UUID().uuidString
    let icon: String
    let title: String
    let content: String
    let key: String
    var isSelected: Bool = false
}

struct DiscoveryPage: View {
    private var popoverIconSize: CGFloat = 18
    @State private var isSelectedCollection = false
    @State private var showPopover = false
    @State private var showBottomSheet = false
    @State private var isGoToMultitabPageView = false
    @State private var isGoToConnectionManagementPageView = false
    @State private var currentTab = 0
    let images = ["header1", "header2", "header3"]
    @State private var icons: [ApplicationModel] = [
        ApplicationModel(title: "Baidu", icon: "baidu", link: "https://www.baidu.com"),
        ApplicationModel(title: "Google", icon: "google", link: "https://www.google.com")
    ]
    @State private var applications: [ApplicationModel] = [
        ApplicationModel(title: "Baidu", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Google", icon: "google", content: "Google is a search engine"),
        ApplicationModel(title: "Baidu2", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu3", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu4", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu5", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu6", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu7", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu8", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu9", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu10", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu11", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu12", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu13", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu14", icon: "baidu", content: "Baidu is a search engine"),
        ApplicationModel(title: "Baidu15", icon: "baidu", content: "Baidu is a search engine"),
    ]
    @State private var wallets: [WalletModel] = [
        WalletModel(icon: "baidu", title: "Baidu", content: "Baidu is a search engine", key: "TTbTNNmo4nBPdGXRdgGvYKEmEFpkeQQ8s4"),
        WalletModel(icon: "google", title: "Google", content: "Google is a search engine", key: "TTbTNNmo4nBPdGXRdgGvYKEmEasD12", isSelected: true),
        WalletModel(icon: "baidu", title: "Baidu2", content: "Baidu is a search engine", key: "TTbTNNmo4nBPdGXRdgGvYKEmEFpkeadfjl"),
    ]
    @State var selectedTab: SelectedTab? = nil
    @State var isShowWebView: Bool = false
    @State var showWebViewPopover: Bool = false
    @State var urlString: String = ""
    @State var urlStringGoogle: String = ""
    @State var openedTabPage: [TabPageMode] = [
        TabPageMode(title: "Baidu", icon: "baidu", isHouse: true),
        TabPageMode(title: "Google", icon: "google")
    ]
    @State private var isShowAlert: Bool = false
    @State private var isFirstOpenURL: Bool = true
    @State private var isShowFullSearchView: Bool = false
    @FocusState private var isFocused: Bool
    @State private var searchText: String = ""
    @State private var scrollOffset: CGFloat = 0.0
    @State private var isInSearchFullViewShow: Bool = false
    @State private var homePageScreenshot: UIImage? = nil
    @GestureState private var dragOffset = CGSize.zero
    @State private var collectionList: [ApplicationModel] = [
        ApplicationModel(title: "Baidu", icon: "baidu", link: "http://www.baidu.com"),
        ApplicationModel(title: "Google", icon: "google", link: "http://www.google.com"),
        ApplicationModel(title: "Bing", icon: "bing", link: "http://www.bing.com"),
    ]
    @Environment(\.navigationState) private var navigationState
    private var navigationPath: Binding<NavigationPath> {
        Binding(
            get: { navigationState.wallet },
            set: { navigationState.wallet = $0 }
        )
    }
    
    var body: some View {
        NavigationStack(path: navigationPath) {
            ZStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 0)  {
                        header
                        
                        bodyConent
                            .offset(y: -UIScreen.main.bounds.height * 0.1)
                        
                        Spacer()
                        
                    }
                    .background(Color(red: 0.955, green: 0.955, blue: 0.965))
                    .background(
                        GeometryReader { geo in
                            Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                    scrollOffset = value
                                }
                        }
                        
                    )
                    
                }
                .ignoresSafeArea(edges: [.top, .bottom]) // 忽略顶部安全区
                
                
                VStack(alignment: .center, spacing: 0)  {
                    headerText
                        .background(.white.opacity(scrollOffset < -100 ? 1 : -scrollOffset * 0.01))
                    //                        .overlay {
                    //                                                Text("\(Int(scrollOffset))")
                    //                                                    .foregroundColor(.red)
                    //                                                    .bold()
                    //                                            }
                    Spacer()
                }
                
                if let url = URL(string: urlString) {
                    WebViewHavenHeader(url: url)
                    //                        .opacity(isShowWebView ? 1 : 0)
                    //                        .scaleEffect(isShowWebView ? 1 : 0)
                        .offset(x: isShowWebView ? 0 : UIScreen.main.bounds.width)
                        .animation(.spring(duration: 0.2), value: isShowWebView)
                }
                
                Color.black.opacity((showPopover || showBottomSheet || showWebViewPopover || (isShowAlert && isFirstOpenURL)) ? 0.5 : 0).ignoresSafeArea()
                    .animation(.spring, value: (showPopover || showBottomSheet || showWebViewPopover || (isShowAlert && isFirstOpenURL)))
                    .onTapGesture {
                        showPopover = false
                        showBottomSheet = false
                        showWebViewPopover = false
                    }
                
                popoverView
                    .opacity(showPopover ? 1 : 0)
                    .scaleEffect(showPopover ? 1 : 0, anchor: .topTrailing)
                    .offset(x: UIScreen.main.bounds.width * 0.15, y: -UIScreen.main.bounds.height * 0.26)
                    .animation(.spring, value: showPopover)
                
                switchWalletSheetView
                //                    .opacity(showBottomSheet ? 1 : 0)
                    .offset(x: showBottomSheet ? 0 : UIScreen.main.bounds.width)
                    .animation(.spring, value: showBottomSheet)
                
                
                popoverViewForWeb
                    .opacity(showWebViewPopover ? 1 : 0)
                    .scaleEffect(showWebViewPopover ? 1 : 0, anchor: .topTrailing)
                    .offset(x: UIScreen.main.bounds.width * 0.15, y: -UIScreen.main.bounds.height * 0.13)
                    .animation(.spring, value: showWebViewPopover)
                
                
                searchFullView
                //                    .opacity(isShowFullSearchView ? 1 : 0)
                    .offset(x: isShowFullSearchView ? 0 : UIScreen.main.bounds.width)
                    .animation(.spring, value: isShowFullSearchView)
                    .onChange(of: isShowFullSearchView, initial: false) { old, newValue in
                        if newValue {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isFocused = true
                            }
                        }
                    }
                
                if let url = URL(string: urlStringGoogle) {
                    WebViewHavenHeader(url: url)
                        .opacity(isShowWebView ? 1 : 0)
                    //                        .scaleEffect(isShowWebView ? 1 : 0)
                        .offset(x: isShowWebView ? 0 : UIScreen.main.bounds.width)
                        .animation(.spring(duration: 0.2), value: isShowWebView)
                }
                
                if isShowAlert && isFirstOpenURL {
                    AlertView()
                }
                
            }
            //        }
            //        .navigationDestination(isPresented: $isGoToMultitabPageView) {
            //            if let selectedTab {
            //                MultitabPageView(selectedTab: selectedTab, openedTabPage: $openedTabPage, homePpageScreenshot: homePageScreenshot, collectionList: $collectionList)
            //            }
            //        }
            .navigationDestination(isPresented: $isGoToConnectionManagementPageView) {
                ConnectionManagementPageView()
            }
            .onAppear {
                homePageScreenshot = saveScreenShot()
            }
            .navigationBarBackButtonHidden()
        }
        
        //        .overlay {
        //            if homePpageScreenshot != nil {
        //                Image(uiImage: homePpageScreenshot!)
        //                    .resizable()
        //                    .scaledToFill()
        //                    .frame(width: 100)
        //            }
        //        }
    }
    
    var header: some View {
        ZStack(alignment: .top) {
            
            TabView(selection: $currentTab) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .tag(index) // 添加 tag
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // 使其为分页样式
            .frame(height: UIScreen.main.bounds.height * 0.4)
            .overlay(alignment: .bottomLeading) {
                carouselPointView
                    .padding(.leading, 14)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.11)
            }
            
            
        }
    }
    
    var headerText: some View {
        HStack(spacing: 12) {
            Text("发现")
                .bold()
                .font(.title3)
                .foregroundColor(scrollOffset < -100 ? .black : .white)
            Spacer()
            
//            Button {
//                selectedTab = .multitab
//                isShowAlert = true
//                if !isFirstOpenURL {
//                    isGoToMultitabPageView.toggle()
//                }
//                selectedTab = .multitab
//                isShowAlert = true
//                isGoToMultitabPageView = true
//                showPopover = false
//            } label: {
//
//            }
            multiPageLink(child: Image(systemName: "1.square")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(.horizontal, 4)
                .foregroundColor(scrollOffset < -100 ? .black : .white))
            
            
            Button(action: {
                showPopover.toggle()
            }, label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .rotationEffect(.degrees(90))
                    .padding(.horizontal, 4)
                    .foregroundColor(scrollOffset < -100 ? .black : .white)
            })
            
        }
        .padding(.bottom, 6)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        //        .padding(.top, UIScreen.main.bounds.height * 0.06)
    }
    
    var popoverView: some View {
        VStack(alignment: .center, spacing: 4)  {
            popoverButton(title: "新标签页", icon: "plus") {
                selectedTab = .multitab
                isShowAlert = true
                isGoToMultitabPageView = true
                showPopover = false
            }
            
            
            Divider()
            popoverButton(title: "刷新", icon: "repeat") {
                showPopover = false
            }
            
            
            Divider()
                .frame(height: 4)
                .background(.gray.opacity(0.1))
            popoverButton(title: "浏览记录", icon: "clock") {
                selectedTab = .history
                isGoToMultitabPageView = true
                showPopover = false
            }
            
            Divider()
            popoverButton(title: "收藏夹", icon: "folder") {
                selectedTab = .collection
                isGoToMultitabPageView = true
                showPopover = false
            }
            
            
            Divider()
                .frame(height: 4)
                .background(.gray.opacity(0.1))
            popoverButton(title: "切换钱包", icon: "switch.2") {
                showPopover = false
                showBottomSheet = true
                showPopover = false
            }
            
            Divider()
            popoverButton(title: "连接管理", icon: "link") {
                showPopover = false
                isGoToConnectionManagementPageView.toggle()
            }
            
            
            
        }
        .background(.white)
        .cornerRadius(12)
        .frame(width: UIScreen.main.bounds.width * 0.6)
    }
    
    func popoverButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack(alignment: .center, spacing: 0)  {
                Text(title)
                Spacer()
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: popoverIconSize, height: popoverIconSize)
            }
            .padding(8)
        }
        .tint(.black)
    }
    
    @ViewBuilder
    func AlertView() -> some View {
        VStack(alignment: .center, spacing: 12)  {
            Text("""
            您即将跳转至第三方页面，您在该页面上
            的使用行为将适用该页面的《用户协议》
            和《隐私政策》，由该页面直接并单独向
            您承担责任。
            """)
            .multilineTextAlignment(.center)
            .bold()
            
            HStack(alignment: .center, spacing: 4)  {
                Button {
                    isShowAlert = false
                } label: {
                    Text("关闭")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(.white)
                        .cornerRadius(6)
                }
                
                Button {
                    urlString = ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        urlString = "https://www.baidu.com"
                    }
                    isShowAlert = false
                    isShowWebView = true
                    isFirstOpenURL = false
                    
                    isShowFullSearchView = false
                    searchText = ""
                    hideKeyboard()
                } label: {
                    Text("立即进入")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color(red: 0.217, green: 0.242, blue: 0.33))
                        .cornerRadius(6)
                }
            }
        }
        .padding(12)
        .background(.white)
        .cornerRadius(12)
        .padding(12)
    }
    
    // search full view
    var searchFullView: some View {
        ZStack(alignment: .top) {
            Color(red: 0.978, green: 0.978, blue: 0.987)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 12)  {
                HStack(alignment: .center, spacing: 0)  {
                    HStack(alignment: .center, spacing: 4)  {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("搜索名称或输入网址", text: $searchText)
                            .foregroundColor(.black)
                            .font(.footnote)
                            .focused($isFocused)
                            .onSubmit {
                                isShowFullSearchView = false
                                hideKeyboard()
                            }
                    }
                    .padding(12)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.leading, 12)
                    
                    Text("取消")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            isShowFullSearchView = false
                            hideKeyboard()
                        }
                }
                if searchText.isEmpty {
                    Group {
                        HStack(alignment: .center, spacing: 0)  {
                            Text("访问历史")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .center, spacing: 12)  {
                            ForEach(0...2, id: \.self) { _ in
                                historyViewItem()
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                }
                else {
                    HStack(alignment: .center, spacing: 12)  {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        Group {
                            Text("直接搜索")
                            Text("\"\(searchText)\"")
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "arrow.forward")
                                .foregroundColor(.gray)
                                .bold()
                        }
                        .font(.footnote)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    .onTapGesture {
                        urlStringGoogle = ""
                        let tempSearchText = searchText
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            urlStringGoogle = "https://www.google.com.hk/search?q=\(tempSearchText)"
                            hideKeyboard()
                        }
                        isShowAlert = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            isShowFullSearchView = isFirstOpenURL
                        }
                        isShowWebView = !isFirstOpenURL
                    }
                }
                
                Spacer()
            }
        }
        .onChange(of: isShowFullSearchView, initial: false,  { old, newValue in
            if !newValue {
                searchText = ""
            }
        })
    }
    
    @ViewBuilder
    func historyViewItem() -> some View {
        HStack(alignment: .center, spacing: 12)  {
            Image("baidu")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text("https://www.baidu.com")
                .foregroundColor(.black)
                .tint(.black)
                .font(.footnote)
            Spacer()
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding(12)
        .background(.white)
        .cornerRadius(8)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var dynamicOpacity: Double {
        return scrollOffset < -100 ? 1.0 : Double(min(1, max(0, scrollOffset * 0.01)))
    }
    
    func multiPageLink(child: some View,
                        selectedTab: SelectedTab = .multitab) -> some View {
        NavigationLink(destination: {
            MultitabPageView(selectedTab: selectedTab,
                             openedTabPage: $openedTabPage,
                             homePpageScreenshot: homePageScreenshot,
                             collectionList: $collectionList)
        }, label: { child })
    }
    
    func webViewLink(child: some View, model: ApplicationModel) -> some View {
//        NavigationLink(destination: {
//            var t: WebView?
//            if /*let link = model.link, */let url = URL(string: "https://www.google.com") {
//                t = WebView(url: url)
//            }
//            return t
//        }, label: { child })
        Button(action: {
            guard let link = model.link, let _ = URL(string: link) else { return }
            urlString = link
            isShowWebView = true
        }, label: { child })
    }
}

// MARK: Carousel map
extension DiscoveryPage {
    var carouselPointView: some View {
        HStack(alignment: .center, spacing: 6)  {
            ForEach(0..<images.count, id: \.self) { index in
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                    .opacity(currentTab == index ? 1 : 0.5)
            }
        }
    }
}

// MARK: Body Content
extension DiscoveryPage {
    var bodyConent: some View {
        VStack(alignment: .center, spacing: 8)  {
            // search
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(height: 40)
                .overlay(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("搜索名称或输入网址")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isShowFullSearchView = true
                            }
                        //                        TextField("搜索名称或输入网址", text: .constant(""))
                        //                            .foregroundColor(.black)
                        //                            .font(.footnote)
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.horizontal, 12)
            
            VStack(alignment: .leading, spacing: 0)  {
                
                selectedView
                
                if isSelectedCollection {
                    Group {
                        if collectionList.isEmpty {
                            HStack(alignment: .center, spacing: 12)  {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("如何收藏应用？")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding(1)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 18)  {
                                ForEach(collectionList, id: \.title) { (item: ApplicationModel) in
                                    VStack {
                                        Image(item.icon ?? "")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 28, height: 28)
                                        Text(item.title ?? "")
                                            .font(.footnote)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                    .offset(y: 14)
                    
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(icons, id: \.title) { (app: ApplicationModel) in
                                webViewLink(child: VStack {
                                    Image(app.icon ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 28, height: 28)
                                        .clipShape(Circle())
                                    Text(app.title ?? "")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }, model: app)
                            }
                        }
                    }
                    .offset(y: 14)
                }
                
            }
            .padding(12)
            .padding(.bottom, 14)
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal, 12)
            
            recommendedApplication
        }
    }
    
    var selectedView: some View {
        HStack(alignment: .center, spacing: 12)  {
            Button {
                withAnimation(.spring) {
                    isSelectedCollection.toggle()
                }
            } label: {
                Text("常用")
                    .foregroundColor(!isSelectedCollection ? .black : .gray)
                    .overlay(alignment: .bottom, content: {
                        if !isSelectedCollection {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.black)
                                .frame(width: 20, height: 3)
                                .offset(y: 6)
                        }
                    })
            }
            
            
            Button {
                withAnimation(.spring) {
                    isSelectedCollection.toggle()
                }
            } label: {
                Text("收藏")
                    .foregroundColor(isSelectedCollection ? .black : .gray)
                    .overlay(alignment: .bottom, content: {
                        if isSelectedCollection {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.black)
                                .frame(width: 20, height: 3)
                                .offset(y: 6)
                        }
                    })
            }
            
        }
        .font(.footnote)
    }
    
    var recommendedApplication: some View {
        VStack(alignment: .center, spacing: 0)  {
            HStack {
                Text("推荐应用")
                    .bold()
                    .font(.footnote)
                    .padding(12)
                Spacer()
            }
            
            ScrollView {
                VStack(alignment: .center, spacing: 12)  {
                    ForEach(applications, id: \.title) { (app: ApplicationModel) in
                        webViewLink(child: HStack(alignment: .center, spacing: 12)  {
                            Image(app.icon ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            VStack(alignment: .leading, spacing: 0)  {
                                Text(app.title ?? "")
                                    .bold()
                                Text(app.content ?? "")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.leading, 12), model: app)
                    }
                    Spacer(minLength: applications.count < 10 ? UIScreen.main.bounds.height * 0.3 : 0)
                }
            }
            
        }
        .padding(4)
        .background(.white)
        .cornerRadius(12)
        .padding(.horizontal, 12)
    }
}

// MARK: Web
extension DiscoveryPage {
    @ViewBuilder
    func WebViewHavenHeader(url: URL) -> some View {
        VStack(alignment: .center, spacing: 0)  {
            HStack(alignment: .center, spacing: 8)  {
                
                Group {
                    // back icon button
                    Button {
                        isShowWebView = false
                        isShowFullSearchView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                    }
                    // home icon button
                    Button {
                        urlString = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            urlString = "http://www.baidu.com"
                        }
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                    }
                }
                
                Spacer()
                
                Group {
                    Button {
                        selectedTab = .multitab
                        isGoToMultitabPageView = true
                    } label: {
                        Image(systemName: "1.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .padding(.horizontal, 4)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                    Button(action: {
                        showWebViewPopover.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.black)
                    })
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(Color(red: 0.978, green: 0.978, blue: 0.992))
            .overlay {
                // url path
                HStack(alignment: .center, spacing: 4)  {
                    // lock icon
                    Image(systemName: "lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    // url
                    Text(url.description)
                        .font(.footnote)
                }
                .foregroundColor(.black)
                .tint(.black)
                .padding(.vertical, 8)
                .frame(width: UIScreen.main.bounds.width * 0.6)
                .background(Color(red: 0.911, green: 0.911, blue: 0.925))
                .cornerRadius(30)
            }
            
            WebView(url: url)
                .edgesIgnoringSafeArea(.all)
        }
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onChanged { value in
                    // 检查手势起始位置是否在左边缘
                    if value.startLocation.x < 50 { // 50是左边缘的阈值
                        if value.translation.width > 100 {
                            withAnimation(.spring) {
                                isShowFullSearchView = false
                                isShowWebView = false
                            }
                        }
                    }
                }
        )
    }
    var popoverViewForWeb: some View {
        VStack(alignment: .center, spacing: 4)  {
            popoverButton(title: "新标签页", icon: "plus") {
                selectedTab = .multitab
                isGoToMultitabPageView = true
                showWebViewPopover = false
            }
            
            
            Divider()
            popoverButton(title: "刷新", icon: "repeat") {
                showWebViewPopover = false
            }
            
            
            Divider()
                .frame(height: 4)
                .background(.gray.opacity(0.1))
            
            popoverButton(title: "浏览记录", icon: "clock") {
                selectedTab = .history
                isGoToMultitabPageView = true
                showWebViewPopover = false
            }
            
            Divider()
            
            popoverButton(title: "收藏夹", icon: "folder") {
                selectedTab = .collection
                isGoToMultitabPageView = true
                showWebViewPopover = false
            }
            
            
            Divider()
                .frame(height: 4)
                .background(.gray.opacity(0.1))
            
            popoverButton(title: "切换钱包", icon: "switch.2") {
                showPopover = false
                showBottomSheet = true
                showWebViewPopover = false
            }
            
            Divider()
            
            popoverButton(title: "连接管理", icon: "link") {
                showWebViewPopover = false
                isGoToConnectionManagementPageView.toggle()
            }
            Divider()
            popoverButton(title: "分享页面", icon: "square.and.arrow.up", action: {
                showWebViewPopover = false
            })
            Divider()
            popoverButton(title: "外部打开", icon: "safari", action: {
                showWebViewPopover = false
            })
            Divider()
            popoverButton(title: "举报", icon: "shield.lefthalf.filled.trianglebadge.exclamationmark", action: {
                showWebViewPopover = false
            })
            
            
            Divider()
                .frame(height: 4)
                .background(.gray.opacity(0.1))
            
            popoverButton(title: "关闭当前标签页", icon: "xmark.circle", action: {
                showWebViewPopover = false
            })
            
        }
        .background(.white)
        .cornerRadius(12)
        .frame(width: UIScreen.main.bounds.width * 0.6)
    }
}


// MARK: Switch Wallet Sheet
extension DiscoveryPage {
    var switchWalletSheetView: some View {
        VStack(alignment: .center, spacing: 12)  {
            Text("切换钱包")
                .bold()
                .font(.subheadline)
                .padding(.top, 12)
            Divider()
            
            // search
            HStack(alignment: .center, spacing: 4)  {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("搜索您要查找的钱包名称或地址", text: .constant(""))
                    .foregroundColor(.black)
                    .font(.footnote)
                    .onSubmit {
                        hideKeyboard()
                    }
            }
            .padding(8)
            .background(.white)
            .cornerRadius(30)
            .padding(1)
            .background(.gray)
            .cornerRadius(30)
            .padding(.horizontal, 12)
            
            VStack(alignment: .center, spacing: 4)  {
                ForEach(wallets, id: \.id) { item in
                    switchWalletSheetViewItem(item: item)
                        .onTapGesture {
                            if let index = wallets.firstIndex(where: { $0.id == item.id }) {
                                wallets[index].isSelected.toggle()
                            }
                        }
                    Divider()
                }
            }
            Spacer()
        }
        .background(.white)
        .cornerRadius(10)
        .overlay(alignment: .topTrailing) {
            Button {
                showBottomSheet.toggle()
                hideKeyboard()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(12)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    func switchWalletSheetViewItem(item: WalletModel) -> some View {
        HStack(alignment: .center, spacing: 12)  {
            Image(item.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2)  {
                Text(item.title)
                Group {
                    Text(item.content)
                    HStack(spacing: 8) {
                        Text(item.key)
                        Image(systemName: "square.on.square")
                    }
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(12)
        .overlay(alignment: .topTrailing) {
            if item.isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.black)
                    .padding(12)
            }
        }
    }
}

extension DiscoveryPage {
    func saveScreenShot() -> UIImage? {
        // 获取整个屏幕的尺寸
        let bounds = UIScreen.main.bounds
        
        // 创建一个 UIGraphicsImageRenderer 来渲染 SwiftUI 视图为 UIImage
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        
        // 生成 UIImage 并返回
        let image = renderer.image { context in
            // 从 SwiftUI 获取当前的 rootView 并将其转换为 UIKit 的 UIView
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.layer.render(in: context.cgContext)
            }
        }
        
        return image
    }
}


// 自定义 PreferenceKey 用于传递滚动偏移量
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0.0 // default value
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


