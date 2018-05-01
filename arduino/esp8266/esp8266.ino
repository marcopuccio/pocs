#include <SoftwareSerial.h>
#include <SerialESP8266wifi.h>

#define RX 10
#define TX 11
SoftwareSerial esp8266Serial(RX,TX);
const char* ssid = "<SSID>";
const char* password = "<PASSWORD>";
boolean isWifiConnected;

int ledPin = 7;


void setup() {
  Serial.begin(9600);
  esp8266Serial.begin(115200);
  SerialESP8266wifi wifi = SerialESP8266wifi(esp8266Serial, esp8266Serial, 13);
  wifi.begin();
  wifi.connectToAP(ssid, password);
  isWifiConnected = wifi.isConnectedToAP();
  pinMode(ledPin, OUTPUT);
}

void loop() {
  if(isWifiConnected) {
    Serial.println("Connected to WiFi");
    digitalWrite(ledPin, HIGH);
    delay(1000);
    digitalWrite(ledPin, LOW);
  }
}
