Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2202D14C4
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Dec 2020 16:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgLGPcC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Dec 2020 10:32:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:35888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgLGPcC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Dec 2020 10:32:02 -0500
Date:   Mon, 7 Dec 2020 16:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607355081;
        bh=OXnNnJ0q6ty6Utz9nMuW9TnknNPpIiZNrA5tOyxMzUM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=X5OAItxXM1VAEML4Bxi7W/ORvlzMaQSPgfAVQrIxb6TQeE6RRPjbxD/ty/fKJOOXK
         TGI8rv7nPQ18Pce7jLxRtqn170xiod3jCGdO1MuU9FyXov+HIBotk/m5lp+xfd9hkP
         0Ifp+GrcdukxqsUt9Wdz4z+iEb6/nYreHhw5DhxeZK508WaLnvUHwS9+MLn5Lb+IeK
         y/pBtTGMFyvF15jSEtsvgivjo+or27c8tkwCt0Vjc64w1jlPxIru833yZBgGam5Wkt
         HMdW8QNMXyOMfGVTyJerlpsROBUgLC45Gn3WBv4I3qm8UUTqzr3Su8uC+xO8MJYUAw
         E6zyEV+PGTp5A==
From:   Jessica Yu <jeyu@kernel.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 2/2] modules: add scmversion field
Message-ID: <20201207153116.GA15772@linux-8ccs>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
 <20201125010541.309848-3-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201125010541.309848-3-willmcvicker@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Will McVicker [25/11/20 01:05 +0000]:
>Add the modinfo field `scmversion` to include the SCM version of kernel
>modules, e.g. git sha1. This allows one to identify the exact source
>code version of a given kernel module.
>
>You can retrieve it in two ways,
>
>1) By using modinfo
>    > modinfo -F scmversion <module_name>
>2) By module sysfs node
>    > cat /sys/module/<module_name>/scmversion
>
>Signed-off-by: Will McVicker <willmcvicker@google.com>

Hi Will, sorry for the delay.

First, what will help is to include a justification and a detailed
explanation of an example use-case (for in-tree modules) in the
changelog/commit message, which is scattered over thread replies but
seems to be omitted here. For example, your explanation here [1] was
pretty helpful and should be included in the changelog. Please
describe in the commit message how this new sysfs entry will be used
and why it is helpful to have this information available for in-tree
modules.

Second, this feature seems to be a debugging aid for distro
developers analogous to (or an alternative to) CONFIG_MODULE_SRCVERSION_ALL.
As opposed to including it by default (implicitly depending on
localversion config options), perhaps this feature should be
packaged in a config option i.e. CONFIG_MODULE_SCMVERSION with a
depends on CONFIG_LOCALVERSION_AUTO. That way the dependency is
explicitly specified and the option could be enabled for distros that
want this.

[1] https://lore.kernel.org/lkml/20201123221338.GA2726675@google.com/

Thanks,

