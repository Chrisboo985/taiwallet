import SwiftUI


struct Link {
    let id: String = UUID().uuidString
    let url: String
    var isSelected: Bool = false
}

struct ConnectionManagementPageView: View {
    @Environment(\.presentationMode) var presentation
    @State private var linkList: [Link] = [
        Link(url: "http://www.baidu.com"),
        Link(url: "http://www.google.com"),
        Link(url: "http://www.bing.com"),
    ]
    @State private var isAllSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 24)  {
            header
            
            ZStack(alignment: .bottom) {
                bodyContent
                
                foot
            }
        }
        .padding(12)
        .navigationBarBackButtonHidden()
    }
    
    var header: some View {
        HStack(alignment: .center, spacing: 8)  {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .onTapGesture {
                    presentation.wrappedValue.dismiss()
                }
            
            Text("DApp连接管理")
                .bold()
                .font(.title2)
            Spacer()
            Text(isAllSelected ? "取消全选" : "全选")
                .foregroundColor(isAllSelected ? .gray : .blue)
                .onTapGesture {
                    isAllSelected.toggle()
                    linkList = linkList.map { link in
                        var link = link
                        link.isSelected = isAllSelected
                        return link
                    }
                }
        }
    }
    
    var bodyContent: some View {
        VStack(alignment: .center, spacing: 0)  {
            HStack(alignment: .center, spacing: 0)  {
                Text("允许访问 钱包 账户地址的DApps")
                    .bold()
                    .font(.subheadline)
                Spacer()
            }
            .padding(.bottom, 8)
            ForEach(linkList, id: \.id) { link in
                bodyContentItem(link: link)
                    .onTapGesture {
                        linkList = linkList.map { item in
                            var item = item
                            if item.id == link.id {
                                item.isSelected.toggle()
                            }
                            return item
                        }
                    }
                Divider()
            }
            Spacer()
        }
    }
    
    func bodyContentItem(link: Link) -> some View {
            HStack(alignment: .center, spacing: 0)  {
                Text(link.url)
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(link.isSelected ? .black : .gray)
                    .padding(12)
            }
    }
    
    var foot: some View {
        let selectedColor = Color(red: 0.217, green: 0.242, blue: 0.33)
        return Button {
            
        } label: {
            Text("取消连接")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(12)
            // 如果任意选中了一个，就显示亮灰色
                .background(linkList.filter({ $0.isSelected }).isEmpty ? .gray.opacity(0.5) : selectedColor)
                .cornerRadius(6)
            
        }

    }
}

