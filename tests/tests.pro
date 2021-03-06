QT       += core gui network xml testlib

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = tests
TEMPLATE = app

CONFIG -= debug
CONFIG += c++11 release

SRC_DIR = $$PWD/../redis-desktop-manager//

SOURCES += \
    $$PWD/main.cpp \
    $$PWD/source/*.cpp \
    $$SRC_DIR/source/updater/Updater.cpp \
    $$SRC_DIR/source/redis/*.cpp \
    $$SRC_DIR/source/network/*.cpp \
    $$SRC_DIR/source/models/*.cpp \
    $$SRC_DIR/source/models/items/*.cpp \
    $$SRC_DIR/source/widgets/consoleTab.cpp \

HEADERS  += \
    $$PWD/include/*.h \
    $$SRC_DIR/include/updater/Updater.h \
    $$SRC_DIR/include/redis/*.h \
    $$SRC_DIR/include/network/*.h \
    $$SRC_DIR/include/models/*.h \
    $$SRC_DIR/include/models/items/*.h \
    $$SRC_DIR/include/widgets/consoleTab.h \

release: DESTDIR = ./../bin/tests
debug:   DESTDIR = ./../bin/tests

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../deps/libs/win32/ -llibssh2
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../deps/libs/win32/ -llibssh2
else:unix: LIBS += /usr/local/lib/libssh2.so

win32:CONFIG(release, debug|release): LIBS += -lws2_32 -lkernel32 -luser32 -lshell32 -luuid -lole32 -ladvapi32
else:win32:CONFIG(debug, debug|release): LIBS += -lws2_32 -lkernel32 -luser32 -lshell32 -luuid -lole32 -ladvapi32


INCLUDEPATH += $$PWD/../deps/libssh/include
DEPENDPATH += $$PWD/../deps/libssh/include

win32:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../deps/libs/win32/libssh2.lib
else:win32:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../deps/libs/win32/libssh2.lib
else:unix: PRE_TARGETDEPS += /usr/local/lib/libssh2.so

unix:!mac {
 LIBS += -Wl,-rpath=\\\$$ORIGIN/../lib
}


INCLUDEPATH += $$PWD/source \
    $$PWD/"include" \
    $$SRC_DIR/source/models \
    $$SRC_DIR/source/models/items \
    $$SRC_DIR/source/network \
    $$SRC_DIR/source/redis \
    $$SRC_DIR/source/updater \
    $$SRC_DIR/source/widgets \
    $$SRC_DIR/"include" \
    $$SRC_DIR/include/models \
    $$SRC_DIR/include/models/items \
    $$SRC_DIR/include/network \
    $$SRC_DIR/include/redis \
    $$SRC_DIR/include/updater \
    $$SRC_DIR/include/widgets \


OTHER_FILES += \
    stubs/connections.xml
