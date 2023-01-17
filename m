Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60AF66DA6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 11:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236372AbjAQKA0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 05:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjAQKAV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:21 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF8E2BEF1;
        Tue, 17 Jan 2023 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949619; x=1705485619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UKtv3kUx0vS3buDAuUIeHU2A9cEBJviu8ldfa7WMCxo=;
  b=hRoi3g7yzBXG7bIclLzlodBDPWA3us366ep9QoNCeYzTepgJHYiixNJf
   nLu37ApDVoptd12q27oMhIj/J9E/BtoYATMITFEvPXJPr2e+9i6K9x4En
   lES8IQ4hVYv+IJ6p0cWqXoBY9d9nrwEouZwudlj7GzxF6wlxLqo4qlLwV
   twpzX0vv188KPXUqhRcs0WbsqKINgM/gCLh6qNbAh+4if+s4fBTOUMwku
   yyaj2jSo9aCwW/vn2byPFbVvEDSinLZ5pMp/h12hW5a2bq+JQaGzgxcrR
   22DyacivIxyh9QdgPxK1j58M3zQPmT4MTkZ3H4o6B/AX6JF3VeUF7HRL9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325933251"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="325933251"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904595605"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="904595605"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:16 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 4/6] docs/kbuild/makefiles: drop section numbering, use references
Date:   Tue, 17 Jan 2023 11:59:44 +0200
Message-Id: <20230117095946.2042832-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
References: <20230117095946.2042832-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Drop the manually updated section numbering. It's hard to maintain, and
indeed hasn't been updated when sections 3.4 and 7.8 were dropped.

Update all the section references to rst references.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/kbuild/makefiles.rst | 206 ++++++++++++++---------------
 1 file changed, 103 insertions(+), 103 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 12cf92320e46..0180a49fefbf 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -4,8 +4,8 @@ Linux Kernel Makefiles
 
 This document describes the Linux kernel Makefiles.
 
-1 Overview
-==========
+Overview
+========
 
 The Makefiles have five parts::
 
@@ -36,8 +36,8 @@ scripts/Makefile.* contains all the definitions/rules etc. that
 are used to build the kernel based on the kbuild makefiles.
 
 
-2 Who does what
-===============
+Who does what
+=============
 
 People have four different relationships with the kernel Makefiles.
 
@@ -62,8 +62,8 @@ These people need to know about all aspects of the kernel Makefiles.
 This document is aimed towards normal developers and arch developers.
 
 
-3 The kbuild files
-==================
+The kbuild files
+================
 
 Most Makefiles within the kernel are kbuild Makefiles that use the
 kbuild infrastructure. This chapter introduces the syntax used in the
@@ -72,11 +72,11 @@ The preferred name for the kbuild files are 'Makefile' but 'Kbuild' can
 be used and if both a 'Makefile' and a 'Kbuild' file exists, then the 'Kbuild'
 file will be used.
 
-Section 3.1 "Goal definitions" is a quick intro; further chapters provide
+Section `Goal definitions`_ is a quick intro; further chapters provide
 more details, with real examples.
 
-3.1 Goal definitions
---------------------
+Goal definitions
+----------------
 
 	Goal definitions are the main part (heart) of the kbuild Makefile.
 	These lines define the files to be built, any special compilation
@@ -102,8 +102,8 @@ more details, with real examples.
 	If CONFIG_FOO is neither y nor m, then the file will not be compiled
 	nor linked.
 
-3.2 Built-in object goals - obj-y
----------------------------------
+Built-in object goals - obj-y
+-----------------------------
 
 	The kbuild Makefile specifies object files for vmlinux
 	in the $(obj-y) lists.  These lists depend on the kernel
@@ -132,8 +132,8 @@ more details, with real examples.
 		obj-$(CONFIG_ISDN_I4L)         += isdn.o
 		obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
 
-3.3 Loadable module goals - obj-m
----------------------------------
+Loadable module goals - obj-m
+-----------------------------
 
 	$(obj-m) specifies object files which are built as loadable
 	kernel modules.
@@ -187,8 +187,8 @@ more details, with real examples.
 	kbuild will build an ext2.o file for you out of the individual
 	parts and then link this into built-in.a, as you would expect.
 
