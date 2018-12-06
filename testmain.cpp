# include<iostream>
# include<math.h>
# include<complex.h>
using namespace std;

void testmenu() {
	cout << ">> Enter the coefficients of a quadratic polynomial, from the 2-order term to the constant:" << endl;
	double a, b, c;
	while (true) {
		cin >> a >> b >> c;
		double delta;
		delta = b*b - 4*a*c;
		if (delta >= 0) {
			cout << ">> Equation has 2 real roots:" << endl;
			double sqrt1;
			sqrt1 = sqrt(delta);
			double root1, root2;
			if (b >= 0) {
				root1 = 2*c/(-b - sqrt1);
				root2 = (-b - sqrt1)/(2*a);
			}
			else {
				root1 = (-b + sqrt1)/(2*a);
				root2 = 2*c/(-b + sqrt1);
			}
			cout << "root1 = " << root1 << endl;
			cout << "root2 = " << root2 << endl;
		}
		else {
			cout << ">> Equation has 2 complex roots:" << endl;
			double re, re1, re2;
			double im, im1, im2;
			complex<double> sqrt1(re, im), root1(re1, im1), root2(re2, im2);
			sqrt1 = delta;
			sqrt1 = sqrt(sqrt1);
			if (b*real(root1) >= 0) {
				root1 = 2*c/(-b - sqrt1);
				root2 = (-b - sqrt1)/(2*a);
			}
			else {
				root1 = (-b + sqrt1)/(2*a);
				root2 = 2*c/(-b + sqrt1);
			}
			cout << "root1 = " << root1 << endl;
			cout << "root2 = " << root2 << endl;
		}
	}
}

int main() {
	testmenu();
	return 0;
}
