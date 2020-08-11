def real_intersection(F,G,xmin,xmax,ymin,ymax,zmin,zmax,npoints):
    answer = []
    i = 0

    t = xmin
    delta = (xmax-xmin)/npoints.n()
    while t < xmax:
        t = t + delta
        solutions = solve([F.substitute({x:t}), G.substitute({x:t})], [y,z])
        for (y0,z0) in solutions:
            if y0.rhs().is_real() and z0.rhs().is_real() and ymin <= y0.rhs() and ymax >= y0.rhs() and zmin <= z0.rhs() and zmax >= z0.rhs():
                answer.append((t,y0.rhs(),z0.rhs()))

    t = ymin
    delta = (ymax-ymin)/npoints.n()
    while t < ymax:
        t = t + delta
        solutions = solve([F.substitute({y:t}), G.substitute({y:t})], [x,z])
        for (x0,z0) in solutions:
            if x0.rhs().is_real() and z0.rhs().is_real() and xmin <= x0.rhs() and xmax >= x0.rhs() and zmin <= z0.rhs() and zmax >= z0.rhs():
                answer.append((x0.rhs(),t,z0.rhs()))

    t = zmin
    delta = (zmax-zmin)/npoints.n()
    while t < zmax:
        t = t + delta
        solutions = solve([F.substitute({z:t}), G.substitute({z:t})], [x,y])
        for (x0,y0) in solutions:
            if x0.rhs().is_real() and y0.rhs().is_real() and xmin <= x0.rhs() and xmax >= x0.rhs() and ymin <= y0.rhs() and ymax >= y0.rhs():
                answer.append((x0.rhs(),y0.rhs(),t))
                
    return answer

var('x','y','z')
F_1 = 81 * (x^3+y^3+z^3)
F_2 = 189 * (x^2*(y+z)+y^2*(x+z)+z^2*(x+y))
F_3 = 54 * x * y * z
F_4 = 126 * (x*y+x*z+y*z)
F_5 = 9 * (x^2+y^2+z^2)
F_6 = 9 * (x+y+z)
F = F_1 - F_2 + F_3 + F_4 - F_5 + F_6 + 1
G = diff(F,x) + diff(F,y) + diff(F,z) + F_4 - F_5 + 2*F_6 + 3
P = implicit_plot3d(F, (x,-1,1), (y,-1,1), (z,-1,1), color='lightgrey', plot_points=100)
Q = sum([point(p, color='red') for p in real_intersection(F,G,-1,1,-1,1,-1,1,200)])
R = point([1,1,1], color='yellow', border=2, size=10)
(P+Q+R).show(frame=False, viewer='threejs')


            

