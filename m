Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7016A34432
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfFDKQD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:16:03 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39599 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfFDKPw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:52 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7F032511;
        Tue, 4 Jun 2019 19:14:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7F032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643262;
        bh=a2r32HBmfOPNhRHR6NEw2nxMZDcJlmjbZJmpiqemrdE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QdVNDT7nNkg19+Wlfu/K+AI0Yx1lbQ5iZqx1EHQH9hhnpPYpyNa0thqDI9gC9lpOq
         dQfvsxeZM1ek9Gx2oA+FOAPwvMdu3RaM6Yrndu6jjuaaHxYFb9YOT1TzP2wpTixDkI
         j4NQHwarh3frbWvnQnze1UHuAngkxC/x5W31OxJhoMPaLiV5YUEjH/EEh/gSBFmHqQ
         gubwXc2sYP4EytQTMgQ+OtENpBNetfhNJzrYvXxyD8I0n2clhgtoym8n+U2iy18R9n
         m1nvMFbzERoKuPAeTdDKpCbAE3c+hHMJ8Ir25WfjtUq5aN4Pd48GsCTvAWueXfcUnc
         1s+tEih4LeIsQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] kbuild: re-implement Makefile.headersinst without directory descending
Date:   Tue,  4 Jun 2019 19:14:03 +0900
Message-Id: <20190604101409.2078-10-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit fcc8487d477a ("uapi: export all headers under uapi
directories"), the headers in uapi directories are all exported by
default although exceptional cases are still allowed by the syntax
'no-export-headers'.

The traditional directory descending has been still kept (in a
somewhat hacky way), but it is no longer needed.

Get rid of it to simplify the code.

Also, handle files one by one instead of the previous per-directory
processing. This will emit much more log, but I like it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                        |   8 +-
 include/uapi/{linux => }/Kbuild |   6 +-
 scripts/Makefile.headersinst    | 132 +++++++++++++-------------------
 3 files changed, 62 insertions(+), 84 deletions(-)
 rename include/uapi/{linux => }/Kbuild (77%)

diff --git a/Makefile b/Makefile
index 3c172dd516ff..608af32cc758 100644
--- a/Makefile
+++ b/Makefile
@@ -1194,13 +1194,13 @@ PHONY += headers
 headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 	$(if $(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/Kbuild),, \
 	  $(error Headers not exportable for the $(SRCARCH) architecture))
-	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi dst=include
+	$(Q)$(MAKE) $(hdr-inst)=include/uapi
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi
 
 PHONY += headers_check
 headers_check: headers
-	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include HDRCHECK=1
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi dst=include HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=include/uapi HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi HDRCHECK=1
 
 ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
diff --git a/include/uapi/linux/Kbuild b/include/uapi/Kbuild
similarity index 77%
rename from include/uapi/linux/Kbuild
rename to include/uapi/Kbuild
index 34711c5d6968..61ee6e59c930 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/Kbuild
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/a.out.h),)
-no-export-headers += a.out.h
+no-export-headers += linux/a.out.h
 endif
 
 ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/kvm.h),)
-no-export-headers += kvm.h
+no-export-headers += linux/kvm.h
 endif
 
 ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/kvm_para.h),)
 ifeq ($(wildcard $(objtree)/arch/$(SRCARCH)/include/generated/uapi/asm/kvm_para.h),)
-no-export-headers += kvm_para.h
+no-export-headers += linux/kvm_para.h
 endif
 endif
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 1af6d0b06585..c96c4c26e240 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -14,109 +14,87 @@ __headers:
 
 include scripts/Kbuild.include
 
-srcdir        := $(srctree)/$(obj)
+src := $(srctree)/$(obj)
+gen := $(objtree)/$(subst include/,include/generated/,$(obj))
+dst := usr/include
 
