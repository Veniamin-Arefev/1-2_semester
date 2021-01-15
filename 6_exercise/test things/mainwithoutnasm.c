#include <stdio.h>
#include <math.h>

const double eps1 = 0.00000001;
const double eps2 = 0.0001;
const double p = 1 / 3;

int iterations = 0;

//number 9 method 4  and formula 2
//extern int func(void);
double f1(double x) {
    //return 3 / ((x - 1) * (x - 1) + 1);
    return 3 / (pow((x - 1), 2) + 1);
}

double f2(double x) {
    return sqrt(x + 0.5);
}

double f3(double x) {
    return exp(-x);
}

double f1div(double x) {
    return (6 - 6 * x) / pow((pow((x - 1), 2) + 1), 2);
}

double f2div(double x) {
    return 1 / (2 * sqrt(x + 0.5));
}

double f3div(double x) {
    return -exp(-x);
}

double root(double (*f)(double), double (*g)(double), double a, double b, double eps, double (*fdiv)(double),
            double (*gdiv)(double)) {
    //(F( (a+b) / 2)) > ((F(a) - F(b)) / 2)        F() = f() - g()
    int upperchord = 0;
    if ((f((a + b) / 2) - g((a + b) / 2)) > ((f(a) - g(a) + f(b) - g(b)) / 2)) {
        upperchord = 1;
    }
    //int upperchord = (f((a + b) / 2) - g((a + b) / 2)) > ((f(a) - g(a) + f(b) - g(b)) / 2) ?
    //               1 : 0;
    int divpositive = 0;
    if (fdiv(a) - gdiv(a) >= 0) {
        divpositive = 1;
    }
//    int divpositive = (fdiv(a) - gdiv(a)) >= 0 ?
//                      1 : 0;
    int variant = upperchord ^divpositive; //1 is first var and 0 is second

    iterations = 0;
    //F(a) - F(b) < eps
    while (fabs(b - a) > eps) {
        //chord
        //aF(b) - bF(a) / F(b) - F(a)          F() = f() - g()
        double c = (a * (f(b) - g(b)) - b * (f(a) - g(a))) / (f(b) - g(b) - f(a) + g(a));
        a = variant ? c : a;
        b = variant ? b : c;

        //tangent
        c = variant ? b : a;
        //c = d - F(d)/ Fdiv(d) where d if upper c
        c = c - (f(c) - g(c)) / (fdiv(c) - gdiv(c));
        a = variant ? a : c;
        b = variant ? c : b;
        iterations++;
    }
    //printf("a = %.8lf and b = %.8lf\n", a, b);
    return (a + b) / 2;
}

double nintegral(double (*f)(double), double a, double b, int n) {
    //In = h (0.5F0 + F1 + F2 + ... + Fn-1 + 0.5Fn), где Fi = F(a + ih), h = (b – a)/n
    double h = (b - a) / n;
    double answer = f(a); //F0
    answer += f(b); // + Fn
    answer /= 2; // 0.5F0 + 0.5Fn
    for (int i = 1; i < n; ++i) {
        answer += f(a + i * h);
    }
    return answer * h;
}

double integral(double (*f)(double), double a, double b, double eps) {
    int n = 1024;
    double answer = nintegral(f, a, b, 1024);
    n *= 2;
    double betteranswer = nintegral(f, a, b, n);
    while (p * fabs(betteranswer - answer) > eps) {
        answer = betteranswer;
        n *= 2;
        betteranswer = nintegral(f, a, b, n);
    }
    return betteranswer;
}

int main(int argc, char **args) {
    int sout = 1;
    printf("Should intersection point be printed?\n");
    scanf("%d", &sout);

    int siter = 1;
    printf("Should number of iterations be printed?\n");
    scanf("%d", &siter);

    if (sout) {
        printf("Intersection point:\n");
    }
    double point1 = root(f1, f3, -0.25, 0.3, eps1, f1div, f3div);

    if (sout) {
        printf("For f1 and f3 is x = %0.8lf\n", point1);
        if (siter) {
            printf("Number os iterations is %d\n", iterations);
        }
    }

    double point2 = root(f2, f3, -0.45, 4, eps1, f2div, f3div);

    if (sout) {
        printf("For f2 and f3 is x = %0.8lf\n", point2);
        if (siter) {
            printf("Number os iterations is %d\n", iterations);
        }
    }

    double point3 = root(f1, f2, 1.6, 20, eps1, f1div, f2div);

    if (sout) {
        printf("For f1 and f2 is x = %0.8lf\n", point3);
        if (siter) {
            printf("Number os iterations is %d\n", iterations);
        }
    }


    double integr = integral(f1, point1, point3, eps2);
    integr -= integral(f2, point1, point3, eps2);
    integr -= integral(f3, point1, point3, eps2);
    integr += integral(f2, point1, point2, eps2);
    integr += integral(f3, point2, point3, eps2);
    printf("Integral = %0.8lf\n", integr);
    return 0;
}
