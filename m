Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C70E3523B7
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Apr 2021 01:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbhDAXcm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Apr 2021 19:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235987AbhDAXc0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Apr 2021 19:32:26 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CACC061794
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Apr 2021 16:32:25 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a19so7527480ybg.10
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Apr 2021 16:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MkcfzR92H2jDmq2d4RL+VoRfm9LM05H88oYR/VzcB5I=;
        b=Rkz+baugCU0boZ02HoTqlKubiEntpTT9QoWd+o+BAtncvl/retLEsZJAVH1rB01pBf
         9MWWF5Ch6NCgBFjhkYOnIyGZkaUHAm4WQipSnmL1TN8jSdE1KnFkhrDGOdtJwAMKUq7Y
         ICnqrEyN5y2FKL4wdgElMDjDKvF3tSZHAaNz5+nfb285KADVJhqWX3UYzFsXrMf6/kld
         bJQuBvFO6EnQ41XejqN7DiVAEPNg1FbXVySMSbcg8voHCyEIDpyF5ZrhRYBVPedQE8xQ
         qcVp8YZPEw+NmZ9Yi0mzjnmQy7xzaJDg/OgCMdv++swJ3YMIgKApL8IVshi8YNvR0HJb
         NrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MkcfzR92H2jDmq2d4RL+VoRfm9LM05H88oYR/VzcB5I=;
        b=GzgxlPqU8pbEVOd8UC3ASY43OAk0aN6rnZEA9iiKU9TXYFKwGzAKabwRJA57IQiGNI
         n2/8fvsvEtgjGEEVJK9bOgW6LrM9CV3gsMX4H2vfYUAdE3WqN/eJ5SJPtdp0Z48fyqt4
         TR8j8r6nY8KsKTAuproAUSd/0J16le3pDflHUgnZt5/pX0oWqsahyWlTosGY/UG+AwRS
         R+zRVAvLaDA51pt7fOvcaoGjdiMWutjAKGV2YZDZmyqT0nNLmJ26/8FBzI6lRQqdLH2W
         +pBVy2QZgk2dzSv40pBWmFHukOhDWGDQN7Jf519cJlhimi5LpQwX9vnZMdVkhPxmRV/M
         FehQ==
X-Gm-Message-State: AOAM532Nxyixs8PPM5DVDoh7xm7c0K1noQmI2MZz/mivOrKgjhfB7JAA
        16Keng9LQDx6jYPWa2ELakY7j04Zr9VAJtuh56E=
X-Google-Smtp-Source: ABdhPJxZYcMHvWjMRQqjhTv5hlYtkLPcoAOWWHLVSo1F+sDIZa5GooWGPiUDl1KsIBupRPE2wPS+ZDp0ie617LFUrGg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:4cd1:da86:e91b:70b4])
 (user=samitolvanen job=sendgmr) by 2002:a25:d045:: with SMTP id
 h66mr15244938ybg.138.1617319944327; Thu, 01 Apr 2021 16:32:24 -0700 (PDT)
Date:   Thu,  1 Apr 2021 16:32:01 -0700
In-Reply-To: <20210401233216.2540591-1-samitolvanen@google.com>
Message-Id: <20210401233216.2540591-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210401233216.2540591-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v5 03/18] mm: add generic function_nocfi macro
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG, the compiler replaces function addresses
in instrumented C code with jump table addresses. This means that
__pa_symbol(function) returns the physical address of the jump table
entry instead of the actual function, which may not work as the jump
table code will immediately jump to a virtual address that may not be
mapped.

To avoid this address space confusion, this change adds a generic
definition for function_nocfi(), which architectures that support CFI
can override. The typical implementation of would use inline assembly
to take the function address, which avoids compiler instrumentation.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/mm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8ba434287387..22cce9c7dd05 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -124,6 +124,16 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #define lm_alias(x)	__va(__pa_symbol(x))
 #endif
 
+/*
+ * With CONFIG_CFI_CLANG, the compiler replaces function addresses in
+ * instrumented C code with jump table addresses. Architectures that
+ * support CFI can define this macro to return the actual function address
+ * when needed.
+ */
+#ifndef function_nocfi
+#define function_nocfi(x) (x)
+#endif
+
 /*
  * To prevent common memory management code establishing
  * a zero page mapping on a read fault.
-- 
2.31.0.208.g409f899ff0-goog

