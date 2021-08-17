import sys
import psycopg2

from PyQt5.QtWidgets import QApplication
from PyQt5.QtWidgets import QDialog, QVBoxLayout, QLabel, QTextEdit

dbname = 'terkas'
username = 'postgres'
password = 'monrepo'


class Dialog(QDialog):
    def __init__(self):
        QDialog.__init__(self)

        self.conn = None

        try:
            self.conn = psycopg2.connect(
                database=dbname,
                host='localhost',
                user=username,
                password=password
            )

            cur = self.conn.cursor()
            cur.execute('SELECT version()')

            version = cur.fetchone()[0]
            print(version)

        except psycopg2.DatabaseError as error:
            print(f'Error {error}')
            sys.exit(1)

        finally:
            if self.conn:
                self.conn.close()

        label = QLabel('TEST')

        layout = QVBoxLayout()
        layout.addWidget(label)
        self.setLayout(layout)


if __name__ == "__main__":
    app = QApplication([])
    window = Dialog()
    window.show()
    sys.exit(app.exec_())