Jessica
>---
> Documentation/ABI/stable/sysfs-module | 17 +++++++++++++++++
> include/linux/module.h                |  1 +
> kernel/module.c                       |  2 ++
> scripts/Makefile.modpost              | 20 ++++++++++++++++++++
> scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
> 5 files changed, 63 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
>index 6272ae5fb366..46c99ec927ab 100644
>--- a/Documentation/ABI/stable/sysfs-module
>+++ b/Documentation/ABI/stable/sysfs-module
>@@ -32,3 +32,20 @@ Description:
> 		Note: If the module is built into the kernel, or if the
> 		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
> 		this file will not be present.
>+
>+What:		/sys/module/MODULENAME/scmversion
>+Date:		November 2020
>+KernelVersion:	5.10
>+Contact:	Will McVicker <willmcvicker@google.com>
>+Description:	This read-only file will appear if modpost was supplied with an
>+		SCM version for the module. The SCM version is retrieved by
>+		scripts/setlocalversion, which means that the presence of this
>+		file depends on CONFIG_LOCALVERSION_AUTO=y or LOCALVERSION=.
>+		When read, the SCM version that the module was compiled with is
>+		returned. The SCM version is returned in the following format::
>+
>+		===
>+		Git:		g[a-f0-9]\+(-dirty)\?
>+		Mercurial:	hg[a-f0-9]\+(-dirty)\?
>+		Subversion:	svn[0-9]\+
>+		===
>diff --git a/include/linux/module.h b/include/linux/module.h
>index 6264617bab4d..63137ca5147b 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -372,6 +372,7 @@ struct module {
> 	struct module_attribute *modinfo_attrs;
> 	const char *version;
> 	const char *srcversion;
>+	const char *scmversion;
> 	struct kobject *holders_dir;
>
> 	/* Exported symbols */
>diff --git a/kernel/module.c b/kernel/module.c
>index a4fa44a652a7..a203dab4a03b 100644
>--- a/kernel/module.c
>+++ b/kernel/module.c
>@@ -807,6 +807,7 @@ static struct module_attribute modinfo_##field = {                    \
>
> MODINFO_ATTR(version);
> MODINFO_ATTR(srcversion);
>+MODINFO_ATTR(scmversion);
>
> static char last_unloaded_module[MODULE_NAME_LEN+1];
>
>@@ -1269,6 +1270,7 @@ static struct module_attribute *modinfo_attrs[] = {
> 	&module_uevent,
> 	&modinfo_version,
> 	&modinfo_srcversion,
>+	&modinfo_scmversion,
> 	&modinfo_initstate,
> 	&modinfo_coresize,
> 	&modinfo_initsize,
>diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>index f54b6ac37ac2..fb4ddf2bf794 100644
>--- a/scripts/Makefile.modpost
>+++ b/scripts/Makefile.modpost
>@@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
>
> input-symdump := vmlinux.symvers
> output-symdump := Module.symvers
>+module_srcpath := $(srctree)
>
> else
>
>@@ -77,6 +78,17 @@ src := $(obj)
> include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>
>+# Get the external module's source path. KBUILD_EXTMOD could either be an
>+# absolute path or relative path from $(srctree). This makes sure that we
>+# aren't using a relative path from a separate working directory (O= or
>+# KBUILD_OUTPUT) since that may not be the actual module's SCM project path. So
>+# check the path relative to $(srctree) first.
>+ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
>+	module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
>+else
>+	module_srcpath := $(KBUILD_EXTMOD)
>+endif
>+
> # modpost option for external modules
> MODPOST += -e
>
>@@ -85,6 +97,14 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
>
> endif
>
>+# Get the SCM version of the module. Sed verifies setlocalversion returns
>+# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
>+module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
>+	sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
>+ifneq ($(module_scmversion),)
>+MODPOST += -v$(module_scmversion)
>+endif
>+
> # modpost options for modules (both in-kernel and external)
> MODPOST += \
> 	$(addprefix -i ,$(wildcard $(input-symdump))) \
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index f882ce0d9327..db71e0c9ab20 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -30,6 +30,8 @@ static int have_vmlinux = 0;
> static int all_versions = 0;
> /* If we are modposting external module set to 1 */
> static int external_module = 0;
>+#define MODULE_SCMVERSION_SIZE 64
>+static char module_scmversion[MODULE_SCMVERSION_SIZE];
> /* Only warn about unresolved symbols */
> static int warn_unresolved = 0;
> /* How a symbol is exported */
>@@ -2272,6 +2274,20 @@ static void add_intree_flag(struct buffer *b, int is_intree)
> 		buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
> }
>
>+/**
>+ * add_scmversion() - Adds the MODULE_INFO macro for the scmversion.
>+ * @b: Buffer to append to.
>+ *
>+ * This function fills in the module attribute `scmversion` for the kernel
>+ * module. This is useful for determining a given module's SCM version on
>+ * device via /sys/modules/<module>/scmversion and/or using the modinfo tool.
>+ */
>+static void add_scmversion(struct buffer *b)
>+{
>+	if (module_scmversion[0] != '\0')
>+		buf_printf(b, "\nMODULE_INFO(scmversion, \"%s\");\n", module_scmversion);
>+}
>+
> /* Cannot check for assembler */
> static void add_retpoline(struct buffer *b)
> {
>@@ -2559,7 +2575,7 @@ int main(int argc, char **argv)
> 	struct dump_list *dump_read_start = NULL;
> 	struct dump_list **dump_read_iter = &dump_read_start;
>
>-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
>+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:v:")) != -1) {
> 		switch (opt) {
> 		case 'e':
> 			external_module = 1;
>@@ -2597,6 +2613,11 @@ int main(int argc, char **argv)
> 		case 'd':
> 			missing_namespace_deps = optarg;
> 			break;
>+		case 'v':
>+			if (!optarg)
>+				fatal("'-v' requires an argument defining the SCM version.");
>+			strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
>+			break;
> 		default:
> 			exit(1);
> 		}
>@@ -2645,6 +2666,7 @@ int main(int argc, char **argv)
> 		add_depends(&buf, mod);
> 		add_moddevtable(&buf, mod);
> 		add_srcversion(&buf, mod);
>+		add_scmversion(&buf);
>
> 		sprintf(fname, "%s.mod.c", mod->name);
> 		write_if_changed(&buf, fname);
>-- 
>2.29.2.454.gaff20da3a2-goog
>
