#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Impala
  module Protocol
    module Fb303
      module Fb_status
        DEAD = 0
        STARTING = 1
        ALIVE = 2
        STOPPING = 3
        STOPPED = 4
        WARNING = 5
        VALUE_MAP = {0 => "DEAD", 1 => "STARTING", 2 => "ALIVE", 3 => "STOPPING", 4 => "STOPPED", 5 => "WARNING"}
        VALID_VALUES = Set.new([DEAD, STARTING, ALIVE, STOPPING, STOPPED, WARNING]).freeze
      end

    end
  end
end
