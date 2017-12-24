#!/usr/bin/env python

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
"""
A script that uses *wmctrl* command to present the workspaces as positioned on a
X_WORKSPACESxY_WORKSPACES flat torus: periodic in x- and y-coordinate.
Indexing is row-major; this script combines well with the plugin
https://cinnamon-spices.linuxmint.com/applets/view/116
"""

import os
import re
from optparse import OptionParser

# os.system('wmctrl -s 3')
# wmctrl -r :ACTIVE: -t NUM wmctrl -s NUM


def get_current_desktop():
    desktopstring = os.popen('wmctrl -d').read()
    regcurrent = re.compile(r"\d+.*\*")
    regdigits = re.compile(r"\d+")
    strcurrentspan = regcurrent.search(desktopstring).span()
    strcurrent = desktopstring[strcurrentspan[0]:strcurrentspan[1]]
    strdigitsspan = regdigits.match(strcurrent).span()
    strdigits = strcurrent[strdigitsspan[0]:strdigitsspan[1]]
    return int(strdigits)


def set_current_desktop(n):
    s = str(n)
    os.system('wmctrl -s ' + s)


def move_to_desktop(n):
    s = str(n)
    os.system('wmctrl -r :ACTIVE: -t ' + s + ' && wmctrl -s ' + s)


def get_options(parser):
    """ Define command line options."""
    parser.add_option(
        "-d", "--desktop", dest="desktop", default=None,
        help="Jump to an adjacent workspace, given by 'up', 'down', 'left', 'right'.")
    parser.add_option(
        "-t",
        "--todesktop",
        dest="todesktop",
        default=None,
        help="Move the current window to an adjacent workspace, given by 'up', 'down', 'left', 'right'.")
    parser.add_option(
        "-x",
        "--xworkspaces",
        dest="xworkspaces",
        default=2,
        help="The number of columns in the workspace grid. Default: 2.")
    parser.add_option(
        "-y",
        "--yworkspaces",
        dest="yworkspaces",
        default=2,
        help="The number of rows in the workspace grid. Default: 2.")
    options, args = parser.parse_args()
    return options.desktop, options.todesktop, options.xworkspaces, options.yworkspaces


def numerize(inp, X_WORKSPACES):
    return {
        'left': X_WORKSPACES-1,
        'right': 1,
        'up': -X_WORKSPACES,
        'down': X_WORKSPACES
    }.get(inp, 0)


def gridparse(cdesk, X_WORKSPACES):
    cdeskx = cdesk % X_WORKSPACES
    cdesky = (cdesk - cdeskx) // X_WORKSPACES
    return cdeskx, cdesky


def main(desktop, todesktop, X_WORKSPACES, Y_WORKSPACES):
    if desktop is not None:
        cdesk = get_current_desktop()
        cdeskx, cdesky = gridparse(cdesk, X_WORKSPACES)
        delta = numerize(desktop, X_WORKSPACES)
        deltax, deltay = gridparse(delta, X_WORKSPACES)
        cdeskx = (cdeskx + deltax) % X_WORKSPACES
        cdesky = (cdesky + deltay) % Y_WORKSPACES
        cdesk = cdesky * X_WORKSPACES + cdeskx
        set_current_desktop(cdesk)
    elif todesktop is not None:
        cdesk = get_current_desktop()
        cdeskx, cdesky = gridparse(cdesk, X_WORKSPACES)
        delta = numerize(todesktop, X_WORKSPACES)
        deltax, deltay = gridparse(delta, X_WORKSPACES)
        cdeskx = (cdeskx + deltax) % X_WORKSPACES
        cdesky = (cdesky + deltay) % Y_WORKSPACES
        cdesk = cdesky * X_WORKSPACES + cdeskx
        move_to_desktop(cdesk)

if __name__ == "__main__":
    parser = OptionParser()
    desktop, todesktop, X_WORKSPACES, Y_WORKSPACES = get_options(parser)
    print(desktop)
    print(todesktop)
    main(desktop, todesktop, int(X_WORKSPACES), int(Y_WORKSPACES))
