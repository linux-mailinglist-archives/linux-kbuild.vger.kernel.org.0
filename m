Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C66125CC0
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 09:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfLSIed (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 03:34:33 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:36689 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLSIed (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:34:33 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBJ8XVeE026051;
        Thu, 19 Dec 2019 17:33:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBJ8XVeE026051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576744414;
        bh=hqbUenuvR6fw/8XNviC6Tz21TG63y2gIQKK3vmfTNtg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PoCBUhPLUdYEynfkqvs/ctHyV4QOMmDldlt4RgwnjO6CBCbF77hpe47TpAiup5HVI
         Vn8/WWCspyb7lJtoK3O6B7/eDJzqzC/nKnoe+bf8cosR7r9X4EqDQWyvNSHttsNp+u
         5PFvP0zguibQxV7ikGALaxKcBXT5uZqi9mBJmYpKlwySHK7U9+39akUpKG7ivM+W6K
         QEMlH3frtrXoqHuBrG9REmfOTSqHpYtoVNmUq6LFhZHGwJBZ0/gKiuOeTo9TCVPx8a
         Ai7F5Lvq2c9ty14msvuT9K0K7N/wUnlWoolqBDgqlCk5VvmCmBk4SyrlLf/2ETZ2W2
         UMHPElmRqhIpA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: create modules.builtin without Makefile.modbuiltin or tristate.conf
Date:   Thu, 19 Dec 2019 17:33:29 +0900
Message-Id: <20191219083329.5926-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219083329.5926-1-masahiroy@kernel.org>
References: <20191219083329.5926-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit bc081dd6e9f6 ("kbuild: generate modules.builtin") added
infrastructure to generate modules.builtin, the list of all
builtin modules.

Basically, it works like this:

  - Kconfig generates include/config/tristate.conf, the list of
    tristate CONFIG options with a value in a capital letter.

  - scripts/Makefile.modbuiltin makes Kbuild descend into
    directories to collect the information of builtin modules.

I am not a big fan of it because Kbuild ends up with traversing
the source tree twice.

I am not sure how perfectly it should work, but this approach cannot
avoid false positives; even if the relevant CONFIG option is tristate,
some Makefiles forces obj-m to obj-y.

Some examples are:

  arch/powerpc/platforms/powermac/Makefile:
    obj-$(CONFIG_NVRAM:m=y)         += nvram.o

  net/ipv6/Makefile:
    obj-$(subst m,y,$(CONFIG_IPV6)) += inet6_hashtables.o

  net/netlabel/Makefile:
    obj-$(subst m,y,$(CONFIG_IPV6)) += netlabel_calipso.o

Nobody has complained about (or noticed) it, so it is probably fine to
have false positives in modules.builtin.

This commit simplifies the implementation. Let's exploit the fact
that every module has MODULE_LICENSE(). (modpost shows a warning if
MODULE_LICENSE is missing. If so, 0-day bot would already have blocked
such a module.)

I added MODULE_FILE to <linux/module.h>. When the code is being compiled
as builtin, it will be filled with the file path of the module, and
collected into modules.builtin.info. Then, scripts/link-vmlinux.sh
extracts the list of builtin modules out of it.

This new approach fixes the false-positives above, but adds another
type of false-positives; non-modular code may have MODULE_LICENSE()
by mistake. This is not a big deal, it is just the code is always
orphan. We can clean it up if we like. You can see cleanup examples by:

  $ git log --grep='make.* explicitly non-modular'

To sum up, this commits deletes lots of code, but still produces almost
equivalent results. Please note it does not increase the vmlinux size at
all. As you can see in include/asm-generic/vmlinux.lds.h, the .modinfo
section is discarded in the link stage.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig.rst |  5 ---
 Makefile                         | 21 +++---------
 include/linux/module.h           | 12 ++++++-
 scripts/Kbuild.include           |  6 ----
 scripts/Makefile.modbuiltin      | 57 --------------------------------
 scripts/kconfig/confdata.c       | 45 ++-----------------------
 scripts/link-vmlinux.sh          |  4 +++
 7 files changed, 22 insertions(+), 128 deletions(-)
 delete mode 100644 scripts/Makefile.modbuiltin

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index a9a855f894b3..dce6801d66c9 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -154,11 +154,6 @@ KCONFIG_AUTOCONFIG
 This environment variable can be set to specify the path & name of the
 "auto.conf" file.  Its default value is "include/config/auto.conf".
 
-KCONFIG_TRISTATE
-----------------
-This environment variable can be set to specify the path & name of the
-"tristate.conf" file.  Its default value is "include/config/tristate.conf".
-
 KCONFIG_AUTOHEADER
 ------------------
 This environment variable can be set to specify the path & name of the
diff --git a/Makefile b/Makefile
index f900c23b8291..a9fa0f2975e2 100644
--- a/Makefile
+++ b/Makefile
@@ -673,7 +673,7 @@ $(KCONFIG_CONFIG):
 #
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
-%/auto.conf %/auto.conf.cmd %/tristate.conf: $(KCONFIG_CONFIG)
+%/auto.conf %/auto.conf.cmd: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
@@ -1277,24 +1277,13 @@ all: modules
 # using awk while concatenating to the final file.
 
 PHONY += modules
-modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
 modules.order: descend
 	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
 
-modbuiltin-dirs := $(addprefix _modbuiltin_, $(build-dirs))
-
-modules.builtin: $(modbuiltin-dirs)
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
-
-PHONY += $(modbuiltin-dirs)
-# tristate.conf is not included from this Makefile. Add it as a prerequisite
-# here to make it self-healing in case somebody accidentally removes it.
-$(modbuiltin-dirs): include/config/tristate.conf
-	$(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
-
 # Target to prepare building external modules
 PHONY += modules_prepare
 modules_prepare: prepare
@@ -1314,7 +1303,7 @@ _modinst_:
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
-	@sed 's:^:kernel/:' modules.builtin > $(MODLIB)/modules.builtin
+	@cp -f modules.builtin $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
@@ -1356,7 +1345,7 @@ endif # CONFIG_MODULES
 
 # Directories & files removed with 'make clean'
 CLEAN_DIRS  += include/ksym
-CLEAN_FILES += modules.builtin.modinfo modules.nsdeps
+CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config include/generated          \
@@ -1711,7 +1700,7 @@ clean: $(clean-dirs)
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
-		-o -name modules.builtin -o -name '.tmp_*.o.*' \
+		-o -name '.tmp_*.o.*' \
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
 		-o -name '*.gcno' \) -type f -print | xargs rm -f
diff --git a/include/linux/module.h b/include/linux/module.h
index bd165ba68617..6877b3b191d0 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -169,6 +169,16 @@ extern void cleanup_module(void);
  */
 #define MODULE_SOFTDEP(_softdep) MODULE_INFO(softdep, _softdep)
 
+/*
+ * MODULE_FILE is used for generating modules.builtin
+ * So, make it no-op when this is being built as a module
+ */
+#ifdef MODULE
+#define MODULE_FILE
+#else
+#define MODULE_FILE	MODULE_INFO(file, KBUILD_MODFILE);
+#endif
+
 /*
  * The following license idents are currently accepted as indicating free
  * software modules
@@ -213,7 +223,7 @@ extern void cleanup_module(void);
  * 2.	So the community can ignore bug reports including proprietary modules
  * 3.	So vendors can do likewise based on their own policies
  */
-#define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
+#define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
 
 /*
  * Author(s), use "Name <email>" or just "Name", for multiple
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 88c144787e57..3da8321efb74 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -163,12 +163,6 @@ ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 # $(Q)$(MAKE) $(build)=dir
 build := -f $(srctree)/scripts/Makefile.build obj
 
-###
-# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.modbuiltin obj=
-# Usage:
-# $(Q)$(MAKE) $(modbuiltin)=dir
-modbuiltin := -f $(srctree)/scripts/Makefile.modbuiltin obj
-
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.dtbinst obj=
 # Usage:
diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
deleted file mode 100644
index 7d4711b88656..000000000000
--- a/scripts/Makefile.modbuiltin
+++ /dev/null
@@ -1,57 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# ==========================================================================
-# Generating modules.builtin
-# ==========================================================================
-
-src := $(obj)
-
-PHONY := __modbuiltin
-__modbuiltin:
-
-include include/config/auto.conf
-# tristate.conf sets tristate variables to uppercase 'Y' or 'M'
-# That way, we get the list of built-in modules in obj-Y
-include include/config/tristate.conf
-
-include scripts/Kbuild.include
-
-ifdef building_out_of_srctree
-# Create output directory if not already present
-_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
-endif
-
-# The filename Kbuild has precedence over Makefile
-kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
-kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
-include $(kbuild-file)
-
-include scripts/Makefile.lib
-__subdir-Y     := $(patsubst %/,%,$(filter %/, $(obj-Y)))
-subdir-Y       += $(__subdir-Y)
-subdir-ym      := $(sort $(subdir-y) $(subdir-Y) $(subdir-m))
-subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
-obj-Y          := $(addprefix $(obj)/,$(obj-Y))
-
-modbuiltin-subdirs := $(patsubst %,%/modules.builtin, $(subdir-ym))
-modbuiltin-mods    := $(filter %.ko, $(obj-Y:.o=.ko))
-modbuiltin-target  := $(obj)/modules.builtin
-
-__modbuiltin: $(modbuiltin-target) $(subdir-ym)
-	@:
-
-$(modbuiltin-target): $(subdir-ym) FORCE
-	$(Q)(for m in $(modbuiltin-mods); do echo $$m; done;	\
-	cat /dev/null $(modbuiltin-subdirs)) > $@
-
-PHONY += FORCE
-
-FORCE:
-
-# Descending
-# ---------------------------------------------------------------------------
-
-PHONY += $(subdir-ym)
-$(subdir-ym):
-	$(Q)$(MAKE) $(modbuiltin)=$@
-
-.PHONY: $(PHONY)
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3569d2dec37c..fb675bd9a809 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -710,25 +710,6 @@ static struct conf_printer header_printer_cb =
 	.print_comment = header_print_comment,
 };
 
-/*
- * Tristate printer
- *
- * This printer is used when generating the `include/config/tristate.conf' file.
- */
-static void
-tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
-{
-
-	if (sym->type == S_TRISTATE && *value != 'n')
-		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
-}
-
-static struct conf_printer tristate_printer_cb =
-{
-	.print_symbol = tristate_print_symbol,
-	.print_comment = kconfig_print_comment,
-};
-
 static void conf_write_symbol(FILE *fp, struct symbol *sym,
 			      struct conf_printer *printer, void *printer_arg)
 {
@@ -1062,7 +1043,7 @@ int conf_write_autoconf(int overwrite)
 	struct symbol *sym;
 	const char *name;
 	const char *autoconf_name = conf_get_autoconfig_name();
-	FILE *out, *tristate, *out_h;
+	FILE *out, *out_h;
 	int i;
 
 	if (!overwrite && is_present(autoconf_name))
@@ -1077,23 +1058,13 @@ int conf_write_autoconf(int overwrite)
 	if (!out)
 		return 1;
 
-	tristate = fopen(".tmpconfig_tristate", "w");
-	if (!tristate) {
-		fclose(out);
-		return 1;
-	}
-
 	out_h = fopen(".tmpconfig.h", "w");
 	if (!out_h) {
 		fclose(out);
-		fclose(tristate);
 		return 1;
 	}
 
 	conf_write_heading(out, &kconfig_printer_cb, NULL);
-
-	conf_write_heading(tristate, &tristate_printer_cb, NULL);
-
 	conf_write_heading(out_h, &header_printer_cb, NULL);
 
 	for_all_symbols(i, sym) {
@@ -1101,15 +1072,11 @@ int conf_write_autoconf(int overwrite)
 		if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
 			continue;
 
-		/* write symbol to auto.conf, tristate and header files */
+		/* write symbols to auto.conf and autoconf.h */
 		conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
-
-		conf_write_symbol(tristate, sym, &tristate_printer_cb, (void *)1);
-
 		conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
 	}
 	fclose(out);
-	fclose(tristate);
 	fclose(out_h);
 
 	name = getenv("KCONFIG_AUTOHEADER");
@@ -1120,14 +1087,6 @@ int conf_write_autoconf(int overwrite)
 	if (rename(".tmpconfig.h", name))
 		return 1;
 
-	name = getenv("KCONFIG_TRISTATE");
-	if (!name)
-		name = "include/config/tristate.conf";
-	if (make_parent_dir(name))
-		return 1;
-	if (rename(".tmpconfig_tristate", name))
-		return 1;
-
 	if (make_parent_dir(autoconf_name))
 		return 1;
 	/*
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 436379940356..bf0bf9063aaf 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -250,6 +250,10 @@ ${MAKE} -f "${srctree}/scripts/Makefile.modpost" MODPOST_VMLINUX=1
 
 info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
+info GEN modules.builtin
+# The second line aids cases where multiple modules share the same object.
+tr '\0' '\n' < modules.builtin.modinfo | sed -n 's/^[[:alnum:]:_]*\.file=//p' |
+	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$/.ko/' > modules.builtin
 
 btf_vmlinux_bin_o=""
 if [ -n "${CONFIG_DEBUG_INFO_BTF}" ]; then
-- 
2.17.1

