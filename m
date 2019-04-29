Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3398FDEAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2019 11:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfD2JJD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Apr 2019 05:09:03 -0400
Received: from monster.unsafe.ru ([5.9.28.80]:44644 "EHLO mail.unsafe.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfD2JJD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 05:09:03 -0400
Received: from dhcp129-178.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.unsafe.ru (Postfix) with ESMTPSA id BE8F6C61A88;
        Mon, 29 Apr 2019 09:08:57 +0000 (UTC)
Date:   Mon, 29 Apr 2019 11:08:54 +0200
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-api@vger.kernel.org, linux-modules@vger.kernel.org,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [PATCH v3] moduleparam: Save information about built-in modules in
 separate file
Message-ID: <20190429090854.GU9023@dhcp129-178.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Problem:

When a kernel module is compiled as a separate module, some important
information about the kernel module is available via .modinfo section of
the module.  In contrast, when the kernel module is compiled into the
kernel, that information is not available.

Information about built-in modules is necessary in the following cases:

1. When it is necessary to find out what additional parameters can be
passed to the kernel at boot time.

2. When you need to know which module names and their aliases are in
the kernel. This is very useful for creating an initrd image.

Proposal:

The proposed patch does not remove .modinfo section with module
information from the vmlinux at the build time and saves it into a
separate file after kernel linking. So, the kernel does not increase in
size and no additional information remains in it. Information is stored
in the same format as in the separate modules (null-terminated string
array). Because the .modinfo section is already exported with a separate
modules, we are not creating a new API.

It can be easily read in the userspace:

$ tr '\0' '\n' < kernel.builtin
ext4.softdep=pre: crc32c
ext4.license=GPL
ext4.description=Fourth Extended Filesystem
ext4.author=Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others
ext4.alias=fs-ext4
ext4.alias=ext3
ext4.alias=fs-ext3
ext4.alias=ext2
ext4.alias=fs-ext2
md_mod.alias=block-major-9-*
md_mod.alias=md
md_mod.description=MD RAID framework
md_mod.license=GPL
md_mod.parmtype=create_on_open:bool
md_mod.parmtype=start_dirty_degraded:int
...

v2:
 * Extract modinfo from vmlinux.o as suggested by Masahiro Yamada;
 * Rename output file to kernel.builtin;
 * Add MODULE_VERSION to modinfo that is saved to the kernel.builtin;
 * Fix build warnings on powerpc.

v3:
 * Rename output file to modules.builtin.modinfo as suggested by Masahiro Yamada;
 * Update Documentation/dontdiff, Documentation/kbuild/kbuild.txt.

Co-Developed-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Signed-off-by: Alexey Gladkov <gladkov.alexey@gmail.com>
---
 .gitignore                        |  1 +
 Documentation/dontdiff            |  1 +
 Documentation/kbuild/kbuild.txt   |  5 +++++
 Makefile                          |  2 ++
 include/asm-generic/vmlinux.lds.h |  1 +
 include/linux/module.h            |  1 +
 include/linux/moduleparam.h       | 12 +++++-------
 scripts/link-vmlinux.sh           |  4 ++++
 8 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/.gitignore b/.gitignore
index a20ac26aa2f5..8ef2c87703b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -45,6 +45,7 @@
 *.xz
 Module.symvers
 modules.builtin
+modules.builtin.modinfo
 
 #
 # Top-level generic files
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 2228fcc8e29f..3d4d5a402b8b 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -179,6 +179,7 @@ mktables
 mktree
 modpost
 modules.builtin
+modules.builtin.modinfo
 modules.order
 modversions.h*
 nconf
diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index c9e3d93e7a89..63e118c8c837 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -11,6 +11,11 @@ modules.builtin
 This file lists all modules that are built into the kernel. This is used
 by modprobe to not fail when trying to load something builtin.
 
+modules.builtin.modinfo
+--------------------------------------------------
+This file contains modinfo from all modules that are built into the kernel.
+Unlike modinfo of a separate module, all fields are prefixed with module name.
+
 
 Environment variables
 
diff --git a/Makefile b/Makefile
index d5713e7b1e50..5e6657fcf08c 100644
--- a/Makefile
+++ b/Makefile
@@ -1288,6 +1288,7 @@ _modinst_:
 	fi
 	@cp -f $(objtree)/modules.order $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin $(MODLIB)/
+	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 # This depmod is only for convenience to give the initial
@@ -1328,6 +1329,7 @@ endif # CONFIG_MODULES
 
 # Directories & files removed with 'make clean'
 CLEAN_DIRS  += $(MODVERDIR) include/ksym
+CLEAN_FILES += modules.builtin.modinfo
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config usr/include include/generated          \
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3d7a6a9c2370..44c724bf7d3a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -844,6 +844,7 @@
 	EXIT_CALL							\
 	*(.discard)							\
 	*(.discard.*)							\
+	*(.modinfo)							\
 	}
 
 /**
diff --git a/include/linux/module.h b/include/linux/module.h
index f5bc4c046461..1cae28b1172a 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -237,6 +237,7 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
 #define MODULE_VERSION(_version) MODULE_INFO(version, _version)
 #else
 #define MODULE_VERSION(_version)					\
+	MODULE_INFO(version, _version);					\
 	static struct module_version_attribute ___modver_attr = {	\
 		.mattr	= {						\
 			.attr	= {					\
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index ba36506db4fb..5ba250d9172a 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -10,23 +10,21 @@
    module name. */
 #ifdef MODULE
 #define MODULE_PARAM_PREFIX /* empty */
+#define __MODULE_INFO_PREFIX /* empty */
 #else
 #define MODULE_PARAM_PREFIX KBUILD_MODNAME "."
+/* We cannot use MODULE_PARAM_PREFIX because some modules override it. */
+#define __MODULE_INFO_PREFIX KBUILD_MODNAME "."
 #endif
 
 /* Chosen so that structs with an unsigned long line up. */
 #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
 
-#ifdef MODULE
 #define __MODULE_INFO(tag, name, info)					  \
 static const char __UNIQUE_ID(name)[]					  \
   __used __attribute__((section(".modinfo"), unused, aligned(1)))	  \
-  = __stringify(tag) "=" info
-#else  /* !MODULE */
-/* This struct is here for syntactic coherency, it is not used */
-#define __MODULE_INFO(tag, name, info)					  \
-  struct __UNIQUE_ID(name) {}
-#endif
+  = __MODULE_INFO_PREFIX __stringify(tag) "=" info
+
 #define __MODULE_PARM_TYPE(name, _type)					  \
   __MODULE_INFO(parmtype, name##type, #name ":" _type)
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c8cf45362bd6..41ef7cb043c1 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -226,6 +226,10 @@ modpost_link vmlinux.o
 # modpost vmlinux.o to check for section mismatches
 ${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
 
+info MODINFO modules.builtin.modinfo
+"${OBJCOPY}" -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
+chmod 444 modules.builtin.modinfo
+
 kallsymso=""
 kallsyms_vmlinux=""
 if [ -n "${CONFIG_KALLSYMS}" ]; then
-- 
2.21.0

