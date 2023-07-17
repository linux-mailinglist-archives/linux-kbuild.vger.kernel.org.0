Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43EE7560B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jul 2023 12:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjGQKkK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jul 2023 06:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjGQKkJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jul 2023 06:40:09 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68162C7;
        Mon, 17 Jul 2023 03:40:06 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 00FC221959;
        Mon, 17 Jul 2023 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1689590405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t0PWIriOGm57bGT6WBJGU5RZw5slCTeNudwflDjA+z8=;
        b=vcd7uunVbrq2PWMck5m0NE+4oFRnP20zDgd1Dg6KJ1anPwv/2oV0+3hsyJ7CodduG1Ek0w
        PIJvKSDpheoTU04QQ2c5cHonMXEi+JP8ZmUVumeaMxyYfi1M2TltEwGw0VFDiyQvl+/XYL
        yBOL7SrcDBv1KqrH6Mvc7BiHujVe9gU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1689590405;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t0PWIriOGm57bGT6WBJGU5RZw5slCTeNudwflDjA+z8=;
        b=UjDj3E4eU+wUG5uPxALJwt/1vKe9C6SjhjSnf6dlG+Vr6pplIuT+8ac8qD985qv5E2wWIB
        tf85eZa/ZunSQaBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        by relay2.suse.de (Postfix) with ESMTP id 8BE042C149;
        Mon, 17 Jul 2023 10:40:04 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     linux-modules@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
        Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH kmod v4 4/4] libkmod, depmod, modprobe: Make directory for kernel modules configurable
Date:   Mon, 17 Jul 2023 12:39:53 +0200
Message-ID: <cc04472084dc016679598fcffafc788bbb6d9c0f.1689589902.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689589902.git.msuchanek@suse.de>
References: <20230711153126.28876-1-msuchanek@suse.de> <cover.1689589902.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

modprobe.d is now searched under ${prefix}/lib, add ${module_directory} to
specify the directory where to search for kernel modules.

With this distributions that do not want to ship files in /lib can also
move kernel modules to /usr while others can keep them in /lib.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v4: Make the whole path configurable
---
 Makefile.am                          |   3 +-
 configure.ac                         |   7 ++
 libkmod/libkmod.c                    |   4 +-
 man/Makefile.am                      |   1 +
 man/depmod.d.xml                     |   6 +-
 man/depmod.xml                       |   4 +-
 man/modinfo.xml                      |   2 +-
 man/modprobe.xml                     |   2 +-
 man/modules.dep.xml                  |   6 +-
 testsuite/module-playground/Makefile |   2 +-
 testsuite/setup-rootfs.sh            | 109 +++++++++++++++------------
 testsuite/test-depmod.c              |  16 ++--
 testsuite/test-testsuite.c           |   8 +-
 tools/depmod.c                       |   6 +-
 tools/kmod.c                         |   1 +
 tools/modinfo.c                      |   4 +-
 tools/modprobe.c                     |   4 +-
 tools/static-nodes.c                 |   6 +-
 18 files changed, 107 insertions(+), 84 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 7aa5bfa5638d..981574558c93 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -20,6 +20,7 @@ AM_CPPFLAGS = \
 	-I$(top_srcdir) \
 	-DSYSCONFDIR=\""$(sysconfdir)"\" \
 	-DPREFIX=\""$(prefix)"\" \
+	-DMODULE_DIRECTORY=\""$(module_directory)"\" \
 	${zlib_CFLAGS}
 
 AM_CFLAGS = $(OUR_CFLAGS)
@@ -220,7 +221,7 @@ EXTRA_DIST += testsuite/setup-rootfs.sh
 MODULE_PLAYGROUND = testsuite/module-playground
 ROOTFS = testsuite/rootfs
 ROOTFS_PRISTINE = $(top_srcdir)/testsuite/rootfs-pristine
-CREATE_ROOTFS = $(AM_V_GEN) $(top_srcdir)/testsuite/setup-rootfs.sh $(ROOTFS_PRISTINE) $(ROOTFS) $(MODULE_PLAYGROUND) $(top_builddir)/config.h $(sysconfdir)
+CREATE_ROOTFS = $(AM_V_GEN) MODULE_DIRECTORY=$(module_directory) $(top_srcdir)/testsuite/setup-rootfs.sh $(ROOTFS_PRISTINE) $(ROOTFS) $(MODULE_PLAYGROUND) $(top_builddir)/config.h $(sysconfdir)
 
 build-module-playground:
 	$(AM_V_GEN)if test "$(top_srcdir)" != "$(top_builddir)"; then \
