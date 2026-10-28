
#include <qt6/QtGui/QGuiApplication>
#include <qt6/QtCore/QDebug>
#include <qt6/QtCore/QObject>

/* Test class */

class CoreShell : public QObject {
    Q_OBJECT
public:
    explicit CoreShell( QObject* parent = nullptr ) : QObject( parent ) {
        qDebug( ) << "CoreShell initialized";
    }
};

#include "main.moc"

int main( int argc, char *argv[ ] ) {
    QGuiApplication app( argc, argv );
    CoreShell shell;

    qDebug( ) << "Event loop ready...";
    return app.exec( );
}
