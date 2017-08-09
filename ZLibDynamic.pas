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

  ©František Milt 2017-08-07

  Version 1.0

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

//== Procedural types ==========================================================

type
  zlibVersion_t          = Function: PAnsiChar; cdecl;

  deflate_t              = Function(strm: z_streamp; flush: int): int; cdecl;
  deflateEnd_t           = Function(strm: z_streamp): int; cdecl;

  inflate_t              = Function(strm: z_streamp; flush: int): int; cdecl;
  inflateEnd_t           = Function(strm: z_streamp): int; cdecl;

  deflateSetDictionary_t = Function(strm: z_streamp; dictionary: PByte; dictLength: uInt): int; cdecl;
  deflateGetDictionary_t = Function(strm: z_streamp; dictionary: PByte; dictLength: puInt): int; cdecl;
  deflateCopy_t          = Function(dest, source: z_streamp): int; cdecl;
  deflateReset_t         = Function(strm: z_streamp): int; cdecl;
  deflateParams_t        = Function(strm: z_streamp; level, strategy: int): int; cdecl;
  deflateTune_t          = Function(strm: z_streamp; good_length, max_lazy, nice_length, max_chain: int): int; cdecl;
  deflateBound_t         = Function(strm: z_streamp; sourceLen: uLong): uLong; cdecl;
  deflatePending_t       = Function(strm: z_streamp; pending: punsigned; bits: pint): int; cdecl;
  deflatePrime_t         = Function(strm: z_streamp; bits, value: int): int; cdecl;
  deflateSetHeader_t     = Function(strm: z_streamp; head: gz_headerp): int; cdecl;

  inflateSetDictionary_t = Function(strm: z_streamp; dictionary: PByte; dictLength: uInt): int; cdecl;
  inflateGetDictionary_t = Function(strm: z_streamp; dictionary: PByte; dictLength: puInt): int; cdecl;
  inflateSync_t          = Function(strm: z_streamp): int; cdecl;
  inflateCopy_t          = Function(dest, source: z_streamp): int; cdecl;
  inflateReset_t         = Function(strm: z_streamp): int; cdecl;
  inflateReset2_t        = Function(strm: z_streamp; windowBits: int): int; cdecl;
  inflatePrime_t         = Function(strm: z_streamp; bits, value: int): int; cdecl;
  inflateMark_t          = Function(strm: z_streamp): long; cdecl;
  inflateGetHeader_t     = Function(strm: z_streamp; head: gz_headerp): int; cdecl;

  inflateBack_t          = Function(strm: z_streamp; in_f: in_func; in_desc: Pointer; out_f: out_func; out_desc: Pointer): int; cdecl;
  inflateBackEnd_t       = Function(strm: z_streamp): int; cdecl;

  zlibCompileFlags_t     = Function: uLong; cdecl;

  compress_t             = Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: PuLong): int; cdecl;
  compress2_t            = Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: uLong; level: int): int; cdecl;
  compressBound_t        = Function(sourceLen: uLong): uLong; cdecl;
  uncompress_t           = Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: uLong): int; cdecl;
  uncompress2_t          = Function(dest: PByte; destLen: puLong; source: PByte; sourceLen: puLong): int; cdecl;

