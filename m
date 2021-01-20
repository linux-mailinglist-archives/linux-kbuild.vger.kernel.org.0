Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEBA2FCB4F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 08:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbhATHJU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 02:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbhATHJI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 02:09:08 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CF4C061796
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 23:07:52 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id md11so1600157pjb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iL/6d9CA7Mlv7x2jkzmEch3eouj1dsWSO4tRpX3owdI=;
        b=u1UT6UUP4J+geMR4J7VLUSlL515tanP+PW1crkyEINjzX5/U3FJzPMKlUMsTMjThHO
         yWZk+i6yCayN7NPcNHMu4P0+cwmsyZFtLwDowjkd5ithO7yx+Eu6CbG2p2piMVrS5nzm
         3JCzF9hhmZjRGnO06w0MtjKB4YIu2+P6Am73hcYmfAOsNkLgOPPFOMv47v09X2w+HH0X
         An2R6fdSe05RuPnYI1xYwUjhpKqdBfkm0zFWONQU3bnmcdKOqmPgRgHkCnaZm2p1ewoy
         ADIm3Io4b5TI+2Mx7eqjZlFU8AZ1PZcr1eJd6NOIGn7xMgBY+3zV4O6zSN9OV0xcIGLV
         NpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iL/6d9CA7Mlv7x2jkzmEch3eouj1dsWSO4tRpX3owdI=;
        b=KZkDz2il8rkjsN09LPugeKaU90CYXOPqjMpMe4Y/MnoZ5qZL0Kut/ptalD+L9QRNcm
         ruapM/C9J7K0rFL9TPKE9qJ5kUOTok1P8G/boQQFJQ6JaFxzYFladPFTkTaaOMU3PJia
         49pM1JRGNU1CisIVkOFDnIjpAxKswIGmZnZm1+ovlseVn31yTzwm7u7cgdBwsRedgcdD
         nNQ8Cw3blZUtugmrw2yR6UJeIdi0r3Xwa9y6qHtXzFlgM4a5d222l2V0Gp998zR5thp/
         q84iXN0MNHwMUYZxIxijNz5sw8cQ9CTrCLnnd9UOsCiWJU/6Mu4Lu/9JuVOsLl6kQd2S
         3EdQ==
X-Gm-Message-State: AOAM533hsG2fV/aY4eBcT6oK8C30/LAF4WjDqvjazQ+iQBsD/NCUIbgW
        zr86dGW9pyAC7MtolmCLIjgS16CwplEyVg==
X-Google-Smtp-Source: ABdhPJy+3lpLxbrRKz1M9N2KZ4cKeva786QVSry+7IVAZRrw6ArVYYp/WuinIyQvIgc2cZholgIb7A==
X-Received: by 2002:a17:90a:9918:: with SMTP id b24mr4135202pjp.108.1611126472151;
        Tue, 19 Jan 2021 23:07:52 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id u12sm1098882pgi.91.2021.01.19.23.07.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 23:07:51 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
Date:   Wed, 20 Jan 2021 12:36:46 +0530
Message-Id: <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1611124778.git.viresh.kumar@linaro.org>
References: <cover.1611124778.git.viresh.kumar@linaro.org>
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
 .gitignore               | 3 +--
 Makefile                 | 4 ++--
 scripts/Makefile.dtbinst | 3 +++
 scripts/Makefile.lib     | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..0458c36f3cb2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,8 +17,7 @@
 *.bz2
 *.c.[012]*.*
 *.dt.yaml
-*.dtb
-*.dtb.S
+*.dtb*
 *.dwo
 *.elf
 *.gcno
diff --git a/Makefile b/Makefile
index 9e73f82e0d86..b84f5e0b46ab 100644
--- a/Makefile
+++ b/Makefile
@@ -1334,7 +1334,7 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
+%.dtb %.dtbo: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dtbs_check
@@ -1816,7 +1816,7 @@ clean: $(clean-dirs)
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
index 213677a5ed33..30bc0a8e0087 100644
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
@@ -324,7 +326,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
-$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
+$(obj)/%.dtb $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
-- 
2.25.0.rc1.19.g042ed3e048af

