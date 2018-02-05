#define DEBUG

// The PS2 keyboard signals
/*
 * Brown    Data
 * Red      +5v
 * Orange   Clock
 * Yellow   GND
 */
#define PS2_CLOCK_PIN 3
#define PS2_DATA_PIN 2  

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
 * Table for mapping core PS2 key codes to ATARI keyboard codes.
 * 
 * See the table at http://www.computer-engineering.org/ps2keyboard/scancodes2.html
 * for details of codes. Core codes are those codes which have a single byte 
 * "key pressed" code.
 */
const PROGMEM byte coreKeymap[128] = {
  ATARI_NOKEY,     ATARI_KEY_HELP,  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,    ATARI_NOKEY,      ATARI_KEY_OPTION, 
  ATARI_NOKEY,     ATARI_KEY_START, ATARI_KEY_BREAK, ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_TAB,  ATARI_NOKEY,      ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_SHIFT, ATARI_NOKEY,     ATARI_KEY_CTRL,  ATARI_KEY_Q,    ATARI_KEY_1,      ATARI_NOKEY, 
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_Z,     ATARI_KEY_S,     ATARI_KEY_A,     ATARI_KEY_W,    ATARI_KEY_2,      ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_KEY_C,     ATARI_KEY_X,     ATARI_KEY_D,     ATARI_KEY_E,     ATARI_KEY_4,    ATARI_KEY_3,      ATARI_NOKEY, 
  ATARI_NOKEY,     ATARI_KEY_SPACE, ATARI_KEY_V,     ATARI_KEY_F,     ATARI_KEY_T,     ATARI_KEY_R,    ATARI_KEY_5,      ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_KEY_N,     ATARI_KEY_B,     ATARI_KEY_H,     ATARI_KEY_G,     ATARI_KEY_Y,    ATARI_KEY_6,      ATARI_NOKEY, 
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_M,     ATARI_KEY_J,     ATARI_KEY_U,     ATARI_KEY_7,    ATARI_KEY_8,      ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_KEY_COMMA, ATARI_KEY_K,     ATARI_KEY_I,     ATARI_KEY_O,     ATARI_KEY_0,    ATARI_KEY_9,      ATARI_NOKEY, 
  ATARI_NOKEY,     ATARI_KEY_FSTOP, ATARI_KEY_SLASH, ATARI_KEY_L,     ATARI_KEY_SEMI,  ATARI_KEY_P,    ATARI_KEY_MINUS,  ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_EQ,   ATARI_NOKEY,      ATARI_NOKEY, 
  ATARI_KEY_CAPS,  ATARI_KEY_SHIFT, ATARI_KEY_RET,   ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,    ATARI_NOKEY,      ATARI_NOKEY, 
  
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,    ATARI_KEY_DEL,    ATARI_NOKEY, 
  ATARI_NOKEY,     ATARI_KEY_1,     ATARI_NOKEY,     ATARI_KEY_4,     ATARI_KEY_7,     ATARI_NOKEY,    ATARI_NOKEY,      ATARI_NOKEY, 
  
  ATARI_KEY_0,     ATARI_KEY_FSTOP, ATARI_KEY_2,     ATARI_KEY_5,     ATARI_KEY_6,     ATARI_KEY_8,    ATARI_KEY_ESC,    ATARI_NOKEY, 
  ATARI_KEY_SELECT,ATARI_KEY_PLUS,  ATARI_KEY_3,     ATARI_KEY_MINUS, ATARI_KEY_TIMES, ATARI_KEY_9,    ATARI_NOKEY,      ATARI_KEY_RESET
};

/*
 * Table for mapping core PS2 key codes to ATARI keyboard codes.
 * 
 * See the table at http://www.computer-engineering.org/ps2keyboard/scancodes2.html
 * for details of codes. Core codes are those codes which have a double byte 
 * "key pressed" code.
 */
