ClrHome
Menu("Options:", "Slope Field", 1, "Reduce Radical", 2, "Base Converter", 3, "Quit", 99)

Lbl 99
Stop


====================================================

Lbl 1

ClrDraw:AxesOn:Func:ClrHome

Input "dy/dx: ", Str1
Input "Window size: ", W
Input "Step: ", Z

Z * 0.5 → R
-W → Xmin: W → Xmax
-W → Ymin: W → Ymax

For(A, -W, W, Z)
For(B, -W, W, Z)
A + 8E-9 → X
B + 9E-9 → Y
expr(Str1) → M
tan^-1(M) → θ
Rsin(θ) → T
Rcos(θ) → S
Line(X - S, Y - T, X + S, Y + T)
End
End

Pause
ClrDraw:ZStandard:ClrHome:Stop


====================================================

Lbl 2

Input "√(", A
√(a) → E

If E = int(E): Then
Disp E
Stop
End

1 →  F
For(B, 2, E)
While fPart(A / B^2)) = 0
A / (B^2) → A
F * B → F
End
End

int(log(F)) + 2 → D

If F - 1: Then
ClrHome
Output(1, 1, F)
Output(1, D, "√(")
Output(1, D + 2, A)
End
Output(2, 1, F * √(A))
Stop


====================================================

Lbl 3

ClrHome

Input "Start base: ", B
Input "Number: ", Str1
Disp " "
Input "End base: ", F

If B > 10 or F > 10
Goto 3

0 → D

// convert to decimal
For(X, length(Str1), 1, -1)
D + (expr(sub(Str1, X, 1)) * (B ^ length(Str1) - X) → D
End

0 → O

// convert from decimal to end base
While D > 0
int(ln(D) / ln(f)) → X
O + 10^X → O
D - F^X → D
End

Disp O

Stop


