import QtQuick 2.15
import QtQuick.Controls 2.12

Item {
    id:item
    width: 345
    height: 345
    property alias internal:internal

    property int id:0
    property string pathImage:""
    property string title:"TITULO FAKE"

    QtObject{
        id:internal
        function load(id, pathImage, title){
            item.id = id
            item.pathImage = pathImage
            item.title = title
        }
    }
    Rectangle{
        id:background
        anchors.fill: parent
        clip: true
        color: "#EEEEEE"
        Image{
            id:image
            height: parent.height - bottomBar.height
            width: parent.width
            source: item.pathImage
            fillMode: Image.Stretch
            anchors{
                top: parent.top
                left: parent.left
            }
        }
        Rectangle{
            id:bottomBar
            height: 132
            width: parent.width
            color: "#9F9999"
            Text{
                id:playListTitle
                text:item.title
                font{
                    pixelSize: 40
                    family: openSans.name
                }
                anchors{
                    left:parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }
            }
            anchors{
                bottom: parent.bottom
                left: parent.left
            }
        }
    }
}
