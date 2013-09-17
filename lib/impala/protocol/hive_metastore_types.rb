#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'fb303_types'


module Impala
  module Protocol
    module HiveMetastore
      module HiveObjectType
        GLOBAL = 1
        DATABASE = 2
        TABLE = 3
        PARTITION = 4
        COLUMN = 5
        VALUE_MAP = {1 => "GLOBAL", 2 => "DATABASE", 3 => "TABLE", 4 => "PARTITION", 5 => "COLUMN"}
        VALID_VALUES = Set.new([GLOBAL, DATABASE, TABLE, PARTITION, COLUMN]).freeze
      end

      module PrincipalType
        USER = 1
        ROLE = 2
        GROUP = 3
        VALUE_MAP = {1 => "USER", 2 => "ROLE", 3 => "GROUP"}
        VALID_VALUES = Set.new([USER, ROLE, GROUP]).freeze
      end

      module PartitionEventType
        LOAD_DONE = 1
        VALUE_MAP = {1 => "LOAD_DONE"}
        VALID_VALUES = Set.new([LOAD_DONE]).freeze
      end

      class Version
        include ::Thrift::Struct, ::Thrift::Struct_Union
        VERSION = 1
        COMMENTS = 2

        FIELDS = {
          VERSION => {:type => ::Thrift::Types::STRING, :name => 'version'},
          COMMENTS => {:type => ::Thrift::Types::STRING, :name => 'comments'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class FieldSchema
        include ::Thrift::Struct, ::Thrift::Struct_Union
        NAME = 1
        TYPE = 2
        COMMENT = 3

        FIELDS = {
          NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
          TYPE => {:type => ::Thrift::Types::STRING, :name => 'type'},
          COMMENT => {:type => ::Thrift::Types::STRING, :name => 'comment'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Type
        include ::Thrift::Struct, ::Thrift::Struct_Union
        NAME = 1
        TYPE1 = 2
        TYPE2 = 3

        FIELDS = {
          NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
          TYPE1 => {:type => ::Thrift::Types::STRING, :name => 'type1', :optional => true},
          TYPE2 => {:type => ::Thrift::Types::STRING, :name => 'type2', :optional => true}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class HiveObjectRef
        include ::Thrift::Struct, ::Thrift::Struct_Union
        OBJECTTYPE = 1
        DBNAME = 2
        OBJECTNAME = 3
        PARTVALUES = 4
        COLUMNNAME = 5

        FIELDS = {
          OBJECTTYPE => {:type => ::Thrift::Types::I32, :name => 'objectType', :enum_class => ::Impala::Protocol::HiveMetastore::HiveObjectType},
          DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
          OBJECTNAME => {:type => ::Thrift::Types::STRING, :name => 'objectName'},
          PARTVALUES => {:type => ::Thrift::Types::LIST, :name => 'partValues', :element => {:type => ::Thrift::Types::STRING}},
          COLUMNNAME => {:type => ::Thrift::Types::STRING, :name => 'columnName'}
        }

        def struct_fields; FIELDS; end

        def validate
          unless @objectType.nil? || ::Impala::Protocol::HiveMetastore::HiveObjectType::VALID_VALUES.include?(@objectType)
            raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field objectType!')
          end
        end

        ::Thrift::Struct.generate_accessors self
      end

      class PrivilegeGrantInfo
        include ::Thrift::Struct, ::Thrift::Struct_Union
        PRIVILEGE = 1
        CREATETIME = 2
        GRANTOR = 3
        GRANTORTYPE = 4
        GRANTOPTION = 5

        FIELDS = {
          PRIVILEGE => {:type => ::Thrift::Types::STRING, :name => 'privilege'},
          CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
          GRANTOR => {:type => ::Thrift::Types::STRING, :name => 'grantor'},
          GRANTORTYPE => {:type => ::Thrift::Types::I32, :name => 'grantorType', :enum_class => ::Impala::Protocol::HiveMetastore::PrincipalType},
          GRANTOPTION => {:type => ::Thrift::Types::BOOL, :name => 'grantOption'}
        }

        def struct_fields; FIELDS; end

        def validate
          unless @grantorType.nil? || ::Impala::Protocol::HiveMetastore::PrincipalType::VALID_VALUES.include?(@grantorType)
            raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field grantorType!')
          end
        end

        ::Thrift::Struct.generate_accessors self
      end

      class HiveObjectPrivilege
        include ::Thrift::Struct, ::Thrift::Struct_Union
        HIVEOBJECT = 1
        PRINCIPALNAME = 2
        PRINCIPALTYPE = 3
        GRANTINFO = 4

        FIELDS = {
          HIVEOBJECT => {:type => ::Thrift::Types::STRUCT, :name => 'hiveObject', :class => ::Impala::Protocol::HiveMetastore::HiveObjectRef},
          PRINCIPALNAME => {:type => ::Thrift::Types::STRING, :name => 'principalName'},
          PRINCIPALTYPE => {:type => ::Thrift::Types::I32, :name => 'principalType', :enum_class => ::Impala::Protocol::HiveMetastore::PrincipalType},
          GRANTINFO => {:type => ::Thrift::Types::STRUCT, :name => 'grantInfo', :class => ::Impala::Protocol::HiveMetastore::PrivilegeGrantInfo}
        }

        def struct_fields; FIELDS; end

        def validate
          unless @principalType.nil? || ::Impala::Protocol::HiveMetastore::PrincipalType::VALID_VALUES.include?(@principalType)
            raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field principalType!')
          end
        end

        ::Thrift::Struct.generate_accessors self
      end

      class PrivilegeBag
        include ::Thrift::Struct, ::Thrift::Struct_Union
        PRIVILEGES = 1

        FIELDS = {
          PRIVILEGES => {:type => ::Thrift::Types::LIST, :name => 'privileges', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::HiveObjectPrivilege}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class PrincipalPrivilegeSet
        include ::Thrift::Struct, ::Thrift::Struct_Union
        USERPRIVILEGES = 1
        GROUPPRIVILEGES = 2
        ROLEPRIVILEGES = 3

        FIELDS = {
          USERPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'userPrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::PrivilegeGrantInfo}}},
          GROUPPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'groupPrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::PrivilegeGrantInfo}}},
          ROLEPRIVILEGES => {:type => ::Thrift::Types::MAP, :name => 'rolePrivileges', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::LIST, :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::PrivilegeGrantInfo}}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Role
        include ::Thrift::Struct, ::Thrift::Struct_Union
        ROLENAME = 1
        CREATETIME = 2
        OWNERNAME = 3

        FIELDS = {
          ROLENAME => {:type => ::Thrift::Types::STRING, :name => 'roleName'},
          CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
          OWNERNAME => {:type => ::Thrift::Types::STRING, :name => 'ownerName'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Database
        include ::Thrift::Struct, ::Thrift::Struct_Union
        NAME = 1
        DESCRIPTION = 2
        LOCATIONURI = 3
        PARAMETERS = 4
        PRIVILEGES = 5

        FIELDS = {
          NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
          DESCRIPTION => {:type => ::Thrift::Types::STRING, :name => 'description'},
          LOCATIONURI => {:type => ::Thrift::Types::STRING, :name => 'locationUri'},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
          PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::Impala::Protocol::HiveMetastore::PrincipalPrivilegeSet, :optional => true}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SerDeInfo
        include ::Thrift::Struct, ::Thrift::Struct_Union
        NAME = 1
        SERIALIZATIONLIB = 2
        PARAMETERS = 3

        FIELDS = {
          NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
          SERIALIZATIONLIB => {:type => ::Thrift::Types::STRING, :name => 'serializationLib'},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Order
        include ::Thrift::Struct, ::Thrift::Struct_Union
        COL = 1
        ORDER = 2

        FIELDS = {
          COL => {:type => ::Thrift::Types::STRING, :name => 'col'},
          ORDER => {:type => ::Thrift::Types::I32, :name => 'order'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class StorageDescriptor
        include ::Thrift::Struct, ::Thrift::Struct_Union
        COLS = 1
        LOCATION = 2
        INPUTFORMAT = 3
        OUTPUTFORMAT = 4
        COMPRESSED = 5
        NUMBUCKETS = 6
        SERDEINFO = 7
        BUCKETCOLS = 8
        SORTCOLS = 9
        PARAMETERS = 10

        FIELDS = {
          COLS => {:type => ::Thrift::Types::LIST, :name => 'cols', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::FieldSchema}},
          LOCATION => {:type => ::Thrift::Types::STRING, :name => 'location'},
          INPUTFORMAT => {:type => ::Thrift::Types::STRING, :name => 'inputFormat'},
          OUTPUTFORMAT => {:type => ::Thrift::Types::STRING, :name => 'outputFormat'},
          COMPRESSED => {:type => ::Thrift::Types::BOOL, :name => 'compressed'},
          NUMBUCKETS => {:type => ::Thrift::Types::I32, :name => 'numBuckets'},
          SERDEINFO => {:type => ::Thrift::Types::STRUCT, :name => 'serdeInfo', :class => ::Impala::Protocol::HiveMetastore::SerDeInfo},
          BUCKETCOLS => {:type => ::Thrift::Types::LIST, :name => 'bucketCols', :element => {:type => ::Thrift::Types::STRING}},
          SORTCOLS => {:type => ::Thrift::Types::LIST, :name => 'sortCols', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::Order}},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Table
        include ::Thrift::Struct, ::Thrift::Struct_Union
        TABLENAME = 1
        DBNAME = 2
        OWNER = 3
        CREATETIME = 4
        LASTACCESSTIME = 5
        RETENTION = 6
        SD = 7
        PARTITIONKEYS = 8
        PARAMETERS = 9
        VIEWORIGINALTEXT = 10
        VIEWEXPANDEDTEXT = 11
        TABLETYPE = 12
        PRIVILEGES = 13

        FIELDS = {
          TABLENAME => {:type => ::Thrift::Types::STRING, :name => 'tableName'},
          DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
          OWNER => {:type => ::Thrift::Types::STRING, :name => 'owner'},
          CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
          LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
          RETENTION => {:type => ::Thrift::Types::I32, :name => 'retention'},
          SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::Impala::Protocol::HiveMetastore::StorageDescriptor},
          PARTITIONKEYS => {:type => ::Thrift::Types::LIST, :name => 'partitionKeys', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::FieldSchema}},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
          VIEWORIGINALTEXT => {:type => ::Thrift::Types::STRING, :name => 'viewOriginalText'},
          VIEWEXPANDEDTEXT => {:type => ::Thrift::Types::STRING, :name => 'viewExpandedText'},
          TABLETYPE => {:type => ::Thrift::Types::STRING, :name => 'tableType'},
          PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::Impala::Protocol::HiveMetastore::PrincipalPrivilegeSet, :optional => true}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Partition
        include ::Thrift::Struct, ::Thrift::Struct_Union
        VALUES = 1
        DBNAME = 2
        TABLENAME = 3
        CREATETIME = 4
        LASTACCESSTIME = 5
        SD = 6
        PARAMETERS = 7
        PRIVILEGES = 8

        FIELDS = {
          VALUES => {:type => ::Thrift::Types::LIST, :name => 'values', :element => {:type => ::Thrift::Types::STRING}},
          DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
          TABLENAME => {:type => ::Thrift::Types::STRING, :name => 'tableName'},
          CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
          LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
          SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::Impala::Protocol::HiveMetastore::StorageDescriptor},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
          PRIVILEGES => {:type => ::Thrift::Types::STRUCT, :name => 'privileges', :class => ::Impala::Protocol::HiveMetastore::PrincipalPrivilegeSet, :optional => true}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Index
        include ::Thrift::Struct, ::Thrift::Struct_Union
        INDEXNAME = 1
        INDEXHANDLERCLASS = 2
        DBNAME = 3
        ORIGTABLENAME = 4
        CREATETIME = 5
        LASTACCESSTIME = 6
        INDEXTABLENAME = 7
        SD = 8
        PARAMETERS = 9
        DEFERREDREBUILD = 10

        FIELDS = {
          INDEXNAME => {:type => ::Thrift::Types::STRING, :name => 'indexName'},
          INDEXHANDLERCLASS => {:type => ::Thrift::Types::STRING, :name => 'indexHandlerClass'},
          DBNAME => {:type => ::Thrift::Types::STRING, :name => 'dbName'},
          ORIGTABLENAME => {:type => ::Thrift::Types::STRING, :name => 'origTableName'},
          CREATETIME => {:type => ::Thrift::Types::I32, :name => 'createTime'},
          LASTACCESSTIME => {:type => ::Thrift::Types::I32, :name => 'lastAccessTime'},
          INDEXTABLENAME => {:type => ::Thrift::Types::STRING, :name => 'indexTableName'},
          SD => {:type => ::Thrift::Types::STRUCT, :name => 'sd', :class => ::Impala::Protocol::HiveMetastore::StorageDescriptor},
          PARAMETERS => {:type => ::Thrift::Types::MAP, :name => 'parameters', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}},
          DEFERREDREBUILD => {:type => ::Thrift::Types::BOOL, :name => 'deferredRebuild'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Schema
        include ::Thrift::Struct, ::Thrift::Struct_Union
        FIELDSCHEMAS = 1
        PROPERTIES = 2

        FIELDS = {
          FIELDSCHEMAS => {:type => ::Thrift::Types::LIST, :name => 'fieldSchemas', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Impala::Protocol::HiveMetastore::FieldSchema}},
          PROPERTIES => {:type => ::Thrift::Types::MAP, :name => 'properties', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class EnvironmentContext
        include ::Thrift::Struct, ::Thrift::Struct_Union
        PROPERTIES = 1

        FIELDS = {
          PROPERTIES => {:type => ::Thrift::Types::MAP, :name => 'properties', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class MetaException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class UnknownTableException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class UnknownDBException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class AlreadyExistsException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class InvalidPartitionException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class UnknownPartitionException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class InvalidObjectException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class NoSuchObjectException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class IndexAlreadyExistsException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class InvalidOperationException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ConfigValSecurityException < ::Thrift::Exception
        include ::Thrift::Struct, ::Thrift::Struct_Union
        def initialize(message=nil)
          super()
          self.message = message
        end

        MESSAGE = 1

        FIELDS = {
          MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

    end
  end
end
