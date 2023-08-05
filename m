Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F56770D92
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 05:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjHEDnB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Aug 2023 23:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjHEDm7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Aug 2023 23:42:59 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACD64ED7
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Aug 2023 20:42:58 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-56ca4d7079aso1911471eaf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Aug 2023 20:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691206978; x=1691811778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2b9Q3lkZKmu12e+0EDMznFMvNtKZWqeAAT4HuHSNrk=;
        b=YJOww/XmC1BQgoqAtC8JHi5ht9cK3QAJWVTNOCRxgIUvykcuv3JwCYkLiaxAnB9ncA
         Ve70F0xy+rgYC8ta4zD5ONpXbuKYnZKO0GIr601Zsm6ByDg1UbU11oMKlYHUHSEE60hi
         +OtwuBrLw756Xn6dUCnvs2l2vdTZHpltmmay0lK5iFZrXiwsz4Bk3iCGIcZjNGhA4x/2
         q5PM31rLnHWXMMch3V2x3Jq4WWvCg3ehWNP31cM85U8QOCrdw1vVxwUIBkQWWRny8FRV
         kW0eW8hD7G/OkJSM8PD8YnkbWIbacBq510VlePtNXbyB8RoWHmaqXRo7spqg9INsT+/N
         2pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691206978; x=1691811778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2b9Q3lkZKmu12e+0EDMznFMvNtKZWqeAAT4HuHSNrk=;
        b=ajm3rwQPwNd5ewSLtC+0Ntjhp2Cefp4TpUIgyHt1892HgbaGNk2GK3Ewk+mraaHHR9
         nITkT+W4/3GdUDf2xrsjpNFCsZU7zX6RhgaBLeQm1AqTRYNhD/FqRNF/Ma9L9EF3slbG
         fzE72D47SA4ykO4B3LIGHuTBF8BB1xJqqdu/Kt8lG4sZc43paJIhAAH4VlY/1IndKr7n
         94K1k/LCaqh0zjqA3lk6Bti8cMX6cahY8aSJ0tVnurgLNbG/UY2k2nrtLsQH6d8ku2zT
         KtU6Ss9s1+0bX+N3MULLHJI0+ldCV3DfjMaE26ndMtPiQJILtWe0OZJq8U0scUrAi2Ns
         /tpQ==
X-Gm-Message-State: AOJu0YxL3zmMHCtVOGEyvUVtmrj2bhUkYDeW+uu/4/liYcTAV5nF2kwU
        cWrtk22iksiCRhQ3QE3CTIacPlwz09pX+w==
X-Google-Smtp-Source: AGHT+IHI1usm5ORGkl7P0EknAauXwu1K8v5U5jYI0x07qPHR7trGFROSbGlEpyZpF8PXltUKMBq/CA==
X-Received: by 2002:a05:6808:14cc:b0:3a4:3b56:72b2 with SMTP id f12-20020a05680814cc00b003a43b5672b2mr4613062oiw.8.1691206977863;
        Fri, 04 Aug 2023 20:42:57 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:7ccd:e816:6b54:140a])
        by smtp.gmail.com with ESMTPSA id q15-20020a0cf5cf000000b0063d4631d1e4sm1136726qvm.68.2023.08.04.20.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:42:57 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v1] kconfig: Alias mconfig to menuconfig, qconfig to xconfig
Date:   Fri,  4 Aug 2023 23:42:56 -0400
Message-Id: <20230805034256.2478162-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

All the other menu-based config tools have a one-letter prefix, and
are named the same as their respective file,
except for mconfig and qconfig. This commit adds an alias for mconfig
to menuconfig and qconfig to xconfig.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 scripts/kconfig/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index af1c96198f49..319cd623acb9 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -32,9 +32,11 @@ unexport CONFIG_
 
 config-prog	:= conf
 menuconfig-prog	:= mconf
+mconfig-prog	:= mconf
 nconfig-prog	:= nconf
 gconfig-prog	:= gconf
 xconfig-prog	:= qconf
+qconfig-prog	:= qconf
 
 define config_rule
 PHONY += $(1)
@@ -45,7 +47,7 @@ PHONY += build_$(1)
 build_$(1): $(obj)/$($(1)-prog)
 endef
 
-$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call config_rule,$(c))))
+$(foreach c, config menuconfig mconfig nconfig gconfig xconfig qconfig, $(eval $(call config_rule,$(c))))
 
 PHONY += localmodconfig localyesconfig
 localyesconfig localmodconfig: $(obj)/conf
@@ -118,7 +120,9 @@ help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
 	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
+	@echo  '  mconfig	  - Alias to menuconfig'
 	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
+	@echo  '  qconfig         - Alias to xconfig
 	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
-- 
2.40.0

