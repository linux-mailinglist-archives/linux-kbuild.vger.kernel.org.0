Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3422C3611
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 02:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgKYBGh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 20:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgKYBGg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 20:06:36 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95992C0613D4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:36 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id 202so552895qkl.9
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 17:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=YbWKCne8oiSwCs+LETaaQuxj6nssPvd/ENx+h/xhUkQ=;
        b=VD95qJ50YfNhlAIzTqXB7bWZqflUREpGXlZ1v14Zqf7QbyEW+1fSYZQFDYq0wZCUPq
         rAGEUyIpaWJhNW7WYPua7SowPdY10PFtu23ICx45YcPyZN6CAChZIygSwekQjZc9hITx
         b921pHjRJc0DQeFHlQ7DmdXXkNGcQurJJ1u5b48tAydxKYJlniAmQMO26PzygE5BjMCS
         pbWDBeq5hPvR+M2TxrOohzEd4nAego3Zzt5WFie+KkF5uMivByps5K8U+lSh7SWLLLQm
         UYjfotcdqleoiDUby/Ebbetey+OkDgt8YEosMsDr6GZ2juZ0yX2jfKNEvX2tI7j5pVNB
         bu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YbWKCne8oiSwCs+LETaaQuxj6nssPvd/ENx+h/xhUkQ=;
        b=XYZImKBoUPxynh/+wbtwNer+eSVFfCl39Y9xyFMj/vYQQcrBFYcrKp2BA/nu1rDKZ0
         p4EmqXmIe8jkl7FwuHAkdpQry5rN35csYLdpXyvT7bVAFgTmxnfHOpyW7EUj3XAO8eo3
         kvR5vVmiwXGf5IJECyiYcKjsPuxOy+6Xiu8dkbLuOgAWhUnDsGeJQ6K+jpNKBfT7THrK
         MIROzgtYfkqYpRBoELeNI3RzsJo5iEpmPaf8XafuDJwjYaVWUlB2u0iJJETPX/lJQhR4
         ovuwHLsi7FgAeR6KADpH6IxihaJrFkcdqc9CMvjyotaa7E/r5pf7PSuz721BZJUJTLCg
         AzAw==
X-Gm-Message-State: AOAM532l2GLK0wLH9txAVCUkbGyxB6P05s44lprtmsnqQ7g0Dcaa5X8l
        CFFuH0HG0yYFWeExIxDuzARWxdYItgRDmjbzZ10=
X-Google-Smtp-Source: ABdhPJyiDeumgvZEcdU+MPnyD9qSO5ehrwZUtIoneyR5tx090S7hUOPBhUznUsNQpdC8NZ5a0FyxFRnByzqgPiusOKE=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a0c:9e20:: with SMTP id
 p32mr1307270qve.44.1606266395772; Tue, 24 Nov 2020 17:06:35 -0800 (PST)
Date:   Wed, 25 Nov 2020 01:05:41 +0000
In-Reply-To: <20201125010541.309848-1-willmcvicker@google.com>
Message-Id: <20201125010541.309848-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 2/2] modules: add scmversion field
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
 Documentation/ABI/stable/sysfs-module | 17 +++++++++++++++++
 include/linux/module.h                |  1 +
 kernel/module.c                       |  2 ++
 scripts/Makefile.modpost              | 20 ++++++++++++++++++++
 scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
 5 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
index 6272ae5fb366..46c99ec927ab 100644
--- a/Documentation/ABI/stable/sysfs-module
+++ b/Documentation/ABI/stable/sysfs-module
@@ -32,3 +32,20 @@ Description:
 		Note: If the module is built into the kernel, or if the
 		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
 		this file will not be present.
+
+What:		/sys/module/MODULENAME/scmversion
+Date:		November 2020
+KernelVersion:	5.10
+Contact:	Will McVicker <willmcvicker@google.com>
+Description:	This read-only file will appear if modpost was supplied with an
+		SCM version for the module. The SCM version is retrieved by
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
index a4fa44a652a7..a203dab4a03b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -807,6 +807,7 @@ static struct module_attribute modinfo_##field = {                    \
 
 MODINFO_ATTR(version);
 MODINFO_ATTR(srcversion);
+MODINFO_ATTR(scmversion);
 
 static char last_unloaded_module[MODULE_NAME_LEN+1];
 
@@ -1269,6 +1270,7 @@ static struct module_attribute *modinfo_attrs[] = {
 	&module_uevent,
 	&modinfo_version,
 	&modinfo_srcversion,
+	&modinfo_scmversion,
 	&modinfo_initstate,
 	&modinfo_coresize,
 	&modinfo_initsize,
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f54b6ac37ac2..fb4ddf2bf794 100644
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
+# KBUILD_OUTPUT) since that may not be the actual module's SCM project path. So
+# check the path relative to $(srctree) first.
+ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
+	module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
+else
+	module_srcpath := $(KBUILD_EXTMOD)
+endif
+
 # modpost option for external modules
 MODPOST += -e
 
@@ -85,6 +97,14 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
 endif
 
+# Get the SCM version of the module. Sed verifies setlocalversion returns
+# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
+module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
+	sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
+ifneq ($(module_scmversion),)
+MODPOST += -v$(module_scmversion)
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
2.29.2.454.gaff20da3a2-goog

