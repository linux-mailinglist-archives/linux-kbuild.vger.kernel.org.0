Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF1433167B
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 19:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhCHSrM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 13:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhCHSrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 13:47:00 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5B4C06174A
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Mar 2021 10:47:00 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id h21so8051459qkl.12
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Mar 2021 10:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Qzw87IjpyPEnnpaW2VW2opErpv1GSjEUj7UuHD/O6I4=;
        b=a6xeuAP3eXwT8Dwq5ALbVXDnhin4gW/L2S8GMZCTALGiwze1HVRxvy5AOiKBgz7LSD
         9Q74FeR/muNa84dAGfprso7rf5tZTSRSpORRUeq8AcGwbqIOzU4gN9yG3R+aoW5PvFLP
         YiJNzKFnJYE0gBIBZzf/wYKe+4352iECO40TvYoJH6LigNlRBNvDrM1EH5jnN5X90O16
         zUkFSBRD1Y+sxJJMbmSAubnPwV7dZfBN4YozGeOeOglTFF+XStp5Wg/ZVa0XP+Iuz532
         3LPzlaioezslgSrkgWewg0sB+1bHZEce+4R7oyxzcveyL0N4/8zrQJg7dcjId6twD6FP
         PJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Qzw87IjpyPEnnpaW2VW2opErpv1GSjEUj7UuHD/O6I4=;
        b=I3wmACRF4ejN7Pxih5ZuDUeYggX5561MJHSs9eOAaPIhskNtOmNfIELnhFkDJtvEsO
         BV0fuG/02mLrjVtGBty2IfMPgw2gMKF47brMgngJg0rxo5tUjxs3GSZSKse35Jtt870a
         MV975Qsfi/8xcb5ccLhcwW9zK9w0ajlWzigUaFu3p2V7RO9Y7WKwWDVgiWB0+bgxJf67
         WnFP1FukTZvsuER6cehQp2qEs9u/rYR+tLSjFGeHWlzrz45dbPWLh39nZ/vg+jcqIg9Q
         IPzi1QB8tEZhs9YVXEBHhDRNwp814XfjsjFsHT9fGJZIR3zcaJY3ucZqpE05h4cgedwu
         fdEg==
X-Gm-Message-State: AOAM532WdlY/NTS3yDLDgowpHqI9O7JbY5mE2OWFT5FlE8MzWIlViSZ6
        1KIqIF79xIg+q8nxuDF3h7UkCkhEGf9nNOS0Xc4=
X-Google-Smtp-Source: ABdhPJxg4hio5XYPFHLtQ71d/4pZywp6EIOqqNBTmGBHjnMJQFpkBYe/mvvXKQqQCyRDRdf3lWGC2LzWCCuLT3E+L8M=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:8dbc:8d66:eebd:6d0e])
 (user=samitolvanen job=sendgmr) by 2002:a0c:ee89:: with SMTP id
 u9mr22247920qvr.40.1615229219742; Mon, 08 Mar 2021 10:46:59 -0800 (PST)
Date:   Mon,  8 Mar 2021 10:46:56 -0800
Message-Id: <20210308184656.1914947-1-samitolvanen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] kbuild: Allow LTO to be selected with KASAN_HW_TAGS
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While LTO with KASAN is normally not useful, hardware tag-based KASAN
can be used also in production kernels with ARM64_MTE. Therefore, allow
KASAN_HW_TAGS to be selected together with HAS_LTO_CLANG.

Reported-by: Alistair Delva <adelva@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2bb30673d8e6..2e7139b39e8f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -638,7 +638,7 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	depends on !KASAN
+	depends on !KASAN || KASAN_HW_TAGS
 	depends on !GCOV_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's

base-commit: 144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
-- 
2.30.1.766.gb4fecdf3b7-goog

