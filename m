Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76472207369
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388761AbgFXMeV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:34:21 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40131 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388132AbgFXMeR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:34:17 -0400
Received: by mail-qk1-f194.google.com with SMTP id 80so1582630qko.7;
        Wed, 24 Jun 2020 05:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYlBDYPOP+i+Z8CCPoWHLzBw8cVCy1kOHLCJDYgloi0=;
        b=Um2pPq53cIsmU/SMf9olAn7Fy0Eqf6MlbuYQHWe/zlTbYewfd0U32b9DdyNjbPb5zO
         DiX+KMpkBcF+g7BT7gQINg8vSjFz/TeXKWu6kAzkAJZECq1/uv7Irp6IZV0/0y83R5wX
         s5uK54zgb1qckBPQ+9eqyfMW8Jc/CapAd7++LO7IV3AWpoRpxprCtxagLoiig9gqJnBr
         VSP3MlVMfDCQfJioZahkFHYdLh1LxCzZWNyCmNMS5odYaXwXt2TKwKurErJeguMhpZmH
         NMVIsuNS3xomQi7ZiOyDbNc98jj8x/P7tKHXRRhScX9wLGDrpiNQ9GSymlNffNd8dHff
         8A8g==
X-Gm-Message-State: AOAM5329oQz76FQw0bjLfHvJRUvQPnSI/j2RGtW9t5fgwoh6aUX7smIw
        QfSOsSdYbcV7jbZ61GqtRR8=
X-Google-Smtp-Source: ABdhPJxG56K9PcyzErynBCq8WXO4GdEN7iVHSozkebRt9XKZi/zlbyDg2T5l/cdnA0We9Seu6jAYtg==
X-Received: by 2002:a37:a785:: with SMTP id q127mr10507259qke.452.1593002055490;
        Wed, 24 Jun 2020 05:34:15 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id x26sm3354512qtr.4.2020.06.24.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:34:14 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
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
Subject: [PATCH v2 2/5] ARM: vdso: Don't use gcc plugins for building vgettimeofday.c
Date:   Wed, 24 Jun 2020 15:33:27 +0300
Message-Id: <20200624123330.83226-3-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624123330.83226-1-alex.popov@linux.com>
References: <20200624123330.83226-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Don't use gcc plugins for building arch/arm/vdso/vgettimeofday.c to
avoid unneeded instrumentation.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 arch/arm/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index d3c9f03e7e79..a54f70731d9f 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -29,7 +29,7 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 CFLAGS_REMOVE_vdso.o = -pg
 
 # Force -O2 to avoid libgcc dependencies
-CFLAGS_REMOVE_vgettimeofday.o = -pg -Os
+CFLAGS_REMOVE_vgettimeofday.o = -pg -Os $(GCC_PLUGINS_CFLAGS)
 ifeq ($(c-gettimeofday-y),)
 CFLAGS_vgettimeofday.o = -O2
 else
-- 
2.25.4

