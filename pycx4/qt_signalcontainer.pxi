# Signal container to bypass inheritance from QObject
# to be encapsulated in Qt channel-like classes
class SignalContainer(QObject):
    signal = pyqtSignal(object)
    def __init__(self):
        super().__init__()
        # next lines is possible after initialization
        self.connect = self.signal.connect
        self.disconnect = self.signal.disconnect
        self.emit = self.signal.emit


# conpile-time define for contitional compilation
DEF SIGNAL_IMPL='Qt'
Signal = SignalContainer
