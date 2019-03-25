{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  zlib bindings (expected zlib version: 1.2.11)

  Bindings for dynamically linked library (DLL)

  These units provides plain (no wrappers or helpers) bindings for zlib library.
  Most comments were copied directly from zlib.h header without any change.

  This binding is distributed with all necessary binaries (object files, DLLs)
  precompiled. For details please refer to file bin_readme.txt.

  ©František Milt 2018-02-07

  Version 1.0.1

  Dependencies:
    AuxTypes  - github.com/ncs-sniper/Lib.AuxTypes
  * StrRect   - github.com/ncs-sniper/Lib.StrRect

  StrRect is required only for dynamically linked part of the binding (unit
  ZLibDynamic).

===============================================================================}
unit ZLibDynamic;

{$INCLUDE '.\ZLib_defs.inc'}

interface

uses
  AuxTypes, ZLibCommon;

{===============================================================================
    Zlib functions
===============================================================================}
// for documentation, see ZLibStatic.pas

//== Procedural variables ======================================================

var
  zlibVersion:          Function: PAnsiChar; cdecl;

  deflate:              Function(strm: z_streamp; flush: int): int; cdecl;
  deflateEnd:           Function(strm: z_streamp): int; cdecl;

  inflate:              Function(strm: z_streamp; flush: int): int; cdecl;
  inflateEnd:           Function(strm: z_streamp): int; cdecl;

  deflateSetDictionary: Function(strm: z_streamp; dictionary: PByte; dictLength: uInt): int; cdecl;
  deflateGetDictionary: Function(strm: z_streamp; dictionary: PByte; dictLength: puInt): int; cdecl;
  deflateCopy:          Function(dest, source: z_streamp): int; cdecl;
  deflateReset:         Function(strm: z_streamp): int; cdecl;
  deflateParams:        Function(strm: z_streamp; level, strategy: int): int; cdecl;
  deflateTune:          Function(strm: z_streamp; good_length, max_lazy, nice_length, max_chain: int): int; cdecl;
  deflateBound:         Function(strm: z_streamp; sourceLen: uLong): uLong; cdecl;
  deflatePending:       Function(strm: z_streamp; pending: punsigned; bits: pint): int; cdecl;
  deflatePrime:         Function(strm: z_streamp; bits, value: int): int; cdecl;
  deflateSetHeader:     Function(strm: z_streamp; head: gz_headerp): int; cdecl;

  inflateSetDictionary: Function(strm: z_streamp; dictionary: PByte; dictLength: uInt): int; cdecl;
  inflateGetDictionary: Function(strm: z_streamp; dictionary: PByte; dictLength: puInt): int; cdecl;
  inflateSync:          Function(strm: z_streamp): int; cdecl;
  inflateCopy:          Function(dest, source: z_streamp): int; cdecl;
  inflateReset:         Function(strm: z_streamp): int; cdecl;
  inflateReset2:        Function(strm: z_streamp; windowBits: int): int; cdecl;
  inflatePrime:         Function(strm: z_streamp; bits, value: int): int; cdecl;
  inflateMark:          Function(strm: z_streamp): long; cdecl;
  inflateGetHeader:     Function(strm: z_streamp; head: gz_headerp): int; cdecl;

  inflateBack:          Function(strm: z_streamp; in_f: in_func; in_desc: Pointer; out_f: out_func; out_desc: Pointer): int; cdecl;
  inflateBackEnd:       Function(strm: z_streamp): int; cdecl;

  zlibCompileFlags:     Function: uLong; cdecl;

  compress:             Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: uLong): int; cdecl;
  compress2:            Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: uLong; level: int): int; cdecl;
  compressBound:        Function(sourceLen: uLong): uLong; cdecl;
  uncompress:           Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: uLong): int; cdecl;
  uncompress2:          Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: puLong): int; cdecl;

