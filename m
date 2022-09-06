Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6E05ADF7B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Sep 2022 08:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238421AbiIFGOP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Sep 2022 02:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbiIFGOL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Sep 2022 02:14:11 -0400
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A031A6EF3A;
        Mon,  5 Sep 2022 23:14:06 -0700 (PDT)
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 2866DVIA023845;
        Tue, 6 Sep 2022 15:13:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 2866DVIA023845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1662444814;
        bh=YtAT52MFlicCIvWCgg23CLf6TdJ/zxnwdUEim0coU/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MdsU+2KO1KA+kklhVXl8R99zRa4MGfcyHFapCljT4/BtAFGUSTd0g4F0VwALj5gyV
         U+8FH+1MzwIWSbQ2ThXiPH2ZWZOqxbBgnSFVYbAg+ia1XyRcfKXDPFr9aPrjRqJj3/
         fpg+ehq6UNYqBk+15SHrWj9xWipMXEfgFZefqbOT87SDBpcNHK7EqbpJeUKuhdRzGS
         EL19N7t/Uo9FAIDuzqUwoJw7NtiQzSOwefnJcoAYu0mPzsRByLyl4fcPGdEMuWpNMU
         T17D3YnlEysEPrCgciCGnCXUg2/VhdI6PqGWJGy24V+6ZghCv0UUKqenXBPFR94l/w
         plnm2lADJP0aQ==
X-Nifty-SrcIP: [133.32.182.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 4/8] kbuild: move .vmlinux.objs rule to Makefile.modpost
Date:   Tue,  6 Sep 2022 15:13:09 +0900
Message-Id: <20220906061313.1445810-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906061313.1445810-1-masahiroy@kernel.org>
References: <20220906061313.1445810-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

.vmlinux.objs is used by modpost, so scripts/Makefile.modpost is
a better place to generate it.

It is used only when CONFIG_MODVERSIONS=y. It should be guarded
by "ifdef CONFIG_MODVERSIONS".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Makefile                 |  2 +-
 scripts/Makefile.modpost | 30 ++++++++++++++++++++++++++++--
 scripts/link-vmlinux.sh  | 18 ------------------
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index ef0621d55ebb..cf06ace9da3a 100644
--- a/Makefile
+++ b/Makefile
@@ -1485,7 +1485,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json .thinlto-cache
+	       compile_commands.json .thinlto-cache .vmlinux.objs
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 911606496341..04ad00917b2f 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -57,6 +57,32 @@ vmlinux.symvers: vmlinux.o
 
 __modpost: vmlinux.symvers
 
+# Generate the list of in-tree objects in vmlinux
+# ---------------------------------------------------------------------------
+
+# This is used to retrieve symbol versions generated by genksyms.
+ifdef CONFIG_MODVERSIONS
+vmlinux.symvers: .vmlinux.objs
+endif
+
+# Ignore libgcc.a
+# Some architectures do '$(CC) --print-libgcc-file-name' to borrow libgcc.a
+# from the toolchain, but there is no EXPORT_SYMBOL in it.
+
+quiet_cmd_vmlinux_objs = GEN     $@
+      cmd_vmlinux_objs =		\
+	for f in $(real-prereqs); do	\
+		case $${f} in		\
+		*libgcc.a) ;;		\
+		*.a) $(AR) t $${f} ;;	\
+		*) echo $${f} ;;	\
+		esac			\
+	done > $@
+
+targets += .vmlinux.objs
+.vmlinux.objs: $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS) FORCE
+	$(call if_changed,vmlinux_objs)
+
 else
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -134,6 +160,8 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
 
+endif
+
 PHONY += FORCE
 FORCE:
 
@@ -141,6 +169,4 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-endif
-
 .PHONY: $(PHONY)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 8d982574145a..161bca64e8aa 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -199,7 +199,6 @@ cleanup()
 	rm -f System.map
 	rm -f vmlinux
 	rm -f vmlinux.map
-	rm -f .vmlinux.objs
 	rm -f .vmlinux.export.c
 }
 
@@ -218,23 +217,6 @@ fi
 #link vmlinux.o
 ${MAKE} -f "${srctree}/scripts/Makefile.vmlinux_o"
 
-# Generate the list of in-tree objects in vmlinux
-#
-# This is used to retrieve symbol versions generated by genksyms.
-for f in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
-	case ${f} in
-	*libgcc.a)
-		# Some architectures do '$(CC) --print-libgcc-file-name' to
-		# borrow libgcc.a from the toolchain.
-		# There is no EXPORT_SYMBOL in external objects. Ignore this.
-		;;
-	*.a)
-		${AR} t ${f} ;;
-	*)
-		echo ${f} ;;
-	esac
-done > .vmlinux.objs
-
 # modpost vmlinux.o to check for section mismatches
 ${MAKE} -f "${srctree}/scripts/Makefile.modpost" MODPOST_VMLINUX=1
 
-- 
2.34.1

