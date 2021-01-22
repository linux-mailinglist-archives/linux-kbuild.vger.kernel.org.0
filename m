Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2093000E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 11:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbhAVKzS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 05:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbhAVKvw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 05:51:52 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4DBC061797
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 02:51:12 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id i5so3464682pgo.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEpV/4+pPDDR7a+hsqu9AsNuEUO5TQBQt3UbF56LflA=;
        b=sWrdcTSnHVrF0YS3uSKW5LnuC2iM1fGJiNkwUttGPC/iUUJAzwXFSK30L021dMW0Ln
         rqMIezwKbS6JOB/M9tubz10ho2rkxROjRNE389vJj7O2PCiOuSUA1DfkFlVdxDUnuDDP
         G8tsiGJbg5juhzroZNh6fpkWwhfd/lOG4ehUPP7aAJM0ufxw5Ky0X2xbB/HX/RTff2eU
         JUoBv9vWOSLFymqxrikuOCC9GmXh2z3znGreXaq1vNF7vhr+/VsLZuyKd3IF1/Oa2vyD
         iLWST9xr/2ayhnAOwpBih07yAuZNz+q3/fGEJDHKYL4MXNUvRS0MLaPXx2//t9HEexvl
         lzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEpV/4+pPDDR7a+hsqu9AsNuEUO5TQBQt3UbF56LflA=;
        b=T42gNXwwj4Lp5pK8/8oV4tbKnJ837RCbrzjfM+3ths0brbTrW8z7/lXZngQsbJxXSW
         /JKOXyrkA7B1Raj5OWlrHMMbYNIWuVPT+vjSOZSwrKH5UiYCurO1AFZIQAJvpQfxwDN8
         fHAK2Xsbp1Llmn4WwyCSdor65ElTB1pwcZY9f/+IIDZvRwW3VnEc2oq5X3ZpMY9SkpjD
         g2bwgvOlEHJRbncSmlF2tq20OvlCR3bwbRU7+I0w05l+4VA/T5UUUyUyEPbHbapZTOlF
         4mcdVKu1F0NYVm5Y9xOnvMbd8WoBJuyq1MhcZzCgyTjpask8aS8XCTt+v7WlB1Hwr2Qo
         U9dw==
X-Gm-Message-State: AOAM531iClRAny2Ymd6BBI/Ze7dOtgGY7CIdzuYkj5IBH+A5JmeM0Yzl
        sxGe5lXpttnBH/SiG3qNPqCp7g==
X-Google-Smtp-Source: ABdhPJxIgYBXVQv1WUsomXtMNGRJBanjSFT8GUNJpf2Ib/v8DpdL5NJQyMnDp4kZB9yhrWCPO3o0Bg==
X-Received: by 2002:a63:405:: with SMTP id 5mr4182014pge.44.1611312671691;
        Fri, 22 Jan 2021 02:51:11 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id m27sm8210751pgn.62.2021.01.22.02.51.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2021 02:51:11 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, anmar.oueja@linaro.org,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH V6 4/6] kbuild: Add support to build overlays (%.dtbo)
Date:   Fri, 22 Jan 2021 16:20:34 +0530
Message-Id: <43d693de2034dd30bb7d4576ffb52207ca220079.1611312122.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1611312122.git.viresh.kumar@linaro.org>
References: <cover.1611312122.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add support for building DT overlays (%.dtbo). The overlay's source file
will have the usual extension, i.e. .dts, though the blob will have
.dtbo extension to distinguish it from normal blobs.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore               | 1 +
 Makefile                 | 5 ++++-
 scripts/Makefile.dtbinst | 3 +++
 scripts/Makefile.lib     | 5 +++++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..bb65fa253e58 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,6 +18,7 @@
 *.c.[012]*.*
 *.dt.yaml
 *.dtb
+*.dtbo
 *.dtb.S
 *.dwo
 *.elf
diff --git a/Makefile b/Makefile
index 9e73f82e0d86..18fd02f55d9b 100644
--- a/Makefile
+++ b/Makefile
@@ -1337,6 +1337,9 @@ ifneq ($(dtstree),)
 %.dtb: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
+%.dtbo: include/config/kernel.release scripts_dtc
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+
 PHONY += dtbs dtbs_install dtbs_check
 dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
@@ -1816,7 +1819,7 @@ clean: $(clean-dirs)
 	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' \
-		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
+		-o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su' -o -name '*.mod' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 50d580d77ae9..ba01f5ba2517 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -29,6 +29,9 @@ quiet_cmd_dtb_install = INSTALL $@
 $(dst)/%.dtb: $(obj)/%.dtb
 	$(call cmd,dtb_install)
 
+$(dst)/%.dtbo: $(obj)/%.dtbo
+	$(call cmd,dtb_install)
+
 PHONY += $(subdirs)
 $(subdirs):
 	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33..b00855b247e0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -86,7 +86,9 @@ extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
 extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
 extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
 endif
 
 # Add subdir path
@@ -327,6 +329,9 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
+$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+	$(call if_changed_dep,dtc)
+
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
-- 
2.25.0.rc1.19.g042ed3e048af

