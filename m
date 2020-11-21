Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22B52BBB76
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Nov 2020 02:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgKUBRJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 20:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgKUBRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 20:17:08 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B9BC061A04
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 17:17:06 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id v188so13878827ybc.19
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=iQ4OrlgV37km/esdj9c16jR7zuMFgvA4/19ePO+04nk=;
        b=SiFdqc2tdvdZfG5LPcF9rZtMTetWJJa75zaMNVRpf+7ypgLW8W59rZNIJ09X/HR02N
         cUL55MCreIUkgc0wfevnIeMgjTWWLfjZN5EK7pdpzUyLdkufhNt9mR9v8NQT/bUCtkye
         l5/3w2ruaua8HcTHg2idVAgHozfxop2F1KSZFoxxntzypbG6j9DPNGGwXWgY63/rLJVG
         N7TdmCUgliRjAvDbYcwPzrBENBBB2ORYkrsVqQUKFUNmd4ulUPWJyWpYf5u84ATRtMhA
         2uAxuetzdNvG4nfVabv7W1M/m2Add9TJ5QzAkreQjdDVCyAVjqVFzLaIzEklYsdS/V/g
         PbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iQ4OrlgV37km/esdj9c16jR7zuMFgvA4/19ePO+04nk=;
        b=fmKQO84V2UhQu7OuLp9CIqlTODJTnPJIG7800dnf64ML5O+W47NHpZ1hupT77XHGX5
         7p9lzvuDaEOKRozzszYJLe+jPAsLHwgZXTZswpHRvKm/wL4QlLh0yoZG8cG11J/0Kgwi
         6cGc0fuO3/IO24HQBoAUtbrMlQtE22FdevI90vRkQU2mKGnDuhIM3aOyc0gkTANeagBE
         IcJJPna1Z67HFW0JIjMLqNKuvXMpqVsbvYjb5Q8JL+KxnVyVktNCv8vUPmC7U/Iaxh2M
         bR2yi8gpHSgkCrLeomvg0lhgH8oz3ZdjqOWFggz1WU9EwJU8/SWfxdb/PMBD+B0VwfLj
         dFVA==
X-Gm-Message-State: AOAM533IuMOXLGpKdQNWfIqEAGE8JCrCMZcJTq/dzzZiVI5XeWqYR5FS
        +lLuYZ9DGNLpzN4MOmtBhh7u38fwgrvCk2+wnfc=
X-Google-Smtp-Source: ABdhPJyc/MKHdu8cACn/yJ2Gr4rfpnNrUDF6yh12J/zfYZzsJRL+Tjk+j+gsVyGhAkEnJv1R26t54SyxuQXZDWyucl4=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:7542:: with SMTP id
 q63mr31125405ybc.176.1605921426183; Fri, 20 Nov 2020 17:17:06 -0800 (PST)
Date:   Sat, 21 Nov 2020 01:16:51 +0000
In-Reply-To: <20201121011652.2006613-1-willmcvicker@google.com>
Message-Id: <20201121011652.2006613-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20201121011652.2006613-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 2/2] modules: add scmversion field
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@google.com, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add the modinfo field `scmversion` to include the SCM version of kernel
modules, e.g. git sha1. This allows one to identify the exact source
code version of a given kernel module.

You can retrieve it in two ways,

1) By using modinfo
    > modinfo -F scmversion <module_name>
