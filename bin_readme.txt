All *.o and *.dll files were compiled from original zlib source using MinGW-W64 
(GCC 7.1.0, GNU Make 4.1).
You can find the source in folder zlib_src or on webpage https://zlib.net/.

Following files were further edited using objconv utility 
(http://www.agner.org/optimize):

  zlib_win64/deflate.o
  
    public symbol ".refptr.zcalloc" made local
    public symbol ".refptr.zcfree" made local  
  
  zlib_win64/inflate.o  
  
    public symbol ".refptr.zcalloc" made local
    public symbol ".refptr.zcfree" made local 
    
*.obj files vere compiled using bcc32c 7.20 (BCC 10.1). Underscores were 
stripped from all public and external symbol names and symbol name z_errmsg was
removed from zutil.obj.