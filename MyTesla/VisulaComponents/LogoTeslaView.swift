//
//  LogoTeslaView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 17.05.2024.
//

import Foundation
import SwiftUI

struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 5 * height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 5*width, y: 0))
        path.addLine(to: CGPoint(x: 10*width, y: 0))
        path.addLine(to: CGPoint(x: 10*width, y: 0.33597 * height))
        path.addCurve(to: CGPoint(x: 9.97692*width, y: 0.65755 * height), control1: CGPoint(x: 10 * width, y: 0.63309 * height), control2: CGPoint(x: 9.99692 * width, y: 0.6705*height))
        path.addCurve(to: CGPoint(x: 9.95385 * width, y: 0.67842 * height), control1: CGPoint(x: 9.95692 * width, y: 0.6446 * height), control2: CGPoint(x: 9.95538 * width, y: 0.64676*height))
        path.addCurve(to: CGPoint(x: 9.98462 * width, y: 0.69568*height), control1: CGPoint(x: 9.95385*width, y: 0.71583*height), control2: CGPoint(x: 9.96308*width, y: 0.72086*height))
        path.addCurve(to: CGPoint(x: 9.99846 * width, y: 2.47338*height), control1: CGPoint(x: 9.99231*width, y: 0.68633*height), control2: CGPoint(x: 9.99846*width, y: 1.3964*height))
        path.addCurve(to: CGPoint(x: 9.97692 * width, y: 4.26619*height), control1: CGPoint(x: 10 * width, y: 4.06259*height), control2: CGPoint(x: 9.99692*width, y: 4.26619*height))
        path.addCurve(to: CGPoint(x: 9.95385*width, y: 4.33453*height), control1: CGPoint(x: 9.95846*width, y: 4.26619*height), control2: CGPoint(x: 9.95385*width, y: 4.27842*height))
        path.addCurve(to: CGPoint(x: 9.97692*width, y: 4.40288*height), control1: CGPoint(x: 9.95385*width, y: 4.39065*height), control2: CGPoint(x: 9.95846*width, y: 4.40288*height))
        path.addCurve(to: CGPoint(x: 10 * width, y: 7.20144*height), control1: CGPoint(x: 9.99692*width, y: 4.40288 * height), control2: CGPoint(x: 10 * width, y: 4.71871*height))
        path.addLine(to: CGPoint(x: 10 * width, y: 10 * height))
        path.addLine(to: CGPoint(x: 5 * width, y: 10*height))
        path.addLine(to: CGPoint(x: 0, y: 10*height))
        path.addLine(to: CGPoint(x: 0, y: 5*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 5.67692*width, y: 6.12878*height))
        path.addCurve(to: CGPoint(x: 6.29231*width, y: 6.0964*height), control1: CGPoint(x: 5.86615*width, y: 6.12158*height), control2: CGPoint(x: 5.90923*width, y: 6.11942*height))
        path.addCurve(to: CGPoint(x: 7.00769*width, y: 6.03597*height), control1: CGPoint(x: 6.46615*width, y: 6.08633*height), control2: CGPoint(x: 6.85077*width, y: 6.05396*height))
        path.addCurve(to: CGPoint(x: 7.23846*width, y: 6.01079*height), control1: CGPoint(x: 7.04154*width, y: 6.03237*height), control2: CGPoint(x: 7.14615*width, y: 6.02086*height))
        path.addCurve(to: CGPoint(x: 8.23538*width, y: 5.87266*height), control1: CGPoint(x: 7.54308*width, y: 5.97698*height), control2: CGPoint(x: 7.94769*width, y: 5.92086*height))
        path.addCurve(to: CGPoint(x: 8.38462*width, y: 5.83525*height), control1: CGPoint(x: 8.34308*width, y: 5.85396*height), control2: CGPoint(x: 8.38462*width, y: 5.84388*height))
        path.addCurve(to: CGPoint(x: 8.27692*width, y: 5.7741*height), control1: CGPoint(x: 8.38462*width, y: 5.82878*height), control2: CGPoint(x: 8.33692*width, y: 5.80072*height))
        path.addCurve(to: CGPoint(x: 8.01231*width, y: 5.74029*height), control1: CGPoint(x: 8.16*width, y: 5.72086*height), control2: CGPoint(x: 8.15846*width, y: 5.72014*height))
        path.addCurve(to: CGPoint(x: 7.90462*width, y: 5.75468*height), control1: CGPoint(x: 7.98*width, y: 5.7446*height), control2: CGPoint(x: 7.93077*width, y: 5.75108*height))
        path.addCurve(to: CGPoint(x: 6.61538*width, y: 5.89281*height), control1: CGPoint(x: 7.52*width, y: 5.80647*height), control2: CGPoint(x: 7.01231*width, y: 5.86115*height))
        path.addCurve(to: CGPoint(x: 3.82308*width, y: 5.92806*height), control1: CGPoint(x: 5.74615*width, y: 5.96331*height), control2: CGPoint(x: 4.69077*width, y: 5.97698*height))
        path.addCurve(to: CGPoint(x: 3.62308*width, y: 5.91727*height), control1: CGPoint(x: 3.75538*width, y: 5.92446*height), control2: CGPoint(x: 3.66615*width, y: 5.91942*height))
        path.addCurve(to: CGPoint(x: 2.00154*width, y: 5.7554*height), control1: CGPoint(x: 3.23385*width, y: 5.89568*height), control2: CGPoint(x: 2.49231*width, y: 5.82158*height))
        path.addCurve(to: CGPoint(x: 1.75692*width, y: 5.72662*height), control1: CGPoint(x: 1.88308*width, y: 5.73957*height), control2: CGPoint(x: 1.77385*width, y: 5.72662*height))
        path.addCurve(to: CGPoint(x: 1.50769*width, y: 5.84029*height), control1: CGPoint(x: 1.72769*width, y: 5.72662*height), control2: CGPoint(x: 1.50769*width, y: 5.82662*height))
        path.addCurve(to: CGPoint(x: 2.82308*width, y: 6.02878*height), control1: CGPoint(x: 1.50769*width, y: 5.85899*height), control2: CGPoint(x: 2.39692*width, y: 5.98633*height))
        path.addCurve(to: CGPoint(x: 3.03846*width, y: 6.05036*height), control1: CGPoint(x: 2.90769*width, y: 6.03669*height), control2: CGPoint(x: 3.00462*width, y: 6.04676*height))
        path.addCurve(to: CGPoint(x: 4.07692*width, y: 6.12302*height), control1: CGPoint(x: 3.27538*width, y: 6.07698*height), control2: CGPoint(x: 3.63846*width, y: 6.10216*height))
        path.addCurve(to: CGPoint(x: 5.67692*width, y: 6.12878*height), control1: CGPoint(x: 4.47692*width, y: 6.14245*height), control2: CGPoint(x: 5.24462*width, y: 6.14532*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 4.68462*width, y: 5.72662*height))
        path.addCurve(to: CGPoint(x: 4.95231*width, y: 5.61151*height), control1: CGPoint(x: 4.82*width, y: 5.66331*height), control2: CGPoint(x: 4.94154*width, y: 5.61151*height))
        path.addCurve(to: CGPoint(x: 5.22*width, y: 5.72734*height), control1: CGPoint(x: 4.96462*width, y: 5.61151*height), control2: CGPoint(x: 5.08462*width, y: 5.66403*height))
        path.addLine(to: CGPoint(x: 5.46615*width, y: 5.84388*height))
        path.addLine(to: CGPoint(x: 5.68308*width, y: 5.83885*height))
        path.addCurve(to: CGPoint(x: 6.06154*width, y: 5.82446*height), control1: CGPoint(x: 5.80308*width, y: 5.83669*height), control2: CGPoint(x: 5.97231*width, y: 5.8295*height))
        path.addCurve(to: CGPoint(x: 6.3*width, y: 5.80935*height), control1: CGPoint(x: 6.15077*width, y: 5.81871*height), control2: CGPoint(x: 6.25846*width, y: 5.81151*height))
        path.addCurve(to: CGPoint(x: 7.05385*width, y: 5.73669*height), control1: CGPoint(x: 6.43692*width, y: 5.80072*height), control2: CGPoint(x: 6.83846*width, y: 5.76187*height))
        path.addCurve(to: CGPoint(x: 7.52308*width, y: 5.67626*height), control1: CGPoint(x: 7.20769*width, y: 5.71871*height), control2: CGPoint(x: 7.38923*width, y: 5.69496*height))
        path.addCurve(to: CGPoint(x: 7.73077*width, y: 5.64748*height), control1: CGPoint(x: 7.61231*width, y: 5.66331*height), control2: CGPoint(x: 7.70615*width, y: 5.65036*height))
        path.addCurve(to: CGPoint(x: 8.01231*width, y: 5.5964*height), control1: CGPoint(x: 7.87846*width, y: 5.62878*height), control2: CGPoint(x: 8.00769*width, y: 5.60576*height))
        path.addCurve(to: CGPoint(x: 7.71231*width, y: 5.45324*height), control1: CGPoint(x: 8.01846*width, y: 5.57914*height), control2: CGPoint(x: 7.83385*width, y: 5.49137*height))
        path.addCurve(to: CGPoint(x: 7.32308*width, y: 5.3705*height), control1: CGPoint(x: 7.58923*width, y: 5.41583*height), control2: CGPoint(x: 7.41385*width, y: 5.37842*height))
        path.addCurve(to: CGPoint(x: 7.23846*width, y: 5.39353*height), control1: CGPoint(x: 7.27231*width, y: 5.36619*height), control2: CGPoint(x: 7.26769*width, y: 5.36763*height))
        path.addCurve(to: CGPoint(x: 6.70769*width, y: 5.49065*height), control1: CGPoint(x: 7.17231*width, y: 5.45108*height), control2: CGPoint(x: 7.03077*width, y: 5.4777*height))
        path.addCurve(to: CGPoint(x: 5.86*width, y: 5.47698*height), control1: CGPoint(x: 6.49385*width, y: 5.49928*height), control2: CGPoint(x: 5.88615*width, y: 5.48921*height))
        path.addCurve(to: CGPoint(x: 5.75385*width, y: 5.26259*height), control1: CGPoint(x: 5.84615*width, y: 5.4705*height), control2: CGPoint(x: 5.79538*width, y: 5.36691*height))
        path.addCurve(to: CGPoint(x: 5.68462*width, y: 5.10432*height), control1: CGPoint(x: 5.74615*width, y: 5.24317*height), control2: CGPoint(x: 5.71538*width, y: 5.17194*height))
        path.addCurve(to: CGPoint(x: 5.61692*width, y: 4.94964*height), control1: CGPoint(x: 5.65385*width, y: 5.03741*height), control2: CGPoint(x: 5.62308*width, y: 4.96763*height))
        path.addCurve(to: CGPoint(x: 5.54769*width, y: 4.79137*height), control1: CGPoint(x: 5.60923*width, y: 4.93165*height), control2: CGPoint(x: 5.57846*width, y: 4.86043*height))
        path.addCurve(to: CGPoint(x: 5.41538*width, y: 4.49281*height), control1: CGPoint(x: 5.46615*width, y: 4.61007*height), control2: CGPoint(x: 5.42923*width, y: 4.5259*height))
        path.addCurve(to: CGPoint(x: 5.34769*width, y: 4.33813*height), control1: CGPoint(x: 5.40923*width, y: 4.47698*height), control2: CGPoint(x: 5.37846*width, y: 4.40719*height))
        path.addCurve(to: CGPoint(x: 5.24615*width, y: 4.10791*height), control1: CGPoint(x: 5.31692*width, y: 4.26906*height), control2: CGPoint(x: 5.27077*width, y: 4.16547*height))
        path.addCurve(to: CGPoint(x: 5.14462*width, y: 3.8777*height), control1: CGPoint(x: 5.22154*width, y: 4.05036*height), control2: CGPoint(x: 5.17538*width, y: 3.94676*height))
        path.addCurve(to: CGPoint(x: 5.07692*width, y: 3.72302*height), control1: CGPoint(x: 5.11385*width, y: 3.80863*height), control2: CGPoint(x: 5.08308*width, y: 3.73885*height))
        path.addCurve(to: CGPoint(x: 4.96154*width, y: 3.46906*height), control1: CGPoint(x: 5.05077*width, y: 3.65899*height), control2: CGPoint(x: 4.96615*width, y: 3.47122*height))
        path.addCurve(to: CGPoint(x: 4.86923*width, y: 3.61942*height), control1: CGPoint(x: 4.94615*width, y: 3.46187*height), control2: CGPoint(x: 4.91846*width, y: 3.50791*height))
        path.addCurve(to: CGPoint(x: 4.64462*width, y: 4.13309*height), control1: CGPoint(x: 4.81846*width, y: 3.73669*height), control2: CGPoint(x: 4.71692*width, y: 3.96906*height))
        path.addCurve(to: CGPoint(x: 4.6*width, y: 4.23741*height), control1: CGPoint(x: 4.62615*width, y: 4.17266*height), control2: CGPoint(x: 4.60615*width, y: 4.21942*height))
        path.addCurve(to: CGPoint(x: 4.52923*width, y: 4.39568*height), control1: CGPoint(x: 4.59231*width, y: 4.2554*height), control2: CGPoint(x: 4.56154*width, y: 4.32662*height))
        path.addCurve(to: CGPoint(x: 4.46154*width, y: 4.55036*height), control1: CGPoint(x: 4.49846*width, y: 4.46475*height), control2: CGPoint(x: 4.46769*width, y: 4.53453*height))
        path.addCurve(to: CGPoint(x: 4.41692*width, y: 4.65108*height), control1: CGPoint(x: 4.45538*width, y: 4.56619*height), control2: CGPoint(x: 4.43538*width, y: 4.61151*height))
        path.addCurve(to: CGPoint(x: 4.10615*width, y: 5.35971*height), control1: CGPoint(x: 4.34615*width, y: 4.81079*height), control2: CGPoint(x: 4.18154*width, y: 5.18561*height))
        path.addCurve(to: CGPoint(x: 3.95692*width, y: 5.48633*height), control1: CGPoint(x: 4.05077*width, y: 5.48705*height), control2: CGPoint(x: 4.05846*width, y: 5.48058*height))
        path.addCurve(to: CGPoint(x: 3.5*width, y: 5.49209*height), control1: CGPoint(x: 3.90923*width, y: 5.48921*height), control2: CGPoint(x: 3.70308*width, y: 5.49137*height))
        path.addCurve(to: CGPoint(x: 2.99077*width, y: 5.47986*height), control1: CGPoint(x: 3.19846*width, y: 5.49281*height), control2: CGPoint(x: 3.10462*width, y: 5.49065*height))
        path.addCurve(to: CGPoint(x: 2.66923*width, y: 5.39712*height), control1: CGPoint(x: 2.80462*width, y: 5.46187*height), control2: CGPoint(x: 2.70923*width, y: 5.43741*height))
        path.addCurve(to: CGPoint(x: 2.58154*width, y: 5.3705*height), control1: CGPoint(x: 2.64*width, y: 5.36763*height), control2: CGPoint(x: 2.63692*width, y: 5.36619*height))
        path.addCurve(to: CGPoint(x: 2.23846*width, y: 5.43813*height), control1: CGPoint(x: 2.51231*width, y: 5.37482*height), control2: CGPoint(x: 2.36308*width, y: 5.40432*height))
        path.addCurve(to: CGPoint(x: 1.89538*width, y: 5.59496*height), control1: CGPoint(x: 2.12462*width, y: 5.46835*height), control2: CGPoint(x: 1.88769*width, y: 5.57698*height))
        path.addCurve(to: CGPoint(x: 2.53846*width, y: 5.69712*height), control1: CGPoint(x: 1.90154*width, y: 5.60935*height), control2: CGPoint(x: 2.02*width, y: 5.62878*height))
        path.addCurve(to: CGPoint(x: 4.30615*width, y: 5.84029*height), control1: CGPoint(x: 3.19692*width, y: 5.78489*height), control2: CGPoint(x: 3.82769*width, y: 5.83597*height))
        path.addLine(to: CGPoint(x: 4.43692*width, y: 5.84173*height))
        path.addLine(to: CGPoint(x: 4.68462*width, y: 5.72662*height))
        path.closeSubpath()
        return path
        
    }
}
struct TeslaLogotip: View {
    @State private var logoColor = Color.gradientRectangleOne
    @State private var borderColor = Color.red
    
    var body: some View {
        ZStack {
            MyIcon()
                .stroke(borderColor, lineWidth: 1)
                .fill(logoColor)
                .frame(width: 40, height: 100)
                .offset(x: -177, y: -365)
                .rotationEffect(Angle(degrees: 180))
                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .onAppear {
                    animateLogoColors()
                }
        }
        .edgesIgnoringSafeArea(.all)
    }

    func animateLogoColors() {
        withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
            borderColor = .gradientRectangleTwo
            logoColor = .lightShadow
        }
    }
}


#Preview {
    TeslaLogotip()
}
