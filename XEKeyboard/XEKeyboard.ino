#include <hidboot.h>
#include <usbhub.h>
#include <SPI.h>


#define DEBUG

void handleKey(byte key, byte mod, bool pressed);
void keyAction(byte key, bool pressed);

#ifdef DEBUG
void dumpState();
#endif


/*
 * Connecting to the Atari 65XE
 * 
 * POKEY ~K0   U24, pin 11     14 in
 * POKEY ~K1   U24, pin 10     15 in
 * POKEY ~K2   U24, pin 9      16 in
 * POKEY ~K3   U25, pin 11     17 in
 * POKEY ~K4   U25, pin 10     18 in
 * POKEY ~K5   U25, pin 9      19 in
 * 
 * POKEY ~KR1  U22, pin 25     8  out   Currently selected switch in 8x8 matrix
 * POKEY ~KR2  U22, pin16      9  out   Break/Shift/Control keys
 * 
 * GTIA   S0   U17, pin 12     10 out   Start button
 * GTIA   S1   U17, pin 13     11 out   Select button
 * GTIA   S2   U17, pin 14     12 out   Option button
 * 
 * RESET       L14             4  out   Reset button
 * 
 */
#define ATARI_PIN_RESET  4
#define ATARI_PIN_KR1    8
#define ATARI_PIN_KR2    9
#define ATARI_PIN_START  10
#define ATARI_PIN_SELECT 11
#define ATARI_PIN_OPTION 12

#define ATARI_PIN_ROW0   14     // The code assumes the ROWx and COLx pins are all
#define ATARI_PIN_ROW1   15     // connected to the bottom 6 bits of PortC. The
#define ATARI_PIN_ROW2   16     // code will break if that isn't so!
#define ATARI_PIN_COL0   17     //
#define ATARI_PIN_COL1   18     // YOU HAVE BEEN WARNED!
#define ATARI_PIN_COL2   19     //

/*
 * Key definitions for the 8 x 8 matrix driven by the POKEY and sampled
 * on the ~KR1 pin
 */
#define ATARI_NOKEY     255

#define ATARI_KEY_A     0     // 0,0
#define ATARI_KEY_S     1
#define ATARI_KEY_G     2
#define ATARI_KEY_CAPS  3
// No key
#define ATARI_KEY_D     5
#define ATARI_KEY_H     6
#define ATARI_KEY_F     7

#define ATARI_KEY_GT    8     // 1,0
#define ATARI_KEY_LT    9
#define ATARI_KEY_8     10
#define ATARI_KEY_DEL   11
#define ATARI_KEY_7     12
#define ATARI_KEY_0     13
// No key
#define ATARI_KEY_9     15

#define ATARI_KEY_Q     16    // 2,0
#define ATARI_KEY_W     17
#define ATARI_KEY_T     18
#define ATARI_KEY_TAB   19
#define ATARI_KEY_Y     20
#define ATARI_KEY_E     21
// No key
#define ATARI_KEY_R     23

#define ATARI_KEY_INV   24    // 3,0
#define ATARI_KEY_SLASH 25
#define ATARI_KEY_M     26
// No key
#define ATARI_KEY_N     28
#define ATARI_KEY_FSTOP 29
#define ATARI_KEY_SPACE 30
#define ATARI_KEY_COMMA 31

#define ATARI_KEY_1     32    // 4,0
#define ATARI_KEY_2     33
#define ATARI_KEY_5     34
#define ATARI_KEY_ESC   35
#define ATARI_KEY_6     36
#define ATARI_KEY_3     37
// No key
#define ATARI_KEY_4     39

#define ATARI_KEY_Z     40    // 5,0
#define ATARI_KEY_X     41
#define ATARI_KEY_B     42
// No key
// No key
#define ATARI_KEY_C     45
#define ATARI_KEY_HELP  46
#define ATARI_KEY_V     47

#define ATARI_KEY_EQ    48    // 6,0
#define ATARI_KEY_MINUS 49
#define ATARI_KEY_I     50
#define ATARI_KEY_RET   51
#define ATARI_KEY_U     52
#define ATARI_KEY_P     53
// No key
#define ATARI_KEY_O     55

