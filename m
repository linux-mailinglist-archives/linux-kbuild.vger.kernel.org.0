Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D2E6CD15C
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Mar 2023 06:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjC2E7o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Mar 2023 00:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjC2E7m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Mar 2023 00:59:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D0719AB
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:59:41 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so10311318wmq.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=a+A3vmtN33rV7G2K+kBT5+09RNfw/x9RSy+q2X3PBbr29xgkn5AQt12Fbediy1rrcC
         iHU5gwK6JXKuap5Q1K7ZWEHCpYah/bxgqzwBr1yWkZ7mh7r58y1ARcbbZcV8tzEpyFZf
         VDgXJr/tDJG2F0g9ahkj0NkZFJvy+ATuc/EtdJZvDtU/skKpBzTkNMEHgFcM7dZ0S8Er
         0eHpqVt7Wim1e1rCAGgxA04h6ZrRWhIYTlP6NK+v9auLZyoJkLfTpVcTWrSdLfMq4V8r
         hjcdeqmxZeOMiEHhoNumsB/hafrv2w9DmhB2P7mDfgctEKEXOeNUvMmKfuAJRA7CSlDX
         2FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=SkZ4IfENYv5AN+0DnCrr2FTRPc7/Av6P+RgyvzY3X/iWsmPnbpS3kZB3yPxpuq540K
         SBX/0z4ftzrBG74xDfQoL28Ry5Zk+oJmy7d1Hl+a5R3hxQBynTGzy592+f0R05jJTD/D
         mDOlQ8IYyvfnuHR01UXfc9Z6kAS2MPJ+XILKUx82htmPc3UN4MkHyNL3ubsKO54EeAJO
         3uxPj8460bgfBeReeL0Obw9a0/Xa+Uddwh1uC//RtaBFgKSiZq4mMjRI8nEGNRXEqNot
         81lPsrwmM9HrwGJ4dNSHtkgxaW4B6q0ag6Nbv3U/aX1R3Bq/GdOxUp8eJx3nwHiLkFLF
         JvCQ==
X-Gm-Message-State: AO0yUKUYkzrTHxibf5ci+hdDzWqdcElinEUg+pIDo5FsS4brrDLpuQhl
        kQoNeSPR7uBgp27dKALsn3X6uQ==
X-Google-Smtp-Source: AK7set/hrrFzd6yhsYIengKEXesiDvT2OHC1fUfzzUtI8h99/a73zFv/Utk9ctYdbI75FCHmhSsncw==
X-Received: by 2002:a05:600c:209:b0:3ee:282d:1016 with SMTP id 9-20020a05600c020900b003ee282d1016mr13218010wmi.25.1680065980323;
        Tue, 28 Mar 2023 21:59:40 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q18-20020a7bce92000000b003ef71d541cbsm842566wmj.1.2023.03.28.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:59:39 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
Date:   Wed, 29 Mar 2023 06:53:29 +0200
Message-Id: <20230329045329.64565-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To circumvent an issue where placing the relocations inside the init
sections produces empty relocations, use --emit-relocs. But to avoid
carrying those relocations in vmlinux, use an intermediate
vmlinux.relocs file which is a copy of vmlinux *before* stripping its
relocations.

Suggested-by: Björn Töpel <bjorn@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Makefile          |  2 +-
 arch/riscv/Makefile.postlink | 13 +++++++++++++
 arch/riscv/boot/Makefile     |  7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 860b09e409c7..7dc6904a6836 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -8,7 +8,7 @@
 
 OBJCOPYFLAGS    := -O binary
 ifeq ($(CONFIG_RELOCATABLE),y)
-	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
+	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro --emit-relocs
 	KBUILD_CFLAGS += -fPIE
 endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index d5de8d520d3e..a46fc578b30b 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -15,12 +15,25 @@ quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
 	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 
+ifdef CONFIG_RELOCATABLE
+quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
+cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
+
+quiet_cmd_relocs_strip = STRIPREL $@
+cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
+                                --remove-section='.rel__*'      \
+                                --remove-section='.rela.*'      \
+                                --remove-section='.rela__*' $@
+endif
+
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
 	@true
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
+	$(call if_changed,cp_vmlinux_relocs)
+	$(call if_changed,relocs_strip)
 endif
 
 %.ko: FORCE
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index c72de7232abb..22b13947bd13 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,7 +33,14 @@ $(obj)/xipImage: vmlinux FORCE
 
 endif
 
+ifdef CONFIG_RELOCATABLE
+vmlinux.relocs: vmlinux
+	@ (! [ -f vmlinux.relocs ] && echo "vmlinux.relocs can't be found, please remove vmlinux and try again") || true
+
+$(obj)/Image: vmlinux.relocs FORCE
+else
 $(obj)/Image: vmlinux FORCE
+endif
 	$(call if_changed,objcopy)
 
 $(obj)/Image.gz: $(obj)/Image FORCE
-- 
2.37.2

