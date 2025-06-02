#include<bits/stdc++.h>
using namespace std;

void displayBool(vector<bool> b){
    for (int i = b.size() - 1; i >= 0; i--){
        cout << b[i];
    }
}

int main(){

    int multiplier, multiplicand;
    cout << "Enter multiplicand: ";
    cin >> multiplicand;
    cout << "Enter multiplier: ";
    cin >> multiplier;
    const size_t len1 = int(log2(abs(multiplicand))) + 3;
    const size_t len2 = int(log2(abs(multiplier))) + 3;
    vector<bool> MULTIPLICAND;
    vector<bool> MULTIPLIER;

    for (int i = 0; i < 32; i++){
        MULTIPLICAND.push_back((multiplicand >> i) & 1);
        MULTIPLIER.push_back((multiplier >> i) & 1);
    }
    int bitlength = max(len1, len2);
    MULTIPLICAND.resize(2*bitlength);
    MULTIPLIER.resize(bitlength);
    displayBool(MULTIPLICAND);
    cout << endl;
    displayBool(MULTIPLIER);
    cout << endl;
    vector<bool> PRODUCT(2*bitlength, false);
    for (int i = 0; i < bitlength; i++){
        int lastBit = MULTIPLIER[0];
        if(lastBit == 1){
            // We need to add
            int carry = 0;
            for (int i = 0; i < 2 * bitlength; i++)
            {
                 int temp = MULTIPLICAND[i] + PRODUCT[i] + carry;
                    if(temp > 1){
                        PRODUCT[i] = temp % 2;
                        carry = 1;
                    }
                    else {
                        PRODUCT[i] = temp;
                        carry = 0;
                    }
            }

            //Shift multiplier to Right
            for (int i = 0; i < bitlength - 1; i++){
                MULTIPLIER[i] = MULTIPLIER[i + 1];
            }
            MULTIPLIER[bitlength - 1] = 0;
            // Shift multiplicand to Left
            for (int i = 2*bitlength - 1; i > 0; i--){
                MULTIPLICAND[i] = MULTIPLICAND[i - 1];
            }
            MULTIPLICAND[0] = 0;
        }
        else {
            // We don't add
             for (int i = 0; i < bitlength - 1; i++){
                MULTIPLIER[i] = MULTIPLIER[i + 1];
            }
            MULTIPLIER[bitlength - 1] = 0;
            // Shift multiplicand to Left
            for (int i = 2*bitlength - 1; i > 0; i--){
                MULTIPLICAND[i] = MULTIPLICAND[i - 1];
            }
            MULTIPLICAND[0] = 0;
        }
    }

    cout << "Result is: ";
    displayBool(PRODUCT);
    cout << endl;
}