diff --git a/configure.ac b/configure.ac
index 6064dee77ae6..a195c8e6b554 100644
--- a/configure.ac
+++ b/configure.ac
@@ -84,6 +84,12 @@ AC_ARG_WITH([rootlibdir],
         [], [with_rootlibdir=$libdir])
 AC_SUBST([rootlibdir], [$with_rootlibdir])
 
+# Ideally this would be $prefix/lib/modules but default to /lib/modules for compatibility with earlier versions
+AC_ARG_WITH([module_directory],
+        AS_HELP_STRING([--with-module-directory=DIR], [directory in which to look for kernel modules - typically '/lib/modules' or '${prefix}/lib/modules']),
+        [], [with_module_directory=/lib/modules])
+AC_SUBST([module_directory], [$with_module_directory])
+
 AC_ARG_WITH([zstd],
 	AS_HELP_STRING([--with-zstd], [handle Zstandard-compressed modules @<:@default=disabled@:>@]),
 	[], [with_zstd=no])
@@ -304,6 +310,7 @@ AC_MSG_RESULT([
 	$PACKAGE $VERSION
 	=======
 
+	module_directory:	${module_directory}
 	prefix:			${prefix}
 	sysconfdir:		${sysconfdir}
 	libdir:			${libdir}
diff --git a/libkmod/libkmod.c b/libkmod/libkmod.c
index f3139c1cef97..d2ed8748c833 100644
--- a/libkmod/libkmod.c
+++ b/libkmod/libkmod.c
@@ -209,7 +209,7 @@ static int log_priority(const char *priority)
 	return 0;
 }
 
-static const char *dirname_default_prefix = "/lib/modules";
+static const char *dirname_default_prefix = MODULE_DIRECTORY;
 
 static char *get_kernel_release(const char *dirname)
 {
@@ -231,7 +231,7 @@ static char *get_kernel_release(const char *dirname)
 /**
  * kmod_new:
  * @dirname: what to consider as linux module's directory, if NULL
- *           defaults to /lib/modules/`uname -r`. If it's relative,
+ *           defaults to ${module_prefix}/lib/modules/`uname -r`. If it's relative,
  *           it's treated as relative to the current working directory.
  *           Otherwise, give an absolute dirname.
  * @config_paths: ordered array of paths (directories or files) where
diff --git a/man/Makefile.am b/man/Makefile.am
index ad07c30bbd24..25c2cc6fdf13 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -22,6 +22,7 @@ CLEANFILES = $(dist_man_MANS)
 	else \
 		sed -e '/@PREFIX@/d' $< ; \
 	fi | \
+	sed -e 's|@MODULE_DIRECTORY@|$(module_directory)|g' | \
 	$(XSLT) \
 		-o $@ \
 		--nonet \
diff --git a/man/depmod.d.xml b/man/depmod.d.xml
index 431ebca6654b..676977c69a4f 100644
--- a/man/depmod.d.xml
+++ b/man/depmod.d.xml
@@ -70,7 +70,7 @@
         </term>
         <listitem>
           <para>
-            This allows you to specify the order in which /lib/modules
+            This allows you to specify the order in which @MODULE_DIRECTORY@
             (or other configured module location) subdirectories will
             be processed by <command>depmod</command>. Directories are
             listed in order, with the highest priority given to the
@@ -101,7 +101,7 @@
             <command>depmod</command> command. It is possible to
             specify one kernel or all kernels using the * wildcard.
             <replaceable>modulesubdirectory</replaceable> is the
-            name of the subdirectory under /lib/modules (or other
+            name of the subdirectory under @MODULE_DIRECTORY@ (or other
             module location) where the target module is installed.
           </para>
           <para>
@@ -110,7 +110,7 @@
             specifying the following command: "override kmod * extra".
             This will ensure that any matching module name installed
             under the <command>extra</command> subdirectory within
-            /lib/modules (or other module location) will take priority
+            @MODULE_DIRECTORY@ (or other module location) will take priority
             over any likenamed module already provided by the kernel.
           </para>
         </listitem>
diff --git a/man/depmod.xml b/man/depmod.xml
index 3b0097184fd7..fce2a4a67a89 100644
--- a/man/depmod.xml
+++ b/man/depmod.xml
@@ -80,7 +80,7 @@
     </para>
     <para> <command>depmod</command> creates a list of module dependencies by
       reading each module under
-      <filename>/lib/modules/</filename><replaceable>version</replaceable> and
+      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable> and
       determining what symbols it exports and what symbols it needs.  By
       default, this list is written to <filename>modules.dep</filename>, and a
       binary hashed version named <filename>modules.dep.bin</filename>, in the
@@ -141,7 +141,7 @@
         <listitem>
           <para>
             If your modules are not currently in the (normal) directory
-            <filename>/lib/modules/</filename><replaceable>version</replaceable>,
+            <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>,
             but in a staging area, you can specify a
             <replaceable>basedir</replaceable> which is prepended to the
             directory name.  This <replaceable>basedir</replaceable> is
diff --git a/man/modinfo.xml b/man/modinfo.xml
index 9fe0324a2527..b6c4d6045829 100644
--- a/man/modinfo.xml
+++ b/man/modinfo.xml
@@ -54,7 +54,7 @@
       <command>modinfo</command> extracts information from the Linux Kernel
       modules given on the command line.  If the module name is not a filename,
       then the
-      <filename>/lib/modules/</filename><replaceable>version</replaceable>
+      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>
       directory is searched, as is also done by
       <citerefentry><refentrytitle>modprobe</refentrytitle><manvolnum>8</manvolnum></citerefentry>
       when loading kernel modules.
diff --git a/man/modprobe.xml b/man/modprobe.xml
index 91f9e27997cd..4d1fd59c000b 100644
--- a/man/modprobe.xml
+++ b/man/modprobe.xml
@@ -78,7 +78,7 @@
       is no difference between _ and - in module names (automatic
       underscore conversion is performed).
       <command>modprobe</command> looks in the module directory
-      <filename>/lib/modules/`uname -r`</filename> for all
+      <filename>@MODULE_DIRECTORY@/`uname -r`</filename> for all
       the modules and other files, except for the optional
       configuration files in the
       <filename>/etc/modprobe.d</filename> directory
diff --git a/man/modules.dep.xml b/man/modules.dep.xml
index ed633694ec9e..8ef6d8b3536e 100644
--- a/man/modules.dep.xml
+++ b/man/modules.dep.xml
@@ -34,8 +34,8 @@
   </refnamediv>
 
   <refsynopsisdiv>
-    <para><filename>/lib/modules/modules.dep</filename></para>
-    <para><filename>/lib/modules/modules.dep.bin</filename></para>
+    <para><filename>@MODULE_DIRECTORY@/modules.dep</filename></para>
+    <para><filename>@MODULE_DIRECTORY@/modules.dep.bin</filename></para>
   </refsynopsisdiv>
 
   <refsect1><title>DESCRIPTION</title>
@@ -43,7 +43,7 @@
       <filename>modules.dep.bin</filename> is a binary file generated by
       <command>depmod</command> listing the dependencies for
       every module in the directories under
-      <filename>/lib/modules/</filename><replaceable>version</replaceable>.
+      <filename>@MODULE_DIRECTORY@/</filename><replaceable>version</replaceable>.
       It is used by kmod tools such as <command>modprobe</command> and
       libkmod.
     </para>
diff --git a/testsuite/module-playground/Makefile b/testsuite/module-playground/Makefile
index e6045b0dd932..a7ab09bea2bf 100644
--- a/testsuite/module-playground/Makefile
+++ b/testsuite/module-playground/Makefile
@@ -47,7 +47,7 @@ endif
 
 else
 # normal makefile
-KDIR ?= /lib/modules/`uname -r`/build
+KDIR ?= $(module_prefix)/lib/modules/`uname -r`/build
 KVER ?= `uname -r`
 ifeq ($(FAKE_BUILD),)
     FAKE_BUILD=0
diff --git a/testsuite/setup-rootfs.sh b/testsuite/setup-rootfs.sh
index 4440ddcd6b4d..a780f9381b3c 100755
--- a/testsuite/setup-rootfs.sh
+++ b/testsuite/setup-rootfs.sh
@@ -16,6 +16,19 @@ create_rootfs() {
 	cp -r "$ROOTFS_PRISTINE" "$ROOTFS"
 	find "$ROOTFS" -type d -exec chmod +w {} \;
 	find "$ROOTFS" -type f -name .gitignore -exec rm -f {} \;
+	if [ "$MODULE_DIRECTORY" != "/lib/modules" ] ; then
+		sed -i -e "s|/lib/modules|$MODULE_DIRECTORY|g" $(find "$ROOTFS" -name \*.txt -o -name \*.conf -o -name \*.dep)
+		sed -i -e "s|$MODULE_DIRECTORY/external|/lib/modules/external|g" $(find "$ROOTFS" -name \*.txt -o -name \*.conf -o -name \*.dep)
+		for i in "$ROOTFS"/*/lib/modules/* "$ROOTFS"/*/*/lib/modules/* ; do
+			version="$(basename $i)"
+			[ $version != 'external' ] || continue
+			mod="$(dirname $i)"
+			lib="$(dirname $mod)"
+			up="$(dirname $lib)$MODULE_DIRECTORY"
+			mkdir -p "$up"
+			mv "$i" "$up"
+		done
+	fi
 
 	if [ "$SYSCONFDIR" != "/etc" ]; then
 		find "$ROOTFS" -type d -name etc -printf "%h\n" | while read -r e; do
@@ -32,57 +45,57 @@ feature_enabled() {
 
 declare -A map
 map=(
-    ["test-depmod/search-order-simple/lib/modules/4.4.4/kernel/crypto/"]="mod-simple.ko"
-    ["test-depmod/search-order-simple/lib/modules/4.4.4/updates/"]="mod-simple.ko"
-    ["test-depmod/search-order-same-prefix/lib/modules/4.4.4/foo/"]="mod-simple.ko"
-    ["test-depmod/search-order-same-prefix/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-c.ko"]="mod-loop-c.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-d.ko"]="mod-loop-d.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-e.ko"]="mod-loop-e.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-f.ko"]="mod-loop-f.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-g.ko"]="mod-loop-g.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-h.ko"]="mod-loop-h.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-i.ko"]="mod-loop-i.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-j.ko"]="mod-loop-j.ko"
-    ["test-depmod/detect-loop/lib/modules/4.4.4/kernel/mod-loop-k.ko"]="mod-loop-k.ko"
-    ["test-depmod/search-order-external-first/lib/modules/4.4.4/foo/"]="mod-simple.ko"
-    ["test-depmod/search-order-external-first/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
+    ["test-depmod/search-order-simple$MODULE_DIRECTORY/4.4.4/kernel/crypto/"]="mod-simple.ko"
+    ["test-depmod/search-order-simple$MODULE_DIRECTORY/4.4.4/updates/"]="mod-simple.ko"
+    ["test-depmod/search-order-same-prefix$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
+    ["test-depmod/search-order-same-prefix$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-c.ko"]="mod-loop-c.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-d.ko"]="mod-loop-d.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-e.ko"]="mod-loop-e.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-f.ko"]="mod-loop-f.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-g.ko"]="mod-loop-g.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-h.ko"]="mod-loop-h.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-i.ko"]="mod-loop-i.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-j.ko"]="mod-loop-j.ko"
+    ["test-depmod/detect-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-k.ko"]="mod-loop-k.ko"
+    ["test-depmod/search-order-external-first$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
+    ["test-depmod/search-order-external-first$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
     ["test-depmod/search-order-external-first/lib/modules/external/"]="mod-simple.ko"
-    ["test-depmod/search-order-external-last/lib/modules/4.4.4/foo/"]="mod-simple.ko"
-    ["test-depmod/search-order-external-last/lib/modules/4.4.4/foobar/"]="mod-simple.ko"
+    ["test-depmod/search-order-external-last$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
+    ["test-depmod/search-order-external-last$MODULE_DIRECTORY/4.4.4/foobar/"]="mod-simple.ko"
     ["test-depmod/search-order-external-last/lib/modules/external/"]="mod-simple.ko"
-    ["test-depmod/search-order-override/lib/modules/4.4.4/foo/"]="mod-simple.ko"
-    ["test-depmod/search-order-override/lib/modules/4.4.4/override/"]="mod-simple.ko"
-    ["test-dependencies/lib/modules/4.0.20-kmod/kernel/fs/foo/"]="mod-foo-b.ko"
-    ["test-dependencies/lib/modules/4.0.20-kmod/kernel/"]="mod-foo-c.ko"
-    ["test-dependencies/lib/modules/4.0.20-kmod/kernel/lib/"]="mod-foo-a.ko"
-    ["test-dependencies/lib/modules/4.0.20-kmod/kernel/fs/"]="mod-foo.ko"
+    ["test-depmod/search-order-override$MODULE_DIRECTORY/4.4.4/foo/"]="mod-simple.ko"
+    ["test-depmod/search-order-override$MODULE_DIRECTORY/4.4.4/override/"]="mod-simple.ko"
+    ["test-dependencies$MODULE_DIRECTORY/4.0.20-kmod/kernel/fs/foo/"]="mod-foo-b.ko"
+    ["test-dependencies$MODULE_DIRECTORY/4.0.20-kmod/kernel/"]="mod-foo-c.ko"
+    ["test-dependencies$MODULE_DIRECTORY/4.0.20-kmod/kernel/lib/"]="mod-foo-a.ko"
+    ["test-dependencies$MODULE_DIRECTORY/4.0.20-kmod/kernel/fs/"]="mod-foo.ko"
     ["test-init/"]="mod-simple.ko"
     ["test-remove/"]="mod-simple.ko"
-    ["test-modprobe/show-depends/lib/modules/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
-    ["test-modprobe/show-depends/lib/modules/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
-    ["test-modprobe/show-depends/lib/modules/4.4.4/kernel/mod-simple.ko"]="mod-simple.ko"
+    ["test-modprobe/show-depends$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
+    ["test-modprobe/show-depends$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
+    ["test-modprobe/show-depends$MODULE_DIRECTORY/4.4.4/kernel/mod-simple.ko"]="mod-simple.ko"
     ["test-modprobe/show-exports/mod-loop-a.ko"]="mod-loop-a.ko"
-    ["test-modprobe/softdep-loop/lib/modules/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
-    ["test-modprobe/softdep-loop/lib/modules/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
-    ["test-modprobe/install-cmd-loop/lib/modules/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
-    ["test-modprobe/install-cmd-loop/lib/modules/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
-    ["test-modprobe/force/lib/modules/4.4.4/kernel/"]="mod-simple.ko"
-    ["test-modprobe/oldkernel/lib/modules/3.3.3/kernel/"]="mod-simple.ko"
-    ["test-modprobe/oldkernel-force/lib/modules/3.3.3/kernel/"]="mod-simple.ko"
-    ["test-modprobe/alias-to-none/lib/modules/4.4.4/kernel/"]="mod-simple.ko"
-    ["test-modprobe/module-param-kcmdline/lib/modules/4.4.4/kernel/"]="mod-simple.ko"
+    ["test-modprobe/softdep-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
+    ["test-modprobe/softdep-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
+    ["test-modprobe/install-cmd-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-a.ko"]="mod-loop-a.ko"
+    ["test-modprobe/install-cmd-loop$MODULE_DIRECTORY/4.4.4/kernel/mod-loop-b.ko"]="mod-loop-b.ko"
+    ["test-modprobe/force$MODULE_DIRECTORY/4.4.4/kernel/"]="mod-simple.ko"
+    ["test-modprobe/oldkernel$MODULE_DIRECTORY/3.3.3/kernel/"]="mod-simple.ko"
+    ["test-modprobe/oldkernel-force$MODULE_DIRECTORY/3.3.3/kernel/"]="mod-simple.ko"
+    ["test-modprobe/alias-to-none$MODULE_DIRECTORY/4.4.4/kernel/"]="mod-simple.ko"
+    ["test-modprobe/module-param-kcmdline$MODULE_DIRECTORY/4.4.4/kernel/"]="mod-simple.ko"
     ["test-modprobe/external/lib/modules/external/"]="mod-simple.ko"
     ["test-modprobe/module-from-abspath/home/foo/"]="mod-simple.ko"
     ["test-modprobe/module-from-relpath/home/foo/"]="mod-simple.ko"
-    ["test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/block/cciss.ko"]="mod-fake-cciss.ko"
-    ["test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/scsi/hpsa.ko"]="mod-fake-hpsa.ko"
-    ["test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/scsi/scsi_mod.ko"]="mod-fake-scsi-mod.ko"
-    ["test-depmod/modules-outdir/lib/modules/4.4.4/kernel/drivers/block/cciss.ko"]="mod-fake-cciss.ko"
-    ["test-depmod/modules-outdir/lib/modules/4.4.4/kernel/drivers/scsi/hpsa.ko"]="mod-fake-hpsa.ko"
-    ["test-depmod/modules-outdir/lib/modules/4.4.4/kernel/drivers/scsi/scsi_mod.ko"]="mod-fake-scsi-mod.ko"
+    ["test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/block/cciss.ko"]="mod-fake-cciss.ko"
+    ["test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/hpsa.ko"]="mod-fake-hpsa.ko"
+    ["test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/scsi_mod.ko"]="mod-fake-scsi-mod.ko"
+    ["test-depmod/modules-outdir$MODULE_DIRECTORY/4.4.4/kernel/drivers/block/cciss.ko"]="mod-fake-cciss.ko"
+    ["test-depmod/modules-outdir$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/hpsa.ko"]="mod-fake-hpsa.ko"
+    ["test-depmod/modules-outdir$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/scsi_mod.ko"]="mod-fake-scsi-mod.ko"
     ["test-modinfo/mod-simple-i386.ko"]="mod-simple-i386.ko"
     ["test-modinfo/mod-simple-x86_64.ko"]="mod-simple-x86_64.ko"
     ["test-modinfo/mod-simple-sparc64.ko"]="mod-simple-sparc64.ko"
@@ -90,20 +103,20 @@ map=(
     ["test-modinfo/mod-simple-sha256.ko"]="mod-simple.ko"
     ["test-modinfo/mod-simple-pkcs7.ko"]="mod-simple.ko"
     ["test-modinfo/external/lib/modules/external/mod-simple.ko"]="mod-simple.ko"
-    ["test-tools/insert/lib/modules/4.4.4/kernel/"]="mod-simple.ko"
-    ["test-tools/remove/lib/modules/4.4.4/kernel/"]="mod-simple.ko"
+    ["test-tools/insert$MODULE_DIRECTORY/4.4.4/kernel/"]="mod-simple.ko"
+    ["test-tools/remove$MODULE_DIRECTORY/4.4.4/kernel/"]="mod-simple.ko"
 )
 
 gzip_array=(
-    "test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/block/cciss.ko"
+    "test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/block/cciss.ko"
     )
 
 xz_array=(
-    "test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/scsi/scsi_mod.ko"
+    "test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/scsi_mod.ko"
     )
 
 zstd_array=(
-    "test-depmod/modules-order-compressed/lib/modules/4.4.4/kernel/drivers/scsi/hpsa.ko"
+    "test-depmod/modules-order-compressed$MODULE_DIRECTORY/4.4.4/kernel/drivers/scsi/hpsa.ko"
     )
 
 attach_sha256_array=(
diff --git a/testsuite/test-depmod.c b/testsuite/test-depmod.c
index 93606947f18a..c96dbf0a62be 100644
--- a/testsuite/test-depmod.c
+++ b/testsuite/test-depmod.c
@@ -27,7 +27,7 @@
 
 #define MODULES_UNAME "4.4.4"
 #define MODULES_ORDER_ROOTFS TESTSUITE_ROOTFS "test-depmod/modules-order-compressed"
-#define MODULES_ORDER_LIB_MODULES MODULES_ORDER_ROOTFS "/lib/modules/" MODULES_UNAME
+#define MODULES_ORDER_LIB_MODULES MODULES_ORDER_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_modules_order_for_compressed(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -55,8 +55,8 @@ DEFINE_TEST(depmod_modules_order_for_compressed,
 	});
 
 #define MODULES_OUTDIR_ROOTFS TESTSUITE_ROOTFS "test-depmod/modules-outdir"
-#define MODULES_OUTDIR_LIB_MODULES_OUTPUT MODULES_OUTDIR_ROOTFS "/outdir/lib/modules/" MODULES_UNAME
-#define MODULES_OUTDIR_LIB_MODULES_INPUT MODULES_OUTDIR_ROOTFS "/lib/modules/" MODULES_UNAME
+#define MODULES_OUTDIR_LIB_MODULES_OUTPUT MODULES_OUTDIR_ROOTFS "/outdir" MODULE_DIRECTORY "/" MODULES_UNAME
+#define MODULES_OUTDIR_LIB_MODULES_INPUT MODULES_OUTDIR_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_modules_outdir(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -87,7 +87,7 @@ DEFINE_TEST(depmod_modules_outdir,
 	});
 
 #define SEARCH_ORDER_SIMPLE_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-simple"
-#define SEARCH_ORDER_SIMPLE_LIB_MODULES SEARCH_ORDER_SIMPLE_ROOTFS "/lib/modules/" MODULES_UNAME
+#define SEARCH_ORDER_SIMPLE_LIB_MODULES SEARCH_ORDER_SIMPLE_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_search_order_simple(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -114,7 +114,7 @@ DEFINE_TEST(depmod_search_order_simple,
 	});
 
 #define SEARCH_ORDER_SAME_PREFIX_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-same-prefix"
-#define SEARCH_ORDER_SAME_PREFIX_LIB_MODULES SEARCH_ORDER_SAME_PREFIX_ROOTFS "/lib/modules/" MODULES_UNAME
+#define SEARCH_ORDER_SAME_PREFIX_LIB_MODULES SEARCH_ORDER_SAME_PREFIX_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_search_order_same_prefix(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -164,7 +164,7 @@ DEFINE_TEST(depmod_detect_loop,
 	});
 
 #define SEARCH_ORDER_EXTERNAL_FIRST_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-external-first"
-#define SEARCH_ORDER_EXTERNAL_FIRST_LIB_MODULES SEARCH_ORDER_EXTERNAL_FIRST_ROOTFS "/lib/modules/" MODULES_UNAME
+#define SEARCH_ORDER_EXTERNAL_FIRST_LIB_MODULES SEARCH_ORDER_EXTERNAL_FIRST_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_search_order_external_first(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -191,7 +191,7 @@ DEFINE_TEST(depmod_search_order_external_first,
 	});
 
 #define SEARCH_ORDER_EXTERNAL_LAST_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-external-last"
-#define SEARCH_ORDER_EXTERNAL_LAST_LIB_MODULES SEARCH_ORDER_EXTERNAL_LAST_ROOTFS "/lib/modules/" MODULES_UNAME
+#define SEARCH_ORDER_EXTERNAL_LAST_LIB_MODULES SEARCH_ORDER_EXTERNAL_LAST_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_search_order_external_last(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
@@ -218,7 +218,7 @@ DEFINE_TEST(depmod_search_order_external_last,
 	});
 
 #define SEARCH_ORDER_OVERRIDE_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-override"
-#define SEARCH_ORDER_OVERRIDE_LIB_MODULES SEARCH_ORDER_OVERRIDE_ROOTFS "/lib/modules/" MODULES_UNAME
+#define SEARCH_ORDER_OVERRIDE_LIB_MODULES SEARCH_ORDER_OVERRIDE_ROOTFS MODULE_DIRECTORY "/" MODULES_UNAME
 static noreturn int depmod_search_order_override(const struct test *t)
 {
 	const char *progname = ABS_TOP_BUILDDIR "/tools/depmod";
diff --git a/testsuite/test-testsuite.c b/testsuite/test-testsuite.c
index 56e73609f204..c77c4bbc04eb 100644
--- a/testsuite/test-testsuite.c
+++ b/testsuite/test-testsuite.c
@@ -64,7 +64,7 @@ static int testsuite_rootfs_fopen(const struct test *t)
 	char s[100];
 	int n;
 
-	fp = fopen("/lib/modules/a", "r");
+	fp = fopen(MODULE_DIRECTORY "/a", "r");
 	if (fp == NULL)
 		return EXIT_FAILURE;;
 
@@ -89,7 +89,7 @@ static int testsuite_rootfs_open(const struct test *t)
 	char buf[100];
 	int fd, done;
 
-	fd = open("/lib/modules/a", O_RDONLY);
+	fd = open(MODULE_DIRECTORY "/a", O_RDONLY);
 	if (fd < 0)
 		return EXIT_FAILURE;
 
@@ -121,12 +121,12 @@ static int testsuite_rootfs_stat_access(const struct test *t)
 {
 	struct stat st;
 
-	if (access("/lib/modules/a", F_OK) < 0) {
+	if (access(MODULE_DIRECTORY "/a", F_OK) < 0) {
 		ERR("access failed: %m\n");
 		return EXIT_FAILURE;
 	}
 
-	if (stat("/lib/modules/a", &st) < 0) {
+	if (stat(MODULE_DIRECTORY "/a", &st) < 0) {
 		ERR("stat failed: %m\n");
 		return EXIT_FAILURE;
 	}
diff --git a/tools/depmod.c b/tools/depmod.c
index 7e9339923809..22bc1d87c83e 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -911,7 +911,7 @@ struct vertex;
 struct mod {
 	struct kmod_module *kmod;
 	char *path;
-	const char *relpath; /* path relative to '$ROOT/lib/modules/$VER/' */
+	const char *relpath; /* path relative to '$ROOT$MODULE_DIRECTORY/$VER/' */
 	char *uncrelpath; /* same as relpath but ending in .ko */
 	struct kmod_list *info_list;
 	struct kmod_list *dep_sym_list;
@@ -3024,11 +3024,11 @@ static int do_depmod(int argc, char *argv[])
 	}
 
 	cfg.dirnamelen = snprintf(cfg.dirname, PATH_MAX,
-				  "%s/lib/modules/%s",
+				  "%s" MODULE_DIRECTORY "/%s",
 				  root ?: "", cfg.kversion);
 
 	cfg.outdirnamelen = snprintf(cfg.outdirname, PATH_MAX,
-				     "%s/lib/modules/%s",
+				     "%s" MODULE_DIRECTORY "/%s",
 				     out_root ?: (root ?: ""), cfg.kversion);
 
 	if (optind == argc)
diff --git a/tools/kmod.c b/tools/kmod.c
index a684c1d24284..3a2589c67447 100644
--- a/tools/kmod.c
+++ b/tools/kmod.c
@@ -115,6 +115,7 @@ static int kmod_config(int argc, char *argv[])
 	unsigned i;
 	printf("{\"prefix\":\"" PREFIX "\""
 			",\"sysconfdir\":\"" SYSCONFDIR "\""
+			",\"module_directory\":\"" MODULE_DIRECTORY "\""
 			",\"module_signature\":["
 #ifdef ENABLE_OPENSSL
 			"\"PKCS#7\","
diff --git a/tools/modinfo.c b/tools/modinfo.c
index d0aab200af4e..cacc32dc4c40 100644
--- a/tools/modinfo.c
+++ b/tools/modinfo.c
@@ -367,7 +367,7 @@ static void help(void)
 		"\t-m, --modname               Handle argument as module name instead of alias or filename\n"
 		"\t-F, --field=FIELD           Print only provided FIELD\n"
 		"\t-k, --set-version=VERSION   Use VERSION instead of `uname -r`\n"
-		"\t-b, --basedir=DIR           Use DIR as filesystem root for /lib/modules\n"
+		"\t-b, --basedir=DIR           Use DIR as filesystem root for " MODULE_DIRECTORY "\n"
 		"\t-V, --version               Show version\n"
 		"\t-h, --help                  Show this help\n",
 		program_invocation_short_name);
@@ -462,7 +462,7 @@ static int do_modinfo(int argc, char *argv[])
 			}
 			kversion = u.release;
 		}
