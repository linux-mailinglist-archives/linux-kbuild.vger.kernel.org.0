Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0434A2EA9CA
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 12:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbhAELZT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Jan 2021 06:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbhAELZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jan 2021 06:25:14 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685BBC061795
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Jan 2021 03:24:34 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id a188so5527068pfa.11
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Jan 2021 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+ltXAUjJoz14b04u4WjYIwfhaMvBRudeWXKWbcBneE=;
        b=p6O4ofi1uYIO+ua5FiO+ty++Q3FvaqIC+dYof2D5w1bew03YrS1JPn/3lhZl8TmJm5
         B6uEWgVf18P1VhBvXtgQyWi/2yjfGq4Ag8gFvTLTuB5ooCyPd4hb23E6NhvrHvRzx5Xn
         meiXcEYeZqa9cbYkS07A4RsOlLWe1iEu6ohae6jTj9B38DEoM/OqgnZJEVGBwxjxgZni
         ApeKb8Kf1r8ytldxm/ieId3qyOCeikTnhJwtNZfmQ13VmhpjwBP4tTOEiQAturMDUzJG
         ZbJp8J4wsdmMBW/iqVAdOOK1ZoFp7q4Rse59Psnr981L7DakvNK6ozhMRHd1DW8W2fRP
         NfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+ltXAUjJoz14b04u4WjYIwfhaMvBRudeWXKWbcBneE=;
        b=Kdj2A+a23ohmZXUlmGrH3P2355ahQe0NjxHf2m9NcLby61iwRccSLLfHEbyM1nIV4a
         k28cmBE9XUB8GJLFfUmMUaElmX1Yr4umks6HpjMa40bCfqQns8+t5kc2SXflrX+C/Lx4
         2Ngz8WlkRs0wmzjnL8/nLhF+rq3CAjOrFUjoYoEXprklyg6e8azwmV1wRnJ/ds0mO5FJ
         7nr3j7mTjmXKrsPPP5WHPMR9gkCYtN4+1gh3sxtbQ6hzIIJFqdCNdYr8Bhzg/1c7jE2r
         WBF6cgciHgOGPDeMU9b+RdleQAVUOum2Y5sdGMEhe6NHLj6a0HVbJoC53GpyitxF2bem
         qerA==
X-Gm-Message-State: AOAM531fwgaD8FmoTu//vSynAvPJrgRBgkmc2taIg9+Y2nIWQL3iG9cB
        /aJ4TADbwpZQKwBuGR8RegvVRFZIVhev2w==
X-Google-Smtp-Source: ABdhPJyP0+fnCNVWjX9rMocIDdoOBf7iok8wHhTh8Pg2QQWh21tcUx8v3uh7bvzMRMswZs8tdUIXJg==
X-Received: by 2002:aa7:8647:0:b029:1ad:c67c:3796 with SMTP id a7-20020aa786470000b02901adc67c3796mr58844824pfo.43.1609845873987;
        Tue, 05 Jan 2021 03:24:33 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id q35sm2545089pjh.38.2021.01.05.03.24.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 03:24:33 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Subject: [RFC 1/2] kbuild: Add support to build overlays (%.dtbo)
Date:   Tue,  5 Jan 2021 16:54:16 +0530
Message-Id: <317735e32a8ec3db935a375584aa420fe89124cc.1609844956.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1609844956.git.viresh.kumar@linaro.org>
References: <cover.1609844956.git.viresh.kumar@linaro.org>
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
 Makefile             |  4 ++--
 scripts/Makefile.lib | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3d328b7ab200..54cdcdfea67b 100644
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
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33..f70d7bd3262a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -82,11 +82,15 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 extra-y				+= $(dtb-y)
+extra-y				+= $(dtbo-y)
 extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
+extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtbo-)
 
 ifneq ($(CHECK_DTBS),)
 extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dtbo-y))
 extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtbo-))
 endif
 
 # Add subdir path
@@ -299,6 +303,11 @@ endif
 
 DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
 
+# enable creation of __symbols__ node
+ifneq ($(dtbo-y),)
+DTC_FLAGS += -@
+endif
+
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_dt_S_dtb= DTB     $@
 cmd_dt_S_dtb=						\
@@ -327,6 +336,9 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
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