const PROGMEM byte extendedKeymap[128] = {
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_CTRL,  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_SLASH, ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_KEY_RET,   ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,

  ATARI_KEY_BREAK, ATARI_KEY_DEL,   ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,
  ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY,     ATARI_NOKEY
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


// PS2 keyboard scan code buffer - doesn't need to be very big
#define KEY_BUFF_SIZE 4
byte keyBuff[KEY_BUFF_SIZE];
volatile int head = 0;
volatile int tail = 0; 

volatile long kChangeCount = 0;
/*
 * PS2 Clock interrupt handler
 */
ISR(PCINT2_vect) {
  static unsigned long prevIntTime = 0;
  static unsigned long now;
  static byte numBits = 0;
  static int data = 0;
  byte val;

  if (digitalRead(PS2_CLOCK_PIN) == LOW) {
    // Falling edge
    //delayMicroseconds(5);
    val = digitalRead(PS2_DATA_PIN);
  
    now = millis();
    if (now - prevIntTime > 250) {
      // Reset
      data = numBits = 0;
    }
    prevIntTime = now;

    data = (data>>1) | val<<10;
    numBits++;

    if (numBits == 11) {
      keyBuff[head] = (data>>1) & 0xff;
      head++;

      if (head >= KEY_BUFF_SIZE) {
        head = 0;
      }

      data = numBits = 0;
    }
  }
}


/* 
 * Interrupt handler for Atari keyboard row/col address outputs from
 * the POKEY. Triggered by a rising or falling edge on the K0 signal
 * from the POKEY.
 */
ISR(PCINT1_vect) {
  byte addr = PINC & 0x3f;
  byte row = addr>>3;

  kChangeCount++;
  
  digitalWrite(ATARI_PIN_KR1, kr1Matrix[addr]);
  digitalWrite(ATARI_PIN_KR2, kr2Matrix[row]);
}


/*
 * setup
 */
void setup() {
#ifdef DEBUG
  Serial.begin(57600);
  Serial.println("PS2 keyboard to Atari 8-bit translator");
  Serial.println("by Bob Green <bob@wookey.org.uk>, Jan 2018.");
  Serial.println();
#endif

  // PS2 keyboard interface
  pinMode(PS2_CLOCK_PIN, INPUT_PULLUP);
  pinMode(PS2_DATA_PIN, INPUT_PULLUP);

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

  /* 
   *  Enable interrupts on falling edge of PS2 keyboard clock change 
   */
  cli();
  PCICR |= 0b00000100;        // Enable port D pin change interrupts
  PCMSK2 |= 0b10001000;       // Port D, pin 3 will interrupt on change


  /*
   * Enable interrupts when K5:0 change, falling or rising edges
   */
  PCICR |= 0b00000010;        // Enable port C pin change interrupts
  PCMSK1 |= 0b00000001;       // Port C, pin 0 will interrupt on change
  sei();
}


/* 
 *  Mail polling loop: read PS2 keys, update virtual keyboard
 *  state.
 */
void loop() {
  byte keyCode = getKeyCode();
  bool alternative = false;
  bool pressed = true;
  byte atariKey;
  static byte pauseSequence[] = {0x14, 0x77, 0xe1, 0xf0, 0x14, 0xf0, 0x77};

  if (keyCode == 0xe1) {
    /*
     * Special case - just one key generates a 0xE1 prefix - the Pause key. There may be a 
     * cleaner way to deal with this, but this one works - kind of!
     */
    bool pause = expect(pauseSequence, 7);

    if (pause) {
      /*
       * I'm mapping the 8 byte pause key sequence to a single unused keycode, 0x7f.
       * Note. This key only ever sends a "key pressed" sequence, and never a "key released"
       */
      keyCode = 0x7f;
    }
  }
  
  while (keyCode & 0x80) {
    if (keyCode == 0xe0) {
      alternative = true;
    }
    else if (keyCode == 0xf0) {
      pressed = false;
    }

    keyCode = getKeyCode();
  }

  atariKey = (alternative)?pgm_read_byte_near(extendedKeymap + keyCode):pgm_read_byte_near(coreKeymap + keyCode);

#ifdef DEBUG
  Serial.print(pressed?"Press: ":"Release: ");
  Serial.print(keyCode, HEX);
  if (alternative) {
    Serial.print(" (ext)");
  }

  if (atariKey == ATARI_NOKEY) {
    Serial.println(" - not mapped");
  }
  else {
    Serial.print(" -> ");
    Serial.println(atariKey);
  }

  /*
   * When DEBUG is defined, pressing F1 will dump the current keyboard 
   * state data
   */
   if (pressed && !alternative && keyCode == 5) {
      dumpState();
      atariKey = ATARI_NOKEY;
   }
#endif

  // Update the virtual keyboard state with the Atari equivalent key
  //if (atariKey != ATARI_NOKEY) {
    keyAction(atariKey, pressed);
  //}
}


/*
 * Wait for a key code byte from the PS2 keyboard
 * 
 * Will block forever if no key pressed.
 * While waiting it checks to see if there is a RESET operation in progress and
 * deasserts RESET one the time defined by RESET_MILLIS
 */
byte getKeyCode() {
  byte keyCode;
  
  while (head == tail) {
    checkResetTimer();
  }
  
  keyCode = keyBuff[tail];
  tail++;

  if (tail >= KEY_BUFF_SIZE) {
    tail = 0;
  }

#ifdef DEBUG
  Serial.print(" [");
  Serial.print(keyCode, HEX);
  Serial.print("] ");
#endif

  return keyCode;
}


bool expect(const byte *bytes, int count) {
  for (int i=0; i<count; i++) {
    byte key = getKeyCode();

    if (key != bytes[i]) {
      return false;
    }
  }

  return true;
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
          assertReset();
          break;
      }
    }
  }
}


#ifdef DEBUG

/*
 * Dump internal state to serial port
 */
void dumpState() {
  Serial.println("Keyboard state:");

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
      Serial.print(kr1Matrix[(row*8)+col]==SWITCH_CLOSED?" X ":" . ");
    }
    
    Serial.println(kr2Matrix[row]==SWITCH_CLOSED?"      X":"      .");
  }

  Serial.println();

  Serial.print("K0:5 change counter: ");
  Serial.println(kChangeCount);
}
#endif
