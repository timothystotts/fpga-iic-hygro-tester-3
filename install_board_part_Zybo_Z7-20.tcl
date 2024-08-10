# Install the board part for Zybo Z7-20

# You will need to replace the path portion /username/ with your own user login path under C:/Users/
#set_param board.repoPaths {C:/Users/username/AppData/Roaming/Xilinx/Vivado/2021.2/xhub/board_store/xilinx_board_store}
set_param board.repoPaths {/home/username/.Xilinx/Vivado/2021.2/xhub/board_store/xilinx_board_store}
xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]

# If the part is already installed, but out of date, use the xhub::update command instead.
xhub::install [xhub::get_xitems digilentinc.com:xilinx_board_store:zybo-z7-20:1.0]
#xhub::update [xhub::get_xitems digilentinc.com:xilinx_board_store:zybo-z7-20:1.0]
