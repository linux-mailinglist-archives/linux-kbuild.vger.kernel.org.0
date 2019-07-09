Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F214D62F89
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfGIEZv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:51 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42417 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbfGIEZv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:51 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVr009969;
        Tue, 9 Jul 2019 13:24:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVr009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646299;
        bh=Q+SzS7vD0yVNOyjqQdvY9kfGxu0p784rrS+yRzVFgSA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sGs1wdFvX0O/6eZhSwsTmCb4K6NHClzNU+2d7uHIna+kIXdblJ4xRGAow6rUgMLfX
         WGKNhEwNQB5h/8dPRpPRQA1JzWOBDy3WkmW3R63bnNwr+dunWzgRazn1dsxAfMji4m
         VKaP8ZZ4HCRH6b/NulRoXFpiS7p1hhe6hdZnbGM2Sq3xr76fRBw5nIG87MY8oF3nSH
         I+pXPG3h9gffthUZvv41g6Vca7Row1w+zj01e4zWtY5QMi9NqrDno1txSyVhYTpE+R
         pIglRqygif31WXxTUF+jig2MEI40sCX381PhnsSLAe2upAnuLX9t2bUp/D5tcdNsxI
         g76ivP50f5oJQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 08/11] kbuild: create *.mod with full directory path and remove MODVERDIR
Date:   Tue,  9 Jul 2019 13:24:12 +0900
Message-Id: <20190709042416.27554-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While descending directories, Kbuild produces objects for modules,
but final *.ko files are linked in the modpost.

To keep track of modules, Kbuild creates a *.mod file in $(MODVERDIR)
for every module it is building. Some post-processing steps read the
necessary information from *.mod files. This avoids descending into
directories again. This mechanism was introduced in 2003 or so.

Later, commit 551559e13af1 ("kbuild: implement modules.order") added
modules.order. So, we can simply read it out to know all the modules
with directory paths. This is easier than parsing the first line of
*.mod files.

$(MODVERDIR) has a flat structure. This is based on the assumption
that the module name is unique. This assumption is really fragile.

Stephen Rothwell reported a race condition caused by a module name
conflict:

  https://lkml.org/lkml/2019/5/13/991

