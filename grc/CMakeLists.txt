# Copyright 2011 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

# Build hier blocks
list(APPEND grc_hier_blocks
    detector_single_lag_autocorrelation
)
foreach(hier_block ${grc_hier_blocks})
    add_custom_target(
        ${hier_block}
        ALL
        COMMAND grcc ${hier_block}.grc
        DEPENDS ${hier_block}.grc
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Generating GNU Radio Hier Block ${hier_block}"
    )
endforeach()

install(FILES
    DESTINATION share/gnuradio/grc/blocks
)
