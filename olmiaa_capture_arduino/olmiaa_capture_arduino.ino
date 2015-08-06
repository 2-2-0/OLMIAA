// OMLIAA_capture
// by 220
// for Arduino UNO R3

int pin_sensor = A0;
int pin_led = 11;

char c;
int value;

void setup () {
  Serial.begin (115200);
  Serial.print ("Initializing olmiaa capture_a...");
  
  pinMode (pin_sensor, INPUT);
  pinMode (pin_led, OUTPUT);
  
  Serial.println ("ok!");
  Serial.flush ();
}
void loop () {
  while (Serial.available ()) {
    c = Serial.read ();
  }
  
  value = analogRead (pin_sensor);
  value = map (value, 0, 1024, 0, 255);
  
  analogWrite (pin_led, value);
  Serial.write (value);

  delay (80);  
}
