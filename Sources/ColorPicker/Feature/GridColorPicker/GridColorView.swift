import UIKit

class GridColorView: UIView {
    
    let column = 12
    let row = 10
    var cellSize: CGSize {
        let length = bounds.width / Double(column)
        return CGSize(width: length, height: length)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.snp.makeConstraints { make in
            make.height.equalTo(self.snp.width).multipliedBy(10.0 / 12.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func point(location: CGPoint) -> (x: Int, y: Int) {
        let x = Int(location.x / bounds.width * Double(column))
        let y = Int(location.y / bounds.height * Double(row))
        let clampedX = max(min(x, column - 1), 0)
        let clampedY = max(min(y, row - 1), 0)
        return (clampedX, clampedY)
    }
    
    func rect(forX x: Int, y: Int) -> CGRect {
        let x = Double(x) * cellSize.width
        let y = Double(y) * cellSize.height
        return CGRect(x: x, y: y, width: cellSize.width, height: cellSize.height).integral
    }
    
    func color(atX x: Int, y: Int) -> CGColor {
        let i = x + column * y
        return gridColors[i]
    }
    
    func index(forColor color: CGColor) -> Int? {
        gridColors.firstIndex(of: color)
    }
    
    func point(for index: Int) -> (x: Int, y: Int) {
        let x = index % column
        let y = index / column
        return (x, y)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let maskPath = UIBezierPath(roundedRect: rect, cornerRadius: 8).cgPath
        context.addPath(maskPath)
        context.clip()
        for (offset, color) in gridColors.enumerated() {
            context.setFillColor(color)
            let x = Double(offset % column) * cellSize.width
            let y = Double(offset / column) * cellSize.height
            let rect = CGRect(
                x: x,
                y: y,
                width: cellSize.width,
                height: cellSize.height
            ).integral
            context.fill(rect)
        }
    }
}

let gridColors = [
    CGColor.make(hsv: HSV(h: 0.5, s: 1.7881391300989234e-07, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.9215685725212097), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.8392158150672913), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6666666666666666, s: 2.350388746464036e-07, v: 0.7607845067977905), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.6784313917160034), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 9.934103120361394e-08, v: 0.600000262260437), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.5215685963630676), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.43921566009521484), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5, s: 8.260426806340572e-08, v: 0.36078429222106934), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.27843135595321655), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 1.490116652292008e-07, v: 0.19999992847442627), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0, s: 0.0, v: 0.0), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5427927479712105, s: 1.0000008528262967, v: 0.2901960015296936), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6124030566718041, s: 0.9885061241912438, v: 0.34117642045021057), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7037036449019883, s: 0.9152541596493883, v: 0.23137256503105164), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7878787304369488, s: 0.9016391184547262, v: 0.2392156720161438), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9371069428134492, s: 0.8833331750084862, v: 0.23529410362243652), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.010989057957337048, s: 0.9891304481945766, v: 0.3607843518257141), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.05185189759014103, s: 1.0, v: 0.3529411554336548), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.09659083584665185, s: 0.9999998953976554, v: 0.3450980484485626), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.11821714192184928, s: 0.9999999464825026, v: 0.3372547924518585), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.15849675674423808, s: 1.0000000601634467, v: 0.3999999463558197), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.17901242183708818, s: 0.9529411625336215, v: 0.3333333730697632), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.251773066273439, s: 0.7580645151405317, v: 0.24313727021217346), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5396039537287965, s: 1.0000008768909685, v: 0.3960783779621124), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6038250587740023, s: 0.9918705163572851, v: 0.4823530316352844), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.70370370736863, s: 0.8780487915074382, v: 0.32156866788864136), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7894736697376187, s: 0.8539325540478288, v: 0.3490196168422699), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9396135337530311, s: 0.8117645157610216, v: 0.33333325386047363), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.021628530592802803, s: 0.9999999882887997, v: 0.5137256383895874), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.055555580969049924, s: 1.0000000124729072, v: 0.48235297203063965), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.10109286933665908, s: 0.9999999748497148, v: 0.47843146324157715), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.12222222335864279, s: 1.000000025569463, v: 0.47058820724487305), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.15827336586688026, s: 0.9858157187434481, v: 0.5529412627220154), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.17746915992311993, s: 0.9152541809352239, v: 0.4627450704574585), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.25136610736877857, s: 0.7011494210201782, v: 0.34117642045021057), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5387323517100489, s: 0.9930080866109633, v: 0.5607842803001404), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6015778195462336, s: 1.0000007195843172, v: 0.6627451181411743), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7196969772860949, s: 0.924369715968098, v: 0.46666663885116577), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7883332951770342, s: 0.8064513830768348, v: 0.48627448081970215), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9385965164898705, s: 0.7851238796099211, v: 0.4745098948478699), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.0239411190217572, s: 1.0000000678085035, v: 0.7098040580749512), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.05973023959331886, s: 1.000000124152243, v: 0.6784316897392273), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.10256412065218189, s: 1.000000363116525, v: 0.6627452373504639), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1232323195700626, s: 0.9939758981159517, v: 0.650980532169342), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1598639870090778, s: 1.0000003130954314, v: 0.7686274647712708), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1777042212856135, s: 0.9151518034335042, v: 0.6470589637756348), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.2550201108417376, s: 0.680327868852459, v: 0.4784313440322876), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5370369963349069, s: 1.0000016055986614, v: 0.7058824896812439), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5996883662976177, s: 1.0000011954316548, v: 0.8392159342765808), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7062840808636683, s: 0.8243243760198469, v: 0.5803924202919006), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7853332812913322, s: 0.7911391564858609, v: 0.6196079850196838), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9387464637286486, s: 0.7647060255209122, v: 0.6000002026557922), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.026548719683155825, s: 1.0, v: 0.8862747550010681), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.06192660126016053, s: 0.9999999437002847, v: 0.8549022078514099), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.10317461552465218, s: 0.9952608051213885, v: 0.8274512887001038), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.12500006491413254, s: 0.9952153346469477, v: 0.8196078538894653), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.16054420872054925, s: 1.0000001001905363, v: 0.960784375667572), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.17921145091729618, s: 0.8899523781958192, v: 0.8196079134941101), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.25396832979180484, s: 0.6687899855801416, v: 0.6156864762306213), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5424381658507835, s: 1.0000024164743258, v: 0.8470590710639954), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6030182450295308, s: 1.0000013757817203, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7164350938063769, s: 0.8089887602072519, v: 0.6980394721031189), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.792237438644127, s: 0.7765956010489053, v: 0.7372549176216125), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.942857191453167, s: 0.756756672378546, v: 0.725490391254425), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.030626817400354667, s: 0.9176472892654947, v: 1.0000004768371582), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.06928101712514867, s: 0.9999999518692663, v: 1.0000003576278687), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.11154862134345682, s: 0.996078883529686, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.13109358374784674, s: 1.0000008732019892, v: 0.9921570420265198), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.16402123231343096, s: 0.7440947136465024, v: 0.9960785508155823), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.18416199116812645, s: 0.766949167551622, v: 0.9254902005195618), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.2601626706949007, s: 0.6577542182392249, v: 0.7333336472511292), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5351924769687332, s: 0.9960349052498567, v: 0.9882356524467468), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6011904168764146, s: 0.7716540604222488, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7076648281746114, s: 0.7957445323683123, v: 0.9215686321258545), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7860962469773672, s: 0.7695471951161464, v: 0.952941358089447), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9385965200764304, s: 0.7434781126128713, v: 0.9019607901573181), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.017142900569100932, s: 0.6862745098039216, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.05646636689113841, s: 0.7176471184281777, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.10209428791720059, s: 0.7519686083024039, v: 0.9960785508155823), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.12239579808133054, s: 0.7559055848432333, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.15765764054145798, s: 0.5803920530805524, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1799517216814521, s: 0.577406001959995, v: 0.9372550249099731), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.25431038050242666, s: 0.5497631593202523, v: 0.827451229095459), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.537254809047739, s: 0.6746037370572461, v: 0.9882352948188782), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6055155517366889, s: 0.5450984024532306, v: 1.0000004768371582), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7190475776893185, s: 0.6889765381524225, v: 0.9960787892341614), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7904191582250536, s: 0.6574803764490461, v: 0.9960785508155823), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.939999974870691, s: 0.5252101398458714, v: 0.9333335757255554), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.013333326848350757, s: 0.49019611232419763, v: 1.0000003576278687), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.051282130725497, s: 0.5098040092225063, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.09803922773867964, s: 0.5333334763844637, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1200981457699638, s: 0.533333273728685, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.15732100768492188, s: 0.41960754511401327, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.18013468013468015, s: 0.4090908833973217, v: 0.9490196108818054), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.25609755645473703, s: 0.37104089700752885, v: 0.866666853427887), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5408805631153158, s: 0.41897235148702366, v: 0.9921570420265198), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6079544335804926, s: 0.34509829399626396, v: 1.000000238418579), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7207602261212736, s: 0.4488187511021653, v: 0.9960784316062927), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7901234689522482, s: 0.42519684285489207, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9416667521620515, s: 0.327868874924884, v: 0.9568629860877991), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.012500060955054551, s: 0.31372549370223357, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.05158725060740962, s: 0.329411646197838, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.09386977899068315, s: 0.3411766858661106, v: 1.0000003576278687), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.11627908757791054, s: 0.33858269554120063, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1571427485772477, s: 0.2745097221112914, v: 1.000000238418579), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.1796876979060589, s: 0.2591092479635712, v: 0.9686276316642761), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.25490218284078053, s: 0.21982757971200304, v: 0.9098041653633118), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.5480766513953915, s: 0.20392168783674763, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.6098484102658345, s: 0.17254924563792504, v: 1.0000003576278687), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7169811176464402, s: 0.20866141473136915, v: 0.9960786700248718), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.7830187678231804, s: 0.2078432541267266, v: 1.000000238418579), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.9429824333345467, s: 0.1526103434642695, v: 0.9764707684516907), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.012820472848875886, s: 0.1529408784473466, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.048780160794964056, s: 0.16078430624569431, v: 1.0000003576278687), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.09302321060268388, s: 0.16862721256179886, v: 0.9999999403953552), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.11507934641066886, s: 0.16470579329660018, v: 1.0000001192092896), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.15656596827209907, s: 0.1299212963586289, v: 0.9960785508155823), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.18279546168446933, s: 0.12399993166446693, v: 0.9803921580314636), alpha: 1.0),
    CGColor.make(hsv: HSV(h: 0.262820554041159, s: 0.10924372645843321, v: 0.9333335757255554), alpha: 1.0),
]