#define ATARI_KEY_TIMES 56    // 7,0
#define ATARI_KEY_PLUS  57
#define ATARI_KEY_K     58
// No key
// No key
#define ATARI_KEY_SEMI  61
#define ATARI_KEY_J     62
#define ATARI_KEY_L     63

/*
 * Keys that are handled differently:
 * 
 * BSC (Break, Select and Control) these three keys are from a a x 8 matrix driven by the 
 * POKEY and sampled on the ~KR2 pin
 * 
 * START, SHIFT, OPTION special keys which connect directly to the GTIA S0, S1 and S2
 * signals respectively. I haven't looked at the OS rom code to see why, but my guess is that
 * they can generate an interrupt when pressed so get picked up immediately
 * 
 * RESET key actually drives the reset 555 timer which physically resets the whole machine by
 * asserting the RST signal
 */

#define KR2_BASE 64
// No key
#define ATARI_KEY_BREAK 65
// No key
// No key
// No key
#define ATARI_KEY_SHIFT 69
// No key
#define ATARI_KEY_CTRL  71

#define ATARI_KEY_START 128
#define ATARI_KEY_SELECT 129
#define ATARI_KEY_OPTION 130
#define ATARI_KEY_RESET 131

/*
 * Table for mapping USB key codes to ATARI keyboard codes.
 * 
 */
const PROGMEM byte keyMap[] = {
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_A,     ATARI_KEY_B,     ATARI_KEY_C,     ATARI_KEY_D,
  ATARI_KEY_E,     ATARI_KEY_F,     ATARI_KEY_G,     ATARI_KEY_H,     ATARI_KEY_I,     ATARI_KEY_J,     ATARI_KEY_K,     ATARI_KEY_L,

  ATARI_KEY_M,     ATARI_KEY_N,     ATARI_KEY_O,     ATARI_KEY_P,     ATARI_KEY_Q,     ATARI_KEY_R,     ATARI_KEY_S,     ATARI_KEY_T,
  ATARI_KEY_U,     ATARI_KEY_V,     ATARI_KEY_W,     ATARI_KEY_X,     ATARI_KEY_Y,     ATARI_KEY_Z,     ATARI_KEY_1,     ATARI_KEY_2,

  ATARI_KEY_3,     ATARI_KEY_4,     ATARI_KEY_5,     ATARI_KEY_6,     ATARI_KEY_7,     ATARI_KEY_8,     ATARI_KEY_9,     ATARI_KEY_0,
  ATARI_KEY_RET,   ATARI_KEY_ESC,   ATARI_KEY_DEL,   ATARI_KEY_TAB,   ATARI_KEY_SPACE, ATARI_KEY_MINUS, ATARI_KEY_EQ,    ATARI_KEY_2,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_SEMI,  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_COMMA, ATARI_KEY_FSTOP,
  ATARI_KEY_SLASH, ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_START, ATARI_KEY_SELECT,

  ATARI_KEY_OPTION,ATARI_KEY_RESET, ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_DEL,   ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_TIMES,

  ATARI_KEY_PLUS,  ATARI_KEY_EQ,    ATARI_KEY_MINUS, ATARI_NOKEY,     ATARI_KEY_SLASH, ATARI_KEY_TIMES, ATARI_KEY_MINUS, ATARI_KEY_PLUS,
  ATARI_KEY_RET,   ATARI_KEY_1,     ATARI_KEY_2,     ATARI_KEY_3,     ATARI_KEY_4,     ATARI_KEY_5,     ATARI_KEY_6,     ATARI_KEY_7,

  ATARI_KEY_8,     ATARI_KEY_9,     ATARI_KEY_0,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

};


/*
 * Virtual Atari keyboard state variables
 */
#define NUM_KR1_KEYS 64       // 8x8
byte kr1Matrix[NUM_KR1_KEYS];

#define NUM_KR2_KEYS 8        // 1x8
byte kr2Matrix[NUM_KR2_KEYS];

#define SWITCH_OPEN HIGH
#define SWITCH_CLOSED LOW

#define RESET_MILLIS 250      // How long to assert the RESET line when BREAK is pressed
unsigned long resetAssertedTime = 0;
bool resetInProgress = false;

bool startKey = SWITCH_OPEN;
bool selectKey = SWITCH_OPEN;
bool optionKey = SWITCH_OPEN;

