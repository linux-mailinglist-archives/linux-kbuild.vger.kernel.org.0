Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FE1228FBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 07:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgGVFed (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 01:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGVFed (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 01:34:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1615CC061794;
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so581262pfe.5;
        Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6XH81WBXfO6/iXFH94MhfENTEKFbXx3UNBzvy3U/FJs=;
        b=EvZnLUq9D7tu6rleIdPCSMEV5Tz1yJQq0CwJNfZiM+GRaEaiJoY6IaRGqrPP9HAMKo
         R74RtVhJo0/jeyvO/zn/0UEPTOpZwXBc5G+6ebEqicwBhwy/FVvGe62AuY2TGLcJH1AL
         1qWAE46zoSlLuRnq5tv6s8yv/PfwBgcdjlxNRzHeOpbq6v69aSPFoXpZXULIh17BYl25
         mjvJAHdmF+RuZG4TgHY8czjHZ9/xce1Mwq/9Qc8f+GxAxJIJUM8Rsmq67pF0qQfh3IKQ
         vP9ljjb4PDIThGI7KSva0f+w5DkG0ppHrhzZeC9S5nhTALC0TxkYYTZef4fsiEvFIAYU
         PaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XH81WBXfO6/iXFH94MhfENTEKFbXx3UNBzvy3U/FJs=;
        b=sca9ZgAjktVgknmbGFO/8iGmIr1qytN9Y5GAZcfdT3WZa1xPxa9+P9FsKbwV5gA5IK
         0O9mQJIYYU3tL+MxJ5o6XgRGAFElZ0eXbVhp323stXUGyq+iRq+NV/dDcffo+oblbSQw
         Pp0UEX1+WZhBpVTRc+YHZVTWytJIHaL38XToRZSGGNm1gqR/lgWyE2QwiQnWFhorfi4t
         c8aD2U1VGiVxy5/WUIJ0faGsvx3HeGEsOxKjkvPORz1waV9kjNaL5t8r4GPgsOnyJuwv
         FpeUKmqE1sDzToI/fxC3FPU+WX48Sby6wV9kBdDr7TbGOTleTu8LcGHFKtV9k2A//Bw0
         0uag==
X-Gm-Message-State: AOAM532szd5UAbJ6rC4eTRPcwDKak1DrYuqMC9ELUIAQ8c+s4t99PvxX
        fbrVnFp/coC3Ra4x7t+6MZw=
X-Google-Smtp-Source: ABdhPJyGlWS5308n24byzEKfDIFi9PkFx3Pz1oKnlAO1LOt40uA3co0mEYCOc3QdPCEoW32ZUaClow==
X-Received: by 2002:a63:1059:: with SMTP id 25mr22543659pgq.302.1595396072530;
        Tue, 21 Jul 2020 22:34:32 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
        by smtp.gmail.com with ESMTPSA id q5sm22536608pfc.130.2020.07.21.22.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:34:32 -0700 (PDT)
From:   Max Filippov <jcmvbkbc@gmail.com>
To:     linux-xtensa@linux-xtensa.org
Cc:     Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 1/2] xtensa: move vmlinux.bin[.gz] to boot subdirectory
Date:   Tue, 21 Jul 2020 22:34:16 -0700
Message-Id: <20200722053417.5915-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722053417.5915-1-jcmvbkbc@gmail.com>
References: <20200722053417.5915-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

vmlinux.bin and vmlinux.bin.gz are always rebuilt in the kernel build
process. Add them to 'targets' and move them to the boot subdirectory
where their rules are. Update make rules that refer to them.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/Makefile              | 11 ++++++-----
 arch/xtensa/boot/boot-elf/Makefile     |  4 ++--
 arch/xtensa/boot/boot-redboot/Makefile |  4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 1a14d38d9b33..801fe30b4dfe 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -17,6 +17,7 @@ BIG_ENDIAN	:= $(shell echo __XTENSA_EB__ | $(CC) -E - | grep -v "\#")
 export BIG_ENDIAN
 
 subdir-y	:= lib
+targets		+= vmlinux.bin vmlinux.bin.gz
 
 # Subdirs for the boot loader(s)
 
@@ -35,19 +36,19 @@ boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y))
 
 OBJCOPYFLAGS = --strip-all -R .comment -R .notes -O binary
 
-vmlinux.bin: vmlinux FORCE
+$(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
 
-vmlinux.bin.gz: vmlinux.bin FORCE
+$(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
 
-boot-elf: vmlinux.bin
-boot-redboot: vmlinux.bin.gz
+boot-elf: $(obj)/vmlinux.bin
+boot-redboot: $(obj)/vmlinux.bin.gz
 
 UIMAGE_LOADADDR = $(CONFIG_KERNEL_LOAD_ADDRESS)
 UIMAGE_COMPRESSION = gzip
 
-$(obj)/uImage: vmlinux.bin.gz FORCE
+$(obj)/uImage: $(obj)/vmlinux.bin.gz FORCE
 	$(call if_changed,uimage)
 	$(Q)$(kecho) '  Kernel: $@ is ready'
 
diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
index badee63dae27..0ebc9827f7e5 100644
--- a/arch/xtensa/boot/boot-elf/Makefile
+++ b/arch/xtensa/boot/boot-elf/Makefile
@@ -19,9 +19,9 @@ targets		+= $(boot-y) boot.lds
 
 OBJS		:= $(addprefix $(obj)/,$(boot-y))
 
-$(obj)/Image.o: vmlinux.bin $(OBJS)
+$(obj)/Image.o: $(obj)/../vmlinux.bin $(OBJS)
 	$(Q)$(OBJCOPY) $(OBJCOPY_ARGS) -R .comment \
-		--add-section image=vmlinux.bin \
+		--add-section image=$< \
 		--set-section-flags image=contents,alloc,load,load,data \
 		$(OBJS) $@
 
diff --git a/arch/xtensa/boot/boot-redboot/Makefile b/arch/xtensa/boot/boot-redboot/Makefile
index 1a277dd57b2a..07cb24afedc2 100644
--- a/arch/xtensa/boot/boot-redboot/Makefile
+++ b/arch/xtensa/boot/boot-redboot/Makefile
@@ -20,9 +20,9 @@ LIBS	:= arch/xtensa/boot/lib/lib.a arch/xtensa/lib/lib.a
 
 LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-$(obj)/zImage.o: vmlinux.bin.gz $(OBJS)
+$(obj)/zImage.o: $(obj)/../vmlinux.bin.gz $(OBJS)
 	$(Q)$(OBJCOPY) $(OBJCOPY_ARGS) -R .comment \
-		--add-section image=vmlinux.bin.gz \
+		--add-section image=$< \
 		--set-section-flags image=contents,alloc,load,load,data \
 		$(OBJS) $@
 
-- 
2.20.1

