#include <bits/stdc++.h>
using namespace std;

void displayBool(vector<bool> b);

// Binary to Decimal Conversion (2's complement handling)
int binaryToDecimal(const std::string& bin) {
    int n = bin.length();
    bool isNegative = (bin[0] == '1');

    if (!isNegative) {
        // Positive number, standard binary to decimal
        return std::stoi(bin, nullptr, 2);
    }

    // If negative: convert from 2's complement
    // Step 1: Invert all bits
    std::string onesComp = bin;
    for (char& bit : onesComp) {
        bit = (bit == '1' ? '0' : '1');
    }

    // Step 2: Convert to decimal and add 1
    int val = std::stoi(onesComp, nullptr, 2);
    return -(val + 1);
}

int main() {
    string divisor_bin, dividend_bin;
    cout << "Enter Divisor (binary): ";
    cin >> divisor_bin;
    cout << "Enter Dividend (binary): ";
    cin >> dividend_bin;

    int divisor = binaryToDecimal(divisor_bin);
    int dividend = binaryToDecimal(dividend_bin);

    const size_t len1 = int(log2(abs(divisor))) + 2;
const size_t len2 = int(log2(abs(dividend))) + 2;
int bitLength = max(len1, len2);
vector<bool> DIVISOR;
vector<bool> DIVIDEND;
vector<bool> compDIVISOR;
int comp = ~divisor + 1;
for (int i = 0; i < 32; i++)
{
    DIVISOR.push_back((divisor >> i) & 1);
    DIVIDEND.push_back((dividend >> i) & 1);
}
vector<bool> REMAINDER(2*bitLength, false);
vector<bool> QUOTIENT(bitLength, false);
REMAINDER = DIVIDEND;
QUOTIENT.resize(bitLength);
for (int i = 0; i < bitLength; i++){
    DIVISOR.insert(DIVISOR.begin(), false);
}
REMAINDER.resize(2 * bitLength);
DIVISOR.resize(2 * bitLength);

cout << "Quotient: ";
displayBool(QUOTIENT);
cout << endl;
cout << "Divisor: ";
displayBool(DIVISOR);
cout << endl;
cout << "Remainder: ";
displayBool(REMAINDER);
cout << endl;
cout << endl;
for (int i = 0; i <= bitLength; i++)
{
    compDIVISOR = DIVISOR;
    compDIVISOR.flip();
    vector<bool> temprem(2 * bitLength, false);
    temprem[0] = 1;
    int carry = 0;
    for (int j = 0; j < 2 * bitLength; j++)
    {

        int temp = temprem[j] + compDIVISOR[j] + carry;
        if (temp > 1)
        {
            compDIVISOR[j] = temp % 2;
            carry = 1;
        }
        else
        {
            compDIVISOR[j] = temp;
            carry = 0;
        }
}
    compDIVISOR.resize(2 * bitLength);
    vector<bool> tempRemainder(2*bitLength, false);
    tempRemainder = REMAINDER;
    // Add Rem and compDivisor
    cout << "Divisor: ";
    displayBool(DIVISOR);
    cout << endl;
    cout << "Remainder: ";
    displayBool(REMAINDER);
    cout << endl;
    cout << "TempRemainder: ";
    displayBool(tempRemainder);
    cout << endl;
    cout << "2's Divisors: ";
    displayBool(compDIVISOR);
    cout << endl;   
    carry = 0;
    for (int j = 0; j < 2 * bitLength; j++){
    
        int temp = tempRemainder[j] + compDIVISOR[j] + carry;
        if(temp > 1){
            tempRemainder[j] = temp % 2;
            carry = 1;
        }
        else {
            tempRemainder[j] = temp;
            carry = 0;
        }
    }
    cout << "After Temp Remainder Operation: ";
    displayBool(tempRemainder);
    cout << endl;
    if (tempRemainder[2 * bitLength - 1] == 1)
    {
        // Negative Remainder detected
        for (int i = bitLength - 1; i > 0; i--)
        {
            QUOTIENT[i] = QUOTIENT[i - 1];
        }
        QUOTIENT[0] = 0;
    }
    else {
        cout << "Shifting Quotient" << endl;
        cout << "Before: ";
        displayBool(QUOTIENT);
        // Shift Quotient to Left setting right most bit to 1
        for (int i = bitLength - 1; i > 0; i--)
        {
            QUOTIENT[i] = QUOTIENT[i - 1];
        }
        QUOTIENT[0] = 1;
        REMAINDER = tempRemainder;
        cout << " After: ";
        displayBool(QUOTIENT);
        cout << endl;
    }
    // Shift Divisor to right
    for (int i = 0; i < 2 * bitLength - 1; i++)
    {
        DIVISOR[i] = DIVISOR[i + 1];
    }
    DIVISOR[2*bitLength - 1] = 0;
    cout << endl;
}
cout << "Quotient: ";
displayBool(QUOTIENT);
cout << endl;
cout << "Remainder: ";
displayBool(REMAINDER);
cout << endl;
}

void displayBool(vector<bool> b){
for (int i = b.size() - 1; i >= 0; i--){
cout << b[i];
}

}