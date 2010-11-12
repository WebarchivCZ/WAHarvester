/*
 * This file is part of the WA Harvester.
 *
 * Licensed to the WebArchiv (WA) by Adam Brokes
 *
 * The IA licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * 2010
 */

/**
 * Styleswitch stylesheet switcher built on jQuery
 * Under an Attribution, Share Alike License
 * By Kelvin Luck ( http://www.kelvinluck.com/ )
 **/

(function($) {
    $(document).ready(function() {
        $('.styleswitch').click(function() {
            switchStylestyle(this.getAttribute("rel"));
            return false;
        });
        var c = readCookie('style');
        if (c) switchStylestyle(c);
    });

    function switchStylestyle(styleName) {
        $('link[@rel*=style][title]').each(function(i) {
            this.disabled = true;
            if (this.getAttribute('title') == styleName) this.disabled = false;
        });
        createCookie('style', styleName, 365);
    }
})(jQuery);
// cookie functions http://www.quirksmode.org/js/cookies.html
function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}
function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}
function eraseCookie(name) {
    createCookie(name, "", -1);
}
// /cookie functions