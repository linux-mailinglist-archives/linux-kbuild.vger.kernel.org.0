Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C21EE5D9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 15:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgFDNvQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 09:51:16 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40568 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNvP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:51:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id n23so7383230ljh.7;
        Thu, 04 Jun 2020 06:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b54SpJMSTOd6h+DBnk1Lku3f1oWBTa5w9a5vkJqB3fA=;
        b=NOKcnCnHmgLbHUot2+eJwnhNzECR4FMJbk1qYoqQ++S6V2X9r5jBm1/aDrPWux9kwy
         m5F5YKtwExVAXlAfK49L4gUJmTQvaoTjxmyG7L6/xUmKQ6iIAPIuMgp6oaRPQkdgkNBz
         Dd6QdErvBVfzOFIaT5DcZ0Az8tl7YC4DQXIKlUizcvvV4D/ULFHbZJgURjYeqyFVVvFB
         DmsFka4YcYyzeQfvItGHaw8a/lIrpRR9VUiJ1uHPgP+8tUWzQBIwix+oYOwV1fF7OUt1
         lzx45X/YW1QqeS73mP+f8ggeTav//83ZS++hJP5swqVnZdInGo3ZnClz6nq/RpH1dr+p
         8zRw==
X-Gm-Message-State: AOAM532isEgAATR8l2s5HmPS1pTIEoHJPvtDt4NPuDjHRU9q6bnj8/fc
        4M+w2vojj9gRWxPyH2K1Ci4=
X-Google-Smtp-Source: ABdhPJwJN+QU/v5qwJyKhHL0R8cAYtbe3PO9Gpb/m6COOlcWqK5m8q5guhRTY5qY7edIDaq2chb7lg==
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr2410838ljj.304.1591278673307;
        Thu, 04 Jun 2020 06:51:13 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id u16sm1202140lji.58.2020.06.04.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:51:12 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Alexander Popov <alex.popov@linux.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc:     notify@kernel.org
Subject: [PATCH 5/5] gcc-plugins/stackleak: Don't instrument vgettimeofday.c in arm64 VDSO
Date:   Thu,  4 Jun 2020 16:49:57 +0300
Message-Id: <20200604134957.505389-6-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Don't try instrumenting functions in arch/arm64/kernel/vdso/vgettimeofday.c.
Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
is disabled.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 arch/arm64/kernel/vdso/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 3862cad2410c..9b84cafbd2da 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -32,7 +32,8 @@ UBSAN_SANITIZE			:= n
 OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT			:= n
 
-CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables
+CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables \
+		$(DISABLE_STACKLEAK_PLUGIN)
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
-- 
2.25.2