-3.5 Library file goals - lib-y
-------------------------------
+Library file goals - lib-y
+--------------------------
 
 	Objects listed with obj-* are used for modules, or
 	combined in a built-in.a for that specific directory.
@@ -214,12 +214,12 @@ more details, with real examples.
 	actually recognize that there is a lib.a being built, the directory
 	shall be listed in libs-y.
 
-	See also "7.4 List directories to visit when descending".
+	See also `List directories to visit when descending`_.
 
 	Use of lib-y is normally restricted to `lib/` and `arch/*/lib`.
 
-3.6 Descending down in directories
-----------------------------------
+Descending down in directories
+------------------------------
 
 	A Makefile is only responsible for building objects in its own
 	directory. Files in subdirectories should be taken care of by
@@ -272,8 +272,8 @@ more details, with real examples.
 	names. This allows kbuild to totally skip the directory if the
 	corresponding `CONFIG_` option is neither 'y' nor 'm'.
 
-3.7 Non-builtin vmlinux targets - extra-y
------------------------------------------
+Non-builtin vmlinux targets - extra-y
+-------------------------------------
 
 	extra-y specifies targets which are needed for building vmlinux,
 	but not combined into built-in.a.
@@ -298,8 +298,8 @@ more details, with real examples.
 	If you intend to build targets unconditionally, always-y (explained
 	in the next section) is the correct syntax to use.
 
-3.8 Always built goals - always-y
----------------------------------
+Always built goals - always-y
+-----------------------------
 
 	always-y specifies targets which are literally always built when
 	Kbuild visits the Makefile.
@@ -309,8 +309,8 @@ more details, with real examples.
 	  offsets-file := include/generated/asm-offsets.h
 	  always-y += $(offsets-file)
 
-3.9 Compilation flags
----------------------
+Compilation flags
+-----------------
 
     ccflags-y, asflags-y and ldflags-y
 	These three flags apply only to the kbuild makefile in which they
@@ -396,8 +396,8 @@ more details, with real examples.
 		AFLAGS_iwmmxt.o      := -Wa,-mcpu=iwmmxt
 
 
-3.10 Dependency tracking
-------------------------
+Dependency tracking
+-------------------
 
 	Kbuild tracks dependencies on the following:
 
@@ -408,8 +408,8 @@ more details, with real examples.
 	Thus, if you change an option to $(CC) all affected files will
 	be re-compiled.
 
-3.11 Custom Rules
------------------
+Custom Rules
+------------
 
 	Custom rules are used when the kbuild infrastructure does
 	not provide the required support. A typical example is
@@ -485,8 +485,8 @@ more details, with real examples.
 
 	will be displayed with "make KBUILD_VERBOSE=".
 
-3.12 Command change detection
------------------------------
+Command change detection
+------------------------
 
 	When the rule is evaluated, timestamps are compared between the target
 	and its prerequisite files. GNU Make updates the target when any of the
@@ -514,7 +514,7 @@ more details, with real examples.
 	explicitly added to $(targets).
 
 	Assignments to $(targets) are without $(obj)/ prefix. if_changed may be
-	used in conjunction with custom rules as defined in "3.11 Custom Rules".
+	used in conjunction with custom rules as defined in `Custom Rules`_.
 
 	Note: It is a typical mistake to forget the FORCE prerequisite.
 	Another common pitfall is that whitespace is sometimes significant; for
@@ -531,8 +531,8 @@ more details, with real examples.
 		unwanted results when the target is up to date and only the
 		tests on changed commands trigger execution of commands.
 
-3.13 $(CC) support functions
-----------------------------
+$(CC) support functions
+-----------------------
 
 	The kernel may be built with several different versions of
 	$(CC), each supporting a unique set of features and options.
@@ -651,8 +651,8 @@ more details, with real examples.
 			endif
 		endif
 
-3.14 $(LD) support functions
-----------------------------
+$(LD) support functions
+-----------------------
 
     ld-option
 	ld-option is used to check if $(LD) supports the supplied option.
@@ -665,8 +665,8 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
-3.15 Script invocation
-----------------------
+Script invocation
+-----------------
 
 	Make rules may invoke scripts to build the kernel. The rules shall
 	always provide the appropriate interpreter to execute the script. They
