Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAA9EE25D
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 15:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfKDO3D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 09:29:03 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:33145 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKDO3C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 09:29:02 -0500
Received: by mail-wr1-f73.google.com with SMTP id a15so10544461wrr.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 06:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=aW4SA83XYvfgMU7wkWAC5rLE2H9FWpbhI6EjHgaPF1Q=;
        b=HjfM6Wvb5TrRvQXysjjhAZUXi13FWV60JFteS+oivUITalKiSIDLxLiGVgaE8rjZG2
         +dQdZYZI/44MYCotEouoS6TbMnf92clOZmho26Nd1I6Nu5lVM2ZXoM41zy/iZdDffmvE
         0SVYiC4IwhQQtpyGFTa+Eu8S4+F3Gfgfxez7s1FWzg825ZLstaiCvlaqstfovKj+O8gX
         b6K6tBM13jfHVCA8L/MhVc7hwQbXU5lZSIo1Y5mLdyyQ8hbi2YaUotlskJZMMFjch2+1
         PEswSISz5h08vomYHGFXbp/Kh9TrObHBabM8gKrGa2nGruMwk7cGij7fbNFqhyQAvADc
         i+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=aW4SA83XYvfgMU7wkWAC5rLE2H9FWpbhI6EjHgaPF1Q=;
        b=Nss3umAv3OMYcdB6N3Ugg17ghDYnKpjnWjGVKjagbfu4+zC6ISah2Tljez6gDxayfJ
         qRudggsaPxp8R0ITVo8PqEK0MIDapMwz/684Ujr6xzTJJowLy9kf+9ModgiJnlxXC7VP
         U19tEqjdmhPUp9LTQ2/G0TxaH6edqAZ3m4t655EqSWrL5i/13pQqiaXX3Hu3kZrluHWQ
         yIo4p1A5QCn6aVpGQtyjKul2QisTh8AiozGh8Vrnkj/avJWubbTmosG9Niqu9glffnsl
         8u4fynOOEmFTWrN0JtUV30DE4erViyPDmf+v+udOPthiP6KeqBZZMCI3QF+wfmK4xJMr
         sBJg==
X-Gm-Message-State: APjAAAVQ7m/prOqSFJH21O9vdoe4NkRJ+BNnFD6T3fr0NLAd/XU7btga
        lBzC/VKEbAnoG/zwqH021gSC+HeW5w==
X-Google-Smtp-Source: APXvYqwpc3TFOOZt+q3MIYWgPWVX1Lm/mb3Jd4l0c4dTAXD7v9VvchXmCDGlKWMT+LJc4C7ZgART+EynnQ==
X-Received: by 2002:a05:6000:350:: with SMTP id e16mr25109889wre.276.1572877739417;
 Mon, 04 Nov 2019 06:28:59 -0800 (PST)
Date:   Mon,  4 Nov 2019 15:27:39 +0100
In-Reply-To: <20191104142745.14722-1-elver@google.com>
Message-Id: <20191104142745.14722-4-elver@google.com>
Mime-Version: 1.0
References: <20191104142745.14722-1-elver@google.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH v3 3/9] objtool, kcsan: Add KCSAN runtime functions to whitelist
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
        npiggin@gmail.com, paulmck@kernel.org, peterz@infradead.org,
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
v3:
* Add missing instrumentation functions.
* Use new function names of refactored core runtime.
---
 tools/objtool/check.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 044c9a3cb247..e022a9a00ca1 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -466,6 +466,24 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store4_noabort",
 	"__asan_report_store8_noabort",
 	"__asan_report_store16_noabort",
+	/* KCSAN */
+	"kcsan_found_watchpoint",
+	"kcsan_setup_watchpoint",
+	/* KCSAN/TSAN */
+	"__tsan_func_entry",
+	"__tsan_func_exit",
+	"__tsan_read_range",
+	"__tsan_write_range",
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
2.24.0.rc1.363.gb1bccd3e3d-goog

