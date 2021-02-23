Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96F9323067
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 19:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhBWSPO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 13:15:14 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43803 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhBWSPL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 13:15:11 -0500
Received: by mail-oi1-f172.google.com with SMTP id d20so18542609oiw.10;
        Tue, 23 Feb 2021 10:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt8JapFR4fQx7DIa/yS5vjOVQrDG88jy3WbeHeUDOX8=;
        b=XBZaQC9Rr1sbx1UeA5jxBNMLQa/mcg1rF89G5QcIAXr30nfRs3AL1elgIE0eaeMwEs
         xuqcTwLc5yBtlx2pFT9fV+XF+BEVlzK6wlEWMUgCUC3adRaYMCvM1ujjPcInVzmem+ug
         J+mhkhBs/EdFfxYDSE2i+KbUpG6NIivxzpF3vwBfInyqg9QQ3H4pmOExch80LS/Aer74
         /OOKqicoN46l4n9xEMpeGFM1TJO1xpa3F/vg6/+BSg+yc7xb5X5p/aCo+7tueFB51FF2
         Hdr/kpcF1NW9I6n9HMpTIt0cJfXXWWIYuYfqLsI/3+uUxQznAgq25riFjrppg0VqASLK
         c/Tg==
X-Gm-Message-State: AOAM532+kS6RogMCKN6jfEcC9RrCHCBP9K4/dvjSs/Z0SwrFVUBy4omZ
        6O5KCww8cYLYxbmgP3/UZA==
X-Google-Smtp-Source: ABdhPJyIh57oR1GBWIC49B1ke/YV4wUnFAwqNsVX+/pcTDN2Gqss6L27Fkupxc66/vxn7AylZPI8YQ==
X-Received: by 2002:aca:b655:: with SMTP id g82mr2307oif.91.1614104070167;
        Tue, 23 Feb 2021 10:14:30 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id b2sm3578113oov.3.2021.02.23.10.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:14:29 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] x86: Drop generated syscall headers from 'targets'
Date:   Tue, 23 Feb 2021 12:14:24 -0600
Message-Id: <20210223181425.4010665-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181425.4010665-1-robh@kernel.org>
References: <20210223181425.4010665-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Including the generated syscall headers in 'targets' is wrong because they
are not built in $(obj)/ and the Makefile does its own path prefix and
build rules.

Cc: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/x86/entry/syscalls/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index 6fb9b57ed5ba..b0dcb7e41554 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -62,8 +62,6 @@ syshdr-$(CONFIG_X86_64)		+= unistd_32_ia32.h unistd_64_x32.h
 syshdr-$(CONFIG_X86_64)		+= syscalls_64.h
 syshdr-$(CONFIG_XEN)		+= xen-hypercalls.h
 
-targets	+= $(uapisyshdr-y) $(syshdr-y)
-
 PHONY += all
 all: $(addprefix $(uapi)/,$(uapisyshdr-y))
 all: $(addprefix $(out)/,$(syshdr-y))
-- 
2.27.0

