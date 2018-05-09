#include <ESP8266WiFi.h>

const char* ssid = "<SSID>";
const char* password = "<PASSWORD>";

const int wifiLedPin = 14;
const int buttonLedPin = 4;
const int buttonPin = 5;

boolean isWifiConnected;
int buttonState = 0;

void setup() {
  Serial.begin(115200);
    // Pin mode Settings
  pinMode(wifiLedPin , OUTPUT);
  pinMode(buttonLedPin , OUTPUT);
  pinMode(buttonPin, INPUT);
  
  // Init WiFi
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  // Log if board isn't connected
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  
  // Log succesful connection
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  isWifiConnected = true;
}

void loop() {
  // blink led if wifi is connected
  if (isWifiConnected) {
    delay(100);
    digitalWrite(wifiLedPin, HIGH);
    delay(100);
    digitalWrite(wifiLedPin, LOW);
  }
  
  // check if button is pressed
  buttonState = digitalRead(buttonPin);
  if (buttonState == HIGH) {
    digitalWrite(buttonLedPin, LOW);
  } else {
    digitalWrite(buttonLedPin, HIGH);
  }
}

