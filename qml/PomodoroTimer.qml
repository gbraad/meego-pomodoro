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
    // Declare properties for use by logic
    property bool activeTimer: false
    property int heartbeatInterval: 1000;
    property alias text : displayText.text

    id: timer
    color: "black"
    // Setting size according to parent or fixed (depends on startup)
    width: parent === undefined ? parent.width: 240
    height: parent === undefined ? parent.height: width / 3

    // Timer for keeping 1-second interval
    Timer {
        id: heartbeat
        interval: heartbeatInterval
        running: activeTimer
        repeat: true
        // Trigger logic on heartbeat interval
        onTriggered: { TimerLogic.triggerTimer() }
    }
    // Text label for timer display
    Text {
        id: displayText
        color: "white"
        // FontSize is based on the orientation and size (dirty hack, magic values)
        font.pointSize: parent.width > parent.height ? parent.height / 4 : parent.width / 7
        // Initial state
        text: "[-] --:--"
        anchors.centerIn: parent
    }
    // Create clickable area to toggle timer
    MouseArea {
        anchors.fill: parent
        onClicked: { TimerLogic.toggleTimer() }
    }
}
