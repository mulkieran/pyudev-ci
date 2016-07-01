#!/bin/bash
# vim: dict+=/usr/share/beakerlib/dictionary.vim cpt=.,w,b,u,t,i,k
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   runtest.sh of /tools/beaker/Library/Runs-pyudev-test-suite
#   Description: Runs pyudev test suite.
#   Author: the mulhern <amulhern@redhat.com>
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   Copyright (c) 2016 Red Hat, Inc.
#
#   This program is free software: you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation, either version 2 of
#   the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be
#   useful, but WITHOUT ANY WARRANTY; without even the implied
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#   PURPOSE.  See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see http://www.gnu.org/licenses/.
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Include Beaker environment
. /usr/bin/rhts-environment.sh || exit 1
. /usr/share/beakerlib/beakerlib.sh || exit 1

PHASE=${PHASE:-Test}

rlJournalStart
    rlPhaseStartTest
        rlRun "git clone https://github.com/pyudev/pyudev.git"
        rlRun "cd pyudev"
        rlRun "git fetch origin pull/190/head:190"
        rlRun "git checkout 190"
        rlRun "tox -e py27"
        rlRun "cd .."
    rlPhaseEnd
rlJournalPrintText
rlJournalEnd
