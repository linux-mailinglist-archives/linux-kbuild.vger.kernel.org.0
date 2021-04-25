Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D1436A512
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 08:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhDYGZY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 02:25:24 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:20919 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhDYGZY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 02:25:24 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13P6OBfM031298;
        Sun, 25 Apr 2021 15:24:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13P6OBfM031298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619331855;
        bh=/O20R/iU0g1jzgc/IGeu4SUnv5vDMesuCm/+pl5398s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PqdyjgfwOE+3wVi8ZeKywMjOJuF+GbtdqRp4Y1BTtKCRAu4+VIlrwdIsDunlazsdX
         8NfTbS9c4VnQbMX9tQcYohoK349WWrv3ADlpIabl6PPiX8YTtYCpQC84Lx3LpxrYdl
         7TsyrWT57P3uY7xqmVJhM2NlMMvaIAU09xr5KVcN9HNJZbeLSQIoml/bkYlszhXz2j
         vo0Q0jKcK5WJXqZFr4B8dbetTVebCFNdmXMhDZeoZztquietvm56Wn/1OAJ+2ejGvN
         MOVNpBQb7McirjkrdwMr9mEfnlKkNEjU4HjAGT3vYPOXQbWRdWtF8/Yg4hSgaUOjhs
         M18Qsyzz3W+Lw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] kbuild: update config_data.gz only when the content of .config is changed
Date:   Sun, 25 Apr 2021 15:24:07 +0900
Message-Id: <20210425062407.1183801-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210425062407.1183801-1-masahiroy@kernel.org>
References: <20210425062407.1183801-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the timestamp of the .config file is updated, config_data.gz is
regenerated, then vmlinux is re-linked. This occurs even if the content
of the .config has actually not changed.

This issue was mitigated by commit 67424f61f813 ("kconfig: do not write
.config if the content is the same"); Kconfig does not update the
.config when it ends up with the identical configuration.

The issue is remaining when the .config is created by *_defconfig with
some config fragment(s) applied on top.

This is typical for powerpc and mips, where several *_defconfig targets
are constructed by (ab)using merge_config.sh.

One workaround is to have the copy of the .config. The filechk rule
updates the copy, kernel/config_data, by checking the content instead
of the timestamp.

With this commit, the second run with the same configuration avoids
the needless rebuilds.

  $ make ARCH=mips defconfig all
   [ snip ]
  $ make ARCH=mips defconfig all
  *** Default configuration is based on target '32r2el_defconfig'
  Using ./arch/mips/configs/generic_defconfig as base
  Merging arch/mips/configs/generic/32r2.config
  Merging arch/mips/configs/generic/el.config
  Merging ./arch/mips/configs/generic/board-boston.config
  Merging ./arch/mips/configs/generic/board-ni169445.config
  Merging ./arch/mips/configs/generic/board-ocelot.config
  Merging ./arch/mips/configs/generic/board-ranchu.config
  Merging ./arch/mips/configs/generic/board-sead-3.config
  Merging ./arch/mips/configs/generic/board-xilfpga.config
  #
  # configuration written to .config
  #
    SYNC    include/config/auto.conf
    CALL    scripts/checksyscalls.sh
    CALL    scripts/atomic/check-atomics.sh
    CHK     include/generated/compile.h
    CHK     include/generated/autoksyms.h

Reported-by: Elliot Berman <eberman@codeaurora.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/.gitignore | 1 +
 kernel/Makefile   | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/.gitignore b/kernel/.gitignore
index 4dc1ffe9770b..c6b299a6b786 100644
--- a/kernel/.gitignore
+++ b/kernel/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+/config_data
 /kheaders.md5
diff --git a/kernel/Makefile b/kernel/Makefile
index 320f1f3941b7..605ec3e70cb7 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -138,10 +138,15 @@ obj-$(CONFIG_SCF_TORTURE_TEST) += scftorture.o
 
 $(obj)/configs.o: $(obj)/config_data.gz
 
-targets += config_data.gz
-$(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
+targets += config_data config_data.gz
+$(obj)/config_data.gz: $(obj)/config_data FORCE
 	$(call if_changed,gzip)
 
+filechk_cat = cat $<
+
+$(obj)/config_data: $(KCONFIG_CONFIG) FORCE
+	$(call filechk,cat)
+
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-- 
2.27.0