{$IFDEF GZIP_Support}
  gzopen_t               = Function(path: PAnsiChar; mode: PAnsiChar): gzFile; cdecl;
  gzdopen_t              = Function(fd: int; mode: PAnsiChar): gzFile; cdecl;
  gzbuffer_t             = Function(aFile: gzFile; size: unsigned): int; cdecl;
  gzsetparams_t          = Function(aFile: gzFile; level, strategy: int): int; cdecl;
  gzread_t               = Function(aFile: gzFile; buf: Pointer; len: unsigned): int; cdecl;
  gzfread_t              = Function(buf: Pointer; size, nitems: z_size_t; aFile: gzFile): z_size_t; cdecl;
  gzwrite_t              = Function(aFile: gzFile; buf: Pointer; len: unsigned): int; cdecl;
  gzfwrite_t             = Function(buf: Pointer; size, nintems: z_size_t; aFile: gzFile): z_size_t; cdecl;
  gzprintf_t             = Function(aFile: gzFile; format: PAnsiChar): int; cdecl varargs;
  gzputs_t               = Function(aFile: gzFile; s: PAnsiChar): int; cdecl;
  gzgets_t               = Function(aFile: gzFile; buf: PAnsiChar; len: int): PAnsiChar; cdecl;
  gzputc_t               = Function(aFile: gzFile; c: int): int; cdecl;
  gzgetc_t               = Function(aFile: gzFile): int; cdecl;
  gzungetc_t             = Function(c: int; aFile: gzFile): int; cdecl;
  gzflush_t              = Function(aFile: gzFile; flush: int): int; cdecl;
  gzseek_t               = Function(aFile: gzFile; offset: z_off_t; whence: int): z_off_t; cdecl;
  gzrewind_t             = Function(aFile: gzFile): int; cdecl;
  gztell_t               = Function(aFile: gzFile): z_off_t; cdecl;
  gzoffset_t             = Function(aFile: gzFile): z_off_t; cdecl;
  gzeof_t                = Function(aFile: gzFile): int; cdecl;
  gzdirect_t             = Function(aFile: gzFile): int; cdecl;
  gzclose_t              = Function(aFile: gzFile): int; cdecl;
  gzclose_r_t            = Function(aFile: gzFile): int; cdecl;
  gzclose_w_t            = Function(aFile: gzFile): int; cdecl;
  gzerror_t              = Function(aFile: gzFile; errnum: pint): PAnsiChar; cdecl;
  gzclearerr_t           = procedure(aFile: gzFile); cdecl;
{$ENDIF GZIP_Support}

  adler32_t              = Function(adler: uLong; buf: PByte; len: uInt): uLong; cdecl;
  adler32_z_t            = Function(adler: uLong; buf: PByte; len: z_size_t): uLong; cdecl;
  adler32_combine_t      = Function(adler1, adler2: uLong; len2: z_off_t): uLong; cdecl;
  crc32_t                = Function(crc: uLong; buf: PByte; len: uInt): uLong; cdecl;
  crc32_z_t              = Function(crc: uLong; buf: PByte; len: z_size_t): uLong; cdecl;
  crc32_combine_t        = Function(crc1, crc2: uLong; len2: z_off_t): uLong; cdecl;

  deflateInit__t         = Function(strm: z_streamp; level: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateInit__t         = Function(strm: z_streamp; version: PAnsiChar; stream_size: int): int; cdecl;
  deflateInit2__t        = Function(strm: z_streamp; level, method, windowBits, memLevel, strategy: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateInit2__t        = Function(strm: z_streamp; windowBits: int; version: PAnsiChar; stream_size: int): int; cdecl;
  inflateBackInit__t     = Function(strm: z_streamp; windowBits: int; window: PByte; version: PAnsiChar; stream_size: int): int; cdecl;

{$IFDEF GZIP_Support}
  gzgetc__t              = Function(aFile: gzFile): int; cdecl;
  gzopen64_t             = Function(path: PAnsiChar; mode: PAnsiChar): gzFile; cdecl;
  gzseek64_t             = Function(aFile: gzFile; offset: z_off64_t; whence: int): z_off64_t; cdecl;
  gztell64_t             = Function(aFile: gzFile): z_off64_t; cdecl;
  gzoffset64_t           = Function(aFile: gzFile): z_off64_t; cdecl;
{$ENDIF GZIP_Support}
  adler32_combine64_t    = Function(adler1, adler2: uLong; len2: z_off64_t): uLong; cdecl;
  crc32_combine64_t      = Function(crc1, crc2: uLong; len2: z_off64_t): uLong; cdecl;

  zError_t               = Function(errnum: int): PAnsiChar; cdecl;
  inflateSyncPoint_t     = Function(strm: z_streamp): int; cdecl;
  get_crc_table_t        = Function: pz_crc_t; cdecl;
  inflateUndermine_t     = Function(strm: z_streamp; subvert: int): int; cdecl;
  inflateValidate_t      = Function(strm: z_streamp; check: int): int; cdecl;
  inflateCodesUsed_t     = Function(strm: z_streamp): UInt32; cdecl;
  inflateResetKeep_t     = Function(strm: z_streamp): int; cdecl;
  deflateResetKeep_t     = Function(strm: z_streamp): int; cdecl;
{$IFDEF GZIP_Support}
  gzopen_w_t             = Function(path: PWideChar; mode: PAnsiChar): gzFile; cdecl;
{$ENDIF GZIP_Support}

//== Procedural variables ======================================================
var
  zlibVersion:          zlibVersion_t;

  deflate:              deflate_t;
  deflateEnd:           deflateEnd_t;

  inflate:              inflate_t;
  inflateEnd:           inflateEnd_t;

  deflateSetDictionary: deflateSetDictionary_t;
  deflateGetDictionary: deflateGetDictionary_t;
  deflateCopy:          deflateCopy_t;
  deflateReset:         deflateReset_t;
  deflateParams:        deflateParams_t;
  deflateTune:          deflateTune_t;
  deflateBound:         deflateBound_t;
  deflatePending:       deflatePending_t;
  deflatePrime:         deflatePrime_t;
  deflateSetHeader:     deflateSetHeader_t;

  inflateSetDictionary: inflateSetDictionary_t;
  inflateGetDictionary: inflateGetDictionary_t;
  inflateSync:          inflateSync_t;
  inflateCopy:          inflateCopy_t;
  inflateReset:         inflateReset_t;
  inflateReset2:        inflateReset2_t;
  inflatePrime:         inflatePrime_t;
  inflateMark:          inflateMark_t;
  inflateGetHeader:     inflateGetHeader_t;

  inflateBack:          inflateBack_t;
  inflateBackEnd:       inflateBackEnd_t;

  zlibCompileFlags:     zlibCompileFlags_t;

  compress:             compress_t;
  compress2:            compress2_t;
  compressBound:        compressBound_t;
  uncompress:           uncompress_t;
  uncompress2:          uncompress2_t;

{$IFDEF GZIP_Support}
  gzopen:               gzopen_t;
  gzdopen:              gzdopen_t;
  gzbuffer:             gzbuffer_t;
  gzsetparams:          gzsetparams_t;
  gzread:               gzread_t;
  gzfread:              gzfread_t;
  gzwrite:              gzwrite_t;
  gzfwrite:             gzfwrite_t;
  gzprintf:             gzprintf_t;
  gzputs:               gzputs_t;
  gzgets:               gzgets_t;
  gzputc:               gzputc_t;
  gzgetc:               gzgetc_t;
  gzungetc:             gzungetc_t;
  gzflush:              gzflush_t;
  gzseek:               gzseek_t;
  gzrewind:             gzrewind_t;
  gztell:               gztell_t;
  gzoffset:             gzoffset_t;
  gzeof:                gzeof_t;
  gzdirect:             gzdirect_t;
  gzclose:              gzclose_t;
  gzclose_r:            gzclose_r_t;
  gzclose_w:            gzclose_w_t;
  gzerror:              gzerror_t;
  gzclearerr:           gzclearerr_t;
{$ENDIF GZIP_Support}

  adler32:              adler32_t;
  adler32_z:            adler32_z_t;
  adler32_combine:      adler32_combine_t;
  crc32:                crc32_t;
  crc32_z:              crc32_z_t;
  crc32_combine:        crc32_combine_t;

  deflateInit_:         deflateInit__t;
  inflateInit_:         inflateInit__t;
  deflateInit2_:        deflateInit2__t;
  inflateInit2_:        inflateInit2__t;
  inflateBackInit_:     inflateBackInit__t;

{$IFDEF GZIP_Support}
  gzgetc_:              gzgetc__t;
  gzopen64:             gzopen64_t;
  gzseek64:             gzseek64_t;
  gztell64:             gztell64_t;
  gzoffset64:           gzoffset64_t;
{$ENDIF GZIP_Support}
  adler32_combine64:    adler32_combine64_t;
  crc32_combine64:      crc32_combine64_t;

  zError:               zError_t;
  inflateSyncPoint:     inflateSyncPoint_t;
  get_crc_table:        get_crc_table_t;
  inflateUndermine:     inflateUndermine_t;
  inflateValidate:      inflateValidate_t;
  inflateCodesUsed:     inflateCodesUsed_t;
  inflateResetKeep:     inflateResetKeep_t;
  deflateResetKeep:     deflateResetKeep_t;
{$IFDEF GZIP_Support}
  gzopen_w:             gzopen_w_t;
{$ENDIF GZIP_Support}

//== Macros ====================================================================

Function deflateInit(strm: z_streamp; level: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateInit(strm: z_streamp): int;{$IFDEF CanInline} inline; {$ENDIF}
Function deflateInit2(strm: z_streamp; level, method, windowBits, memLevel, strategy: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateInit2(strm: z_streamp; windowBits: int): int;{$IFDEF CanInline} inline; {$ENDIF}
Function inflateBackInit(strm: z_streamp; windowBits: int; window: PByte): int;{$IFDEF CanInline} inline; {$ENDIF}

//== Library initialization ====================================================

Function ZLib_Initialize(const {%H-}LibPath: String = LibName): Boolean;
procedure ZLib_Finalize;

implementation

uses
  Windows, StrRect;

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
  ZLib_LibHandle: THandle = 0;

Function ZLib_Initialize(const LibPath: String): Boolean;
begin
If ZLib_LibHandle = 0 then
  begin
    ZLib_LibHandle := LoadLibraryEx(PChar(StrToWin(LibPath)),0,0);
    If ZLib_LibHandle <> 0 then
      begin
        zlibVersion          := zlibVersion_t(GetProcAddress(ZLib_LibHandle,'zlibVersion'));

        deflate              :=     deflate_t(GetProcAddress(ZLib_LibHandle,'deflate'));
        deflateEnd           :=  deflateEnd_t(GetProcAddress(ZLib_LibHandle,'deflateEnd'));

        inflate              :=     inflate_t(GetProcAddress(ZLib_LibHandle,'inflate'));
        inflateEnd           :=  inflateEnd_t(GetProcAddress(ZLib_LibHandle,'inflateEnd'));

        deflateSetDictionary := deflateSetDictionary_t(GetProcAddress(ZLib_LibHandle,'deflateSetDictionary'));
        deflateGetDictionary := deflateGetDictionary_t(GetProcAddress(ZLib_LibHandle,'deflateGetDictionary'));
        deflateCopy          :=          deflateCopy_t(GetProcAddress(ZLib_LibHandle,'deflateCopy'));
        deflateReset         :=         deflateReset_t(GetProcAddress(ZLib_LibHandle,'deflateReset'));
        deflateParams        :=        deflateParams_t(GetProcAddress(ZLib_LibHandle,'deflateParams'));
        deflateTune          :=          deflateTune_t(GetProcAddress(ZLib_LibHandle,'deflateTune'));
        deflateBound         :=         deflateBound_t(GetProcAddress(ZLib_LibHandle,'deflateBound'));
        deflatePending       :=       deflatePending_t(GetProcAddress(ZLib_LibHandle,'deflatePending'));
        deflatePrime         :=         deflatePrime_t(GetProcAddress(ZLib_LibHandle,'deflatePrime'));
        deflateSetHeader     :=     deflateSetHeader_t(GetProcAddress(ZLib_LibHandle,'deflateSetHeader'));

        inflateSetDictionary := inflateSetDictionary_t(GetProcAddress(ZLib_LibHandle,'inflateSetDictionary'));
        inflateGetDictionary := inflateGetDictionary_t(GetProcAddress(ZLib_LibHandle,'inflateGetDictionary'));
        inflateSync          :=          inflateSync_t(GetProcAddress(ZLib_LibHandle,'inflateSync'));
        inflateCopy          :=          inflateCopy_t(GetProcAddress(ZLib_LibHandle,'inflateCopy'));
        inflateReset         :=         inflateReset_t(GetProcAddress(ZLib_LibHandle,'inflateReset'));
        inflateReset2        :=        inflateReset2_t(GetProcAddress(ZLib_LibHandle,'inflateReset2'));
        inflatePrime         :=         inflatePrime_t(GetProcAddress(ZLib_LibHandle,'inflatePrime'));
        inflateMark          :=          inflateMark_t(GetProcAddress(ZLib_LibHandle,'inflateMark'));
        inflateGetHeader     :=     inflateGetHeader_t(GetProcAddress(ZLib_LibHandle,'inflateGetHeader'));

        inflateBack          :=     inflateBack_t(GetProcAddress(ZLib_LibHandle,'inflateBack'));
        inflateBackEnd       :=  inflateBackEnd_t(GetProcAddress(ZLib_LibHandle,'inflateBackEnd'));

        zlibCompileFlags     := zlibCompileFlags_t(GetProcAddress(ZLib_LibHandle,'zlibCompileFlags'));

        compress             :=      compress_t(GetProcAddress(ZLib_LibHandle,'compress'));
        compress2            :=     compress2_t(GetProcAddress(ZLib_LibHandle,'compress2'));
        compressBound        := compressBound_t(GetProcAddress(ZLib_LibHandle,'compressBound'));
        uncompress           :=    uncompress_t(GetProcAddress(ZLib_LibHandle,'uncompress'));
        uncompress2          :=   uncompress2_t(GetProcAddress(ZLib_LibHandle,'uncompress2'));

      {$IFDEF GZIP_Support}
        gzopen               :=      gzopen_t(GetProcAddress(ZLib_LibHandle,'gzopen'));
        gzdopen              :=     gzdopen_t(GetProcAddress(ZLib_LibHandle,'gzdopen'));
        gzbuffer             :=    gzbuffer_t(GetProcAddress(ZLib_LibHandle,'gzbuffer'));
        gzsetparams          := gzsetparams_t(GetProcAddress(ZLib_LibHandle,'gzsetparams'));
        gzread               :=      gzread_t(GetProcAddress(ZLib_LibHandle,'gzread'));
        gzfread              :=     gzfread_t(GetProcAddress(ZLib_LibHandle,'gzfread'));
        gzwrite              :=     gzwrite_t(GetProcAddress(ZLib_LibHandle,'gzwrite'));
        gzfwrite             :=    gzfwrite_t(GetProcAddress(ZLib_LibHandle,'gzfwrite'));
        gzprintf             :=    gzprintf_t(GetProcAddress(ZLib_LibHandle,'gzprintf'));
        gzputs               :=      gzputs_t(GetProcAddress(ZLib_LibHandle,'gzputs'));
        gzgets               :=      gzgets_t(GetProcAddress(ZLib_LibHandle,'gzgets'));
        gzputc               :=      gzputc_t(GetProcAddress(ZLib_LibHandle,'gzputc'));
        gzgetc               :=      gzgetc_t(GetProcAddress(ZLib_LibHandle,'gzgetc'));
        gzungetc             :=    gzungetc_t(GetProcAddress(ZLib_LibHandle,'gzungetc'));
        gzflush              :=     gzflush_t(GetProcAddress(ZLib_LibHandle,'gzflush'));
        gzseek               :=      gzseek_t(GetProcAddress(ZLib_LibHandle,'gzseek'));
        gzrewind             :=    gzrewind_t(GetProcAddress(ZLib_LibHandle,'gzrewind'));
        gztell               :=      gztell_t(GetProcAddress(ZLib_LibHandle,'gztell'));
        gzoffset             :=    gzoffset_t(GetProcAddress(ZLib_LibHandle,'gzoffset'));
        gzeof                :=       gzeof_t(GetProcAddress(ZLib_LibHandle,'gzeof'));
        gzdirect             :=    gzdirect_t(GetProcAddress(ZLib_LibHandle,'gzdirect'));
        gzclose              :=     gzclose_t(GetProcAddress(ZLib_LibHandle,'gzclose'));
        gzclose_r            :=   gzclose_r_t(GetProcAddress(ZLib_LibHandle,'gzclose_r'));
        gzclose_w            :=   gzclose_w_t(GetProcAddress(ZLib_LibHandle,'gzclose_w'));
        gzerror              :=     gzerror_t(GetProcAddress(ZLib_LibHandle,'gzerror'));
        gzclearerr           :=  gzclearerr_t(GetProcAddress(ZLib_LibHandle,'gzclearerr'));
      {$ENDIF GZIP_Support}

        adler32              :=         adler32_t(GetProcAddress(ZLib_LibHandle,'adler32'));
        adler32_z            :=       adler32_z_t(GetProcAddress(ZLib_LibHandle,'adler32_z'));
        adler32_combine      := adler32_combine_t(GetProcAddress(ZLib_LibHandle,'adler32_combine'));
        crc32                :=           crc32_t(GetProcAddress(ZLib_LibHandle,'crc32'));
        crc32_z              :=         crc32_z_t(GetProcAddress(ZLib_LibHandle,'crc32_z'));
        crc32_combine        :=   crc32_combine_t(GetProcAddress(ZLib_LibHandle,'crc32_combine'));

        deflateInit_         :=     deflateInit__t(GetProcAddress(ZLib_LibHandle,'deflateInit_'));
        inflateInit_         :=     inflateInit__t(GetProcAddress(ZLib_LibHandle,'inflateInit_'));
        deflateInit2_        :=    deflateInit2__t(GetProcAddress(ZLib_LibHandle,'deflateInit2_'));
        inflateInit2_        :=    inflateInit2__t(GetProcAddress(ZLib_LibHandle,'inflateInit2_'));
        inflateBackInit_     := inflateBackInit__t(GetProcAddress(ZLib_LibHandle,'inflateBackInit_'));

      {$IFDEF GZIP_Support}
        gzgetc_              :=           gzgetc__t(GetProcAddress(ZLib_LibHandle,'gzgetc_'));
        gzopen64             :=          gzopen64_t(GetProcAddress(ZLib_LibHandle,'gzopen64'));
        gzseek64             :=          gzseek64_t(GetProcAddress(ZLib_LibHandle,'gzseek64'));
        gztell64             :=          gztell64_t(GetProcAddress(ZLib_LibHandle,'gztell64'));
        gzoffset64           :=        gzoffset64_t(GetProcAddress(ZLib_LibHandle,'gzoffset64'));
      {$ENDIF GZIP_Support}
        adler32_combine64    := adler32_combine64_t(GetProcAddress(ZLib_LibHandle,'adler32_combine64'));
        crc32_combine64      :=   crc32_combine64_t(GetProcAddress(ZLib_LibHandle,'crc32_combine64'));

        zError               :=           zError_t(GetProcAddress(ZLib_LibHandle,'zError'));
        inflateSyncPoint     := inflateSyncPoint_t(GetProcAddress(ZLib_LibHandle,'inflateSyncPoint'));
        get_crc_table        :=    get_crc_table_t(GetProcAddress(ZLib_LibHandle,'get_crc_table'));
        inflateUndermine     := inflateUndermine_t(GetProcAddress(ZLib_LibHandle,'inflateUndermine'));
        inflateValidate      :=  inflateValidate_t(GetProcAddress(ZLib_LibHandle,'inflateValidate'));
        inflateCodesUsed     := inflateCodesUsed_t(GetProcAddress(ZLib_LibHandle,'inflateCodesUsed'));
        inflateResetKeep     := inflateResetKeep_t(GetProcAddress(ZLib_LibHandle,'inflateResetKeep'));
        deflateResetKeep     := deflateResetKeep_t(GetProcAddress(ZLib_LibHandle,'deflateResetKeep'));
      {$IFDEF GZIP_Support}
        gzopen_w             :=         gzopen_w_t(GetProcAddress(ZLib_LibHandle,'gzopen_w'));
      {$ENDIF GZIP_Support}

      {$IFDEF CheckCompatibility}
        CheckCompatibility(zlibCompileFlags());
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
If ZLib_LibHandle <> 0 then
  begin
    FreeLibrary(ZLib_LibHandle);
    ZLib_LibHandle := 0;
	end;
end;

end.