@@ -685,8 +685,8 @@ more details, with real examples.
 		cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
 			     $(KERNELRELEASE)
 
-4 Host Program support
-======================
+Host Program support
+====================
 
 Kbuild supports building executables on the host for use during the
 compilation stage.
@@ -700,8 +700,8 @@ This can be done in two ways. Either add the dependency in a rule,
 or utilise the variable "always-y".
 Both possibilities are described in the following.
 
-4.1 Simple Host Program
------------------------
+Simple Host Program
+-------------------
 
 	In some cases there is a need to compile and run a program on the
 	computer where the build is running.
@@ -716,8 +716,8 @@ Both possibilities are described in the following.
 	c-source file named bin2hex.c located in the same directory as
 	the Makefile.
 
-4.2 Composite Host Programs
----------------------------
+Composite Host Programs
+-----------------------
 
 	Host programs can be made up based on composite objects.
 	The syntax used to define composite objects for host programs is
@@ -738,8 +738,8 @@ Both possibilities are described in the following.
 	Finally, the two .o files are linked to the executable, lxdialog.
 	Note: The syntax <executable>-y is not permitted for host-programs.
 
-4.3 Using C++ for host programs
--------------------------------
+Using C++ for host programs
+---------------------------
 
 	kbuild offers support for host programs written in C++. This was
 	introduced solely to support kconfig, and is not recommended
@@ -764,8 +764,8 @@ Both possibilities are described in the following.
 		qconf-cxxobjs := qconf.o
 		qconf-objs    := check.o
 
-4.4 Using Rust for host programs
---------------------------------
+Using Rust for host programs
+----------------------------
 
 	Kbuild offers support for host programs written in Rust. However,
 	since a Rust toolchain is not mandatory for kernel compilation,
@@ -781,8 +781,8 @@ Both possibilities are described in the following.
 	located in the same directory as the ``Makefile``. The crate may
 	consist of several source files (see ``samples/rust/hostprogs``).
 
-4.5 Controlling compiler options for host programs
---------------------------------------------------
+Controlling compiler options for host programs
+----------------------------------------------
 
 	When compiling host programs, it is possible to set specific flags.
 	The programs will always be compiled utilising $(HOSTCC) passed
@@ -813,8 +813,8 @@ Both possibilities are described in the following.
 	When linking qconf, it will be passed the extra option
 	"-L$(QTDIR)/lib".
 
-4.6 When host programs are actually built
------------------------------------------
+When host programs are actually built
+-------------------------------------
 
 	Kbuild will only build host-programs when they are referenced
 	as a prerequisite.
@@ -852,8 +852,8 @@ Both possibilities are described in the following.
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
-5 Userspace Program support
-===========================
+Userspace Program support
+=========================
 
 Just like host programs, Kbuild also supports building userspace executables
 for the target architecture (i.e. the same architecture as you are building
@@ -862,8 +862,8 @@ the kernel for).
 The syntax is quite similar. The difference is to use "userprogs" instead of
 "hostprogs".
 
-5.1 Simple Userspace Program
-----------------------------
+Simple Userspace Program
+------------------------
 
 	The following line tells kbuild that the program bpf-direct shall be
 	built for the target architecture.
@@ -876,8 +876,8 @@ The syntax is quite similar. The difference is to use "userprogs" instead of
 	single C source file named bpf-direct.c located in the same directory
 	as the Makefile.
 
-5.2 Composite Userspace Programs
---------------------------------
+Composite Userspace Programs
+----------------------------
 
 	Userspace programs can be made up based on composite objects.
 	The syntax used to define composite objects for userspace programs is
@@ -898,8 +898,8 @@ The syntax is quite similar. The difference is to use "userprogs" instead of
 	Finally, the two .o files are linked to the executable, bpf-fancy.
 	Note: The syntax <executable>-y is not permitted for userspace programs.
 
-5.3 Controlling compiler options for userspace programs
--------------------------------------------------------
+Controlling compiler options for userspace programs
+---------------------------------------------------
 
 	When compiling userspace programs, it is possible to set specific flags.
 	The programs will always be compiled utilising $(CC) passed
