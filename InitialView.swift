import SwiftUI

struct InitialView: View {

    @State private var move_to_signup_view = false
    @State private var move_to_login_view = false
    @State private var move_to_reminder = false

        
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image(InitialText.logo).resizable()
                .frame(width: 185.0, height: 30.0)
                .padding(.top, 48)
                .padding(.bottom, 40)
            
            Image(InitialText.initialimg).resizable()
                .frame(width: 335, height: 242, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 132)
            
            Text(InitialText.primarytitle)
                .font(Font.custom(Fonts.bold, size: 30))
                .foregroundColor(CustomColors.introheadingcolor)
                .padding(.bottom, 15)
            
            Text(InitialText.sectitle)
                .font(Font.custom(Fonts.light, size: 16))
                .foregroundColor(CustomColors.darktextcolor)
                .multilineTextAlignment(.center)
                .lineSpacing(26.4 - 16)
                .padding(.horizontal, 38)
                .padding(.bottom, 20)
            
            Button(action: {
                move_to_signup_view = true
            }) {
                Text(InitialText.button)
                    .font(Font.custom(Fonts.medium, size: 16)).foregroundColor(.white)
                    .frame(width: 335, height: 64, alignment: Alignment.center).padding(.horizontal, 10).background(CustomColors.primary).cornerRadius(38).padding(.horizontal, 0)
                    
            }
            HStack(){
                Text(InitialText.thirdtitle).font(Font.custom(Fonts.medium, size: 14))
                    .foregroundColor(CustomColors.darktextcolor)
                
                Button(action: {
                    move_to_login_view = true;
                }) {
                    
                    Text(InitialText.button2)
                        .font(Font.custom(Fonts.medium, size: 14)).foregroundColor(CustomColors.fadedblue)
                        .frame(alignment: .leading)}
            }.padding(.top, 20)
            
            //Button(InitialText.thirdtitle){
               // move_to_reminder = true;
            //}
            
            Spacer()
            
        }.frame(
            minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
            maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/
        )
        .background(Image(InitialText.background)
                        .resizable()
                        .frame(width: 375.0, height: 456.5)
                        .ignoresSafeArea(), alignment: .top)
        
        .navigate(to: LoginView(), when: $move_to_login_view)
        .navigate(to: SignupView(), when: $move_to_signup_view)
        .navigate(to: Setting(), when: $move_to_reminder)
        
    }
    
}

extension View {

    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InitialView()
        }
    }
}