/*
 * USB keybaord state
 */
bool controlPressed = false;
bool shiftPressed = false;
bool altPressed = false;
bool winPressed = false;



/* 
 *  Class to handle all the callbacks from the USB Host device
 */
class KbdRptParser : public KeyboardReportParser
{
    void PrintKey(uint8_t mod, uint8_t key);

  protected:
    void OnControlKeysChanged(uint8_t before, uint8_t after);
    void OnKeyDown  (uint8_t mod, uint8_t key);
    void OnKeyUp  (uint8_t mod, uint8_t key);
    void OnKeyPressed(uint8_t key);
};

void KbdRptParser::PrintKey(uint8_t m, uint8_t key)
{
  MODIFIERKEYS mod;
  *((uint8_t*)&mod) = m;
  Serial.print((mod.bmLeftCtrl   == 1) ? "C" : " ");
  Serial.print((mod.bmLeftShift  == 1) ? "S" : " ");
  Serial.print((mod.bmLeftAlt    == 1) ? "A" : " ");
  Serial.print((mod.bmLeftGUI    == 1) ? "G" : " ");

  Serial.print(" >");
  PrintHex<uint8_t>(key, 0x80);
  Serial.print("< ");

  Serial.print((mod.bmRightCtrl   == 1) ? "C" : " ");
  Serial.print((mod.bmRightShift  == 1) ? "S" : " ");
  Serial.print((mod.bmRightAlt    == 1) ? "A" : " ");
  Serial.println((mod.bmRightGUI    == 1) ? "G" : " ");
};

void KbdRptParser::OnKeyDown(uint8_t mod, uint8_t key)
{
#ifdef DEBUG
  Serial.print("DN ");
  PrintKey(mod, key);
  uint8_t c = OemToAscii(mod, key);

  if (c) {
    Serial.print("'");
    Serial.print(c);
    Serial.println("'");
  }
#endif

  handleKey(key, mod, true);
}

void KbdRptParser::OnKeyUp(uint8_t mod, uint8_t key)
{
  Serial.print("UP ");
  PrintKey(mod, key);

  handleKey(key, mod, false);
}

void KbdRptParser::OnControlKeysChanged(uint8_t before, uint8_t after) {

  MODIFIERKEYS beforeMod;
  *((uint8_t*)&beforeMod) = before;

  MODIFIERKEYS afterMod;
  *((uint8_t*)&afterMod) = after;


  controlPressed = afterMod.bmLeftCtrl || afterMod.bmRightCtrl;
  shiftPressed = afterMod.bmLeftShift || afterMod.bmRightShift;
  altPressed = afterMod.bmLeftAlt || afterMod.bmRightAlt;
  winPressed = afterMod.bmLeftGUI || afterMod.bmRightGUI;

  if (beforeMod.bmLeftCtrl != afterMod.bmLeftCtrl) {
    keyAction(ATARI_KEY_CTRL, afterMod.bmLeftCtrl);
  }
  else if (beforeMod.bmRightCtrl != afterMod.bmRightCtrl) {
    keyAction(ATARI_KEY_CTRL, afterMod.bmRightCtrl);
  }

  if (beforeMod.bmLeftShift != afterMod.bmLeftShift) {
    keyAction(ATARI_KEY_SHIFT, afterMod.bmLeftShift);
  }
  else if (beforeMod.bmRightShift != afterMod.bmRightShift) {
    keyAction(ATARI_KEY_SHIFT, afterMod.bmRightShift);
  }
}

USB     Usb;
USBHub     Hub(&Usb);

HIDBoot < USB_HID_PROTOCOL_KEYBOARD > HidComposite(&Usb);
HIDBoot<USB_HID_PROTOCOL_KEYBOARD>    HidKeyboard(&Usb);

KbdRptParser KbdPrs;


/* 
 * Interrupt handler for Atari keyboard row/col address outputs from
 * the POKEY. Triggered by a rising or falling edge on the K0 signal
 * from the POKEY.
 */
ISR(PCINT1_vect) {
  byte addr = PINC & 0x3f;
  byte row = addr>>3;

  digitalWrite(ATARI_PIN_KR1, kr1Matrix[addr]);
  digitalWrite(ATARI_PIN_KR2, kr2Matrix[row]);
}


