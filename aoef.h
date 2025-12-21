#ifndef _AOEF_H_
#define _AOEF_H_

#include <stdint.h>


typedef struct AOEFFHeader {
	uint8_t hID[4];
	uint32_t hType;
	uint32_t hEntry;
	uint32_t hSectOff; // offset of the section header table
	uint32_t hSectSize; // number of section header entries
	uint32_t hSymbOff; // offset of the symbol table
	uint32_t hSymbSize; // number of symbol entries
	uint32_t hStrTabOff; // offset of the string table
	uint32_t hStrTabSize; // size (in bytes) of the string table
	uint32_t hRelDirOff; // offset of the relocation tables directory
	uint32_t hRelDirSize; // number of relocation tables entries (how many reloc tables)
} AOEFFhdr;

#define AH_ID0 0xAE
#define AH_ID1 'A'
#define AH_ID2 'E'
#define AH_ID3 'F'

#define AHID_0 0
#define AHID_1 1
#define AHID_2 2
#define AHID_3 3

#define AHT_EXEC 0 // Executable
#define AHT_KERN 1 // Kernel
#define AHT_DLIB 2 // Dynamic library
#define AHT_AOBJ 3 // Object file
#define AHT_SLIB 4 // Static library


typedef struct AOEFFSectHeader {
	char shSectName[8]; // name of the section
	uint32_t shSectOff; // offset of the section
	uint32_t shSectSize; // size of the section
	uint32_t shSectRel; // index of the relocation table tied to this section
} AOEFFSectHdr;


typedef struct AOEFFSymbEntry {
	uint32_t seSymbName; // index of the symbol name in the string table
	uint32_t seSymbSize; // size of the data that the symbol is referring to
	uint32_t seSymbVal; // value of the symbol
	uint8_t seSymbInfo; // symbol information ([symbol type, symbol locality])
	uint32_t seSymbSect; // section index the symbol is in, undefined if external
} AOEFFSymEnt;

#define SE_SECT_UNDEF 0xFFFFFFFF // For external symbols

#define SE_GET_TYPE(i) (i >> 4)
#define SE_GET_LOC(i) (i & 0xf)
#define SE_SET_INFO(t,l) ((t << 4) | (l & 0xf))

#define SE_NONE_T 0
#define SE_ABSV_T 1
#define SE_FUNC_T 2
#define SE_OBJ_T 3
// Extra object types, not necessary
#define SE_OBJ_ARR_T 4
#define SE_OBJ_STRUCT_T 5
#define SE_OBJ_UNION_T 6
#define SE_OBJ_PTR_T 7

#define SE_LOCAL 0
#define SE_GLOBL 1


typedef struct AOEFFStringTable {
	char* stStrs;
} AOEFFStrTab;

typedef struct AOEFFRelStringTable {
	char* rstStrs;
} AOEFFRelStrTab;

typedef struct AOEFFRelEntry {
	uint32_t reOff; // offset from the start of the section
	uint32_t reSymb; // index of the symbol in symbol table
	uint8_t reType; // type of relocation (RE_ARU32_*)
} AOEFFRelEnt;

typedef struct AOEFFRelTable {
	uint8_t relSect; // which section this relocation table is for
	uint32_t relTabName; // index of relocation table name
	AOEFFRelEnt** relEntries;
	uint32_t relCount; // number of relocation entries
} AOEFFRelTab;

typedef struct AOEFFRelTableDirectory {
	AOEFFRelTab* reldTables;
	uint8_t reldCount; // number of relocation tables
} AOEFFRelTableDir;

#define RE_ARU32_ABS14 0
#define RE_ARU32_MEM9 1
#define RE_ARU32_IR24 2
#define RE_ARU32_IR19 3

typedef struct AOEFFDynamicLibEntry {
	uint32_t dlName; // index of the dynamic library name in dynamic string table
	uint32_t dlVersion; // version of the dynamic library
} AOEFFDyLibEnt;

typedef struct AOEFFDynamicLibTable {
	AOEFFDyLibEnt* dlEntries;
	uint32_t dlCount; // number of dynamic library entries
} AOEFFDyLibTab;

typedef struct AOEFFDynamicStringTable {
	char* dlstStrs;
} AOEFFDyStrTab;

typedef struct AOEFFImportEntry {
	uint32_t ieName; // index of the imported symbol name in the string table
	uint32_t ieDyLib; // index of the dynamic library this symbol is imported from in the dynamic library table
} AOEFFImportEnt;

typedef struct AOEFFImportTable {
	AOEFFImportEnt* imEntries;
	uint32_t imCount; // number of import entries
} AOEFFImportTab;

typedef enum AOEFBinFileType {
	AOEF_FT_AOBJ,
	AOEF_FT_EXEC,
	AOEF_FT_DLIB,
	AOEF_FT_SLIB,
	AOEF_FT_KERN
} AOEFbin_ft;

typedef struct AOEFBinary {
	AOEFbin_ft binarytype;
	AOEFFhdr header;
	AOEFFSectHdr* sectHdrTable;
	AOEFFSymEnt* symbEntTable;
	AOEFFStrTab symbStringTable;
	AOEFFRelTableDir reltabDir;
	AOEFFDyLibTab dyLibTable;
	AOEFFDyStrTab dyLibStringTable;

	AOEFFImportTab importTable;

	uint8_t* _data;
	uint8_t* _const;
	uint32_t* _text;
	uint32_t* _text_init;
	uint32_t* _text_deinit;
	uint32_t* _text_fjt;
	uint8_t* _evt;
	uint8_t* _ivt;
} AOEFbin;

#endif