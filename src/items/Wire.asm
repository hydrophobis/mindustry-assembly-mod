include 'jclass.inc'

format binary as 'class'

  u4 0xcafebabe         ; magic number (identifies a Java class)
  u2 0,49               ; minor and major version

  constant_pool

    _java_string constant_utf8 'Ljava/lang/String;'

    ; String constants
    _Code               constant_utf8      'Code' ; 1
    _init               constant_utf8      '<init>' ; 2
    _item_class         constant_utf8      'mindustry/type/Item' ; 3
    _item_name          constant_utf8      'wire' ; 4
    _item_color         constant_utf8      'f48c42' ; 5

    ; Class references
    Item_class          constant_class     _item_class ; 6
    Item_init           constant_methodref Item_class, _init ; 7

    ; Fields for attributes
    _name_field_name    constant_utf8   'name'
    _color_field_name   constant_utf8   'color'
    _name_field         constant_nameandtype _name_field_name,_java_string; 8
    _color_field        constant_nameandtype _color_field_name, 'I' ; 9
    Object_init         constant_methodref Object_class, _init ; 9
    Object_class        constant_utf8     'java/lang/Object'; 10
    _void               constant_utf8     '()V' ; 11

  end_constant_pool

  u2 ACC_PUBLIC+ACC_SUPER  ; access flags
  u2 Item_class            ; this class
  u2 Object_class          ; super class

  interfaces
  end_interfaces

  fields
  end_fields

  methods

     method_info ACC_PUBLIC, _init, _void  ; public void <init>()

       ; Define the attribute _Code
       ;attribute _Code

       bytecode
            aload 0 ; load 'this'
            invokespecial Object_init ; call super constructor
            aload 0 ; load 'this'
            ldc _item_name ; load item name constant
            putfield _name_field ; set name
            aload 0 ; load 'this'
            ldc _item_color ; load item color constant
            putfield _color_field ; set color
            return
       end_bytecode

       u2 0               ; exception_table_length (assuming no exceptions)
       attributes
       end_attributes

     end_method_info

  end_methods

  attributes
  end_attributes
