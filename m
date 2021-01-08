Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598F62EEEB8
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Jan 2021 09:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbhAHImN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Jan 2021 03:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbhAHImN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jan 2021 03:42:13 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECC5C0612F5
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Jan 2021 00:41:32 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id t6so5324188plq.1
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Jan 2021 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5YW50Ah03cn2qpITNLfaRsXD4PDGBQyXlcG2G1/LKtg=;
        b=CvsP4jxX8IdJOfZqoADc6APWHfTrnbb4YDQ8/D9XHeFZTvFrPC6BQURCTw8A/MdFxt
         xwxrQX9aGXqNpW5FDCmpb4h/2txCkELIINMpfXkv7JfnJDd60a1Jcij7JMpEVQdjBmOE
         R0ylNEbBYp9Uiyey3dutCWTdpGHPulnnNdHy3rkUJgu8U0nwB9aziLcqODRoIccQjHtM
         xFLL3OYcjF0ZP3unUG8fmK3XL0DxqfoE1dR0k2k5VdpRWMSvYz7tO1QYBhRee7UMdljP
         Coz4z0j8lBzMuoaX/h/LDHeXxqcC9B9qenOEfovKY8FPeW15E0rbhMHRH1fBxLhdzCIj
         V/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5YW50Ah03cn2qpITNLfaRsXD4PDGBQyXlcG2G1/LKtg=;
        b=iXpqX8OJEaxSqYOLuSWhb2p8+fsbMVISB/HV150+Xe8vahSj5gvP/mnkVAOWu4Zf3W
         MoWPdaOSSFX5B6fAjT6yM84341DHRh1u3mU+TY8i2G9bn5OluFQso9sI3N7wRT5sjJ/p
         45xj6FLk+bxdteDjh6jo2C4zpuKN9HdykbYMLcZcvWsgvaaWtMtlhdyz098opvnw7fX8
         I/dZHmqFTZJwjQeOK4AOPw38z+VxSenaMkY5uyml5N3I/Tw277UsYlG+FRHlqLDZ3Veq
         wQXx5PqB1Qz26NIZAeLuxSFD+IzSkn1bHgwVEhmHy5ce61mphXD2eshRZo+xZ74KR3R9
         K0Jg==
X-Gm-Message-State: AOAM530OVo+xVGDLZdN1Sq6YyVxIRtV3mvYF5HQ/VPCjiPW29k2OzQjq
        FtiKDcfqEHbhK8X+Zps2q2+VaA==
X-Google-Smtp-Source: ABdhPJxURUQK4OfLPAV2tJmJ/OaEPV8xqk6SEh+SIZHFSg3frcbKUp34+oZhmVq913w3ZytX4WXxeA==
X-Received: by 2002:a17:90a:450c:: with SMTP id u12mr2715278pjg.93.1610095292255;
        Fri, 08 Jan 2021 00:41:32 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id m15sm8393768pfa.72.2021.01.08.00.41.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2021 00:41:31 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Date:   Fri,  8 Jan 2021 14:11:20 +0530
Message-Id: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that fdtoverlay is part of the kernel build, start using it to test
the unitest overlays we have by applying them statically.

The file overlay_base.dtb have symbols of its own and we need to apply
overlay.dtb to overlay_base.dtb alone first to make it work, which gives
us intermediate-overlay.dtb file.

The intermediate-overlay.dtb file along with all other overlays is them
applied to testcases.dtb to generate the master.dtb file.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
Depends on:

https://lore.kernel.org/lkml/be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org/

I have kept the .dtb naming for overlays for now, lets see how we do it
eventually.

Rob/Frank, this doesn't work properly right now. Maybe I missed how
these overlays must be applied or there is a bug in fdtoverlay.

The master.dtb doesn't include any nodes from overlay_base.dtb or
overlay.dtb probably because 'testcase-data-2' node isn't present in
testcases.dtb and fdtoverlay doesn't allow applying new nodes to the
root node, i.e. allows new sub-nodes once it gets phandle to the parent
but nothing can be added to the root node itself. Though I get a feel
that it works while applying the nodes dynamically and it is expected to
work here as well.

(And yeah, this is my first serious attempt at updating Makefiles, I am
sure there is a scope of improvement here :))

---
 drivers/of/unittest-data/Makefile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 009f4045c8e4..f17bce85f65f 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -38,3 +38,26 @@ DTC_FLAGS_testcases += -@
 
 # suppress warnings about intentional errors
 DTC_FLAGS_testcases += -Wno-interrupts_property
+
+# Apply overlays statically with fdtoverlay
+intermediate-overlay	:= overlay.dtb
+master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
+			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
+			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
+			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
+			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
+			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
+			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
+			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
+			   intermediate-overlay.dtb
+
+quiet_cmd_fdtoverlay = fdtoverlay $@
+      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
+
+$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
+	$(call if_changed,fdtoverlay)
+
+$(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
+	$(call if_changed,fdtoverlay)
+
+always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
-- 
2.25.0.rc1.19.g042ed3e048af