{$IFDEF GZIP_Support}
  gzopen:               Function(path: PAnsiChar; mode: PAnsiChar): gzFile; cdecl;
  gzdopen:              Function(fd: int; mode: PAnsiChar): gzFile; cdecl;
  gzbuffer:             Function(aFile: gzFile; size: unsigned): int; cdecl;
  gzsetparams:          Function(aFile: gzFile; level, strategy: int): int; cdecl;
  gzread:               Function(aFile: gzFile; buf: Pointer; len: unsigned): int; cdecl;
  gzfread:              Function(buf: Pointer; size, nitems: z_size_t; aFile: gzFile): z_size_t; cdecl;
  gzwrite:              Function(aFile: gzFile; buf: Pointer; len: unsigned): int; cdecl;
  gzfwrite:             Function(buf: Pointer; size, nintems: z_size_t; aFile: gzFile): z_size_t; cdecl;
  gzprintf:             Function(aFile: gzFile; format: PAnsiChar): int; cdecl varargs;
  gzputs:               Function(aFile: gzFile; s: PAnsiChar): int; cdecl;
  gzgets:               Function(aFile: gzFile; buf: PAnsiChar; len: int): PAnsiChar; cdecl;
  gzputc:               Function(aFile: gzFile; c: int): int; cdecl;
  gzgetc:               Function(aFile: gzFile): int; cdecl;
  gzungetc:             Function(c: int; aFile: gzFile): int; cdecl;
  gzflush:              Function(aFile: gzFile; flush: int): int; cdecl;
  gzseek:               Function(aFile: gzFile; offset: z_off_t; whence: int): z_off_t; cdecl;
  gzrewind:             Function(aFile: gzFile): int; cdecl;
  gztell:               Function(aFile: gzFile): z_off_t; cdecl;
  gzoffset:             Function(aFile: gzFile): z_off_t; cdecl;
  gzeof:                Function(aFile: gzFile): int; cdecl;
  gzdirect:             Function(aFile: gzFile): int; cdecl;
  gzclose:              Function(aFile: gzFile): int; cdecl;
  gzclose_r:            Function(aFile: gzFile): int; cdecl;
  gzclose_w:            Function(aFile: gzFile): int; cdecl;
  gzerror:              Function(aFile: gzFile; errnum: pint): PAnsiChar; cdecl;
  gzclearerr:           procedure(aFile: gzFile); cdecl;
{$ENDIF GZIP_Support}

  adler32:              Function(adler: uLong; buf: PByte; len: uInt): uLong; cdecl;
  adler32_z:            Function(adler: uLong; buf: PByte; len: z_size_t): uLong; cdecl;
  adler32_combine:      Function(adler1, adler2: uLong; len2: z_off_t): uLong; cdecl;
  crc32:                Function(crc: uLong; buf: PByte; len: uInt): uLong; cdecl;
  crc32_z:              Function(crc: uLong; buf: PByte; len: z_size_t): uLong; cdecl;
  crc32_combine:        Function(crc1, crc2: uLong; len2: z_off_t): uLong; cdecl;

  deflateInit_:         Function(strm: z_streamp; level: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateInit_:         Function(strm: z_streamp; version: PAnsiChar; stream_size: int): int; cdecl;
  deflateInit2_:        Function(strm: z_streamp; level, method, windowBits, memLevel, strategy: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateInit2_:        Function(strm: z_streamp; windowBits: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateBackInit_:     Function(strm: z_streamp; windowBits: int; window: PByte; version: PAnsiChar; stream_size: int): int; cdecl;

{$IFDEF GZIP_Support}
  gzgetc_:              Function(aFile: gzFile): int; cdecl;
  gzopen64:             Function(path: PAnsiChar; mode: PAnsiChar): gzFile; cdecl;
  gzseek64:             Function(aFile: gzFile; offset: z_off64_t; whence: int): z_off64_t; cdecl;
  gztell64:             Function(aFile: gzFile): z_off64_t; cdecl;
  gzoffset64:           Function(aFile: gzFile): z_off64_t; cdecl;
{$ENDIF GZIP_Support}
  adler32_combine64:    Function(adler1, adler2: uLong; len2: z_off64_t): uLong; cdecl;
  crc32_combine64:      Function(crc1, crc2: uLong; len2: z_off64_t): uLong; cdecl;

  zError:               Function(errnum: int): PAnsiChar; cdecl;
  inflateSyncPoint:     Function(strm: z_streamp): int; cdecl;
  get_crc_table:        Function: pz_crc_t; cdecl;
  inflateUndermine:     Function(strm: z_streamp; subvert: int): int; cdecl;
  inflateValidate:      Function(strm: z_streamp; check: int): int; cdecl;
  inflateCodesUsed:     Function(strm: z_streamp): UInt32; cdecl;
  inflateResetKeep:     Function(strm: z_streamp): int; cdecl;
  deflateResetKeep:     Function(strm: z_streamp): int; cdecl;
{$IF Defined(GZIP_Support) and Defined(Windows)}
  gzopen_w:             Function(path: PWideChar; mode: PAnsiChar): gzFile; cdecl;
{$IFEND}

//== Macro functions ===========================================================

Function deflateInit(strm: z_streamp; level: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateInit(strm: z_streamp): int;{$IFDEF CanInline} inline; {$ENDIF}
Function deflateInit2(strm: z_streamp; level, method, windowBits, memLevel, strategy: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateInit2(strm: z_streamp; windowBits: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateBackInit(strm: z_streamp; windowBits: int; window: PByte): int;{$IFDEF CanInline} inline; {$ENDIF}

//== Library initialization ====================================================

Function ZLib_Initialized: Boolean;
Function ZLib_Initialize(const LibPath: String = LibName): Boolean;
procedure ZLib_Finalize;

implementation

uses
  {$IFDEF Windows}Windows, StrRect{$ELSE}dl{$ENDIF};

//== Macro implementation ======================================================

Function deflateInit(strm: z_streamp; level: int): int;
begin
Result := deflateInit_(strm,level,PAnsiChar(ZLIB_VERSION),SizeOf(z_stream_s));
end;

//------------------------------------------------------------------------------

Function inflateInit(strm: z_streamp): int;
begin
Result := inflateInit_(strm,PAnsiChar(ZLIB_VERSION),SizeOf(z_stream_s));
end;

//------------------------------------------------------------------------------

Function deflateInit2(strm: z_streamp; level, method, windowBits, memLevel, strategy: int): int;
begin
Result := deflateInit2_(strm,level,method,windowBits,memLevel,strategy,PAnsiChar(ZLIB_VERSION),SizeOf(z_stream_s));
end;

//------------------------------------------------------------------------------

Function inflateInit2(strm: z_streamp; windowBits: int): int;
begin
Result := inflateInit2_(strm,windowBits,PAnsiChar(ZLIB_VERSION),SizeOf(z_stream_s));
end;

//------------------------------------------------------------------------------

Function inflateBackInit(strm: z_streamp; windowBits: int; window: PByte): int;
begin
Result := inflateBackInit_(strm,windowBits,window,PAnsiChar(ZLIB_VERSION),SizeOf(z_stream_s));
end;

//== Library initialization implementation =====================================

var
  ZLib_LibHandle: TModuleHandle = {$IFDEF Windows}0{$ELSE}nil{$ENDIF};

Function ZLib_Initialized: Boolean;
begin
{$IFDEF Windows}
Result := ZLib_LibHandle <> 0;
{$ELSE}
Result :=  Assigned(ZLib_LibHandle);
{$ENDIF}
end;

//------------------------------------------------------------------------------

Function ZLib_Initialize(const LibPath: String = LibName): Boolean;
begin
If not ZLib_Initialized then
  begin
  {$IFDEF Windows}
    ZLib_LibHandle := LoadLibraryEx(PChar(StrToWin(LibPath)),0,0);
  {$ELSE}
    ZLib_LibHandle := dlopen(PChar(LibPath),RTLD_NOW);
  {$ENDIF}
    If ZLib_Initialized then
      begin
        zlibVersion          := GetCheckProcAddress(ZLib_LibHandle,'zlibVersion');

        deflate              := GetCheckProcAddress(ZLib_LibHandle,'deflate');
        deflateEnd           := GetCheckProcAddress(ZLib_LibHandle,'deflateEnd');

        inflate              := GetCheckProcAddress(ZLib_LibHandle,'inflate');
        inflateEnd           := GetCheckProcAddress(ZLib_LibHandle,'inflateEnd');

        deflateSetDictionary := GetCheckProcAddress(ZLib_LibHandle,'deflateSetDictionary');
        deflateGetDictionary := GetCheckProcAddress(ZLib_LibHandle,'deflateGetDictionary');
        deflateCopy          := GetCheckProcAddress(ZLib_LibHandle,'deflateCopy');
        deflateReset         := GetCheckProcAddress(ZLib_LibHandle,'deflateReset');
        deflateParams        := GetCheckProcAddress(ZLib_LibHandle,'deflateParams');
        deflateTune          := GetCheckProcAddress(ZLib_LibHandle,'deflateTune');
        deflateBound         := GetCheckProcAddress(ZLib_LibHandle,'deflateBound');
        deflatePending       := GetCheckProcAddress(ZLib_LibHandle,'deflatePending');
        deflatePrime         := GetCheckProcAddress(ZLib_LibHandle,'deflatePrime');
        deflateSetHeader     := GetCheckProcAddress(ZLib_LibHandle,'deflateSetHeader');

        inflateSetDictionary := GetCheckProcAddress(ZLib_LibHandle,'inflateSetDictionary');
        inflateGetDictionary := GetCheckProcAddress(ZLib_LibHandle,'inflateGetDictionary');
        inflateSync          := GetCheckProcAddress(ZLib_LibHandle,'inflateSync');
        inflateCopy          := GetCheckProcAddress(ZLib_LibHandle,'inflateCopy');
        inflateReset         := GetCheckProcAddress(ZLib_LibHandle,'inflateReset');
        inflateReset2        := GetCheckProcAddress(ZLib_LibHandle,'inflateReset2');
        inflatePrime         := GetCheckProcAddress(ZLib_LibHandle,'inflatePrime');
        inflateMark          := GetCheckProcAddress(ZLib_LibHandle,'inflateMark');
        inflateGetHeader     := GetCheckProcAddress(ZLib_LibHandle,'inflateGetHeader');

        inflateBack          := GetCheckProcAddress(ZLib_LibHandle,'inflateBack');
        inflateBackEnd       := GetCheckProcAddress(ZLib_LibHandle,'inflateBackEnd');

        zlibCompileFlags     := GetCheckProcAddress(ZLib_LibHandle,'zlibCompileFlags');

        compress             := GetCheckProcAddress(ZLib_LibHandle,'compress');
        compress2            := GetCheckProcAddress(ZLib_LibHandle,'compress2');
        compressBound        := GetCheckProcAddress(ZLib_LibHandle,'compressBound');
        uncompress           := GetCheckProcAddress(ZLib_LibHandle,'uncompress');
        uncompress2          := GetCheckProcAddress(ZLib_LibHandle,'uncompress2');

      {$IFDEF GZIP_Support}
        gzopen               := GetCheckProcAddress(ZLib_LibHandle,'gzopen');
        gzdopen              := GetCheckProcAddress(ZLib_LibHandle,'gzdopen');
        gzbuffer             := GetCheckProcAddress(ZLib_LibHandle,'gzbuffer');
        gzsetparams          := GetCheckProcAddress(ZLib_LibHandle,'gzsetparams');
        gzread               := GetCheckProcAddress(ZLib_LibHandle,'gzread');
        gzfread              := GetCheckProcAddress(ZLib_LibHandle,'gzfread');
        gzwrite              := GetCheckProcAddress(ZLib_LibHandle,'gzwrite');
        gzfwrite             := GetCheckProcAddress(ZLib_LibHandle,'gzfwrite');
        gzprintf             := GetCheckProcAddress(ZLib_LibHandle,'gzprintf');
        gzputs               := GetCheckProcAddress(ZLib_LibHandle,'gzputs');
        gzgets               := GetCheckProcAddress(ZLib_LibHandle,'gzgets');
        gzputc               := GetCheckProcAddress(ZLib_LibHandle,'gzputc');
        gzgetc               := GetCheckProcAddress(ZLib_LibHandle,'gzgetc');
        gzungetc             := GetCheckProcAddress(ZLib_LibHandle,'gzungetc');
        gzflush              := GetCheckProcAddress(ZLib_LibHandle,'gzflush');
        gzseek               := GetCheckProcAddress(ZLib_LibHandle,'gzseek');
        gzrewind             := GetCheckProcAddress(ZLib_LibHandle,'gzrewind');
        gztell               := GetCheckProcAddress(ZLib_LibHandle,'gztell');
        gzoffset             := GetCheckProcAddress(ZLib_LibHandle,'gzoffset');
        gzeof                := GetCheckProcAddress(ZLib_LibHandle,'gzeof');
        gzdirect             := GetCheckProcAddress(ZLib_LibHandle,'gzdirect');
        gzclose              := GetCheckProcAddress(ZLib_LibHandle,'gzclose');
        gzclose_r            := GetCheckProcAddress(ZLib_LibHandle,'gzclose_r');
        gzclose_w            := GetCheckProcAddress(ZLib_LibHandle,'gzclose_w');
        gzerror              := GetCheckProcAddress(ZLib_LibHandle,'gzerror');
        gzclearerr           := GetCheckProcAddress(ZLib_LibHandle,'gzclearerr');
      {$ENDIF GZIP_Support}

        adler32              := GetCheckProcAddress(ZLib_LibHandle,'adler32');
        adler32_z            := GetCheckProcAddress(ZLib_LibHandle,'adler32_z');
        adler32_combine      := GetCheckProcAddress(ZLib_LibHandle,'adler32_combine');
        crc32                := GetCheckProcAddress(ZLib_LibHandle,'crc32');
        crc32_z              := GetCheckProcAddress(ZLib_LibHandle,'crc32_z');
        crc32_combine        := GetCheckProcAddress(ZLib_LibHandle,'crc32_combine');

        deflateInit_         := GetCheckProcAddress(ZLib_LibHandle,'deflateInit_');
        inflateInit_         := GetCheckProcAddress(ZLib_LibHandle,'inflateInit_');
        deflateInit2_        := GetCheckProcAddress(ZLib_LibHandle,'deflateInit2_');
        inflateInit2_        := GetCheckProcAddress(ZLib_LibHandle,'inflateInit2_');
        inflateBackInit_     := GetCheckProcAddress(ZLib_LibHandle,'inflateBackInit_');

      {$IFDEF GZIP_Support}
        gzgetc_              := GetCheckProcAddress(ZLib_LibHandle,'gzgetc_');
        gzopen64             := GetCheckProcAddress(ZLib_LibHandle,'gzopen64');
        gzseek64             := GetCheckProcAddress(ZLib_LibHandle,'gzseek64');
        gztell64             := GetCheckProcAddress(ZLib_LibHandle,'gztell64');
        gzoffset64           := GetCheckProcAddress(ZLib_LibHandle,'gzoffset64');
      {$ENDIF GZIP_Support}
        adler32_combine64    := GetCheckProcAddress(ZLib_LibHandle,'adler32_combine64');
        crc32_combine64      := GetCheckProcAddress(ZLib_LibHandle,'crc32_combine64');

        zError               := GetCheckProcAddress(ZLib_LibHandle,'zError');
        inflateSyncPoint     := GetCheckProcAddress(ZLib_LibHandle,'inflateSyncPoint');
        get_crc_table        := GetCheckProcAddress(ZLib_LibHandle,'get_crc_table');
        inflateUndermine     := GetCheckProcAddress(ZLib_LibHandle,'inflateUndermine');
        inflateValidate      := GetCheckProcAddress(ZLib_LibHandle,'inflateValidate');
        inflateCodesUsed     := GetCheckProcAddress(ZLib_LibHandle,'inflateCodesUsed');
        inflateResetKeep     := GetCheckProcAddress(ZLib_LibHandle,'inflateResetKeep');
        deflateResetKeep     := GetCheckProcAddress(ZLib_LibHandle,'deflateResetKeep');
      {$IF Defined(GZIP_Support) and Defined(Windows)}
        gzopen_w             := GetCheckProcAddress(ZLib_LibHandle,'gzopen_w');
      {$IFEND}

      {$IFDEF CheckCompatibility}
        CheckCompatibility(zlibCompileFlags);
      {$ENDIF}
        Result := True;
      end
    else Result := False;
  end
else Result := True;
end;

//------------------------------------------------------------------------------

procedure ZLib_Finalize;
begin
If ZLib_Initialized then
  begin
  {$IFDEF Windows}
    FreeLibrary(ZLib_LibHandle);
    ZLib_LibHandle := 0;
  {$ELSE}
    dlclose(ZLib_LibHandle);
    ZLib_LibHandle := nil;
  {$ENDIF}
  end;
end;

end.

