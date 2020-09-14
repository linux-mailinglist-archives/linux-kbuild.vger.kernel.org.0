Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BBA269382
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgINReB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgINR2Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCABC0612F2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:15 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so794712wmd.5
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ev8PHeG2wBS2zSKo7R1VQ4GKo6oUzjZvdtqCLwJ3pDs=;
        b=Ihcd/I42/8bqTmauvPs6wDsvnxOAZx+wYOevPiQvp+xJchPV5GVJkIShVJHhNU2FjO
         Zf1FpuxhmFlq6/3mUCs6IS98Ps2pku3dV/3fh5ECJ4gDZPm9+Ct13ppA30R3IhTtGzSd
         KyjRpOxXeBwr5vS+ttAyiOJy1txvnpeI7w+7wvzy7JfFhvY/m6Hyiw0ksxJxvBH1TKmw
         CpSNjsUVu0fP6g5CeuWF6cI5+zgTBD8gSJA/WEILjUZoiAXavXc7DnpojnXNHupGQsvG
         s7eZ41WyrXa0IMZ4lhH1LzLbNKcQgdbq0M8s5dYCdEOag6uxg2zPjBYciaEkq0N6363O
         Svhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ev8PHeG2wBS2zSKo7R1VQ4GKo6oUzjZvdtqCLwJ3pDs=;
        b=HCsXrHsAGSC02/H8Y5qHfoxhB93tbXoTqVL8e6w47eE1etBIDuIXj5jb/k1hE50Zi3
         D1aBlX8lBdTVTJ9+gVC2huA2zpP3SBiAxd4BEYxgd/VGQ0vDosxNyEz/6d1iACxfL5RW
         R6yeykwPs2wm8R90XSnuqAxwt2zS+QaI23ZCWs9WQBP+YsJSqya8bJVXDRIMaPjsB7MV
         TCW8N2Lt0mMw+ZjsGwBg59tLPxo8gmAIReVc04IbSCEdEJLF8ux5SeUYzt9tIBxmjSF0
         7PLQXdb8sp5Ls6yhDn0xIH19TLbyPNNGBbuySYMOc2Xej3M3Z1OKvs7HJX1OzI3jJcZ3
         8HlA==
X-Gm-Message-State: AOAM532l3tYdFFNshRrWG57gylXaluYN3bOvjHMrXmZGGcZHvLdoezHo
        hyTMsXkyRFZVZxrO8xLcqZY8Yw==
X-Google-Smtp-Source: ABdhPJwtapIR59wfa+PjunnI9DEEbaEmNaoIsHmxwFfZkq+7/rS32R8lqozJpnsFIN4Urr9dofZ6Kw==
X-Received: by 2002:a1c:f619:: with SMTP id w25mr459880wmc.62.1600104493518;
        Mon, 14 Sep 2020 10:28:13 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id s12sm13377783wmd.20.2020.09.14.10.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:12 -0700 (PDT)
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
Subject: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Date:   Mon, 14 Sep 2020 17:27:42 +0000
Message-Id: <20200914172750.852684-7-georgepope@google.com>
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

When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
the handler call, preventing it from printing any information processed
inside the buffer.
For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
-fsanitize=local-bounds, and the latter adds a brk after the handler
call

Signed-off-by: George Popescu <georgepope@google.com>
---
 scripts/Makefile.ubsan | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 27348029b2b8..3d15ac346c97 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -4,7 +4,14 @@ ifdef CONFIG_UBSAN_ALIGNMENT
 endif
 
 ifdef CONFIG_UBSAN_BOUNDS
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
+      # For Clang -fsanitize=bounds translates to -fsanitize=array-bounds and
+      # -fsanitize=local-bounds; the latter adds a brk right after the
+      # handler is called.
+      ifdef CONFIG_CC_IS_CLANG
+            CFLAGS_UBSAN += $(call cc-option, -fsanitize=array-bounds)
+      else
+            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
+      endif
 endif
 
 ifdef CONFIG_UBSAN_MISC
-- 
2.28.0.618.gf4bc123cb7-goog

