import nc
import iso_modal
import math
import datetime
import time

now = datetime.datetime.now()

class Creator(iso_modal.Creator):
    def __init__(self):
        iso_modal.Creator.__init__(self)
        self.output_block_numbers = False
        self.output_tool_definitions = False
        #self.output_g43_on_tool_change_line = True
        self.drillExpanded = True

    def SPACE(self):
        if self.start_of_line == True:
            self.start_of_line = False
            return ''
        else:
            return ' '

    def PROGRAM(self): return None
    def PROGRAM_END(self): return( 'T0' + self.SPACE() + 'M06' + self.SPACE() + 'M05')

        
############################################################################
## Begin Program 

    def program_begin(self, id, comment):
        self.write( ('(Created with GRBL post processor ' + str(now.strftime("%Y/%m/%d %H:%M")) + ')' + '\n') )
        iso_modal.Creator.program_begin(self, id, comment)

nc.creator = Creator()

