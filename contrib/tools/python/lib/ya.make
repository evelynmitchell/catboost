LIBRARY()

LICENSE(
    PSF
)



INCLUDE(${ARCADIA_ROOT}/contrib/tools/python/pyconfig.inc)

PEERDIR(
    contrib/tools/python/base
    contrib/tools/python/include
)

SRCDIR(
    ${PYTHON_SRC_DIR}/Lib
)

IF (YMAKE)
    PYTHON(bootstrap.py python_frozen_modules.rodata bootstrap.c python-libs.txt IN python-libs.txt OUT bootstrap.c OUT python_frozen_modules.rodata

IN ${PYTHON_SRC_DIR}/Include/Python.h
IN __future__.py
IN __phello__.foo.py
IN _abcoll.py
IN _LWPCookieJar.py
IN _MozillaCookieJar.py
IN _osx_support.py
IN _pyio.py
IN _strptime.py
IN _threading_local.py
IN _weakrefset.py
IN abc.py
IN aifc.py
IN antigravity.py
IN anydbm.py
IN argparse.py
IN ast.py
IN asynchat.py
IN asyncore.py
IN atexit.py
IN audiodev.py
IN base64.py
IN BaseHTTPServer.py
IN Bastion.py
IN bdb.py
IN binhex.py
IN bisect.py
IN bsddb/__init__.py
IN bsddb/db.py
IN bsddb/dbobj.py
IN bsddb/dbrecio.py
IN bsddb/dbshelve.py
IN bsddb/dbtables.py
IN bsddb/dbutils.py
IN bsddb/test/__init__.py
IN bsddb/test/test_all.py
IN bsddb/test/test_associate.py
IN bsddb/test/test_basics.py
IN bsddb/test/test_compare.py
IN bsddb/test/test_compat.py
IN bsddb/test/test_cursor_pget_bug.py
IN bsddb/test/test_db.py
IN bsddb/test/test_dbenv.py
IN bsddb/test/test_dbobj.py
IN bsddb/test/test_dbshelve.py
IN bsddb/test/test_dbtables.py
IN bsddb/test/test_distributed_transactions.py
IN bsddb/test/test_early_close.py
IN bsddb/test/test_fileid.py
IN bsddb/test/test_get_none.py
IN bsddb/test/test_join.py
IN bsddb/test/test_lock.py
IN bsddb/test/test_misc.py
IN bsddb/test/test_pickle.py
IN bsddb/test/test_queue.py
IN bsddb/test/test_recno.py
IN bsddb/test/test_replication.py
IN bsddb/test/test_sequence.py
IN bsddb/test/test_thread.py
IN calendar.py
IN cgi.py
IN CGIHTTPServer.py
IN cgitb.py
IN chunk.py
IN cmd.py
IN code.py
IN codecs.py
IN codeop.py
IN collections.py
IN colorsys.py
IN commands.py
IN compileall.py
IN compiler/__init__.py
IN compiler/ast.py
IN compiler/consts.py
IN compiler/future.py
IN compiler/misc.py
IN compiler/pyassem.py
IN compiler/pycodegen.py
IN compiler/symbols.py
IN compiler/syntax.py
IN compiler/transformer.py
IN compiler/visitor.py
IN ConfigParser.py
IN contextlib.py
IN Cookie.py
IN cookielib.py
IN copy.py
IN copy_reg.py
IN cProfile.py
IN csv.py
IN ctypes/__init__.py
IN ctypes/_endian.py
IN ctypes/macholib/__init__.py
IN ctypes/macholib/dyld.py
IN ctypes/macholib/dylib.py
IN ctypes/macholib/framework.py
IN ctypes/test/__init__.py
IN ctypes/test/runtests.py
IN ctypes/test/test_anon.py
IN ctypes/test/test_array_in_pointer.py
IN ctypes/test/test_arrays.py
IN ctypes/test/test_as_parameter.py
IN ctypes/test/test_bitfields.py
IN ctypes/test/test_buffers.py
IN ctypes/test/test_byteswap.py
IN ctypes/test/test_callbacks.py
IN ctypes/test/test_cast.py
IN ctypes/test/test_cfuncs.py
IN ctypes/test/test_checkretval.py
IN ctypes/test/test_delattr.py
IN ctypes/test/test_errno.py
IN ctypes/test/test_find.py
IN ctypes/test/test_frombuffer.py
IN ctypes/test/test_funcptr.py
IN ctypes/test/test_functions.py
IN ctypes/test/test_incomplete.py
IN ctypes/test/test_init.py
IN ctypes/test/test_internals.py
IN ctypes/test/test_keeprefs.py
IN ctypes/test/test_libc.py
IN ctypes/test/test_loading.py
IN ctypes/test/test_macholib.py
IN ctypes/test/test_memfunctions.py
IN ctypes/test/test_numbers.py
IN ctypes/test/test_objects.py
IN ctypes/test/test_parameters.py
IN ctypes/test/test_pep3118.py
IN ctypes/test/test_pickling.py
IN ctypes/test/test_pointers.py
IN ctypes/test/test_prototypes.py
IN ctypes/test/test_python_api.py
IN ctypes/test/test_random_things.py
IN ctypes/test/test_refcounts.py
IN ctypes/test/test_repr.py
IN ctypes/test/test_returnfuncptrs.py
IN ctypes/test/test_simplesubclasses.py
IN ctypes/test/test_sizes.py
IN ctypes/test/test_slicing.py
IN ctypes/test/test_stringptr.py
IN ctypes/test/test_strings.py
IN ctypes/test/test_struct_fields.py
IN ctypes/test/test_structures.py
IN ctypes/test/test_unaligned_structures.py
IN ctypes/test/test_unicode.py
IN ctypes/test/test_values.py
IN ctypes/test/test_varsize_struct.py
IN ctypes/test/test_win32.py
IN ctypes/test/test_wintypes.py
IN ctypes/util.py
IN ctypes/wintypes.py
IN curses/__init__.py
IN curses/ascii.py
IN curses/has_key.py
IN curses/panel.py
IN curses/textpad.py
IN curses/wrapper.py
IN dbhash.py
IN decimal.py
IN difflib.py
IN dircache.py
IN dis.py
IN distutils/__init__.py
IN distutils/archive_util.py
IN distutils/bcppcompiler.py
IN distutils/ccompiler.py
IN distutils/cmd.py
IN distutils/command/__init__.py
IN distutils/command/bdist.py
IN distutils/command/bdist_dumb.py
IN distutils/command/bdist_msi.py
IN distutils/command/bdist_rpm.py
IN distutils/command/bdist_wininst.py
IN distutils/command/build.py
IN distutils/command/build_clib.py
IN distutils/command/build_ext.py
IN distutils/command/build_py.py
IN distutils/command/build_scripts.py
IN distutils/command/check.py
IN distutils/command/clean.py
IN distutils/command/config.py
IN distutils/command/install.py
IN distutils/command/install_data.py
IN distutils/command/install_egg_info.py
IN distutils/command/install_headers.py
IN distutils/command/install_lib.py
IN distutils/command/install_scripts.py
IN distutils/command/register.py
IN distutils/command/sdist.py
IN distutils/command/upload.py
IN distutils/config.py
IN distutils/core.py
IN distutils/cygwinccompiler.py
IN distutils/debug.py
IN distutils/dep_util.py
IN distutils/dir_util.py
IN distutils/dist.py
IN distutils/emxccompiler.py
IN distutils/errors.py
IN distutils/extension.py
IN distutils/fancy_getopt.py
IN distutils/file_util.py
IN distutils/filelist.py
IN distutils/log.py
IN distutils/msvc9compiler.py
IN distutils/msvccompiler.py
IN distutils/spawn.py
IN distutils/sysconfig.py
IN distutils/tests/__init__.py
IN distutils/tests/setuptools_build_ext.py
IN distutils/tests/setuptools_extension.py
IN distutils/tests/support.py
IN distutils/tests/test_archive_util.py
IN distutils/tests/test_bdist.py
IN distutils/tests/test_bdist_dumb.py
IN distutils/tests/test_bdist_msi.py
IN distutils/tests/test_bdist_rpm.py
IN distutils/tests/test_bdist_wininst.py
IN distutils/tests/test_build.py
IN distutils/tests/test_build_clib.py
IN distutils/tests/test_build_ext.py
IN distutils/tests/test_build_py.py
IN distutils/tests/test_build_scripts.py
IN distutils/tests/test_ccompiler.py
IN distutils/tests/test_check.py
IN distutils/tests/test_clean.py
IN distutils/tests/test_cmd.py
IN distutils/tests/test_config.py
IN distutils/tests/test_config_cmd.py
IN distutils/tests/test_core.py
IN distutils/tests/test_dep_util.py
IN distutils/tests/test_dir_util.py
IN distutils/tests/test_dist.py
IN distutils/tests/test_file_util.py
IN distutils/tests/test_filelist.py
IN distutils/tests/test_install.py
IN distutils/tests/test_install_data.py
IN distutils/tests/test_install_headers.py
IN distutils/tests/test_install_lib.py
IN distutils/tests/test_install_scripts.py
IN distutils/tests/test_msvc9compiler.py
IN distutils/tests/test_register.py
IN distutils/tests/test_sdist.py
IN distutils/tests/test_spawn.py
IN distutils/tests/test_sysconfig.py
IN distutils/tests/test_text_file.py
IN distutils/tests/test_unixccompiler.py
IN distutils/tests/test_upload.py
IN distutils/tests/test_util.py
IN distutils/tests/test_version.py
IN distutils/tests/test_versionpredicate.py
IN distutils/text_file.py
IN distutils/unixccompiler.py
IN distutils/util.py
IN distutils/version.py
IN distutils/versionpredicate.py
IN doctest.py
IN DocXMLRPCServer.py
IN dumbdbm.py
IN dummy_thread.py
IN dummy_threading.py
IN email/__init__.py
IN email/_parseaddr.py
IN email/base64mime.py
IN email/charset.py
IN email/encoders.py
IN email/errors.py
IN email/feedparser.py
IN email/generator.py
IN email/header.py
IN email/iterators.py
IN email/message.py
IN email/mime/__init__.py
IN email/mime/application.py
IN email/mime/audio.py
IN email/mime/base.py
IN email/mime/image.py
IN email/mime/message.py
IN email/mime/multipart.py
IN email/mime/nonmultipart.py
IN email/mime/text.py
IN email/parser.py
IN email/quoprimime.py
IN email/test/__init__.py
IN email/test/test_email.py
IN email/test/test_email_codecs.py
IN email/test/test_email_codecs_renamed.py
IN email/test/test_email_renamed.py
IN email/test/test_email_torture.py
IN email/utils.py
IN encodings/__init__.py
IN encodings/aliases.py
IN encodings/ascii.py
IN encodings/base64_codec.py
IN encodings/big5.py
IN encodings/big5hkscs.py
IN encodings/bz2_codec.py
IN encodings/charmap.py
IN encodings/cp037.py
IN encodings/cp1006.py
IN encodings/cp1026.py
IN encodings/cp1140.py
IN encodings/cp1250.py
IN encodings/cp1251.py
IN encodings/cp1252.py
IN encodings/cp1253.py
IN encodings/cp1254.py
IN encodings/cp1255.py
IN encodings/cp1256.py
IN encodings/cp1257.py
IN encodings/cp1258.py
IN encodings/cp424.py
IN encodings/cp437.py
IN encodings/cp500.py
IN encodings/cp720.py
IN encodings/cp737.py
IN encodings/cp775.py
IN encodings/cp850.py
IN encodings/cp852.py
IN encodings/cp855.py
IN encodings/cp856.py
IN encodings/cp857.py
IN encodings/cp858.py
IN encodings/cp860.py
IN encodings/cp861.py
IN encodings/cp862.py
IN encodings/cp863.py
IN encodings/cp864.py
IN encodings/cp865.py
IN encodings/cp866.py
IN encodings/cp869.py
IN encodings/cp874.py
IN encodings/cp875.py
IN encodings/cp932.py
IN encodings/cp949.py
IN encodings/cp950.py
IN encodings/euc_jis_2004.py
IN encodings/euc_jisx0213.py
IN encodings/euc_jp.py
IN encodings/euc_kr.py
IN encodings/gb18030.py
IN encodings/gb2312.py
IN encodings/gbk.py
IN encodings/hex_codec.py
IN encodings/hp_roman8.py
IN encodings/hz.py
IN encodings/idna.py
IN encodings/iso2022_jp.py
IN encodings/iso2022_jp_1.py
IN encodings/iso2022_jp_2.py
IN encodings/iso2022_jp_2004.py
IN encodings/iso2022_jp_3.py
IN encodings/iso2022_jp_ext.py
IN encodings/iso2022_kr.py
IN encodings/iso8859_1.py
IN encodings/iso8859_10.py
IN encodings/iso8859_11.py
IN encodings/iso8859_13.py
IN encodings/iso8859_14.py
IN encodings/iso8859_15.py
IN encodings/iso8859_16.py
IN encodings/iso8859_2.py
IN encodings/iso8859_3.py
IN encodings/iso8859_4.py
IN encodings/iso8859_5.py
IN encodings/iso8859_6.py
IN encodings/iso8859_7.py
IN encodings/iso8859_8.py
IN encodings/iso8859_9.py
IN encodings/johab.py
IN encodings/koi8_r.py
IN encodings/koi8_u.py
IN encodings/latin_1.py
IN encodings/mac_arabic.py
IN encodings/mac_centeuro.py
IN encodings/mac_croatian.py
IN encodings/mac_cyrillic.py
IN encodings/mac_farsi.py
IN encodings/mac_greek.py
IN encodings/mac_iceland.py
IN encodings/mac_latin2.py
IN encodings/mac_roman.py
IN encodings/mac_romanian.py
IN encodings/mac_turkish.py
IN encodings/mbcs.py
IN encodings/palmos.py
IN encodings/ptcp154.py
IN encodings/punycode.py
IN encodings/quopri_codec.py
IN encodings/raw_unicode_escape.py
IN encodings/rot_13.py
IN encodings/shift_jis.py
IN encodings/shift_jis_2004.py
IN encodings/shift_jisx0213.py
IN encodings/string_escape.py
IN encodings/tis_620.py
IN encodings/undefined.py
IN encodings/unicode_escape.py
IN encodings/unicode_internal.py
IN encodings/utf_16.py
IN encodings/utf_16_be.py
IN encodings/utf_16_le.py
IN encodings/utf_32.py
IN encodings/utf_32_be.py
IN encodings/utf_32_le.py
IN encodings/utf_7.py
IN encodings/utf_8.py
IN encodings/utf_8_sig.py
IN encodings/uu_codec.py
IN encodings/zlib_codec.py
IN ensurepip/__init__.py
IN ensurepip/__main__.py
IN ensurepip/_uninstall.py
IN filecmp.py
IN fileinput.py
IN fnmatch.py
IN formatter.py
IN fpformat.py
IN fractions.py
IN ftplib.py
IN functools.py
IN genericpath.py
IN getopt.py
IN getpass.py
IN gettext.py
IN glob.py
IN gzip.py
IN hashlib.py
IN heapq.py
IN hmac.py
IN hotshot/__init__.py
IN hotshot/log.py
IN hotshot/stats.py
IN hotshot/stones.py
IN htmlentitydefs.py
IN htmllib.py
IN HTMLParser.py
IN httplib.py
IN idlelib/__init__.py
IN idlelib/aboutDialog.py
IN idlelib/AutoComplete.py
IN idlelib/AutoCompleteWindow.py
IN idlelib/AutoExpand.py
IN idlelib/Bindings.py
IN idlelib/CallTips.py
IN idlelib/CallTipWindow.py
IN idlelib/ClassBrowser.py
IN idlelib/CodeContext.py
IN idlelib/ColorDelegator.py
IN idlelib/configDialog.py
IN idlelib/configHandler.py
IN idlelib/configHelpSourceEdit.py
IN idlelib/configSectionNameDialog.py
IN idlelib/Debugger.py
IN idlelib/Delegator.py
IN idlelib/dynOptionMenuWidget.py
IN idlelib/EditorWindow.py
IN idlelib/FileList.py
IN idlelib/FormatParagraph.py
IN idlelib/GrepDialog.py
IN idlelib/help.py
IN idlelib/HyperParser.py
IN idlelib/idle.py
IN idlelib/idle_test/__init__.py
IN idlelib/idle_test/htest.py
IN idlelib/idle_test/mock_idle.py
IN idlelib/idle_test/mock_tk.py
IN idlelib/idle_test/test_autocomplete.py
IN idlelib/idle_test/test_autoexpand.py
IN idlelib/idle_test/test_calltips.py
IN idlelib/idle_test/test_config_name.py
IN idlelib/idle_test/test_configdialog.py
IN idlelib/idle_test/test_delegator.py
IN idlelib/idle_test/test_formatparagraph.py
IN idlelib/idle_test/test_grep.py
IN idlelib/idle_test/test_hyperparser.py
IN idlelib/idle_test/test_idlehistory.py
IN idlelib/idle_test/test_io.py
IN idlelib/idle_test/test_parenmatch.py
IN idlelib/idle_test/test_pathbrowser.py
IN idlelib/idle_test/test_rstrip.py
IN idlelib/idle_test/test_searchdialogbase.py
IN idlelib/idle_test/test_searchengine.py
IN idlelib/idle_test/test_text.py
IN idlelib/idle_test/test_textview.py
IN idlelib/idle_test/test_warning.py
IN idlelib/idle_test/test_widgetredir.py
IN idlelib/IdleHistory.py
IN idlelib/idlever.py
IN idlelib/IOBinding.py
IN idlelib/keybindingDialog.py
IN idlelib/macosxSupport.py
IN idlelib/MultiCall.py
IN idlelib/MultiStatusBar.py
IN idlelib/ObjectBrowser.py
IN idlelib/OutputWindow.py
IN idlelib/ParenMatch.py
IN idlelib/PathBrowser.py
IN idlelib/Percolator.py
IN idlelib/PyParse.py
IN idlelib/PyShell.py
IN idlelib/RemoteDebugger.py
IN idlelib/RemoteObjectBrowser.py
IN idlelib/ReplaceDialog.py
IN idlelib/rpc.py
IN idlelib/RstripExtension.py
IN idlelib/run.py
IN idlelib/ScriptBinding.py
IN idlelib/ScrolledList.py
IN idlelib/SearchDialog.py
IN idlelib/SearchDialogBase.py
IN idlelib/SearchEngine.py
IN idlelib/StackViewer.py
IN idlelib/tabbedpages.py
IN idlelib/textView.py
IN idlelib/ToolTip.py
IN idlelib/TreeWidget.py
IN idlelib/UndoDelegator.py
IN idlelib/WidgetRedirector.py
IN idlelib/WindowList.py
IN idlelib/ZoomHeight.py
IN ihooks.py
IN imaplib.py
IN imghdr.py
IN importlib/__init__.py
IN imputil.py
IN inspect.py
IN io.py
IN json/__init__.py
IN json/decoder.py
IN json/encoder.py
IN json/scanner.py
IN json/tests/__init__.py
IN json/tests/test_check_circular.py
IN json/tests/test_decode.py
IN json/tests/test_default.py
IN json/tests/test_dump.py
IN json/tests/test_encode_basestring_ascii.py
IN json/tests/test_fail.py
IN json/tests/test_float.py
IN json/tests/test_indent.py
IN json/tests/test_pass1.py
IN json/tests/test_pass2.py
IN json/tests/test_pass3.py
IN json/tests/test_recursion.py
IN json/tests/test_scanstring.py
IN json/tests/test_separators.py
IN json/tests/test_speedups.py
IN json/tests/test_tool.py
IN json/tests/test_unicode.py
IN json/tool.py
IN keyword.py
IN lib-tk/Canvas.py
IN lib-tk/Dialog.py
IN lib-tk/FileDialog.py
IN lib-tk/FixTk.py
IN lib-tk/ScrolledText.py
IN lib-tk/SimpleDialog.py
IN lib-tk/test/runtktests.py
IN lib-tk/test/test_tkinter/__init__.py
IN lib-tk/test/test_tkinter/test_font.py
IN lib-tk/test/test_tkinter/test_geometry_managers.py
IN lib-tk/test/test_tkinter/test_images.py
IN lib-tk/test/test_tkinter/test_loadtk.py
IN lib-tk/test/test_tkinter/test_text.py
IN lib-tk/test/test_tkinter/test_variables.py
IN lib-tk/test/test_tkinter/test_widgets.py
IN lib-tk/test/test_ttk/__init__.py
IN lib-tk/test/test_ttk/support.py
IN lib-tk/test/test_ttk/test_extensions.py
IN lib-tk/test/test_ttk/test_functions.py
IN lib-tk/test/test_ttk/test_style.py
IN lib-tk/test/test_ttk/test_widgets.py
IN lib-tk/test/widget_tests.py
IN lib-tk/Tix.py
IN lib-tk/tkColorChooser.py
IN lib-tk/tkCommonDialog.py
IN lib-tk/Tkconstants.py
IN lib-tk/Tkdnd.py
IN lib-tk/tkFileDialog.py
IN lib-tk/tkFont.py
IN lib-tk/Tkinter.py
IN lib-tk/tkMessageBox.py
IN lib-tk/tkSimpleDialog.py
IN lib-tk/ttk.py
IN lib-tk/turtle.py
IN lib2to3/__init__.py
IN lib2to3/__main__.py
IN lib2to3/btm_matcher.py
IN lib2to3/btm_utils.py
IN lib2to3/fixer_base.py
IN lib2to3/fixer_util.py
IN lib2to3/fixes/__init__.py
IN lib2to3/fixes/fix_apply.py
IN lib2to3/fixes/fix_asserts.py
IN lib2to3/fixes/fix_basestring.py
IN lib2to3/fixes/fix_buffer.py
IN lib2to3/fixes/fix_callable.py
IN lib2to3/fixes/fix_dict.py
IN lib2to3/fixes/fix_except.py
IN lib2to3/fixes/fix_exec.py
IN lib2to3/fixes/fix_execfile.py
IN lib2to3/fixes/fix_exitfunc.py
IN lib2to3/fixes/fix_filter.py
IN lib2to3/fixes/fix_funcattrs.py
IN lib2to3/fixes/fix_future.py
IN lib2to3/fixes/fix_getcwdu.py
IN lib2to3/fixes/fix_has_key.py
IN lib2to3/fixes/fix_idioms.py
IN lib2to3/fixes/fix_import.py
IN lib2to3/fixes/fix_imports.py
IN lib2to3/fixes/fix_imports2.py
IN lib2to3/fixes/fix_input.py
IN lib2to3/fixes/fix_intern.py
IN lib2to3/fixes/fix_isinstance.py
IN lib2to3/fixes/fix_itertools.py
IN lib2to3/fixes/fix_itertools_imports.py
IN lib2to3/fixes/fix_long.py
IN lib2to3/fixes/fix_map.py
IN lib2to3/fixes/fix_metaclass.py
IN lib2to3/fixes/fix_methodattrs.py
IN lib2to3/fixes/fix_ne.py
IN lib2to3/fixes/fix_next.py
IN lib2to3/fixes/fix_nonzero.py
IN lib2to3/fixes/fix_numliterals.py
IN lib2to3/fixes/fix_operator.py
IN lib2to3/fixes/fix_paren.py
IN lib2to3/fixes/fix_print.py
IN lib2to3/fixes/fix_raise.py
IN lib2to3/fixes/fix_raw_input.py
IN lib2to3/fixes/fix_reduce.py
IN lib2to3/fixes/fix_renames.py
IN lib2to3/fixes/fix_repr.py
IN lib2to3/fixes/fix_set_literal.py
IN lib2to3/fixes/fix_standarderror.py
IN lib2to3/fixes/fix_sys_exc.py
IN lib2to3/fixes/fix_throw.py
IN lib2to3/fixes/fix_tuple_params.py
IN lib2to3/fixes/fix_types.py
IN lib2to3/fixes/fix_unicode.py
IN lib2to3/fixes/fix_urllib.py
IN lib2to3/fixes/fix_ws_comma.py
IN lib2to3/fixes/fix_xrange.py
IN lib2to3/fixes/fix_xreadlines.py
IN lib2to3/fixes/fix_zip.py
IN lib2to3/main.py
IN lib2to3/patcomp.py
IN lib2to3/pgen2/__init__.py
IN lib2to3/pgen2/conv.py
IN lib2to3/pgen2/driver.py
IN lib2to3/pgen2/grammar.py
IN lib2to3/pgen2/literals.py
IN lib2to3/pgen2/parse.py
IN lib2to3/pgen2/pgen.py
IN lib2to3/pgen2/token.py
IN lib2to3/pgen2/tokenize.py
IN lib2to3/pygram.py
IN lib2to3/pytree.py
IN lib2to3/refactor.py
IN linecache.py
IN locale.py
IN logging/__init__.py
IN logging/config.py
IN logging/handlers.py
IN macpath.py
IN macurl2path.py
IN mailbox.py
IN mailcap.py
IN markupbase.py
IN md5.py
IN mhlib.py
IN mimetools.py
IN mimetypes.py
IN MimeWriter.py
IN mimify.py
IN modulefinder.py
IN msilib/__init__.py
IN msilib/schema.py
IN msilib/sequence.py
IN msilib/text.py
IN multifile.py
IN multiprocessing/__init__.py
IN multiprocessing/connection.py
IN multiprocessing/dummy/__init__.py
IN multiprocessing/dummy/connection.py
IN multiprocessing/forking.py
IN multiprocessing/heap.py
IN multiprocessing/managers.py
IN multiprocessing/pool.py
IN multiprocessing/process.py
IN multiprocessing/queues.py
IN multiprocessing/reduction.py
IN multiprocessing/sharedctypes.py
IN multiprocessing/synchronize.py
IN multiprocessing/util.py
IN mutex.py
IN netrc.py
IN new.py
IN nntplib.py
IN ntpath.py
IN nturl2path.py
IN numbers.py
IN opcode.py
IN optparse.py
IN os.py
IN os2emxpath.py
IN pdb.py
IN pickle.py
IN pickletools.py
IN pipes.py
IN pkgutil.py
IN plat-aix3/IN.py
IN plat-aix4/IN.py
IN plat-atheos/IN.py
IN plat-atheos/TYPES.py
IN plat-beos5/IN.py
IN plat-darwin/IN.py
IN plat-freebsd4/IN.py
IN plat-freebsd5/IN.py
IN plat-freebsd6/IN.py
IN plat-freebsd7/IN.py
IN plat-freebsd8/IN.py
IN plat-irix5/AL.py
IN plat-irix5/CD.py
IN plat-irix5/cddb.py
IN plat-irix5/cdplayer.py
IN plat-irix5/CL.py
IN plat-irix5/CL_old.py
IN plat-irix5/DEVICE.py
IN plat-irix5/ERRNO.py
IN plat-irix5/FILE.py
IN plat-irix5/FL.py
IN plat-irix5/flp.py
IN plat-irix5/GET.py
IN plat-irix5/GL.py
IN plat-irix5/GLWS.py
IN plat-irix5/IN.py
IN plat-irix5/IOCTL.py
IN plat-irix5/jpeg.py
IN plat-irix5/panel.py
IN plat-irix5/panelparser.py
IN plat-irix5/readcd.py
IN plat-irix5/SV.py
IN plat-irix5/torgb.py
IN plat-irix5/WAIT.py
IN plat-irix6/AL.py
IN plat-irix6/CD.py
IN plat-irix6/cddb.py
IN plat-irix6/cdplayer.py
IN plat-irix6/CL.py
IN plat-irix6/DEVICE.py
IN plat-irix6/ERRNO.py
IN plat-irix6/FILE.py
IN plat-irix6/FL.py
IN plat-irix6/flp.py
IN plat-irix6/GET.py
IN plat-irix6/GL.py
IN plat-irix6/GLWS.py
IN plat-irix6/IN.py
IN plat-irix6/IOCTL.py
IN plat-irix6/jpeg.py
IN plat-irix6/panel.py
IN plat-irix6/panelparser.py
IN plat-irix6/readcd.py
IN plat-irix6/SV.py
IN plat-irix6/torgb.py
IN plat-irix6/WAIT.py
IN plat-linux2/CDROM.py
IN plat-linux2/DLFCN.py
IN plat-linux2/IN.py
IN plat-linux2/TYPES.py
IN plat-mac/aepack.py
IN plat-mac/aetools.py
IN plat-mac/aetypes.py
IN plat-mac/applesingle.py
IN plat-mac/appletrawmain.py
IN plat-mac/appletrunner.py
IN plat-mac/argvemulator.py
IN plat-mac/Audio_mac.py
IN plat-mac/bgenlocations.py
IN plat-mac/buildtools.py
IN plat-mac/bundlebuilder.py
IN plat-mac/Carbon/__init__.py
IN plat-mac/Carbon/AE.py
IN plat-mac/Carbon/AH.py
IN plat-mac/Carbon/Alias.py
IN plat-mac/Carbon/Aliases.py
IN plat-mac/Carbon/App.py
IN plat-mac/Carbon/Appearance.py
IN plat-mac/Carbon/AppleEvents.py
IN plat-mac/Carbon/AppleHelp.py
IN plat-mac/Carbon/CarbonEvents.py
IN plat-mac/Carbon/CarbonEvt.py
IN plat-mac/Carbon/CF.py
IN plat-mac/Carbon/CG.py
IN plat-mac/Carbon/Cm.py
IN plat-mac/Carbon/Components.py
IN plat-mac/Carbon/ControlAccessor.py
IN plat-mac/Carbon/Controls.py
IN plat-mac/Carbon/CoreFoundation.py
IN plat-mac/Carbon/CoreGraphics.py
IN plat-mac/Carbon/Ctl.py
IN plat-mac/Carbon/Dialogs.py
IN plat-mac/Carbon/Dlg.py
IN plat-mac/Carbon/Drag.py
IN plat-mac/Carbon/Dragconst.py
IN plat-mac/Carbon/Events.py
IN plat-mac/Carbon/Evt.py
IN plat-mac/Carbon/File.py
IN plat-mac/Carbon/Files.py
IN plat-mac/Carbon/Fm.py
IN plat-mac/Carbon/Folder.py
IN plat-mac/Carbon/Folders.py
IN plat-mac/Carbon/Fonts.py
IN plat-mac/Carbon/Help.py
IN plat-mac/Carbon/IBCarbon.py
IN plat-mac/Carbon/IBCarbonRuntime.py
IN plat-mac/Carbon/Icn.py
IN plat-mac/Carbon/Icons.py
IN plat-mac/Carbon/Launch.py
IN plat-mac/Carbon/LaunchServices.py
IN plat-mac/Carbon/List.py
IN plat-mac/Carbon/Lists.py
IN plat-mac/Carbon/MacHelp.py
IN plat-mac/Carbon/MacTextEditor.py
IN plat-mac/Carbon/MediaDescr.py
IN plat-mac/Carbon/Menu.py
IN plat-mac/Carbon/Menus.py
IN plat-mac/Carbon/Mlte.py
IN plat-mac/Carbon/OSA.py
IN plat-mac/Carbon/OSAconst.py
IN plat-mac/Carbon/Qd.py
IN plat-mac/Carbon/Qdoffs.py
IN plat-mac/Carbon/QDOffscreen.py
IN plat-mac/Carbon/Qt.py
IN plat-mac/Carbon/QuickDraw.py
IN plat-mac/Carbon/QuickTime.py
IN plat-mac/Carbon/Res.py
IN plat-mac/Carbon/Resources.py
IN plat-mac/Carbon/Scrap.py
IN plat-mac/Carbon/Snd.py
IN plat-mac/Carbon/Sndihooks.py
IN plat-mac/Carbon/Sound.py
IN plat-mac/Carbon/TE.py
IN plat-mac/Carbon/TextEdit.py
IN plat-mac/Carbon/Win.py
IN plat-mac/Carbon/Windows.py
IN plat-mac/cfmfile.py
IN plat-mac/EasyDialogs.py
IN plat-mac/findertools.py
IN plat-mac/FrameWork.py
IN plat-mac/gensuitemodule.py
IN plat-mac/ic.py
IN plat-mac/icopen.py
IN plat-mac/lib-scriptpackages/_builtinSuites/__init__.py
IN plat-mac/lib-scriptpackages/_builtinSuites/builtin_Suite.py
IN plat-mac/lib-scriptpackages/CodeWarrior/__init__.py
IN plat-mac/lib-scriptpackages/CodeWarrior/CodeWarrior_suite.py
IN plat-mac/lib-scriptpackages/CodeWarrior/Metrowerks_Shell_Suite.py
IN plat-mac/lib-scriptpackages/CodeWarrior/Required.py
IN plat-mac/lib-scriptpackages/CodeWarrior/Standard_Suite.py
IN plat-mac/lib-scriptpackages/Explorer/__init__.py
IN plat-mac/lib-scriptpackages/Explorer/Microsoft_Internet_Explorer.py
IN plat-mac/lib-scriptpackages/Explorer/Netscape_Suite.py
IN plat-mac/lib-scriptpackages/Explorer/Required_Suite.py
IN plat-mac/lib-scriptpackages/Explorer/Standard_Suite.py
IN plat-mac/lib-scriptpackages/Explorer/URL_Suite.py
IN plat-mac/lib-scriptpackages/Explorer/Web_Browser_Suite.py
IN plat-mac/lib-scriptpackages/Finder/__init__.py
IN plat-mac/lib-scriptpackages/Finder/Containers_and_folders.py
IN plat-mac/lib-scriptpackages/Finder/Enumerations.py
IN plat-mac/lib-scriptpackages/Finder/Files.py
IN plat-mac/lib-scriptpackages/Finder/Finder_Basics.py
IN plat-mac/lib-scriptpackages/Finder/Finder_items.py
IN plat-mac/lib-scriptpackages/Finder/Legacy_suite.py
IN plat-mac/lib-scriptpackages/Finder/Standard_Suite.py
IN plat-mac/lib-scriptpackages/Finder/Type_Definitions.py
IN plat-mac/lib-scriptpackages/Finder/Window_classes.py
IN plat-mac/lib-scriptpackages/Netscape/__init__.py
IN plat-mac/lib-scriptpackages/Netscape/Mozilla_suite.py
IN plat-mac/lib-scriptpackages/Netscape/PowerPlant.py
IN plat-mac/lib-scriptpackages/Netscape/Required_suite.py
IN plat-mac/lib-scriptpackages/Netscape/Standard_Suite.py
IN plat-mac/lib-scriptpackages/Netscape/Standard_URL_suite.py
IN plat-mac/lib-scriptpackages/Netscape/Text.py
IN plat-mac/lib-scriptpackages/Netscape/WorldWideWeb_suite.py
IN plat-mac/lib-scriptpackages/StdSuites/__init__.py
IN plat-mac/lib-scriptpackages/StdSuites/AppleScript_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/Macintosh_Connectivity_Clas.py
IN plat-mac/lib-scriptpackages/StdSuites/QuickDraw_Graphics_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/QuickDraw_Graphics_Suppleme.py
IN plat-mac/lib-scriptpackages/StdSuites/Required_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/Standard_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/Table_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/Text_Suite.py
IN plat-mac/lib-scriptpackages/StdSuites/Type_Names_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/__init__.py
IN plat-mac/lib-scriptpackages/SystemEvents/Disk_Folder_File_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Folder_Actions_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Hidden_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Login_Items_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Power_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Processes_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Standard_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/System_Events_Suite.py
IN plat-mac/lib-scriptpackages/SystemEvents/Text_Suite.py
IN plat-mac/lib-scriptpackages/Terminal/__init__.py
IN plat-mac/lib-scriptpackages/Terminal/Standard_Suite.py
IN plat-mac/lib-scriptpackages/Terminal/Terminal_Suite.py
IN plat-mac/lib-scriptpackages/Terminal/Text_Suite.py
IN plat-mac/macerrors.py
IN plat-mac/macostools.py
IN plat-mac/macresource.py
IN plat-mac/MiniAEFrame.py
IN plat-mac/pimp.py
IN plat-mac/PixMapWrapper.py
IN plat-mac/terminalcommand.py
IN plat-mac/videoreader.py
IN plat-netbsd1/IN.py
IN plat-os2emx/_emx_link.py
IN plat-os2emx/grp.py
IN plat-os2emx/IN.py
IN plat-os2emx/pwd.py
IN plat-os2emx/SOCKET.py
IN plat-riscos/riscosenviron.py
IN plat-riscos/riscospath.py
IN plat-riscos/rourl2path.py
IN plat-sunos5/CDIO.py
IN plat-sunos5/DLFCN.py
IN plat-sunos5/IN.py
IN plat-sunos5/STROPTS.py
IN plat-sunos5/SUNAUDIODEV.py
IN plat-sunos5/TYPES.py
IN plat-unixware7/IN.py
IN plat-unixware7/STROPTS.py
IN platform.py
IN plistlib.py
IN popen2.py
IN poplib.py
IN posixfile.py
IN posixpath.py
IN pprint.py
IN profile.py
IN pstats.py
IN pty.py
IN py_compile.py
IN pyclbr.py
IN pydoc.py
IN pydoc_data/__init__.py
IN pydoc_data/topics.py
IN Queue.py
IN quopri.py
IN random.py
IN re.py
IN repr.py
IN rexec.py
IN rfc822.py
IN rlcompleter.py
IN robotparser.py
IN runpy.py
IN sched.py
IN sets.py
IN sgmllib.py
IN sha.py
IN shelve.py
IN shlex.py
IN shutil.py
IN SimpleHTTPServer.py
IN SimpleXMLRPCServer.py
IN site.py
IN smtpd.py
IN smtplib.py
IN sndhdr.py
IN socket.py
IN SocketServer.py
IN sqlite3/__init__.py
IN sqlite3/dbapi2.py
IN sqlite3/dump.py
IN sqlite3/test/__init__.py
IN sqlite3/test/dbapi.py
IN sqlite3/test/dump.py
IN sqlite3/test/factory.py
IN sqlite3/test/hooks.py
IN sqlite3/test/py25tests.py
IN sqlite3/test/regression.py
IN sqlite3/test/transactions.py
IN sqlite3/test/types.py
IN sqlite3/test/userfunctions.py
IN sre.py
IN sre_compile.py
IN sre_constants.py
IN sre_parse.py
IN ssl.py
IN stat.py
IN statvfs.py
IN string.py
IN StringIO.py
IN stringold.py
IN stringprep.py
IN struct.py
IN subprocess.py
IN sunau.py
IN sunaudio.py
IN symbol.py
IN symtable.py
IN sysconfig.py
IN tabnanny.py
IN tarfile.py
IN telnetlib.py
IN tempfile.py
IN textwrap.py
IN this.py
IN threading.py
IN timeit.py
IN toaiff.py
IN token.py
IN tokenize.py
IN trace.py
IN traceback.py
IN tty.py
IN types.py
IN unittest/__init__.py
IN unittest/__main__.py
IN unittest/case.py
IN unittest/loader.py
IN unittest/main.py
IN unittest/result.py
IN unittest/runner.py
IN unittest/signals.py
IN unittest/suite.py
IN unittest/test/__init__.py
IN unittest/test/dummy.py
IN unittest/test/support.py
IN unittest/test/test_assertions.py
IN unittest/test/test_break.py
IN unittest/test/test_case.py
IN unittest/test/test_discovery.py
IN unittest/test/test_functiontestcase.py
IN unittest/test/test_loader.py
IN unittest/test/test_program.py
IN unittest/test/test_result.py
IN unittest/test/test_runner.py
IN unittest/test/test_setups.py
IN unittest/test/test_skipping.py
IN unittest/test/test_suite.py
IN unittest/util.py
IN urllib.py
IN urllib2.py
IN urlparse.py
IN user.py
IN UserDict.py
IN UserList.py
IN UserString.py
IN uu.py
IN uuid.py
IN warnings.py
IN wave.py
IN weakref.py
IN webbrowser.py
IN whichdb.py
IN wsgiref/__init__.py
IN wsgiref/handlers.py
IN wsgiref/headers.py
IN wsgiref/simple_server.py
IN wsgiref/util.py
IN wsgiref/validate.py
IN xdrlib.py
IN xml/__init__.py
IN xml/dom/__init__.py
IN xml/dom/domreg.py
IN xml/dom/expatbuilder.py
IN xml/dom/minicompat.py
IN xml/dom/minidom.py
IN xml/dom/NodeFilter.py
IN xml/dom/pulldom.py
IN xml/dom/xmlbuilder.py
IN xml/etree/__init__.py
IN xml/etree/cElementTree.py
IN xml/etree/ElementInclude.py
IN xml/etree/ElementPath.py
IN xml/etree/ElementTree.py
IN xml/parsers/__init__.py
IN xml/parsers/expat.py
IN xml/sax/__init__.py
IN xml/sax/_exceptions.py
IN xml/sax/expatreader.py
IN xml/sax/handler.py
IN xml/sax/saxutils.py
IN xml/sax/xmlreader.py
IN xmllib.py
IN xmlrpclib.py
IN zipfile.py

    )
ELSE ()
    PYTHON(bootstrap.py bootstrap.c python-libs.txt IN python-libs.txt OUT bootstrap.c)
ENDIF()

END()
