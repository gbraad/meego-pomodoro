// A simple Pomodoro timer
// Copyright (C) 2011 Gerard Braad <me@gbraad.nl>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import QtQuick 1.0
import "PomodoroTimer.js" as TimerLogic

Rectangle {
    property bool activeTimer: false
    property int heartbeatInterval: 1000;
    property alias text : displayText.text

    id: timer
    width: parent === undefined ? parent.width: 240
    height: parent === undefined ? parent.height: width / 3
    color: "black"

    Timer {
        id: heartbeat
        interval: heartbeatInterval
        running: activeTimer
        repeat: true
        onTriggered: { TimerLogic.triggerTimer() }
    }
    Text {
        id: displayText
        color: "white"
        font.pointSize: parent.height / 4
        text: "[-] --:--"
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: { TimerLogic.toggleTimer() }
    }
}
