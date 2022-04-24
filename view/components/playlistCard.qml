import QtQuick 2.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

Item {
    id:item
    width: 345
    height: 345
    property alias internal:internal

    property int id:0
    property string pathImage:""
    property string title:"TITULO FAKE"

    property var playlist:{
        "id":0,
        "name":"fulano",
        "pathImage":"aaaaa"
    }

    signal editCard(int id)
    signal deleteCard(int id)

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
        color: "transparent"
        radius:10

        Rectangle{
            id:imageRect
            height: parent.height - bottomBar.height
            width: parent.width
            radius:10
            color:"white"
            //clip:true
            anchors{
                top: parent.top
                left: parent.left
            }
            Image{
                visible: true
                id:image
                source: item.pathImage
                height: imageRect.height
                fillMode: Image.Stretch
                width: parent.width
                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: imageRect
                }
            }
        }

//        MouseArea{
//            anchors.fill: parent
//            hoverEnabled: true
//            onClicked: console.log("cliquei")
//        }

        Rectangle{
            id:radiusRepair
            color: grayGradientColor
            width: bottomBar.width
            height: 20
            anchors{
                verticalCenter: imageRect.bottom
                horizontalCenter: imageRect.horizontalCenter
            }
        }
        Rectangle{
            id:bottomBar
            height: parent.height * 0.35
            width: parent.width
            gradient: Gradient{
                GradientStop{position:0.2 ; color: grayGradientColor}
                GradientStop{position:1.0 ; color: secondColor}
            }
            //color: "black"
            radius:10
            Row{
                spacing:10
                padding: 10
                anchors.fill: parent
                Text{
                    id:playListTitle
                    text:item.title
                    color:mainColor
                    width: parent.width * 0.7
                    wrapMode: Text.WrapAnywhere
                    font{
                        pixelSize: 20
                        family: openSans.name
                    }
                }
                Column{
                    height: parent.height
                    width: parent.width * 0.3
                    clip: true
                    spacing:20

                    V_Button{
                        height: parent.height * 0.3
                        width: parent.width * 0.7
                        buttonText:""
                        backgroundColor: "transparent"
                        icon.source: "qrc:/view/assets/images/edit.svg"
                        icon.color: mainColor
                        onClicked: editCard(id)
                    }
                    V_Button{
                        height: parent.height * 0.3
                        width: parent.width * 0.7
                        buttonText:""
                        backgroundColor: "transparent"
                        icon.source: "qrc:/view/assets/images/delete.svg"
                        icon.color: mainColor
                        onClicked: deleteCard(id)
                    }
                }
            }
            anchors{
                bottom: parent.bottom
                left: parent.left
            }
        }
    }
}