-		snprintf(dirname_buf, sizeof(dirname_buf), "%s/lib/modules/%s",
+		snprintf(dirname_buf, sizeof(dirname_buf), "%s" MODULE_DIRECTORY "/%s",
 			 root, kversion);
 		dirname = dirname_buf;
 	}
diff --git a/tools/modprobe.c b/tools/modprobe.c
index e891028349a8..5306bef250da 100644
--- a/tools/modprobe.c
+++ b/tools/modprobe.c
@@ -142,7 +142,7 @@ static void help(void)
 		"\t-n, --show                  Same as --dry-run\n"
 
 		"\t-C, --config=FILE           Use FILE instead of default search paths\n"
-		"\t-d, --dirname=DIR           Use DIR as filesystem root for /lib/modules\n"
+		"\t-d, --dirname=DIR           Use DIR as filesystem root for " MODULE_DIRECTORY "\n"
 		"\t-S, --set-version=VERSION   Use VERSION instead of `uname -r`\n"
 
 		"\t-s, --syslog                print to syslog, not stderr\n"
@@ -999,7 +999,7 @@ static int do_modprobe(int argc, char **orig_argv)
 			kversion = u.release;
 		}
 		snprintf(dirname_buf, sizeof(dirname_buf),
-				"%s/lib/modules/%s", root,
+				"%s" MODULE_DIRECTORY "/%s", root,
 				kversion);
 		dirname = dirname_buf;
 	}
