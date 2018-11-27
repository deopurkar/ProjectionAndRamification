k = QQ
S.<X,Y,Z> = PolynomialRing(k)
Sv.<U,V,W> = PolynomialRing(k)

a = 1

C = X^3 + Y^3 + Z^3 + 6*a*X*Y*Z
HeC = X^3 + Y^3 + Z^3 - (1+2*a^3)/a^2 * X*Y*Z
CayC = U^3 + V^3 + W^3 + (1-4*a^3)/a * U*V*W

var('A0','A1','A2')
Q = A0^2 + A1^2 + A2^2

def duality(a,b,c):
    return a*diff(Q, A0) + b*diff(Q, A1) + c*diff(Q, A2)

dual = duality(X,Y,Z)
CayCdual = CayC.substitute({U:dual.coefficient(A0), V:dual.coefficient(A1), W:dual.coefficient(A2)})


