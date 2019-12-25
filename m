Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBBD12A63D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2019 06:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfLYF6K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Dec 2019 00:58:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42955 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfLYF6K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Dec 2019 00:58:10 -0500
Received: by mail-pg1-f193.google.com with SMTP id s64so11274354pgb.9;
        Tue, 24 Dec 2019 21:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AiPV7qSVZembCeJ1CduQaJCxTlT3uNWRUvbKg0FP3WY=;
        b=IYYuuw+kCm70ZYOQqrqh/2XBK+bw5cAXyTSbWqZ69OYV3XNOaZhdGbyB/sK3j02MnM
         1TvH815lM4paFfO2sbvk1EObeHX2X7m+0/buJqMZsYwUBn4TVlS29fkSmcxbFCP39J6D
         1R/KdXXpIooTvcNa97GvFOI9LO/1owa0NC6ZV/NNIoT1nVHBm8Z8EtGsom324QwAbQZ3
         ft5un86HEDmIFTzqn5+2uQ5aCZanEym395+OPegR3kRzEmKROAOJ2zdg+KAGwiTn6QJQ
         fdjqeftDUoDkFj5uxJoB62aScynY07g08U8YFITMc5ykadIK/BaIySgdoEL1NNGlR2zE
         DDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AiPV7qSVZembCeJ1CduQaJCxTlT3uNWRUvbKg0FP3WY=;
        b=Vx2IA5fg59c50EUj22PlHB7PAeASQXo2h6ARxKsqNAeZuArNBQ8xpAtWUJxYWDGe1/
         MRESKSFmXwSZ7D+KvOPzu7mcmLN5I7MntkF22T8XpplOx7aoZXdmzbTPLUfZBr/UqzJA
         oJmSqLOE/TXq0sHw4Zo4mFFuCtArdX8eqdOXW9dbUTTzfPU8BgfCJd/9tl9WSnwIqc+e
         BmgCqa56i0QRCyd0eLRdO2K/b+aq7N5wmg2UbTIGgxhtCA+6FgjCFKleqW72ahp6nlWS
         QnvqQWaDlQePpAbGNe7X3imgRl4cRwQNlgiGQuOjk+fXsN1UqAe9QQqQgCohzMs07XsK
         3Eug==
X-Gm-Message-State: APjAAAUzIfXpHGPIZAyDvmgop+DzNeq6uIEq6r5dmyfT55NciQNaN1sT
        WXgnEOy2QSQu+swYTA3Kd1s=
X-Google-Smtp-Source: APXvYqzPFFJB/OGExgKE32erZv+/D2GHd8RkQ9LPLv7p++7GmyWpLYMR7/hCVxxLwQLYs/dg3dIYFQ==
X-Received: by 2002:a63:31d1:: with SMTP id x200mr38674413pgx.405.1577253489698;
        Tue, 24 Dec 2019 21:58:09 -0800 (PST)
Received: from bj10083pcu01.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id t23sm33155331pfq.106.2019.12.24.21.58.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 24 Dec 2019 21:58:09 -0800 (PST)
From:   Liangcai Fan <fanliangcai9@gmail.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        zhang.lyra@gmail.com, gengcixi@gmail.com, orson.zhai@unisoc.com,
        Liangcai Fan <liangcai.fan@unisoc.com>,
        Liangcai Fan <fanliangcai9@gmail.com>
Subject: [PATCH] use bash instead of sh to run mkcompile_h
Date:   Wed, 25 Dec 2019 13:58:03 +0800
Message-Id: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Liangcai Fan <liangcai.fan@unisoc.com>

Use sh to run mkcompile_h, compilation would fail if whoami contains
backslash, since sh uses dash. The reason is that the echo command would
interpret backslash to escapes, so the LINUX_COMPILE_BY definition was
incorrect.

Parse mkcompile_h with bash, the echo command would not see backslash as
escapes, then there is no error with the definition of LINUX_COMPILE_BY.

Signed-off-by: Liangcai Fan <liangcai.fan@unisoc.com>
Signed-off-by: Liangcai Fan <fanliangcai9@gmail.com>
---
 init/Makefile       | 2 +-
 scripts/mkcompile_h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Makefile b/init/Makefile
index 6246a06..9348d17 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -33,6 +33,6 @@ $(obj)/version.o: include/generated/compile.h
 silent_chk_compile.h = :
 include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
+	$(Q)$(BASH) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
 	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 3a5a4b2..cfc2e2a 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 TARGET=$1
-- 
1.9.1

