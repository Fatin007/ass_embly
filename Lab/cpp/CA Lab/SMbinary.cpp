#include <bits/stdc++.h>
using namespace std;

// Function to print binary (MSB to LSB)
void displayBool(const vector<bool>& b) {
    for (int i = b.size() - 1; i >= 0; i--) {
        cout << b[i];
    }
    cout << endl;
}

// Convert binary string to vector<bool> (LSB first)
vector<bool> binaryToVectorBool(const string& bin, int size) {
    vector<bool> result;
    for (int i = bin.length() - 1; i >= 0; i--) {
        result.push_back(bin[i] == '1');
    }
    // Sign extend if needed
    bool sign = result.back();
    while (result.size() < size)
        result.push_back(sign);
    return result;
}

int main() {
    string multiplicand_bin, multiplier_bin;
    cout << "Enter multiplicand (binary): ";
    cin >> multiplicand_bin;
    cout << "Enter multiplier (binary): ";
    cin >> multiplier_bin;

    int bitlength = max(multiplicand_bin.length(), multiplier_bin.length()) + 1;

    vector<bool> MULTIPLICAND = binaryToVectorBool(multiplicand_bin, 2 * bitlength);
    vector<bool> MULTIPLIER = binaryToVectorBool(multiplier_bin, bitlength);
    vector<bool> PRODUCT(2 * bitlength, false);

    cout << "Initial MULTIPLICAND: ";
    displayBool(MULTIPLICAND);
    cout << "Initial MULTIPLIER:   ";
    displayBool(MULTIPLIER);
    cout << endl;

    for (int i = 0; i < bitlength; i++) {
        int lastBit = MULTIPLIER[0];
        if (lastBit == 1) {
            // Add MULTIPLICAND to PRODUCT
            int carry = 0;
            for (int j = 0; j < 2 * bitlength; j++) {
                int temp = MULTIPLICAND[j] + PRODUCT[j] + carry;
                PRODUCT[j] = temp % 2;
                carry = temp / 2;
            }
        }

        // Shift MULTIPLIER right by 1
        for (int j = 0; j < bitlength - 1; j++) {
            MULTIPLIER[j] = MULTIPLIER[j + 1];
        }
        MULTIPLIER[bitlength - 1] = 0;

        // Shift MULTIPLICAND left by 1
        for (int j = 2 * bitlength - 1; j > 0; j--) {
            MULTIPLICAND[j] = MULTIPLICAND[j - 1];
        }
        MULTIPLICAND[0] = 0;
    }

    cout << "Result is: ";
    displayBool(PRODUCT);

    return 0;
}