In parallel building, two different threads could write to the same
$(MODVERDIR)/*.mod simultaneously.

Non-unique module names are the source of all kind of troubles, hence
commit 3a48a91901c5 ("kbuild: check uniqueness of module names")
introduced a new checker script.

However, it is still fragile in the build system point of view because
this race happens before scripts/modules-check.sh is invoked. If it
happens again, the modpost will emit unclear error messages.

To fix this issue completely, create *.mod in the same directory as
*.ko so that two threads never attempt to write to the same .mod file.
$(MODVERDIR) is no longer needed.

Since modules with directory paths are listed in modules.order, Kbuild
is still able to find *.mod files without additional descending.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore                  |  1 +
 Documentation/dontdiff      |  1 +
 Makefile                    | 20 +++-----------------
 scripts/Makefile.build      |  8 ++------
 scripts/Makefile.modpost    |  4 ++--
 scripts/adjust_autoksyms.sh | 11 ++++-------
 scripts/mod/sumversion.c    | 16 +++-------------
 scripts/package/mkspec      |  2 +-
 8 files changed, 17 insertions(+), 46 deletions(-)

diff --git a/.gitignore b/.gitignore
index 7587ef56b92d..8f5422cba6e2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -30,6 +30,7 @@
 *.lz4
 *.lzma
 *.lzo
+*.mod
 *.mod.c
 *.o
 *.o.*
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 5eba889ea84d..9f4392876099 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -30,6 +30,7 @@
 *.lzo
 *.mo
 *.moc
+*.mod
 *.mod.c
 *.o
 *.o.*
diff --git a/Makefile b/Makefile
index 2f40cf704119..958fafa605b9 100644
--- a/Makefile
+++ b/Makefile
@@ -488,11 +488,6 @@ export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
 export KBUILD_ARFLAGS
 
-# When compiling out-of-tree modules, put MODVERDIR in the module
-# tree rather than in the kernel tree. The kernel tree might
-# even be read-only.
-export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_versions
-
 # Files to ignore in find ... statements
 
 export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
@@ -1034,7 +1029,7 @@ vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 
 # Recurse until adjust_autoksyms.sh is satisfied
 PHONY += autoksyms_recursive
-autoksyms_recursive: $(vmlinux-deps)
+autoksyms_recursive: $(vmlinux-deps) modules.order
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
@@ -1118,7 +1113,6 @@ endif
 
 prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
 						include/generated/utsrelease.h
-	$(cmd_crmodverdir)
 
 archprepare: archheaders archscripts prepare1 scripts
 
@@ -1376,7 +1370,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_DIRS  += $(MODVERDIR) include/ksym
+CLEAN_DIRS  += include/ksym
 CLEAN_FILES += modules.builtin.modinfo
 
 # Directories & files removed with 'make mrproper'
@@ -1637,7 +1631,6 @@ PHONY += $(clean-dirs) clean
 $(clean-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
 
-clean:	rm-dirs := $(MODVERDIR)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
 PHONY += help
@@ -1651,8 +1644,6 @@ help:
 	@echo  ''
 
 PHONY += prepare
-prepare:
-	$(cmd_crmodverdir)
 endif # KBUILD_EXTMOD
 
 clean: $(clean-dirs)
@@ -1663,7 +1654,7 @@ clean: $(clean-dirs)
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
-		-o -name '*.su'  \
+		-o -name '*.su' -o -name '*.mod' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
@@ -1792,11 +1783,6 @@ quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
       cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
                    $(KERNELRELEASE)
 
-# Create temporary dir for module support files
-# clean it up only when building all modules
-cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
-                  $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)
-
 # read saved command lines for existing targets
 existing-targets := $(wildcard $(sort $(targets)))
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1492e37c3927..1d01324455d1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,8 +69,6 @@ modorder-target := $(obj)/modules.order
 endif
 endif
 
-# We keep a list of all modules in $(MODVERDIR)
-
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
 	 $(if $(KBUILD_MODULES),$(obj-m) $(modorder-target)) \
 	 $(subdir-ym) $(always)
@@ -280,13 +278,11 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
-# Single-part modules are special since we need to mark them in $(MODVERDIR)
-
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 	@{ echo $(@:.o=.ko); echo $@; \
-	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
+	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
@@ -468,7 +464,7 @@ cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
 	@{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
-	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
+	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-m)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 2ab1694a7df3..3e229d4f4d72 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -6,8 +6,8 @@
 # Stage one of module building created the following:
 # a) The individual .o files used for the module
 # b) A <module>.o file which is the .o files above linked together
-# c) A <module>.mod file in $(MODVERDIR)/, listing the name of the
-#    the preliminary <module>.o file, plus all .o files
+# c) A <module>.mod file, listing the name of the preliminary <module>.o file,
+#    plus all .o files
 # d) modules.order, which lists all the modules
 
 # Stage 2 is handled by this file and does the following
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index aab4e299d7a2..d3561ff4089c 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -47,13 +47,10 @@ cat > "$new_ksyms_file" << EOT
  */
 
 EOT
-[ "$(ls -A "$MODVERDIR")" ] &&
-for mod in "$MODVERDIR"/*.mod; do
-	sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
-done | sort -u |
-while read sym; do
-	echo "#define __KSYM_${sym} 1"
-done >> "$new_ksyms_file"
+sed 's/ko$/mod/' modules.order |
+xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
+sort -u |
+sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
 # Special case for modversions (see modpost.c)
 if [ -n "$CONFIG_MODVERSIONS" ]; then
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 0f6dcb4011a8..166f3fa247a9 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -396,21 +396,11 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	unsigned long len;
 	struct md4_ctx md;
 	char *sources, *end, *fname;
-	const char *basename;
 	char filelist[PATH_MAX + 1];
-	char *modverdir = getenv("MODVERDIR");
 
-	if (!modverdir)
-		modverdir = ".";
-
-	/* Source files for module are in .tmp_versions/modname.mod,
-	   after the first line. */
-	if (strrchr(modname, '/'))
-		basename = strrchr(modname, '/') + 1;
-	else
-		basename = modname;
-	snprintf(filelist, sizeof(filelist), "%s/%.*s.mod", modverdir,
-		(int) strlen(basename) - 2, basename);
+	/* objects for a module are listed in the second line of *.mod file. */
+	snprintf(filelist, sizeof(filelist), "%.*smod",
+		 (int)strlen(modname) - 1, modname);
 
 	file = grab_file(filelist, &len);
 	if (!file)
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 2d29df4a0a53..8640c278f1aa 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -29,7 +29,7 @@ fi
 
 PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
 __KERNELRELEASE=$(echo $KERNELRELEASE | sed -e "s/-/_/g")
-EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
+EXCLUDES="$RCS_TAR_IGNORE --exclude=*vmlinux* --exclude=*.mod \
 --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
 --exclude=.config.old --exclude=.missing-syscalls.d --exclude=*.s"
 
-- 
2.17.1