@@ -930,8 +930,8 @@ The syntax is quite similar. The difference is to use "userprogs" instead of
 
 	From command line, :ref:`USERCFLAGS and USERLDFLAGS <userkbuildflags>` will also be used.
 
-5.4 When userspace programs are actually built
-----------------------------------------------
+When userspace programs are actually built
+------------------------------------------
 
 	Kbuild builds userspace programs only when told to do so.
 	There are two ways to do this.
@@ -960,8 +960,8 @@ The syntax is quite similar. The difference is to use "userprogs" instead of
 	This will tell Kbuild to build binderfs_example when it visits this
 	Makefile.
 
-6 Kbuild clean infrastructure
-=============================
+Kbuild clean infrastructure
+===========================
 
 "make clean" deletes most generated files in the obj tree where the kernel
 is compiled. This includes generated files such as host programs.
@@ -1005,8 +1005,8 @@ included in the top level makefile. Instead, arch/$(SRCARCH)/Kbuild can use
 Note 2: All directories listed in core-y, libs-y, drivers-y and net-y will
 be visited during "make clean".
 
-7 Architecture Makefiles
-========================
+Architecture Makefiles
+======================
 
 The top level Makefile sets up the environment and does the preparation,
 before starting to descend down in the individual directories.
@@ -1034,8 +1034,8 @@ When kbuild executes, the following steps are followed (roughly):
    - Preparing initrd images and the like
 
 
-7.1 Set variables to tweak the build to the architecture
---------------------------------------------------------
+Set variables to tweak the build to the architecture
+----------------------------------------------------
 
     KBUILD_LDFLAGS
 	Generic $(LD) options
@@ -1049,7 +1049,7 @@ When kbuild executes, the following steps are followed (roughly):
 		KBUILD_LDFLAGS         := -m elf_s390
 
 	Note: ldflags-y can be used to further customise
-	the flags used. See section 3.7.
+	the flags used. See `Non-builtin vmlinux targets - extra-y`_.
 
     LDFLAGS_vmlinux
 	Options for $(LD) when linking vmlinux
@@ -1208,8 +1208,8 @@ When kbuild executes, the following steps are followed (roughly):
 	KBUILD_VMLINUX_LIBS together specify all the object files used to
 	link vmlinux.
 
-7.2 Add prerequisites to archheaders
-------------------------------------
+Add prerequisites to archheaders
+--------------------------------
 
 	The archheaders: rule is used to generate header files that
 	may be installed into user space by "make header_install".
@@ -1218,8 +1218,8 @@ When kbuild executes, the following steps are followed (roughly):
 	architecture itself.
 
 
-7.3 Add prerequisites to archprepare
-------------------------------------
+Add prerequisites to archprepare
+--------------------------------
 
 	The archprepare: rule is used to list prerequisites that need to be
 	built before starting to descend down in the subdirectories.
@@ -1236,8 +1236,8 @@ When kbuild executes, the following steps are followed (roughly):
 	generating offset header files.
 
 
-7.4 List directories to visit when descending
----------------------------------------------
+List directories to visit when descending
+-----------------------------------------
 
 	An arch Makefile cooperates with the top Makefile to define variables
 	which specify how to build the vmlinux file.  Note that there is no
@@ -1270,8 +1270,8 @@ When kbuild executes, the following steps are followed (roughly):
 
 		drivers-$(CONFIG_PM) += arch/sparc/power/
 
-7.5 Architecture-specific boot images
--------------------------------------
+Architecture-specific boot images
+---------------------------------
 
 	An arch Makefile specifies goals that take the vmlinux file, compress
 	it, wrap it in bootstrapping code, and copy the resulting files
@@ -1325,8 +1325,8 @@ When kbuild executes, the following steps are followed (roughly):
 
 	When "make" is executed without arguments, bzImage will be built.
 
-7.7 Commands useful for building a boot image
----------------------------------------------
+Commands useful for building a boot image
+-----------------------------------------
 
     Kbuild provides a few macros that are useful when building a
     boot image.
@@ -1392,8 +1392,8 @@ When kbuild executes, the following steps are followed (roughly):
 		targets += $(dtb-y)
 		DTC_FLAGS ?= -p 1024
 
