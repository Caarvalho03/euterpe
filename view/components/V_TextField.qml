import QtQuick 2.15
import QtQuick.Controls 2.15



TextField{
    id:field
    property string labelText: "Nome"
    height: 50
    width: 300

    color:mainColor
    placeholderTextColor: mainColor

    property bool texting: false
    onTextChanged: texting = text.length > 0? true : false
    placeholderText: labelText
    font{
        pixelSize: 20
        family: openSans.name
    }
    background: Rectangle{
        anchors.fill: field
        color: "transparent"
        radius:10
        border{
            color: mainColor
            width: 2
        }
    }
    Item{
        visible: field.texting
        width: label.width * 1.3
        height:20
        anchors{
            left: field.left
            leftMargin: 15
            verticalCenter: field.top
        }
        Rectangle{
            color: grayGradientColor
            anchors.fill: parent
            Text{
                id:label
                text:labelText
                color:mainColor
                anchors.centerIn: parent
                font{
                    pixelSize: 15
                    family: openSans.name
                }
            }
        }
    }
}


