Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA14E66DA73
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 11:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbjAQKAc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 05:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbjAQKAb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:31 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E8E2BEE8;
        Tue, 17 Jan 2023 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949629; x=1705485629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RnFb+TI1TUgriT4O7/ALroeAYeEPbJNYVdBwoGsYto=;
  b=Plk3yKxatTjbXVkWx4G88QWkgyA+vWa7KnRRnGUIoLylrnlKNSyHUIws
   pZUpfn3j2Y2un0zZWK/CxMzIFVFhgacjvNRWmULkMwZs5fcEZ5GpzXJWW
   Mzbx8BwTJt3bxN8LWuZb/nix23zsbDx5IweF469YI1UA9xrcGOxrC27n3
   I8pncT5uC5/IDft5NCbOdUV7rDHFqmxdI62zQX3YkzlnZDBGXJSq7HNLz
   mfvSN1cbdb/4LLmfHRrsoBaIDNKhiRSfrnu0+EwP7QaKzb1V25y5Zo+2M
   RATmIycygiC/hpB/5HNgQxA8An+M9CXSXdKsaDQ1YPVVnLK0lTfB6h5fi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="305031053"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="305031053"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609197069"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="609197069"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:27 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 6/6] docs/kbuild/makefiles: unify quoting
Date:   Tue, 17 Jan 2023 11:59:46 +0200
Message-Id: <20230117095946.2042832-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
References: <20230117095946.2042832-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding any rst quoting seems to be controversial, but at least try to
unify the existing quoting a bit, without adding new ones.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/kbuild/makefiles.rst | 120 ++++++++++++++---------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 6a1ff67eed34..738d1499db50 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -42,7 +42,7 @@ Who does what
 People have four different relationships with the kernel Makefiles.
 
 *Users* are people who build kernels.  These people type commands such as
-"make menuconfig" or "make".  They usually do not read or edit
+``make menuconfig`` or ``make``.  They usually do not read or edit
 any kernel Makefiles (or any other source files).
 
 *Normal developers* are people who work on features such as device
@@ -69,8 +69,8 @@ Most Makefiles within the kernel are kbuild Makefiles that use the
 kbuild infrastructure. This chapter introduces the syntax used in the
 kbuild makefiles.
 
-The preferred name for the kbuild files are 'Makefile' but 'Kbuild' can
-be used and if both a 'Makefile' and a 'Kbuild' file exists, then the 'Kbuild'
+The preferred name for the kbuild files are ``Makefile`` but ``Kbuild`` can
+be used and if both a ``Makefile`` and a ``Kbuild`` file exists, then the ``Kbuild``
 file will be used.
 
 Section `Goal definitions`_ is a quick intro; further chapters provide
@@ -111,7 +111,7 @@ in the $(obj-y) lists.  These lists depend on the kernel
 configuration.
 
 Kbuild compiles all the $(obj-y) files.  It then calls
-"$(AR) rcSTP" to merge these files into one built-in.a file.
+``$(AR) rcSTP`` to merge these files into one built-in.a file.
 This is a thin archive without a symbol table. It will be later
 linked into vmlinux by scripts/link-vmlinux.sh
 
@@ -148,7 +148,7 @@ Example::
   #drivers/isdn/i4l/Makefile
   obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
 
-Note: In this example $(CONFIG_ISDN_PPP_BSDCOMP) evaluates to 'm'
+Note: In this example $(CONFIG_ISDN_PPP_BSDCOMP) evaluates to "m"
 
 If a kernel module is built from several source files, you specify
 that you want to build a module in the same way as above; however,
@@ -164,10 +164,10 @@ Example::
 
 In this example, the module name will be isdn.o. Kbuild will
 compile the objects listed in $(isdn-y) and then run
-"$(LD) -r" on the list of these files to generate isdn.o.
+``$(LD) -r`` on the list of these files to generate isdn.o.
 
 Due to kbuild recognizing $(<module_name>-y) for composite objects,
