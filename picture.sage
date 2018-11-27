k = QQ
var('X','Y','Z','U','V','W')
S = QQ['X,Y,Z']
Sv = QQ['U,V,W']

a = 3
u = 1
v = 1
w = 1

C = X^3 + Y^3 + Z^3 + 6*a*X*Y*Z
HeC = X^3 + Y^3 + Z^3 - (1+2*a^3)/a^2 * X*Y*Z
CayC = U^3 + V^3 + W^3 + (1-4*a^3)/a * U*V*W

var('A0','A1','A2')
Q = u * diff(C.substitute({X:A0, Y:A1, Z:A2}), A0) + v * diff(C.substitute({X:A0, Y:A1, Z:A2}), A1) - w * diff(C.substitute({X:A0, Y:A1, Z:A2}), A2)

def duality(a,b,c):
    return a*diff(Q, A0) + b*diff(Q, A1) + c*diff(Q, A2)

dual = duality(X,Y,Z)
CayCdual = S(CayC.substitute({U:dual.coefficient(A0), V:dual.coefficient(A1), W:dual.coefficient(A2)}))
conic = S(Q.substitute({A0:X, A1:Y, A2:Z}))

X1 = 1/290 * (203 - 4* sqrt(667))
Y1 = 1/290 * (203 + 4* sqrt(667))
Z1 = 1

X2 = 1/290 * (203 + 4* sqrt(667))
Y2 = 1/290 * (203 - 4* sqrt(667))
Z2 = 1

X3 = 1
Y3 = -1
Z3 = 0

ex1 = [1,-1/777*(14071+544*sqrt(667)),11/259*(391+16*sqrt(667))]
ex2 = [1,-1/777*(14071-544*sqrt(667)),11/259*(391-16*sqrt(667))]
ex3 = [3,3,1]
Ex1 = ex1[0] * diff(C, X) + ex1[1] * diff(C, Y) + ex1[2] * diff(C, Z)
Ex2 = ex2[0] * diff(C, X) + ex2[1] * diff(C, Y) + ex2[2] * diff(C, Z)
Ex3 = ex3[0] * diff(C, X) + ex3[1] * diff(C, Y) + ex3[2] * diff(C, Z)

Ex11 = (232+145*sqrt(78)+41*sqrt(667))*X + (-232-145*sqrt(78)+41*sqrt(667))*Y + (-51*sqrt(667)+4*sqrt(667)*sqrt(78))*Z
Ex12 = (232-145*sqrt(78)+41*sqrt(667))*X + (-232+145*sqrt(78)+41*sqrt(667))*Y + (-51*sqrt(667)-4*sqrt(667)*sqrt(78))*Z

Ex21 = (232+145*sqrt(78)-41*sqrt(667))*X + (-232-145*sqrt(78)-41*sqrt(667))*Y + (51*sqrt(667)-4*sqrt(667)*sqrt(78))*Z
Ex22 = (232-145*sqrt(78)-41*sqrt(667))*X + (-232+145*sqrt(78)-41*sqrt(667))*Y + (51*sqrt(667)+4*sqrt(667)*sqrt(78))*Z
Ex31 = (9 - sqrt(78))*Y + Z - (sqrt(78)-9)*X
Ex32 = (9 + sqrt(78))*Y + Z - (-sqrt(78)-9)*X

var('x','y','z')

allCurves = [conic, HeC, CayCdual, Ex11, Ex21, Ex31, Ex12, Ex22, Ex32]
allAffineCurves = [(f).substitute({f.parent()(X):x, f.parent()(Y):y, f.parent()(Z):1}) for f in allCurves]

pts = 500
M = 5.5
affinePlots = [implicit_plot(allAffineCurves[0], (-M,M),(-M,M), plot_points = pts, linewidth=1, color='black', linestyle="dotted"),
               implicit_plot(allAffineCurves[1], (-M,M),(-M,M), plot_points = pts, linewidth=2, color='green'),
               implicit_plot(allAffineCurves[2], (-M,M),(-M,M), plot_points = pts, linewidth=2, color='orange'),
               implicit_plot(allAffineCurves[3], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='blue', linestyle="dashed"),
               implicit_plot(allAffineCurves[4], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='blue', linestyle="dashed"),
               implicit_plot(allAffineCurves[5], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='blue', linestyle="dashed"),
               implicit_plot(allAffineCurves[6], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='magenta', linestyle="dashed"),
               implicit_plot(allAffineCurves[7], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='magenta', linestyle="dashed"),
               implicit_plot(allAffineCurves[8], (-M,M),(-M,M), plot_points = pts, linewidth=1.5, color='magenta', linestyle="dashed"),
               point([X1,Y1], marker="o", size=50, color='red', alpha=1, zorder=10),
               point([X2,Y2], marker="o", size=50, color='red', alpha=1, zorder=10)]

