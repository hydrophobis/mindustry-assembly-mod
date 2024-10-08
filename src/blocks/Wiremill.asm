
include 'jclass.inc'

format binary as 'class'

  u4 0xcafebabe 		; magic
  u2 0,49			; minor and major version

  constant_pool

	_Code			constant_utf8		'Code' ;1
	_buildvis		constant_utf8		'mindustry/world/meta/BuildVisibility'
	_buildvisfield	constant_utf8		'Lmindustry/world/meta/BuildVisibility;'
	_ItemStack		constant_utf8 		'mindustry/type/ItemStack;'

	_block			constant_utf8		'mindustry/world/Block' ;2
	_Block			constant_class		_block ;3
	_init			constant_utf8		'<init>';4
    _initContent		constant_utf8		'loadContent';5
	_main			constant_utf8		'wiremill';6
	_log			constant_utf8		'arc/util/Log';7
	_log_info		constant_utf8		'info';8
	_void_arrstr		constant_utf8		'([Ljava/lang/String;)V';9
	_void_object		constant_utf8		'(Ljava/lang/Object;)V';10
	_void_string		constant_utf8		'(Ljava/lang/String;)V';11
	Test_class		constant_class		_Test;12
	_Test			constant_utf8		'TestBlock';13
	Object_init		constant_methodref	Object_class,init_method;14
	Object_class		constant_class		_block;15
	_Object 		constant_utf8		'mindustry/world/blocks/production/GenericCrafter';16
	init_method		constant_nameandtype	_init,_void_string;17
	_void			constant_utf8		'()V';18
	Log_class		constant_class		_log;19
	Log_info_method		constant_nameandtype	_log_info,_void_object;20
	Log_info		constant_methodref	Log_class,Log_info_method;21
	System.out		constant_fieldref	System_class,out_field;22
	System_class		constant_class		_System;23
	_System 		constant_utf8		'mindustry/world/Block';24
	out_field		constant_nameandtype	_out,PrintStream_type;25
	_out			constant_utf8		'health';26
	_destructible		constant_utf8		'destructible'
	destructible_field	constant_nameandtype	_destructible,Boolean_type
	Boolean_type		constant_utf8		'Z'
	Block.destructible	constant_fieldref	System_class,destructible_field
	PrintStream_type	constant_utf8		'I';27
	PrintStream_println	constant_methodref	PrintStream_class,println_method;28
	PrintStream_class	constant_class		_PrintStream;29
	_PrintStream		constant_utf8		'java/io/PrintStream';30
	println_method		constant_nameandtype	_println,_void_str;31
	_println		constant_utf8		'println';32
	_void_str		constant_utf8		'(Ljava/lang/String;)V';33
	Buildvis		constant_class		_buildvis;35
	_shown			constant_utf8		'sandboxOnly';36
	_buildvisblock		constant_utf8		'buildVisibility';37
	_Buildvisblock_field	constant_nameandtype	_buildvisblock,_buildvisfield;38
	_Block.buildvis		constant_fieldref	_Block,_Buildvisblock_field;39

	; Item output stuff
	_itemstack      constant_class _ItemStack;52
	_itemstack_ctor constant_methodref _itemstack,_itemstack_init;53
	_itemstack_descriptor constant_utf8 '(Lmindustry/type/Item;I)V'
	_itemstack_init constant_nameandtype _init,_itemstack_descriptor;54
	_outputItem     constant_utf8 'outputItem';55
	_item_utf8		constant_utf8	'mindustry/type/Item'
	_item           constant_class	_item_utf8 ;56
	_Block.outputItem	constant_fieldref _Block,_itemstack_ctor
	_item_fr_this_time	constant_utf8 'Wire'

	_shown_field		constant_nameandtype	_shown,_buildvisfield;40
	_Shown			constant_fieldref	Buildvis,_shown_field;41
	Integer_toString	constant_methodref	Integer_class,toString_method;42
	Integer_class		constant_class		_Integer;43
	_Integer		constant_utf8		'java/lang/Integer';44
	toString_method 	constant_nameandtype	_toString,_str_int;45
	_toString		constant_utf8		'toString';46
	_str_int		constant_utf8		'(I)Ljava/lang/String;';47
	Hello			constant_string 	_main		; re-use some existing UTF-8 sequences 50
	Hello_again		constant_string 	_void_arrstr	; for demonstration purposes 51
	number			constant_integer	500



  end_constant_pool

  u2 ACC_PUBLIC+ACC_SUPER	; access flags
  u2 Test_class 		; this class
  u2 Object_class		; super class

  interfaces

  end_interfaces

  fields

  end_fields

  methods

     method_info ACC_PUBLIC, _init, _void				; public void Test()

       attribute _Code

	 u2 5 ; max_stack
	 u2 1 ; max_locals

	 bytecode

		aload 0
		new _itemstack
		dup
		getstatic _item ; Replace _item with the specific item
		iconst_1        ; Quantity of the item
		invokespecial _itemstack_ctor
		putfield _Block.outputItem
		dup;duplicating
		ldc Hello;loading name
		invokespecial Object_init;initializing block
		dup
		ldc number
		putfield System.out;set health
		dup
		getstatic _outputItem
		putfield _Block.outputItem
		getstatic _Shown
		putfield _Block.buildvis
		bipush 1
		putfield Block.destructible
		return

	 end_bytecode

	 exceptions
	 end_exceptions

	 attributes
	 end_attributes

       end_attribute

     end_method_info

  end_methods

  attributes

  end_attributes
