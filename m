Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 230D8DAF86
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 16:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439899AbfJQONf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 10:13:35 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:42914 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439886AbfJQONf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 10:13:35 -0400
Received: by mail-wr1-f73.google.com with SMTP id e25so440634wra.9
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WM5MzufDPT1JiTPvFRdmsbnktj5wkQpb+gi5I/mGgvo=;
        b=Txn+PJN2OuvP5ODZX7wPzChSa5a1obt62mrXLc0YHWjB2oV6xKvqC8+zPxzs8jjXau
         /OCPqfIFc6DG8H0/6s6NElBEwprF0vhAOUlM6UjTGMG+pDIbQjoai7x5DF2xSbLX3mvc
         GKTWTSNO4/CDlmpsoFdW8eT048brIo2Dnk3CnsfmyU8cIJkA/suytB5wPJYWsBxX7UsB
         wtxxupwaAS9LQ86lMI3t4s8ydtEo+0uRHJtV3WfjmR9MMGh6WSsX3CKe0+fEjweh870x
         1TeGyJpFW+IP8bN67x626QfuP3ObE0JJ9sNDwlZeqVJeybj7NebAuDykEAZRGYT8IY/d
         I1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WM5MzufDPT1JiTPvFRdmsbnktj5wkQpb+gi5I/mGgvo=;
        b=oV363cqKMHiskJx6XFuuPfGUIyHLkQJ5xJafIKuNxv0MCKbo/Ijx12NwKJvvoglTLS
         fLDAh7MpUJlV54wqrpNUzQpRiifn2HEUd9/wdfqjPdM0xNf5y//2oaHAoPCNisRG4FO4
         k7eija+8LnDj0ICoXu59glTC3sraiiCnHggIXzdvqsxDThpss6BUlx/F7UY22CCXQCvK
         ew3pmUmuJsPWlhfzFoschNSZ+kd9gbUz6r8uhiaWcR2HAeHGmNSjtkBQq2jeRWy5wrT1
         8jp/c//+MzMQFWV0C/l6te6Icmct9niVPs3VLGMQCfN6AkCeVZJJxPy9wkDmgrV0J4rA
         lhZg==
X-Gm-Message-State: APjAAAUHYxKQEaN73S0mL7PD0Z6P/WIMKJBzpSGya0cIp2FNdrzkBTT4
        3NkG8liOxkh+QxAZUxHwwi3PMLGdMA==
X-Google-Smtp-Source: APXvYqxeT9QjYrVDR28/tNZYBCzz3DbM0H0OJ7m9CjtFaANScqLFwMWSQDekQoUt1a4G0oIkx8foGjJcWA==
X-Received: by 2002:adf:d850:: with SMTP id k16mr3398476wrl.204.1571321612447;
 Thu, 17 Oct 2019 07:13:32 -0700 (PDT)
Date:   Thu, 17 Oct 2019 16:12:59 +0200
In-Reply-To: <20191017141305.146193-1-elver@google.com>
Message-Id: <20191017141305.146193-3-elver@google.com>
Mime-Version: 1.0
References: <20191017141305.146193-1-elver@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 2/8] objtool, kcsan: Add KCSAN runtime functions to whitelist
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, paulmck@linux.ibm.com, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch adds KCSAN runtime functions to the objtool whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 044c9a3cb247..d1acc867b43c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -466,6 +466,23 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store4_noabort",
 	"__asan_report_store8_noabort",
 	"__asan_report_store16_noabort",
+	/* KCSAN */
+	"__kcsan_check_watchpoint",
+	"__kcsan_setup_watchpoint",
+	/* KCSAN/TSAN out-of-line */
+	"__tsan_func_entry",
+	"__tsan_func_exit",
+	"__tsan_read_range",
+	"__tsan_read1",
+	"__tsan_read2",
+	"__tsan_read4",
+	"__tsan_read8",
+	"__tsan_read16",
+	"__tsan_write1",
+	"__tsan_write2",
+	"__tsan_write4",
+	"__tsan_write8",
+	"__tsan_write16",
 	/* KCOV */
 	"write_comp_data",
 	"__sanitizer_cov_trace_pc",
-- 
2.23.0.866.gb869b98d4c-goog

