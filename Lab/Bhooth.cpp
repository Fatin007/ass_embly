#include<bits/stdc++.h>
using namespace std;

void displayBool(vector<bool>&b){
    for (int i = b.size() - 1; i >= 0; i--){
        cout << b[i];
    }
}

int binaryToDecimal(vector<bool>&b){
    int result = 0;
    for (int i = 0; i < b.size(); i++){
        result += b[i] * pow(2, i);
    }
    return result;
}

int main(){

    int multiplier, multiplicand;
    cout << "Enter multiplicand: ";
    cin >> multiplicand;
    cout << "Enter multiplier: ";
    cin >> multiplier;
    const size_t len1 = int(log2(abs(multiplicand))) + 2;
    const size_t len2 = int(log2(abs(multiplier))) + 2;
    vector<bool> m1, m2, m3;
    int complementForm = ~multiplicand + 1;
    for (int i = 0; i < 32; i++) {
        m1.push_back((multiplicand >> i) & 1);
        m2.push_back((multiplier >> i) & 1);
        m3.push_back((complementForm >> i) & 1);
    }
    int bitlength = max(len1, len2);
    m1.resize(bitlength);
    m2.resize(bitlength);
    m3.resize(bitlength);
    displayBool(m1);
    cout << endl;
    displayBool(m2);
    cout << endl;
    displayBool(m3);
    cout << endl;

    vector<bool> AC = vector<bool>(bitlength, false);
    vector<bool> QR = m2;
    int q0 = 0;
    int q1 = QR[0];
    cout << endl;
    cout << "qn\tq[n+1]\tBR\t\tAC\tQR\t\t\n";
    cout << "\t\tinitial\t\t";
    displayBool(AC);
    cout << "\t";
    displayBool(QR);
    cout << "\t" << endl;
    for (int i = 0; i < bitlength; i++){
        if (q0 == 0 && q1 == 1){
            cout << q0 << "\t" << q1 << "\t";
            cout << "A = A - BR\t";
            int carry = 0;
            for (int i = 0; i < bitlength; i++)
            {
                int temp = AC[i] + m3[i] + carry;
                if (temp > 1)
                {
                    AC[i] = temp % 2;
                    carry = 1;
                }
                else {
                    AC[i] = temp;
                    carry = 0;
                }
            }
            displayBool(AC);
            cout << "\t";
            displayBool(QR);
            cout << endl;
          
        }
        else if (q0 == 1 && q1 == 0){
            // Condition 01
            cout << q0 << "\t" << q1 << "\t";
            cout << "A = A + BR\t";
            int carry = 0;
            for (int i = 0; i < bitlength; i++){
                int temp = AC[i] + m1[i] + carry;
                    if(temp > 1){
                        AC[i] = temp % 2;
                        carry = 1;
                    }
                    else {
                        AC[i] = temp;
                        carry = 0;
                    }
            }
            displayBool(AC);
            cout << "\t";
            displayBool(QR);
            cout << endl;
        }
        cout << q0 << "\t" << q1 << "\t" << "Right Shift\t";
        q0 = q1;
        int temp = AC[0];
        for (int i = 0; i < bitlength - 1; i++){
            AC[i] = AC[i + 1];
            QR[i] = QR[i + 1];
        }
        QR[bitlength - 1] = temp;
        displayBool(AC);
        cout << "\t";
        displayBool(QR);
        cout << endl;

        q1 = QR[0];
        cout << endl;
    }
    vector<bool> result = QR;
    result.insert(result.end(), AC.begin(), AC.end());
    cout << "Result is: ";
    displayBool(result);
    cout << endl;
    cout << "Decimal Result: " << binaryToDecimal(result) << endl;
}