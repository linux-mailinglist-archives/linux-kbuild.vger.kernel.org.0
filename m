Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB41C2FF766
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 22:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbhAUVhn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 16:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbhAUVhf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 16:37:35 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD916C0613D6
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 13:36:51 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id ba10so1890176plb.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 13:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=uOdIV+OIC4oe0YbeVn+NOSkcdmkyaip5vjXYADMjhaU=;
        b=ZlxZGSGgQOyJdUuWoZTSjeF9XkcRXQJePTB7YUDoh6tqXVijT1lQOPNlwAqmftcOBc
         kJXBChowZUUe7Q+oQOdS3wCW7vYewV7DeLRxjC5ePRBtQnutxetlDy0K3QBCZzhNaCTp
         016Yupa76hS7oLOwskhPVay+7V8POo6Iw3A0GT5LTllEeZ4RhxAmtn9IqRr1780kVsBm
         6l6GBIYfF7OCTKKp+pvxyRpTfvaXGjAeae3fFa6LQCCjVhufnuJITFyLABWro/3VEGz8
         FMRWJcV/s3e8NKViGJQZVNq41JDyWOK7qww2LWprB9Ch6iiNF66jfe39SAXHjloDn3e3
         yG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=uOdIV+OIC4oe0YbeVn+NOSkcdmkyaip5vjXYADMjhaU=;
        b=YXzvTnJUxBPHbGqjOKAXeRaHW8uI2W4GBCLdRdkrFi5bGlcX9Wf4XEqc14uLxJeS15
         aDd+iEBMxUytFMkTopNt2+IbqlqggnT8m5lZTZFA/WG2H0ruySC9kyGWiuHk2wLPNSV/
         iVw+ITsk51ZszVxOCnZiATKzEzWSShmqzn4zu/R94Nb+CznNubFaPNn4cQHkbUy3dO6t
         i+PpozWcYqoejPAiyNRIqHGqNOjsi9Ou9DNgsYthuBwbPHJJbzuq/Wq3rW8J58kv4OA5
         ezajCrifkbxVnOn2arhJ4pF7JP02HblUdNOMCwBsSqbxkN2iMUDzK5C8ehKUBQlBwC0u
         145Q==
X-Gm-Message-State: AOAM530+r5x+l+4WxL0S6b24RFhYZkRA1PYPkLOc7ou8gv0b2Dm1YAV4
        brcOrGrF6bdwAI+trpt+hZMfacoDMgQEwvvNlCQ=
X-Google-Smtp-Source: ABdhPJxGV5fBBV9xgsrnjgaUKTfwa0NLICCljMdw6HsrlTYRTpINFURAbxG6w47IFeZAsE3xRZzuGdfAL9kNkRhgTlc=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:90a:3948:: with SMTP id
 n8mr1541963pjf.206.1611265010212; Thu, 21 Jan 2021 13:36:50 -0800 (PST)
Date:   Thu, 21 Jan 2021 21:36:41 +0000
Message-Id: <20210121213641.3477522-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
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
Changelog since v5:
- Simplified scripts/Makefile.modpost to not check for a relative M= path
- Added space between -v and $(module_scmversion)
- Updated modpost.c to not check for a missing argument to -v

 Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
 include/linux/module.h                |  1 +
 init/Kconfig                          | 14 ++++++++++++++
 kernel/module.c                       |  2 ++
 scripts/Makefile.modpost              | 14 ++++++++++++++
 scripts/mod/modpost.c                 | 22 +++++++++++++++++++++-
 6 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
index 6272ae5fb366..a75d137e79f4 100644
--- a/Documentation/ABI/stable/sysfs-module
+++ b/Documentation/ABI/stable/sysfs-module
@@ -32,3 +32,21 @@ Description:
 		Note: If the module is built into the kernel, or if the
 		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
 		this file will not be present.
+
+What:		/sys/module/MODULENAME/scmversion
+Date:		November 2020
+KernelVersion:	5.12
+Contact:	Will McVicker <willmcvicker@google.com>
+Description:	This read-only file will appear if modpost was supplied with an
+		SCM version for the module. It can be enabled with the config
+		MODULE_SCMVERSION. The SCM version is retrieved by
+		scripts/setlocalversion, which means that the presence of this
+		file depends on CONFIG_LOCALVERSION_AUTO=y. When read, the SCM
+		version that the module was compiled with is returned. The SCM
+		version is returned in the following format::
+
+		===
+		Git:		g[a-f0-9]\+(-dirty)\?
+		Mercurial:	hg[a-f0-9]\+(-dirty)\?
+		Subversion:	svn[0-9]\+
+		===
diff --git a/include/linux/module.h b/include/linux/module.h
index 7a0bcb5b1ffc..3b1612193cf9 100644
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
index b77c60f8b963..3d9dac3c4e8f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2131,6 +2131,20 @@ config MODULE_SRCVERSION_ALL
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
+	  If unsure, say N.
+
 config MODULE_SIG
 	bool "Module signature verification"
 	select MODULE_SIG_FORMAT
diff --git a/kernel/module.c b/kernel/module.c
index 4bf30e4b3eaa..d0b359c7e9c9 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -837,6 +837,7 @@ static struct module_attribute modinfo_##field = {                    \
 
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
index f54b6ac37ac2..13ec3e96650c 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
+module_srcpath := $(srctree)
 
 else
 
@@ -82,9 +83,22 @@ MODPOST += -e
 
 input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+module_srcpath := $(KBUILD_EXTMOD)
 
 endif
 
+ifeq ($(CONFIG_MODULE_SCMVERSION),y)
+# Get the SCM version of the module. Sed verifies setlocalversion returns
+# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
+# Note: relative M= paths are not supported when building the kernel out of the
+# srctree since setlocalversion won't be able to find the module srctree.
+module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
+	sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
+ifneq ($(module_scmversion),)
+MODPOST += -v $(module_scmversion)
+endif
+endif
+
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
 	$(addprefix -i ,$(wildcard $(input-symdump))) \
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d6c81657d695..92c4bd88f875 100644
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
@@ -2264,6 +2266,20 @@ static void add_intree_flag(struct buffer *b, int is_intree)
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
@@ -2546,7 +2562,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:v:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2584,6 +2600,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'v':
+			strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
+			break;
 		default:
 			exit(1);
 		}
@@ -2630,6 +2649,7 @@ int main(int argc, char **argv)
 		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
 		add_srcversion(&buf, mod);
+		add_scmversion(&buf);
 
 		sprintf(fname, "%s.mod.c", mod->name);
 		write_if_changed(&buf, fname);
-- 
2.30.0.280.ga3ce27912f-goog

