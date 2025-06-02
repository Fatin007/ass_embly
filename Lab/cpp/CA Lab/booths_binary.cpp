#include <bits/stdc++.h>
using namespace std;

void displayBool(const vector<bool>& b);

// Converts binary string to vector<bool> with sign-extension
vector<bool> binaryStringToBoolVector(const string& bin, int bitlength) {
    vector<bool> vec;
    for (int i = bin.length() - 1; i >= 0; --i) {
        vec.push_back(bin[i] == '1');
    }
    // Sign extend if needed
    bool signBit = vec.back();
    while (vec.size() < bitlength)
        vec.push_back(signBit);
    return vec;
}

// Compute two's complement of a boolean vector
vector<bool> twosComplement(const vector<bool>& bits) {
    vector<bool> res(bits.size());
    // 1's complement
    for (size_t i = 0; i < bits.size(); i++)
        res[i] = !bits[i];

    // Add 1
    bool carry = 1;
    for (size_t i = 0; i < res.size(); i++) {
        bool sum = res[i] ^ carry;
        carry = res[i] && carry;
        res[i] = sum;
    }
    return res;
}

int main() {
    string multiplicand_bin, multiplier_bin;
    cout << "Enter multiplicand (binary): ";
    cin >> multiplicand_bin;
    cout << "Enter multiplier (binary): ";
    cin >> multiplier_bin;

    // Ensure binary strings are valid
    if (multiplicand_bin.empty() || multiplier_bin.empty()) {
        cout << "Error: Inputs cannot be empty.\n";
        return 1;
    }

    int bitlength = max(multiplicand_bin.length(), multiplier_bin.length()) + 1;

    vector<bool> M = binaryStringToBoolVector(multiplicand_bin, bitlength);
    vector<bool> Q = binaryStringToBoolVector(multiplier_bin, bitlength);
    vector<bool> M_neg = twosComplement(M);

    // Initial values
    vector<bool> AC(bitlength, 0);
    vector<bool> QR = Q;
    int q0 = 0;
    int q1 = QR[0];

    cout << "\nInitial values:\n";
    cout << "M  = "; displayBool(M); cout << "\n";
    cout << "Q  = "; displayBool(Q); cout << "\n";
    cout << "-M = "; displayBool(M_neg); cout << "\n";

    cout << "\nqn\tq[n+1]\tOp\t\tAC\t\tQR\n";
    cout << "\t\tInitial\t\t"; displayBool(AC); cout << "\t"; displayBool(QR); cout << "\n";

    for (int step = 0; step < bitlength; step++) {
        if (q0 == 0 && q1 == 1) {
            cout << q0 << "\t" << q1 << "\tA = A - M\t";
            // A = A - M = A + (-M)
            int carry = 0;
            for (int i = 0; i < bitlength; i++) {
                int sum = AC[i] + M_neg[i] + carry;
                AC[i] = sum % 2;
                carry = sum / 2;
            }
            displayBool(AC); cout << "\t"; displayBool(QR); cout << "\n";
        } else if (q0 == 1 && q1 == 0) {
            cout << q0 << "\t" << q1 << "\tA = A + M\t";
            int carry = 0;
            for (int i = 0; i < bitlength; i++) {
                int sum = AC[i] + M[i] + carry;
                AC[i] = sum % 2;
                carry = sum / 2;
            }
            displayBool(AC); cout << "\t"; displayBool(QR); cout << "\n";
        }

        // Right Shift AC || QR || q0
        cout << q0 << "\t" << q1 << "\tRight Shift\t";
        q0 = q1;
        int lastAC = AC[0];
        for (int i = 0; i < bitlength - 1; i++) {
            AC[i] = AC[i + 1];
            QR[i] = QR[i + 1];
        }
        AC[bitlength - 1] = AC[bitlength - 1]; // retain MSB (sign bit)
        QR[bitlength - 1] = lastAC;

        displayBool(AC); cout << "\t"; displayBool(QR); cout << "\n";

        q1 = QR[0];
        cout << "\n";
    }

    // Final result = AC || QR
    vector<bool> result = QR;
    result.insert(result.end(), AC.begin(), AC.end());

    cout << "Final Binary Product: ";
    displayBool(result); cout << "\n";

    return 0;
}

// Display bits MSB -> LSB
void displayBool(const vector<bool>& b) {
    for (int i = b.size() - 1; i >= 0; i--)
        cout << b[i];
}
