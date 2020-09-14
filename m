Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E64269357
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgINRaP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgINR3I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:29:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26269C061226
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:30 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so499742wrx.7
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g9asLkQ3OEMA9W3/GEGNRUW1iZejtpJzTvLvCBaNFqA=;
        b=L3Rqn405GYhI0a/LIy0yLk69eNTGI09w8kK3GusLAgD2VDqrXLtU0QNtSaL3E2jnJl
         aS9V/1Ro1pV9zT8KpI+i624XrTJBd2gg/r8uQFwVfpXG+MpZa0bIA2MWLSvZK3m7cUlb
         HzbBUvIql160nVCPNlIZEkaeXxZAoh9ib5Wq8qddUg5N8BFHAy3BANe7Ewvg3428P7P5
         0iUqBEhudOH/vLy73PmHEYdX5AmRKrjarZzGyKMseTtOquPD/o6H1j9mgPUQryGi9J6M
         AqxmR2pfAlDQpRKkGpdaofGPTEPO/SXB7XcE2rogZG7gtfQNXkNYutC/7Ds7WU6ZOgU5
         70ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9asLkQ3OEMA9W3/GEGNRUW1iZejtpJzTvLvCBaNFqA=;
        b=PTt8WX+QLmrUaIJtNw6JEvuEaSAX1GI9ZSO7yNSZ/1JaXjsEIwO5h9POKQnK0pCPJC
         LvNwhNqYdP04SZzmBLiqFe3K4KkQFaHupIxVuZ1iXnZrv0r/snfOLzpgm9n3IUUYf2pS
         BJeNngtZcI7poVLVDLlz8LULXn02g2DnuNz8SMqfVl62UqXLfAB7kyYZPnG6qWOaNyLm
         Akmux8VJkRWC+E7Qwgs9gLYn2rpEyhAJ+JhzeTpGmJTeslHIlApK9jbs7zoNNPkBs2TR
         CYnuR9fZBNrYQ2yFiyfKKr9gqHMUn1AZBSYYsR5JW7YAwcSQGm9AfKa+O9OQid5nV0gj
         m+YA==
X-Gm-Message-State: AOAM530t4zRLIYWqswiT33V6x5yYBWTzrTQDx2ZrOx2Ea4wLm7EXVBdD
        y5kLwA4NhNiZMHmklzXwok/mJw==
X-Google-Smtp-Source: ABdhPJyuPd0Fs24xYDGYgLUyicl3WMGGQSI7fVgvHIQWca5SpyYpUi5fPphE0FqVU4DtkZnfl8xKwA==
X-Received: by 2002:adf:fec7:: with SMTP id q7mr17052167wrs.293.1600104508663;
        Mon, 14 Sep 2020 10:28:28 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id o6sm22778704wrm.76.2020.09.14.10.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:27 -0700 (PDT)
From:   George-Aurelian Popescu <georgepope@google.com>
To:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, keescook@chromium.org,
        akpm@linux-foundation.org, dvyukov@google.com, elver@google.com,
        tglx@linutronix.de, arnd@arndb.de,
        George Popescu <georgepope@google.com>
Subject: [PATCH 14/14] DO NOT MERGE: Enable configs to test the patch series
Date:   Mon, 14 Sep 2020 17:27:50 +0000
Message-Id: <20200914172750.852684-15-georgepope@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200914172750.852684-1-georgepope@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: George Popescu <georgepope@google.com>

Enable configs from Kconfig.ubsan to test the buffer and
the ubsan_handlers.

Signed-off-by: George Popescu <georgepope@google.com>
---
 lib/Kconfig.ubsan | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 774315de555a..f72b8a564a8c 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -1,9 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ARCH_HAS_UBSAN_SANITIZE_ALL
 	bool
+	default y
 
 menuconfig UBSAN
 	bool "Undefined behaviour sanity checker"
+	default y
 	help
 	  This option enables the Undefined Behaviour sanity checker.
 	  Compile-time instrumentation is used to detect various undefined
@@ -82,7 +84,8 @@ config UBSAN_ALIGNMENT
 
 config TEST_UBSAN
 	tristate "Module for testing for undefined behavior detection"
-	depends on m
+	depends on UBSAN
+	default m
 	help
 	  This is a test module for UBSAN.
 	  It triggers various undefined behavior, and detect it.
-- 
2.28.0.618.gf4bc123cb7-goog