/*
 * setup
 */
void setup() {
#ifdef DEBUG
  Serial.begin(57600);
  Serial.println("USB keyboard to Atari 8-bit translator");
  Serial.println("by Bob Green <bob@wookey.org.uk>, Jan 2018.");
  Serial.println();
#endif

  // Atari interface
  pinMode(ATARI_PIN_ROW0, INPUT);        // POKEY pins K0:5
  pinMode(ATARI_PIN_ROW1, INPUT);
  pinMode(ATARI_PIN_ROW2, INPUT);
  pinMode(ATARI_PIN_COL0, INPUT);
  pinMode(ATARI_PIN_COL1, INPUT);
  pinMode(ATARI_PIN_COL2, INPUT);

  pinMode(ATARI_PIN_RESET, OUTPUT);             // Atari RESET signal
  pinMode(ATARI_PIN_KR1, OUTPUT);               // POKEY KR1 - input for 8x8 matrix
  pinMode(ATARI_PIN_KR2, OUTPUT);               // POKEY KR2 - input for 1x8 (BSC) matrix
  pinMode(ATARI_PIN_START, OUTPUT);             // Atari START signal - GTIA
  pinMode(ATARI_PIN_SELECT, OUTPUT);            // Atari SELECT signal - GTIA
  pinMode(ATARI_PIN_OPTION, OUTPUT);            // Atari OPTION signal - GTIA
  pinMode(LED_BUILTIN, OUTPUT);

  // All switches default to open, i.e. not pressed
  digitalWrite(ATARI_PIN_RESET, SWITCH_OPEN);
  digitalWrite(ATARI_PIN_KR1, SWITCH_OPEN);
  digitalWrite(ATARI_PIN_KR2, SWITCH_OPEN);
  digitalWrite(ATARI_PIN_START, SWITCH_OPEN);
  digitalWrite(ATARI_PIN_SELECT, SWITCH_OPEN);
  digitalWrite(ATARI_PIN_OPTION, SWITCH_OPEN);
  digitalWrite(LED_BUILTIN, LOW);
  
  for (int i=0; i<NUM_KR1_KEYS; i++) {
    kr1Matrix[i] = SWITCH_OPEN;
  }

  for (int i=0; i<NUM_KR2_KEYS; i++) {
    kr2Matrix[i] = SWITCH_OPEN;
  }



  if (Usb.Init() == -1)
    Serial.println("OSC did not start.");

  delay( 200 );

  HidComposite.SetReportParser(0, &KbdPrs);
  HidKeyboard.SetReportParser(0, &KbdPrs);


  /*
   * Enable interrupts when K5:0 change, falling or rising edges
   */
  cli();
  PCICR |= 0b00000010;        // Enable port C pin change interrupts
  PCMSK1 |= 0b00000001;       // Port C, pin 0 will interrupt on change
  sei();
}


/* 
 *  Mail polling loop: read PS2 keys, update virtual keyboard
 *  state.
 */
void loop() {
  Usb.Task();
}


/*
 * Wait for a key code byte from the PS2 keyboard
 * 
 * Will block forever if no key pressed.
 * While waiting it checks to see if there is a RESET operation in progress and
 * deasserts RESET one the time defined by RESET_MILLIS
 */
byte getKeyCode() {
  byte keyCode = 42;
  
#ifdef DEBUG
  Serial.print(" [");
  Serial.print(keyCode, HEX);
  Serial.print("] ");
#endif

  return keyCode;
}


/*
 * Start a RESET sequence - assert the RESET signal and initialise a timer
 */
void assertReset() {
  digitalWrite(ATARI_PIN_RESET, SWITCH_CLOSED);
  digitalWrite(LED_BUILTIN, HIGH);

  resetAssertedTime = millis();
  resetInProgress = true;
}


/*
 * Check if the RESET sequence timer and once RESET_MILLIS has occurred
 * deassert RESET.
 */
void checkResetTimer() {
  unsigned long now = millis();

  if (resetInProgress && ((now - resetAssertedTime) > RESET_MILLIS)) {
    digitalWrite(ATARI_PIN_RESET, SWITCH_OPEN);
    digitalWrite(LED_BUILTIN, LOW);
    resetInProgress = false;
  }
}


