QT += quick quickcontrols2 sql core

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        initialization.cpp \
        logic/database/controllers/playlistcontroller.cpp \
        logic/database/database.cpp \
        logic/database/models/audio.cpp \
        logic/database/models/playlist.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    initialization.h \
    logic/database/controllers/playlistcontroller.h \
    logic/database/database.h \
    logic/database/models/audio.h \
    logic/database/models/playlist.h

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/release/ -lviniciusql
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/debug/ -lviniciusql
else:unix: LIBS += -L$$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/ -lviniciusql

INCLUDEPATH += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/release
DEPENDPATH += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/release

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/release/libviniciusql.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/debug/libviniciusql.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/release/viniciusql.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/debug/viniciusql.lib
else:unix: PRE_TARGETDEPS += $$PWD/../build-viniciusql-Desktop_Qt_5_15_2_MinGW_64_bit-Release/libviniciusql.a