-7.9 Preprocessing linker scripts
---------------------------------
+Preprocessing linker scripts
+----------------------------
 
 	When the vmlinux image is built, the linker script
 	arch/$(SRCARCH)/kernel/vmlinux.lds is used.
@@ -1422,17 +1422,17 @@ When kbuild executes, the following steps are followed (roughly):
 	The kbuild infrastructure for `*lds` files is used in several
 	architecture-specific files.
 
-7.10 Generic header files
--------------------------
+Generic header files
+--------------------
 
 	The directory include/asm-generic contains the header files
 	that may be shared between individual architectures.
 	The recommended approach how to use a generic header file is
 	to list the file in the Kbuild file.
-	See "8.2 generic-y" for further info on syntax etc.
+	See `generic-y`_ for further info on syntax etc.
 
-7.11 Post-link pass
--------------------
+Post-link pass
+--------------
 
 	If the file arch/xxx/Makefile.postlink exists, this makefile
 	will be invoked for post-link objects (vmlinux and modules.ko)
@@ -1447,8 +1447,8 @@ When kbuild executes, the following steps are followed (roughly):
 	For example, powerpc uses this to check relocation sanity of
 	the linked vmlinux file.
 
-8 Kbuild syntax for exported headers
-====================================
+Kbuild syntax for exported headers
+==================================
 
 The kernel includes a set of headers that is exported to userspace.
 Many headers can be exported as-is but other headers require a
@@ -1467,15 +1467,15 @@ A Kbuild file may be defined under arch/<arch>/include/uapi/asm/ and
 arch/<arch>/include/asm/ to list asm files coming from asm-generic.
 See subsequent chapter for the syntax of the Kbuild file.
 
-8.1 no-export-headers
----------------------
+no-export-headers
+-----------------
 
 	no-export-headers is essentially used by include/uapi/linux/Kbuild to
 	avoid exporting specific headers (e.g. kvm.h) on architectures that do
 	not support it. It should be avoided as much as possible.
 
-8.2 generic-y
--------------
+generic-y
+---------
 
 	If an architecture uses a verbatim copy of a header from
 	include/asm-generic then this is listed in the file
@@ -1504,8 +1504,8 @@ See subsequent chapter for the syntax of the Kbuild file.
 
 			#include <asm-generic/termios.h>
 
-8.3 generated-y
----------------
+generated-y
+-----------
 
 	If an architecture generates other header files alongside generic-y
 	wrappers, generated-y specifies them.
@@ -1518,8 +1518,8 @@ See subsequent chapter for the syntax of the Kbuild file.
 			#arch/x86/include/asm/Kbuild
 			generated-y += syscalls_32.h
 
-8.4 mandatory-y
----------------
+mandatory-y
+-----------
 
 	mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild
 	to define the minimum set of ASM headers that all architectures must have.
@@ -1528,8 +1528,8 @@ See subsequent chapter for the syntax of the Kbuild file.
 	in arch/$(SRCARCH)/include/(uapi/)/asm, Kbuild will automatically
 	generate a wrapper of the asm-generic one.
 
-9 Kbuild Variables
-==================
+Kbuild Variables
+================
 
 The top Makefile exports the following variables:
 
@@ -1596,8 +1596,8 @@ The top Makefile exports the following variables:
 	command.
 
 
-10 Makefile language
-====================
+Makefile language
+=================
 
 The kernel Makefiles are designed to be run with GNU Make.  The Makefiles
 use only the documented features of GNU Make, but they do use many
@@ -1616,16 +1616,16 @@ time the left-hand side is used.
 There are some cases where "=" is appropriate.  Usually, though, ":="
 is the right choice.
 
-11 Credits
-==========
+Credits
+=======
 
 - Original version made by Michael Elizabeth Chastain, <mailto:mec@shout.net>
 - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
 - Updates by Sam Ravnborg <sam@ravnborg.org>
 - Language QA by Jan Engelhardt <jengelh@gmx.de>
 
-12 TODO
-=======
+TODO
+====
 
 - Describe how kbuild supports shipped files with _shipped.
 - Generating offset header files.
-- 
2.34.1