/* 
 *  Take action when a key has been pressed that needs mapping
 *  to an Atari key. This mostly involves updating our internal state
 *  but in a few cases involves driving pins on the Atari side of
 *  the Arduino.
 */
void keyAction(byte atariKey, bool pressed) {
  byte state = pressed?SWITCH_CLOSED:SWITCH_OPEN;

  if (atariKey < NUM_KR1_KEYS) {
    kr1Matrix[atariKey] = state;
  }
  else {
    /*
     * One of the keys not in the main 8x8 matrix. Two possibilities:
     * 
     * 1. One of the three keys in the 1x8 matrix (Break, Control or Shift)
     * 2. One of the special non-multiplexed keys Start, Select, Option or Reset
      */

    if (atariKey < ATARI_KEY_START) {
      /*
       * Option 1. 
        */
      int col = atariKey - KR2_BASE;
      kr2Matrix[col] = state; 
    }
    else {
      /*
       * Option 2. While its not necessary to maintain the state of these keys its useful
       * from a debugging perspective.
        */
      switch (atariKey) {
        case ATARI_KEY_START:
          startKey = state;
          digitalWrite(ATARI_PIN_START, state);
          break;
          
        case ATARI_KEY_SELECT:
          selectKey = state;
          digitalWrite(ATARI_PIN_SELECT, state);
          break;
          
        case ATARI_KEY_OPTION:
          optionKey = state;
          digitalWrite(ATARI_PIN_OPTION, state);
          break;
          
        case ATARI_KEY_RESET:
          if (pressed) {
            assertReset();
          }
          break;
      }
    }
  }
}

void handleKey(byte key, byte mod, bool pressed) {
  if (pressed && altPressed && (key == 0x4d)) {
    dumpState();  
  }
  else {
    key = pgm_read_byte_near(keyMap + key);

    if (key) {
      keyAction(key, pressed);
    }
  }
}

#ifdef DEBUG

/*
 * Dump internal state to serial port
 */
void dumpState() {
  static char *names[] = {
    " A ", " S ", " G ", " cl", " nk", " D ", " H ", " F ",
    " > ", " < ", " 8 ", "del", " 7 ", " 0 ", " nk", " 9 ",
    " Q ", " W ", " T ", "tab", " Y ", " E ", " nk", " R ",
    "inv", " / ", " M ", " nk", " N ", " st", " sp", " , ",
    " 1 ", " 2 ", " 5 ", "esc", " 6 ", " 3 ", " nk", " 4 ",
    " Z ", " X ", " B ", " nk", " nk", " C ", "hlp", " V ",
    " = ", " - ", " I ", "ret", " U ", " P ", " nk", " O ",
    " * ", " + ", " K ", " nk", " nk", " ; ", " J ", " L "
    };


  Serial.println("Keyboard state:");

  Serial.print(" USB modifiers: ");
  Serial.print(controlPressed?"CTRL ":"");
  Serial.print(shiftPressed?"SHIFT ":"");
  Serial.print(altPressed?"ALT ":"");
  Serial.println(winPressed?"WIN":"");

  if (resetInProgress) {
      unsigned long now = millis();
      Serial.print("RESET  Asserted: ");
      Serial.print(now - resetAssertedTime);
      Serial.println(" mS");
  }
  else {
    Serial.println("RESET  Inactive");
  }

  Serial.print("START  ");
  Serial.println(startKey==SWITCH_CLOSED?"Asserted":"Inactive");

  Serial.print("SELECT ");
  Serial.println(selectKey==SWITCH_CLOSED?"Asserted":"Inactive");

  Serial.print("OPTION ");
  Serial.println(optionKey==SWITCH_CLOSED?"Asserted":"Inactive");

  Serial.println();

  Serial.println("KR1 8x8                       KR2 1x8");
  Serial.println("matrix:                       matrix:");
  for (int row=0; row<8; row++) {
    for (int col=0; col<8; col++) {
      Serial.print(kr1Matrix[(row*8)+col]==SWITCH_CLOSED?names[(row*8)+col]:" . ");
    }
    
    Serial.println(kr2Matrix[row]==SWITCH_CLOSED?"      X":"      .");
  }

  Serial.println();
}
#endif