-you can use the value of a `CONFIG_` symbol to optionally include an
+you can use the value of a ``CONFIG_`` symbol to optionally include an
 object file as part of a composite object.
 
 Example::
@@ -181,7 +181,7 @@ Example::
 
 In this example, xattr.o, xattr_user.o and xattr_trusted.o are only
 part of the composite object ext2.o if $(CONFIG_EXT2_FS_XATTR)
-evaluates to 'y'.
+evaluates to "y".
 
 Note: Of course, when you are building objects into the kernel,
 the syntax above will also work. So, if you have CONFIG_EXT2_FS=y,
@@ -217,7 +217,7 @@ shall be listed in libs-y.
 
 See also `List directories to visit when descending`_.
 
-Use of lib-y is normally restricted to `lib/` and `arch/*/lib`.
+Use of lib-y is normally restricted to ``lib/`` and ``arch/*/lib``.
 
 Descending down in directories
 ------------------------------
@@ -237,7 +237,7 @@ Example::
   #fs/Makefile
   obj-$(CONFIG_EXT2_FS) += ext2/
 
-If CONFIG_EXT2_FS is set to either 'y' (built-in) or 'm' (modular)
+If CONFIG_EXT2_FS is set to either "y" (built-in) or "m" (modular)
 the corresponding obj- variable will be set, and kbuild will descend
 down in the ext2 directory.
 
@@ -245,11 +245,11 @@ Kbuild uses this information not only to decide that it needs to visit
 the directory, but also to decide whether or not to link objects from
 the directory into vmlinux.
 
-When Kbuild descends into the directory with 'y', all built-in objects
+When Kbuild descends into the directory with "y", all built-in objects
 from that directory are combined into the built-in.a, which will be
 eventually linked into vmlinux.
 
-When Kbuild descends into the directory with 'm', in contrast, nothing
+When Kbuild descends into the directory with "m", in contrast, nothing
 from that directory will be linked into vmlinux. If the Makefile in
 that directory specifies obj-y, those objects will be left orphan.
 It is very likely a bug of the Makefile or of dependencies in Kconfig.
@@ -269,9 +269,9 @@ Examples::
 Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
 syntax is always used for directories.
 
-It is good practice to use a `CONFIG_` variable when assigning directory
+It is good practice to use a ``CONFIG_`` variable when assigning directory
 names. This allows kbuild to totally skip the directory if the
-corresponding `CONFIG_` option is neither 'y' nor 'm'.
+corresponding ``CONFIG_`` option is neither "y" nor "m".
 
 Non-builtin vmlinux targets - extra-y
 -------------------------------------
@@ -294,7 +294,7 @@ Example::
 $(extra-y) should only contain targets needed for vmlinux.
 
 Kbuild skips extra-y when vmlinux is apparently not a final goal.
-(e.g. 'make modules', or building external modules)
+(e.g. ``make modules``, or building external modules)
 
 If you intend to build targets unconditionally, always-y (explained
 in the next section) is the correct syntax to use.
@@ -402,8 +402,8 @@ Dependency tracking
 
 Kbuild tracks dependencies on the following:
 
-1) All prerequisite files (both `*.c` and `*.h`)
-2) `CONFIG_` options used in all prerequisite files
+1) All prerequisite files (both ``*.c`` and ``*.h``)
+2) ``CONFIG_`` options used in all prerequisite files
 3) Command-line used to compile target
 
 Thus, if you change an option to $(CC) all affected files will
@@ -451,10 +451,10 @@ $(obj)
 
 $(kecho)
   echoing information to user in a rule is often a good practice
-  but when execution "make -s" one does not expect to see any output
+  but when execution ``make -s`` one does not expect to see any output
   except for warnings/errors.
   To support this kbuild defines $(kecho) which will echo out the
-  text following $(kecho) to stdout except if "make -s" is used.
+  text following $(kecho) to stdout except if ``make -s`` is used.
 
   Example::
 
@@ -484,7 +484,7 @@ $(kecho)
 
     GEN     lib/crc32table.h
 
-  will be displayed with "make KBUILD_VERBOSE=".
+  will be displayed with ``make KBUILD_VERBOSE=``.
 
 Command change detection
 ------------------------
@@ -543,7 +543,7 @@ available.
 
 as-option
   as-option is used to check if $(CC) -- when used to compile
-  assembler (`*.S`) files -- supports the given option. An optional
+  assembler (``*.S``) files -- supports the given option. An optional
   second option may be specified if the first option is not supported.
 
   Example::
@@ -579,7 +579,7 @@ cc-option
 
 cc-option-yn
   cc-option-yn is used to check if gcc supports a given option
-  and return 'y' if supported, otherwise 'n'.
+  and return "y" if supported, otherwise "n".
 
   Example::
 
@@ -589,7 +589,7 @@ cc-option-yn
     cflags-$(biarch) += -m32
 
   In the above example, $(biarch) is set to y if $(CC) supports the -m32
-  option. When $(biarch) equals 'y', the expanded variables $(aflags-y)
+  option. When $(biarch) equals "y", the expanded variables $(aflags-y)
   and $(cflags-y) will be assigned the values -a32 and -m32,
   respectively.
 
@@ -700,11 +700,11 @@ compilation stage.
 Two steps are required in order to use a host executable.
 
 The first step is to tell kbuild that a host program exists. This is
-done utilising the variable "hostprogs".
+done utilising the variable ``hostprogs``.
 
 The second step is to add an explicit dependency to the executable.
 This can be done in two ways. Either add the dependency in a rule,
-or utilise the variable "always-y".
+or utilise the variable ``always-y``.
 Both possibilities are described in the following.
 
 Simple Host Program
@@ -820,7 +820,7 @@ Example::
   HOSTLDLIBS_qconf := -L$(QTDIR)/lib
 
 When linking qconf, it will be passed the extra option
-"-L$(QTDIR)/lib".
+``-L$(QTDIR)/lib``.
 
 When host programs are actually built
 -------------------------------------
@@ -869,8 +869,8 @@ Just like host programs, Kbuild also supports building userspace executables
 for the target architecture (i.e. the same architecture as you are building
 the kernel for).
 
-The syntax is quite similar. The difference is to use "userprogs" instead of
-"hostprogs".
+The syntax is quite similar. The difference is to use ``userprogs`` instead of
+``hostprogs``.
 
 Simple Userspace Program
 ------------------------
@@ -974,13 +974,13 @@ There are two ways to do this.
 Kbuild clean infrastructure
 ===========================
 
-"make clean" deletes most generated files in the obj tree where the kernel
+``make clean`` deletes most generated files in the obj tree where the kernel
 is compiled. This includes generated files such as host programs.
 Kbuild knows targets listed in $(hostprogs), $(always-y), $(always-m),
 $(always-), $(extra-y), $(extra-) and $(targets). They are all deleted
-during "make clean". Files matching the patterns "*.[oas]", "*.ko", plus
+during ``make clean``. Files matching the patterns ``*.[oas]``, ``*.ko``, plus
 some additional files generated by kbuild are deleted all over the kernel
-source tree when "make clean" is executed.
+source tree when ``make clean`` is executed.
 
 Additional files or directories can be specified in kbuild makefiles by use of
 $(clean-files).
@@ -990,14 +990,14 @@ Example::
   #lib/Makefile
   clean-files := crc32table.h
 
-When executing "make clean", the file "crc32table.h" will be deleted.
+When executing ``make clean``, the file ``crc32table.h`` will be deleted.
 Kbuild will assume files to be in the same relative directory as the
 Makefile, except if prefixed with $(objtree).
 
 To exclude certain files or directories from make clean, use the
 $(no-clean-files) variable.
 
-Usually kbuild descends down in subdirectories due to "obj-* := dir/",
+Usually kbuild descends down in subdirectories due to ``obj-* := dir/``,
 but in the architecture makefiles where the kbuild infrastructure
 is not sufficient this sometimes needs to be explicit.
 
@@ -1007,14 +1007,14 @@ Example::
   subdir- := compressed
 
 The above assignment instructs kbuild to descend down in the
-directory compressed/ when "make clean" is executed.
+directory compressed/ when ``make clean`` is executed.
 
-Note 1: arch/$(SRCARCH)/Makefile cannot use "subdir-", because that file is
+Note 1: arch/$(SRCARCH)/Makefile cannot use ``subdir-``, because that file is
 included in the top level makefile. Instead, arch/$(SRCARCH)/Kbuild can use
-"subdir-".
+``subdir-``.
 
 Note 2: All directories listed in core-y, libs-y, drivers-y and net-y will
-be visited during "make clean".
+be visited during ``make clean``.
 
 Architecture Makefiles
 ======================
@@ -1148,7 +1148,7 @@ KBUILD_CFLAGS
 
 
   The first example utilises the trick that a config option expands
-  to 'y' when selected.
+  to "y" when selected.
 
 KBUILD_RUSTFLAGS
   $(RUSTC) compiler flags
@@ -1227,7 +1227,7 @@ KBUILD_VMLINUX_OBJS
   they are placed before the other objects.
 
 KBUILD_VMLINUX_LIBS
-  All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and
+  All .a ``lib`` files for vmlinux. KBUILD_VMLINUX_OBJS and
   KBUILD_VMLINUX_LIBS together specify all the object files used to
   link vmlinux.
 
@@ -1235,9 +1235,9 @@ Add prerequisites to archheaders
 --------------------------------
 
 The archheaders: rule is used to generate header files that
-may be installed into user space by "make header_install".
+may be installed into user space by ``make header_install``.
 
-It is run before "make archprepare" when run on the
+It is run before ``make archprepare`` when run on the
 architecture itself.
 
 Add prerequisites to archprepare
@@ -1317,11 +1317,11 @@ Example::
   bzImage: vmlinux
           $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-"$(Q)$(MAKE) $(build)=<dir>" is the recommended way to invoke
+``$(Q)$(MAKE) $(build)=<dir>`` is the recommended way to invoke
 make in a subdirectory.
 
 There are no rules for naming architecture-specific targets,
-but executing "make help" will list all relevant targets.
+but executing ``make help`` will list all relevant targets.
 To support this, $(archhelp) must be defined.
 
 Example::
@@ -1336,7 +1336,7 @@ will be built. In the top level Makefile the first goal present
 is all:.
 
 An architecture shall always, per default, build a bootable image.
-In "make help", the default goal is highlighted with a '*'.
+In ``make help``, the default goal is highlighted with a ``*``.
 
 Add a new prerequisite to all: to select a default goal different
 from vmlinux.
@@ -1346,7 +1346,7 @@ Example::
   #arch/x86/Makefile
   all: bzImage
 
-When "make" is executed without arguments, bzImage will be built.
+When ``make`` is executed without arguments, bzImage will be built.
 
 Commands useful for building a boot image
 -----------------------------------------
@@ -1377,11 +1377,11 @@ ld
   1) check for commandline changes
   2) delete target during make clean
 
-  The ": %: %.o" part of the prerequisite is a shorthand that
+  The ``: %: %.o`` part of the prerequisite is a shorthand that
   frees us from listing the setup.o and bootsect.o files.
 
   Note:
-  It is a common mistake to forget the "targets :=" assignment,
+  It is a common mistake to forget the ``targets :=`` assignment,
   resulting in the target file being recompiled for no
   obvious reason.
 
@@ -1406,10 +1406,10 @@ dtc
   in an init section in the image. Platform code *must* copy the
   blob to non-init memory prior to calling unflatten_device_tree().
 
-  To use this command, simply add `*.dtb` into obj-y or targets, or make
-  some other target depend on `%.dtb`
+  To use this command, simply add ``*.dtb`` into obj-y or targets, or make
+  some other target depend on ``%.dtb``
 
-  A central rule exists to create `$(obj)/%.dtb` from `$(src)/%.dts`;
+  A central rule exists to create ``$(obj)/%.dtb`` from ``$(src)/%.dts``;
   architecture Makefiles do no need to explicitly write out that rule.
 
   Example::
@@ -1426,7 +1426,7 @@ arch/$(SRCARCH)/kernel/vmlinux.lds is used.
 The script is a preprocessed variant of the file vmlinux.lds.S
 located in the same directory.
 
-kbuild knows .lds files and includes a rule `*lds.S` -> `*lds`.
+kbuild knows .lds files and includes a rule ``*lds.S`` -> ``*lds``.
 
 Example::
 
@@ -1439,7 +1439,7 @@ target vmlinux.lds.
 The assignment to $(CPPFLAGS_vmlinux.lds) tells kbuild to use the
 specified options when building the target vmlinux.lds.
 
-When building the `*.lds` target, kbuild uses the variables::
+When building the ``*.lds`` target, kbuild uses the variables::
 
   KBUILD_CPPFLAGS      : Set in top-level Makefile
   cppflags-y           : May be set in the kbuild makefile
@@ -1447,7 +1447,7 @@ When building the `*.lds` target, kbuild uses the variables::
                          Note that the full filename is used in this
                          assignment.
 
-The kbuild infrastructure for `*lds` files is used in several
+The kbuild infrastructure for ``*lds`` files is used in several
 architecture-specific files.
 
 Generic header files
@@ -1488,7 +1488,7 @@ The pre-processing does:
 
 - drop kernel-specific annotations
 - drop include of compiler.h
-- drop all sections that are kernel internal (guarded by `ifdef __KERNEL__`)
+- drop all sections that are kernel internal (guarded by ``ifdef __KERNEL__``)
 
 All headers under include/uapi/, include/generated/uapi/,
 arch/<arch>/include/uapi/ and arch/<arch>/include/generated/uapi/
@@ -1598,7 +1598,7 @@ SRCARCH
   This variable specifies the directory in arch/ to build.
 
   ARCH and SRCARCH may not necessarily match. A couple of arch
-  directories are biarch, that is, a single `arch/*/` directory supports
+  directories are biarch, that is, a single ``arch/*/`` directory supports
   both 32-bit and 64-bit.
 
   For example, you can pass in ARCH=i386, ARCH=x86_64, or ARCH=x86.
@@ -1622,7 +1622,7 @@ INSTALL_MOD_PATH, MODLIB
 
 INSTALL_MOD_STRIP
   If this variable is specified, it will cause modules to be stripped
-  after they are installed.  If INSTALL_MOD_STRIP is '1', then the
+  after they are installed.  If INSTALL_MOD_STRIP is "1", then the
   default option --strip-debug will be used.  Otherwise, the
   INSTALL_MOD_STRIP value will be used as the option(s) to the strip
   command.
@@ -1636,15 +1636,15 @@ GNU extensions.
 
 GNU Make supports elementary list-processing functions.  The kernel
 Makefiles use a novel style of list building and manipulation with few
-"if" statements.
+``if`` statements.
 
-GNU Make has two assignment operators, ":=" and "=".  ":=" performs
+GNU Make has two assignment operators, ``:=`` and ``=``.  ``:=`` performs
 immediate evaluation of the right-hand side and stores an actual string
-into the left-hand side.  "=" is like a formula definition; it stores the
+into the left-hand side.  ``=`` is like a formula definition; it stores the
 right-hand side in an unevaluated form and then evaluates this form each
 time the left-hand side is used.
 
-There are some cases where "=" is appropriate.  Usually, though, ":="
+There are some cases where ``=`` is appropriate.  Usually, though, ``:=``
 is the right choice.
 
 Credits
-- 
2.34.1