diff --git a/tools/static-nodes.c b/tools/static-nodes.c
index 8d2356da73f3..5ef3743e967b 100644
--- a/tools/static-nodes.c
+++ b/tools/static-nodes.c
@@ -212,15 +212,15 @@ static int do_static_nodes(int argc, char *argv[])
 		goto finish;
 	}
 
-	snprintf(modules, sizeof(modules), "/lib/modules/%s/modules.devname", kernel.release);
+	snprintf(modules, sizeof(modules), MODULE_DIRECTORY "/%s/modules.devname", kernel.release);
 	in = fopen(modules, "re");
 	if (in == NULL) {
 		if (errno == ENOENT) {
-			fprintf(stderr, "Warning: /lib/modules/%s/modules.devname not found - ignoring\n",
+			fprintf(stderr, "Warning: " MODULE_DIRECTORY "/%s/modules.devname not found - ignoring\n",
 				kernel.release);
 			ret = EXIT_SUCCESS;
 		} else {
-			fprintf(stderr, "Error: could not open /lib/modules/%s/modules.devname - %m\n",
+			fprintf(stderr, "Error: could not open " MODULE_DIRECTORY "/%s/modules.devname - %m\n",
 				kernel.release);
 			ret = EXIT_FAILURE;
 		}
-- 
2.41.0

