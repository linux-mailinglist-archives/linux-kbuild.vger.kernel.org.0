Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB282DC8C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 23:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbgLPWJj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 17:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgLPWJj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 17:09:39 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99ACC0617A7
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 14:08:58 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id k126so2917562qkf.8
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 14:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=1mGpJFgZ/dA1gcKRRTqgg7tDYVACZ/ZcxD4vIZllu8c=;
        b=oeavvbL9yr68L9PpVVEYjMVCjSFIEnOPQN5C+XeSWmOiIWOzprieFODe7bRMVJ1AG8
         2S2qYd1lXREqrc/enjVFtc9+HPUHqjm3+n/WRcGNTG44XiZIAnvHo1XRlZKAhK4k9SvC
         2UEjy1AxTk+E+yKcloKX6sPU3jSk5ubxumwzlWX7f2An6/ePe8K+lKjKsCU6IS784s6U
         +pLBDowtSvI8FAklGvdE87LkNWHhQEMd8zrSzrpjMJznz/8H67d6hWgXFb/j3b94kqy/
         dSjXhMnnBfc3y65+1IUVpIY9B4lgxh5EdCb8BXgU985tZUzyMz7+zriA9A1O3OF9aodZ
         C0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=1mGpJFgZ/dA1gcKRRTqgg7tDYVACZ/ZcxD4vIZllu8c=;
        b=LrgB3UfcdzzqPIfkOjn36v9X1beOf4M5uBCw+/L1HmvC4DUTcI9V+Na9RlKOtEqLgJ
         Njr8am4X9HboplJlLKbO9hN0xNIbW4yREhqJWFFXRR1w9Ljy0eFB+US48yZPyNfwI0WA
         gZiIGaeAVSVte59JBZ/OiAZjytWeFBsxhAAWgUzoHWQyYQOgdMGqQu+/ViD9/P681fGm
         qW+2B/bXm5++Ph8bfyX8qW1MvKnRSXeAxpHaNbg96CzieoFOwKkJcILEEfR3HSs39lIZ
         glpXSi+MmFP7pC6qiUqUCgK2KwKbraS+vJZ/28pYCxaQ61M922lzsse8G5ZJTe2QYrog
         OQMA==
X-Gm-Message-State: AOAM530VAz2E9bSnMHlccqX2j1rKqFfxKf8O91tqUDrECFhbM911N7HG
        ruUx/38v0l3yTYCBw1jHUToHe/gl5XLXlN3NP0Y=
X-Google-Smtp-Source: ABdhPJxuDztsJ/xViU2UmS0E0zAaFOD3/ZBN/KWAT0KcdPr9PwterDhdshBPNhZNFmTc7KN0Q7/w829FunN5ENxOuzg=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:ad4:476c:: with SMTP id
 d12mr44270048qvx.20.1608156537788; Wed, 16 Dec 2020 14:08:57 -0800 (PST)
Date:   Wed, 16 Dec 2020 22:08:50 +0000
Message-Id: <20201216220850.659584-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4] modules: introduce the MODULE_SCMVERSION config
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Config MODULE_SCMVERSION introduces a new module attribute --
`scmversion` -- which can be used to identify a given module's SCM
version.  This is very useful for developers that update their kernel
independently from their kernel modules or vice-versa since the SCM
version provided by UTS_RELEASE (`uname -r`) will now differ from the
module's vermagic attribute.

For example, we have a CI setup that tests new kernel changes on the
hikey960 and db845c devices without updating their kernel modules. When
these tests fail, we need to be able to identify the exact device
configuration the test was using. By including MODULE_SCMVERSION, we can
identify the exact kernel and modules' SCM versions for debugging the
failures.

Additionally, by exposing the SCM version via the sysfs node
/sys/module/MODULENAME/scmversion, one can also verify the SCM versions
of the modules loaded from the initramfs. Currently, modinfo can only
retrieve module attributes from the module's ko on disk and not from the
actual module that is loaded in RAM.

You can retrieve the SCM version in two ways,

1) By using modinfo:
    > modinfo -F scmversion MODULENAME
2) By module sysfs node:
    > cat /sys/module/MODULENAME/scmversion

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
Changelog since v3:
- Dropped [PATCH v2 1/2] scripts/setlocalversion: allow running in a subdir

 Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
 include/linux/module.h                |  1 +
 init/Kconfig                          | 12 ++++++++++++
 kernel/module.c                       |  2 ++
 scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
 scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
 6 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
index 6272ae5fb366..2ba731767737 100644
--- a/Documentation/ABI/stable/sysfs-module
+++ b/Documentation/ABI/stable/sysfs-module
@@ -32,3 +32,21 @@ Description:
 		Note: If the module is built into the kernel, or if the
 		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
 		this file will not be present.