2) By module sysfs node
    > cat /sys/module/<module_name>/scmversion

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 include/linux/module.h   |  1 +
 kernel/module.c          | 20 ++++++++++++++++++++
 scripts/Makefile.modpost | 19 +++++++++++++++++--
 scripts/mod/modpost.c    | 28 +++++++++++++++++++++++++++-
 4 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 6264617bab4d..63137ca5147b 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -372,6 +372,7 @@ struct module {
 	struct module_attribute *modinfo_attrs;
 	const char *version;
 	const char *srcversion;
+	const char *scmversion;
 	struct kobject *holders_dir;
 
 	/* Exported symbols */
diff --git a/kernel/module.c b/kernel/module.c
index a4fa44a652a7..be155ec80083 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -807,6 +807,7 @@ static struct module_attribute modinfo_##field = {                    \
 
 MODINFO_ATTR(version);
 MODINFO_ATTR(srcversion);
+MODINFO_ATTR(scmversion);
 
 static char last_unloaded_module[MODULE_NAME_LEN+1];
 
@@ -1265,10 +1266,29 @@ static ssize_t show_taint(struct module_attribute *mattr,
 static struct module_attribute modinfo_taint =
 	__ATTR(taint, 0444, show_taint, NULL);
 
+/**
+ * struct modinfo_attrs - Module attributes.
+ * @module_uevent: Used to notify udev of events.
+ * @modinfo_version: Module version.
+ * @modinfo_srcversion: Checksum of module source.
+ * @modinfo_scmversion: SCM version of module source.
+ * @modinfo_initstate: Module init state.
+ * @modinfo_coresize: Module core layout size.
+ * @modinfo_initsize: Module init layout size.
+ * @modinfo_taint: Indicates if the module is tainted.
+ * @modinfo_refcnt: Number of references in the kernel to the module.
+ *
+ * These are the module attributes accessible via the sysfs files
+ * /sys/module/<module_name>/<attribute>.
+ *
+ * The following subset of attributes can also be accessed via the modinfo tool
+ * as well: version, srcversion, and scmversion.
+ */
 static struct module_attribute *modinfo_attrs[] = {
 	&module_uevent,
 	&modinfo_version,
 	&modinfo_srcversion,
+	&modinfo_scmversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
 	&modinfo_initsize,
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f54b6ac37ac2..4486eb72240e 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -77,8 +77,23 @@ src := $(obj)
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 
-# modpost option for external modules
-MODPOST += -e
+# Get the external module's source path. KBUILD_EXTMOD could either be an
+# absolute path or relative path from $(srctree). This makes sure that we
+# aren't using a relative path from a separate working directory (O= or
+# KBUILD_OUTPUT) since that may not be the actual module's SCM project path. So
+# check the path relative to $(srctree) first.
+ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
+	module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
+else
+	module_srcpath := $(KBUILD_EXTMOD)
+endif
+
+# Get the SCM version of the external module. Sed verifies setlocalversion
+# returns a proper revision based on the SCM type, e.g. git, mercurial, or svn.
+module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
+	sed -n 's/.*-\(\(\(g\|hg\)[a-fA-F0-9]\+\|svn[0-9]\+\)\(-dirty\)\?\).*\?/\1/p')
+# modpost option for external modules.
+MODPOST += -e$(module_scmversion)
 
 input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f882ce0d9327..db59eb2a880d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -30,6 +30,8 @@ static int have_vmlinux = 0;
 static int all_versions = 0;
 /* If we are modposting external module set to 1 */
 static int external_module = 0;
+#define MODULE_SCMVERSION_SIZE 64
+static char module_scmversion[MODULE_SCMVERSION_SIZE];
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
 /* How a symbol is exported */
@@ -2272,6 +2274,27 @@ static void add_intree_flag(struct buffer *b, int is_intree)
 		buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
 }
 
+/**
+ * add_scmversion() - Adds the MODULE_INFO macro for the scmversion.
+ * @b: Buffer to append to.
+ * @is_intree: Indicates if the module is in-tree or is an external module.
+ *
+ * This function fills in the module attribute `scmversion` for the kernel
+ * module. This is useful for determining a given module's SCM version on
+ * device via /sys/modules/<module>/scmversion and/or using the modinfo tool.
+ *
+ * If it's an in-tree module, then the UTS_RELEASE version is used. Otherwise,
+ * the provided SCM version is used. If there was no SCM version provided to
+ * the script for an external module, then `scmversion` is omitted.
+ */
+static void add_scmversion(struct buffer *b, int is_intree)
+{
+	if (is_intree)
+		buf_printf(b, "\nMODULE_INFO(scmversion, UTS_RELEASE);\n");
+	else if (module_scmversion[0] != '\0')
+		buf_printf(b, "\nMODULE_INFO(scmversion, \"%s\");\n", module_scmversion);
+}
+
 /* Cannot check for assembler */
 static void add_retpoline(struct buffer *b)
 {
@@ -2559,10 +2582,12 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "e::i:mnT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
+			if (optarg)
+				strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
 			break;
 		case 'i':
 			*dump_read_iter =
@@ -2645,6 +2670,7 @@ int main(int argc, char **argv)
 		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
 		add_srcversion(&buf, mod);
+		add_scmversion(&buf, !external_module);
 
 		sprintf(fname, "%s.mod.c", mod->name);
 		write_if_changed(&buf, fname);
-- 
2.29.2.454.gaff20da3a2-goog

