import QtQuick 2.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

Item {
    id:item
    width: 345
    height: 345

    Rectangle{
        id:background
        anchors.fill: parent
        clip: true
        color: "#EEEEEE"
        Rectangle{
            width: 0.8 * parent.width
            height: 0.8 * parent.height
            anchors.centerIn: parent
            border{
                width: 1
                color: "gray"
            }
            color: "#EEEEEE"
            Image{
                id:plusImage
                anchors.centerIn: parent
                height: 60
                width: 60
                fillMode: Image.PreserveAspectFit
                source: "qrc:/view/assets/images/add_white.svg"
                ColorOverlay{
                    color:"gray"
                    source:parent
                    anchors.fill: parent
                }
            }
            Text{
                id:addPlayListText
                text:"Adicione uma nova playlist"
                font{
                    pixelSize: 20
                    family:openSans.name
                }
                anchors{
                    top: plusImage.bottom
                    topMargin: 10
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