+
+What:		/sys/module/MODULENAME/scmversion
+Date:		November 2020
+KernelVersion:	5.11
+Contact:	Will McVicker <willmcvicker@google.com>
+Description:	This read-only file will appear if modpost was supplied with an
+		SCM version for the module. It can be enabled with the config
+		MODULE_SCMVERSION. The SCM version is retrieved by
+		scripts/setlocalversion, which means that the presence of this
+		file depends on CONFIG_LOCALVERSION_AUTO=y or LOCALVERSION=.
+		When read, the SCM version that the module was compiled with is
+		returned. The SCM version is returned in the following format::
+
+		===
+		Git:		g[a-f0-9]\+(-dirty)\?
+		Mercurial:	hg[a-f0-9]\+(-dirty)\?
+		Subversion:	svn[0-9]\+
+		===
diff --git a/include/linux/module.h b/include/linux/module.h
index c4e7a887f469..6bd710308863 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -372,6 +372,7 @@ struct module {
 	struct module_attribute *modinfo_attrs;
 	const char *version;
 	const char *srcversion;
+	const char *scmversion;
 	struct kobject *holders_dir;
 
 	/* Exported symbols */
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963..d9ae12f16ba2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2131,6 +2131,18 @@ config MODULE_SRCVERSION_ALL
 	  the version).  With this option, such a "srcversion" field
 	  will be created for all modules.  If unsure, say N.
 
+config MODULE_SCMVERSION
+	bool "SCM version for modules"
+	depends on LOCALVERSION_AUTO
+	help
+	  This enables the module attribute "scmversion" which can be used
+	  by developers to identify the SCM version of a given module, e.g.
+	  git sha1 or hg sha1. The SCM version can be queried by modinfo or
+	  via the sysfs node: /sys/modules/MODULENAME/scmversion. This is
+	  useful when the kernel or kernel modules are updated separately
+	  since that causes the vermagic of the kernel and the module to
+	  differ.
+
 config MODULE_SIG
 	bool "Module signature verification"
 	select MODULE_SIG_FORMAT
diff --git a/kernel/module.c b/kernel/module.c
index c3a9e972d3b2..6967cd3abf9b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -836,6 +836,7 @@ static struct module_attribute modinfo_##field = {                    \
 
 MODINFO_ATTR(version);
 MODINFO_ATTR(srcversion);
+MODINFO_ATTR(scmversion);
 
 static char last_unloaded_module[MODULE_NAME_LEN+1];
 
@@ -1298,6 +1299,7 @@ static struct module_attribute *modinfo_attrs[] = {
 	&module_uevent,
 	&modinfo_version,
 	&modinfo_srcversion,
+	&modinfo_scmversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
 	&modinfo_initsize,
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f54b6ac37ac2..f1126b60adb7 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
+module_srcpath := $(srctree)
 
 else
 
@@ -77,6 +78,17 @@ src := $(obj)
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 
+# Get the external module's source path. KBUILD_EXTMOD could either be an
+# absolute path or relative path from $(srctree). This makes sure that we
+# aren't using a relative path from a separate working directory (O= or
+# KBUILD_OUTPUT) since that may not be the actual module's SCM project path.
+# So check the path relative to $(srctree) first.
+ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
+	module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
+else
+	module_srcpath := $(KBUILD_EXTMOD)
+endif
+
 # modpost option for external modules
 MODPOST += -e
 
@@ -85,6 +97,16 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
 endif
 
+ifeq ($(CONFIG_MODULE_SCMVERSION),y)
+# Get the SCM version of the module. Sed verifies setlocalversion returns
+# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
+module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
+	sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
+ifneq ($(module_scmversion),)
+MODPOST += -v$(module_scmversion)
+endif
+endif
+
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
 	$(addprefix -i ,$(wildcard $(input-symdump))) \
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f882ce0d9327..db71e0c9ab20 100644
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
@@ -2272,6 +2274,20 @@ static void add_intree_flag(struct buffer *b, int is_intree)
 		buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
 }
 
+/**
+ * add_scmversion() - Adds the MODULE_INFO macro for the scmversion.
+ * @b: Buffer to append to.
+ *
+ * This function fills in the module attribute `scmversion` for the kernel
+ * module. This is useful for determining a given module's SCM version on
+ * device via /sys/modules/<module>/scmversion and/or using the modinfo tool.
+ */
+static void add_scmversion(struct buffer *b)
+{
+	if (module_scmversion[0] != '\0')
+		buf_printf(b, "\nMODULE_INFO(scmversion, \"%s\");\n", module_scmversion);
+}
+
 /* Cannot check for assembler */
 static void add_retpoline(struct buffer *b)
 {
@@ -2559,7 +2575,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:v:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2597,6 +2613,11 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'v':
+			if (!optarg)
+				fatal("'-v' requires an argument defining the SCM version.");
+			strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
+			break;
 		default:
 			exit(1);
 		}
@@ -2645,6 +2666,7 @@ int main(int argc, char **argv)
 		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
 		add_srcversion(&buf, mod);
+		add_scmversion(&buf);
 
 		sprintf(fname, "%s.mod.c", mod->name);
 		write_if_changed(&buf, fname);
-- 
2.29.2.684.gfbc64c5ab5-goog