-# When make is run under a fakechroot environment, the function
-# $(wildcard $(srcdir)/*/.) doesn't only return directories, but also regular
-# files. So, we are using a combination of sort/dir/wildcard which works
-# with fakechroot.
-subdirs       := $(patsubst $(srcdir)/%/,%,\
-		 $(filter-out $(srcdir)/,\
-		 $(sort $(dir $(wildcard $(srcdir)/*/)))))
+-include $(src)/Kbuild
 
-# Recursion
-__headers: $(subdirs)
+src-subdirs := $(patsubst $(src)/%/,%,$(wildcard $(src)/*/))
+gen-subdirs := $(patsubst $(gen)/%/,%,$(wildcard $(gen)/*/))
+all-subdirs := $(sort $(src-subdirs) $(gen-subdirs))
 
-PHONY += $(subdirs)
-$(subdirs):
-	$(Q)$(MAKE) $(hdr-inst)=$(obj)/$@ dst=$(dst)/$@
+src-headers := $(if $(src-subdirs), $(shell cd $(src) && find $(src-subdirs) -name '*.h'))
+src-headers := $(filter-out $(no-export-headers), $(src-headers))
+gen-headers := $(if $(gen-subdirs), $(shell cd $(gen) && find $(gen-subdirs) -name '*.h'))
+gen-headers := $(filter-out $(no-export-headers), $(gen-headers))
 
-# Skip header install/check for include/uapi and arch/$(SRCARCH)/include/uapi.
-# We have only sub-directories there.
-skip-inst := $(if $(filter %/uapi,$(obj)),1)
+# If the same header is exported from source and generated directories,
+# the former takes precedence, but this should be warned.
+duplicated := $(filter $(gen-headers), $(src-headers))
+$(if $(duplicated), $(warning duplicated header export: $(duplicated)))
 
-ifeq ($(skip-inst),)
+gen-headers := $(filter-out $(duplicated), $(gen-headers))
 
-# Kbuild file is optional
-kbuild-file := $(srctree)/$(obj)/Kbuild
--include $(kbuild-file)
+# Add dst path prefix
+all-subdirs := $(addprefix $(dst)/, $(all-subdirs))
+src-headers := $(addprefix $(dst)/, $(src-headers))
+gen-headers := $(addprefix $(dst)/, $(gen-headers))
+all-headers := $(src-headers) $(gen-headers)
 
-installdir    := usr/$(dst)
-gendir        := $(objtree)/$(subst include/,include/generated/,$(obj))
-header-files  := $(notdir $(wildcard $(srcdir)/*.h))
-header-files  := $(filter-out $(no-export-headers), $(header-files))
-genhdr-files  := $(notdir $(wildcard $(gendir)/*.h))
-genhdr-files  := $(filter-out $(header-files), $(genhdr-files))
+# Work out what needs to be removed
+old-subdirs := $(wildcard $(all-subdirs))
+old-headers := $(if $(old-subdirs),$(shell find $(old-subdirs) -name '*.h'))
+unwanted    := $(filter-out $(all-headers), $(old-headers))
 
-# files used to track state of install/check
-install-file  := $(installdir)/.install
-check-file    := $(installdir)/.check
+# Create directories
+existing-dirs := $(sort $(dir $(old-headers)))
+wanted-dirs   := $(sort $(dir $(all-headers)))
+new-dirs      := $(filter-out $(existing-dirs), $(wanted-dirs))
+$(if $(new-dirs), $(shell mkdir -p $(new-dirs)))
 
-# all headers files for this dir
-all-files     := $(header-files) $(genhdr-files)
-output-files  := $(addprefix $(installdir)/, $(all-files))
+# Rules
 
-# Work out what needs to be removed
-oldheaders    := $(patsubst $(installdir)/%,%,$(wildcard $(installdir)/*.h))
-unwanted      := $(filter-out $(all-files),$(oldheaders))
+ifndef HDRCHECK
 
-# Prefix unwanted with full paths to objtree
-unwanted-file := $(addprefix $(installdir)/, $(unwanted))
+quiet_cmd_install = HDRINST $@
+      cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $(@D) $(<D) $(@F)
 
-printdir = $(patsubst %/,%,$(dir $@))
+$(src-headers): $(dst)/%.h: $(src)/%.h $(srctree)/scripts/headers_install.sh FORCE
+	$(call if_changed,install)
 
-quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
-                            file$(if $(word 2, $(all-files)),s))
-      cmd_install = \
-        $(CONFIG_SHELL) $< $(installdir) $(srcdir) $(header-files); \
-        $(CONFIG_SHELL) $< $(installdir) $(gendir) $(genhdr-files); \
-        touch $@
+$(gen-headers): $(dst)/%.h: $(gen)/%.h $(srctree)/scripts/headers_install.sh FORCE
+	$(call if_changed,install)
 
 quiet_cmd_remove = REMOVE  $(unwanted)
-      cmd_remove = rm -f $(unwanted-file)
-
-quiet_cmd_check = CHECK   $(printdir) ($(words $(all-files)) files)
-# Headers list can be pretty long, xargs helps to avoid
-# the "Argument list too long" error.
-      cmd_check = for f in $(all-files); do                          \
-                  echo "$(installdir)/$${f}"; done                      \
-                  | xargs                                            \
-                  $(PERL) $< usr/include $(SRCARCH); \
-	          touch $@
+      cmd_remove = rm -f $(unwanted)
 
-ifndef HDRCHECK
-# Rules for installing headers
-__headers: $(install-file)
+__headers: $(all-headers)
+ifneq ($(unwanted),)
+	$(call cmd,remove)
+endif
 	@:
 
-targets += $(install-file)
-$(install-file): scripts/headers_install.sh \
-		 $(addprefix $(srcdir)/,$(header-files)) \
-		 $(addprefix $(gendir)/,$(genhdr-files)) FORCE
-	$(if $(unwanted),$(call cmd,remove),)
-	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
-	$(call if_changed,install)
+existing-headers := $(filter $(old-headers), $(all-headers))
+
+-include $(foreach f,$(existing-headers),$(dir $(f)).$(notdir $(f)).cmd)
 
 else
-__headers: $(check-file)
-	@:
 
-targets += $(check-file)
-$(check-file): scripts/headers_check.pl $(output-files) FORCE
-	$(call if_changed,check)
+quiet_cmd_check = HDRCHK  $<
+      cmd_check = $(PERL) $(srctree)/scripts/headers_check.pl $(dst) $(SRCARCH) $<; touch $@
 
-endif
+check-files := $(addsuffix .chk, $(all-headers))
 
-cmd_files := $(wildcard \
-             $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
+$(check-files): $(dst)/%.chk : $(dst)/% $(srctree)/scripts/headers_check.pl
+	$(call cmd,check)
 
-ifneq ($(cmd_files),)
-	include $(cmd_files)
-endif
+__headers: $(check-files)
+	@:
 
-endif # skip-inst
+endif
 
 PHONY += FORCE
-FORCE: ;
+FORCE:
 
 .PHONY: $(PHONY)
-- 
2.17.1

