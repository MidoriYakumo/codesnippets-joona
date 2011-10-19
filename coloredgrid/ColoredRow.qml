import QtQuick 1.0

Row {
    property real weight
    property real count: 50
    width: 800; height: 400
    Component.onCompleted: {
        var ratioCount = 0
        for (var index = 0; index < children.length; index++) {
            if (children[index] !== repeater)
                ratioCount += children[index].ratio
        }
        weight = width/ratioCount
    }
    Repeater {
        id: repeater
        model: parent.count
        Rectangle {
            height: parent.height
            color: Qt.rgba(blue ? 0.5*grayness+0.5*Math.random()*grayness : grayness,
                           blue ? grayness+0.6*Math.random()*(1-grayness) : 1.3*grayness,
                           blue ? 0.7*grayness+0.3*Math.random()*grayness : 1.3*grayness)
            width: Math.ceil(ratio*weight)
            property real grayness: 0.2+0.6*Math.random()
            property real value: Math.random()
            property bool blue: value < 0.2
            property real ratio: Math.pow(Math.random(),3)
        }
    }
}