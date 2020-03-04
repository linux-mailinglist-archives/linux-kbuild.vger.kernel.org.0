Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C40178914
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 04:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbgCDDVZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 22:21:25 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:64195 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgCDDVZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 22:21:25 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0243Kef6018747;
        Wed, 4 Mar 2020 12:20:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0243Kef6018747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583292045;
        bh=v2vJfpnqozXNkEifp79FluQTimJVampIAlakCpTKI9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nKKD3muBJ0m/YtVBc8JE/Aa5V22EojkwDntV6b7YPhjlSrnAfwn7kf5+Dnz6XgstE
         zoCnF0F0WglpiFMNLmDan8WZbUAjY4qqrp1oQx1YTRxArHcoFdMyPIytG3DROCfJQ1
         TjboNnqww42k7q5gwnpA/5H9h+r86AwbiQ+VKXAO4nIj65miHrEKwMSZAbWYTSkB/w
         qsZ/H6c3ckDabFevv5dN8DmYVk7UquO16Oc/6ZtJK5A57gx3K8Rfi0Oq63GHy4R4WU
         MsrupfHEyH5E1k8Xwp5BuKeP/cLirWfT07iaooAZoGT+Tqj5mIYFJ3AK69OqXtVLcf
         8fAAxrt8UXvBA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/3] kbuild: allow to run dt_binding_check without kernel configuration
Date:   Wed,  4 Mar 2020 12:20:38 +0900
Message-Id: <20200304032038.14424-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304032038.14424-1-masahiroy@kernel.org>
References: <20200304032038.14424-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The dt_binding_check target is located outside of the
'ifneq ($(dtstree),) ... endif' block.

Hence, you can run 'make dt_binding_check' on any architecture.
This makes a perfect sense because the dt-schema is arch-agnostic.

The only one problem I see is that scripts/dtc/dtc is not always built.
For example, ARCH=x86 defconfig does not define CONFIG_DTC. Kbuild
descends into scripts/dtc/, but does nothing. Then, it fails to build
*.example.dt.yaml files.

Let's build scripts/dtc/dtc forcibly when running dt_binding_check.

The dt-schema does not depend on any CONFIG option either, so you
should be able to run dt_binding_check without the .config file.

Going forward, you can directly run 'make dt_binding_check' in a
pristine source tree.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile             | 2 +-
 scripts/dtc/Makefile | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 7dec7b343842..190f595c7bfc 100644
--- a/Makefile
+++ b/Makefile
@@ -255,7 +255,7 @@ clean-targets := %clean mrproper cleandocs
 no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
-			 %asm-generic kernelversion %src-pkg
+			 %asm-generic kernelversion %src-pkg dt_binding_check
 no-sync-config-targets := $(no-dot-config-targets) install %install \
 			   kernelrelease
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 3acbb410904c..2f3c3a7e1620 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs		:= dtc
-always-$(CONFIG_DTC)	:= $(hostprogs)
+hostprogs			:= dtc
+always-$(CONFIG_DTC)		+= $(hostprogs)
+always-$(CHECK_DT_BINDING)	+= $(hostprogs)
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
-- 
2.17.1

