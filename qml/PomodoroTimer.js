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

// Declare variables
var _timeSpent = 0;
var _timePomodoro = 1500; // 25 minutes * seconds
var _minutes = 0;
var _seconds = 0;
var _sessionCount = 0;

// Toggle timer state and reset variables
function toggleTimer() {
    // Toggle timer
    timer.activeTimer = (timer.activeTimer == true) ? false : true

    // Reset variables
    this._timeSpent = 0;
    this._minutes = 0;
    this._seconds = 0;
    // Leave sessioncount

    // Set display test
    timer.text = "[" + this._sessionCount + "] " + "--:--";
}

// Trigger timer logic (used by timer interval)
function triggerTimer() {
    // Increase timer
    this._timeSpent += 1;

    // Session increase
    if (this._timeSpent > _timePomodoro) {

        this._timeSpent = 0;
        this._sessionCount += 1;
    }

    // Parse variables from time spent
    this._minutes = parseInt(this._timeSpent / 60);
    this._seconds = this._timeSpent - (this._minutes * 60);

    // Weird way to show 2-digit number, but js doesn't have a native padding function
    if (this._minutes < 10)
        this._minutes = "0" + this._minutes.toString();
    else
        this._minutes = this._minutes.toString();

    if (this._seconds < 10)
        this._seconds = "0" + this._seconds.toString();
    else
        this._seconds = this._seconds.toString();

    // Set display text
    timer.text = "[" + this._sessionCount + "] " + this._minutes + ":" + this._seconds;
}
