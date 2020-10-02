Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4B0281E1D
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 00:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgJBWPh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Oct 2020 18:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgJBWPd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Oct 2020 18:15:33 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5ECC0613E2
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2020 15:15:33 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id j8so50160pjy.5
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2020 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/J1gHtjcOOv6Rq1ls75T0pkphOgixxdtxsRzhxRApII=;
        b=DhD8t5kr8ElFUdmH3JdVP9GXM33yLmm67FT7fIl5wwRBQKJJ/2B8l4IoqTbHRe71Lm
         rDMxMTHC1vGlbvnJqy//diKkTio5j2dEzjhWQuYbgIY6As/lRsNAcxn35knW+xPcOyUk
         Osj4zkWGzG57f/iA9OCnsuvHzDqlOO1JFlFDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/J1gHtjcOOv6Rq1ls75T0pkphOgixxdtxsRzhxRApII=;
        b=inD0QMyB0Wrt9q/5YL44GpXFbJA9Na49KsNZhM8GJDDymJIzSgwwPPRp2g2seskkiu
         C2GsPj/w5xhNzT7Bp3F2EDtJ9DiijenvuFxWoGIMXs9DS+XhwjY5Mq7ckJ1eZhSizVIP
         deROUOqHFZEpvcUX2y7tOx0oq9pKcwImm6DhkP63eHmYujS0JeHF/9lZyC6fTYuh3JFh
         DXudjnUuW+nd/oS5MXCXS/qRqbxSArdINgavXGUOnbKp1T/heaIeZB3E+VjgLmWdsW1r
         pQ8UJFfKV1GHozGqgablkH0pGUCjeoFcns3JQIABqUg9AbS1uI4v4YgsfBL/CkD8PSfw
         YRWw==
X-Gm-Message-State: AOAM5308P2nxRatatoyodAliUE0oNRpBUiMfLJMkAs+pNQZfuvJYWEFg
        5idKtBPTsn6OkU1bvSag0NSZug==
X-Google-Smtp-Source: ABdhPJynp5+FxeGECOIttGZMHkFLTgnPXv32Y6n64K/4v4HDOsUQ1brucRflNmhHdgLmUmfggxKPqA==
X-Received: by 2002:a17:90a:800c:: with SMTP id b12mr4837503pjn.179.1601676933444;
        Fri, 02 Oct 2020 15:15:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id bt13sm2640065pjb.23.2020.10.02.15.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ubsan: Disable UBSAN_TRAP for all*config
Date:   Fri,  2 Oct 2020 15:15:27 -0700
Message-Id: <20201002221527.177500-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002221527.177500-1-keescook@chromium.org>
References: <20201002221527.177500-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Doing all*config builds attempts build as much as possible. UBSAN_TRAP
effectively short-circuits lib/usban.c, so it should be disabled for
COMPILE_TEST so that the lib/ubsan.c code gets built.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 1fc07f936e06..b5b9da0b635a 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -14,6 +14,7 @@ if UBSAN
 
 config UBSAN_TRAP
 	bool "On Sanitizer warnings, abort the running kernel code"
+	depends on !COMPILE_TEST
 	depends on $(cc-option, -fsanitize-undefined-trap-on-error)
 	help
 	  Building kernels with Sanitizer features enabled tends to grow
-- 
2.25.1

