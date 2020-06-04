Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8811EE5D7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 15:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgFDNvJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 09:51:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45601 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNvJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:51:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id d7so3632854lfi.12;
        Thu, 04 Jun 2020 06:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQF4gusMMse1t+P2Qqr0GcfguvDdOuRmX3WacGaJBcQ=;
        b=jF6IvBPDfMIYlTCQV/874CGcg+W6j/SRtw8BgSNN1uQQqTIMWsvwPMo30KpjABSsA2
         8hEYk9DwoZdit+/S+QM45zZBeO2m2sqwm8AOvJfFZ13RyngfU9IJZrchZXhxtNES2NDm
         P2JNVPSgvDxgpnPrZ6ALtujS5TC7ytqjTgwnlUpB95NzkMxHojnRHJ+7zxqBJYtUxHBD
         sd+Q9PX0RN9m9hZFN3OrctTDwH/gk1L+w4Q4j+5w1PI5lN5tDBoCl53uieUeJDCQv+9x
         9l6lN+tH1LYJgo9yUR4J6q9t/M6eqvynqT6/EfOOCPJ3k8yqbHypwOQg5pdEQfcvwqXa
         +Whg==
X-Gm-Message-State: AOAM533rHTzkcbSv6nzmJ5qEQrbDmke6aUZBsIShTcniVv4e2aFYZB49
        RWQr2myVyTqGM+DNiX2KFE4=
X-Google-Smtp-Source: ABdhPJxGDD5ukdedXoxuQ27N5jKq1fSsreuCe9q3nAgk5mstTvN2pJQfkeE/l29dSTZfbBg2leMMKA==
X-Received: by 2002:a05:6512:3214:: with SMTP id d20mr2637853lfe.203.1591278666991;
        Thu, 04 Jun 2020 06:51:06 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id u16sm1202140lji.58.2020.06.04.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:51:06 -0700 (PDT)
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
Subject: [PATCH 4/5] gcc-plugins/stackleak: Don't instrument itself
Date:   Thu,  4 Jun 2020 16:49:56 +0300
Message-Id: <20200604134957.505389-5-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no need to try instrumenting functions in kernel/stackleak.c.
Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
is disabled.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index 4cb4130ced32..d372134ac9ec 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_RSEQ) += rseq.o
 
 obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o
 
+CFLAGS_stackleak.o += $(DISABLE_STACKLEAK_PLUGIN)
 obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
 KASAN_SANITIZE_stackleak.o := n
 KCOV_INSTRUMENT_stackleak.o := n
-- 
2.25.2

