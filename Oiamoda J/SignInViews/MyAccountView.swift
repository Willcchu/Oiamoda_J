import SwiftUI
import FirebaseAuth

struct MyAccountView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 30) {
                    
                    // MARK: - Header 区域
                    VStack(spacing: 16) {
                        // 头像（使用系统图标作为占位图，也可以替换为用户上传的图片）
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                        
                        // 用户欢迎信息
                        if let user = Auth.auth().currentUser {
                            Text("Welcome, \(user.email ?? "User")")
                                .font(Font.custom("PlayfairDisplay-Bold", size: 24))
                                .foregroundColor(.primary)
                        } else {
                            Text("Welcome, Guest")
                                .font(Font.custom("PlayfairDisplay-Bold", size: 24))
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.top, 40)
                    
                    // MARK: - 账户选项卡区域
                    VStack(spacing: 16) {
                        
                        NavigationLink(destination: OrdersView()) {
                            AccountOptionRow(icon: "bag.fill", title: "Orders", detail: "Your Order History")
                        }
                        
                        NavigationLink(destination: SettingsView()) {
                            AccountOptionRow(icon: "gearshape.fill", title: "Settings", detail: "Manage your preferences")
                        }
                        
                        NavigationLink(destination: HelpView()) {
                            AccountOptionRow(icon: "questionmark.circle.fill", title: "Help & Support", detail: "Get assistance")
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // MARK: - Sign Out 按钮区域
                    Button(action: {
                        authViewModel.signOut()
                    }) {
                        Text("Sign Out")
                            .font(Font.custom("PlayfairDisplay-Bold", size: 18))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}

struct AccountOptionRow: View {
    let icon: String
    let title: String
    let detail: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.pink)
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(Font.custom("PlayfairDisplay-Bold", size: 18))
                    .foregroundColor(.primary)
                Text(detail)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

// MARK: - 预览
struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyAccountView()
                .environmentObject(AuthViewModel())
                .environmentObject(FavoritesManager())
        }
    }
}
