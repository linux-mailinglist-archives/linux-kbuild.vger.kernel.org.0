Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00754281E13
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 00:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJBWPc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Oct 2020 18:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgJBWPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Oct 2020 18:15:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A866C0613D0
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2020 15:15:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 34so1714654pgo.13
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2020 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0SUsmWACvD3dNMBDG6SPv9xQ8I4+FrehwcPDr9x9nQ=;
        b=NspRsNBoQmAwlT7ORJjoYtbzCkS8Mem1PHd5ELyCp11qlcVrFG/e9NIs9mzirqBWRb
         sy2KeczTIFS+05DESF5CXcTDsPhucuYeI88jXAgsYuq8GCfBtZ3/bX0BRQ7aw9M6uYNy
         uz+algmJ3/4kBFBTVxv4JjL7VqNnzzFzjRQ0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0SUsmWACvD3dNMBDG6SPv9xQ8I4+FrehwcPDr9x9nQ=;
        b=RjIwrqGjJnWMbBNQ8EJuVQLl8HIHSYrBzXlE6ReRZc39l+ZlaVFpsPjyQ/F0j9ghSW
         RpFS4v9sJrBUjOcUM+RAkG/rE/kmIFUTQweF2t1+jkwJxZN1xs3mIYGfmAFSbk60qlao
         hLXHVwQeP9eYCbmucb6i1ZvdY4R0d3lfgTVkH3tZj2KhmXTo6DTS0zLG46G7WHFQ3G7f
         Sv6hIJItb6h5FeAgMdxfX8ztsD/S79/9tdEp9rC7MIf4MD97JrctEFt3sRSaQZOv6th6
         3PYPuuJyEtq6Dh33Sg7XyHrbaw6CTnP9YEf4iNuVrxsqxYUQEoRQ1fZIgiXJ+efsD3rD
         qY4A==
X-Gm-Message-State: AOAM530hKBiD/YnyCTFBn9T3uBR9co7Zo6qDXzd0/j0hbnNpuYkizWLx
        BMzB8umlbXhUKXFfp9ykdnPA0w==
X-Google-Smtp-Source: ABdhPJwUyVVoH5EXUD3PrxRHDmHm6dp6faop7SkvnztMQv9qaPMVwZugN89ctYIKMniZcrQvA9CcJQ==
X-Received: by 2002:a63:794e:: with SMTP id u75mr4097073pgc.233.1601676931560;
        Fri, 02 Oct 2020 15:15:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k4sm3349568pfp.189.2020.10.02.15.15.29
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
Subject: [PATCH 2/4] ubsan: Disable object-size sanitizer under GCC
Date:   Fri,  2 Oct 2020 15:15:25 -0700
Message-Id: <20201002221527.177500-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002221527.177500-1-keescook@chromium.org>
References: <20201002221527.177500-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC's -fsanitize=object-size (as part of CONFIG_UBSAN_MISC) greatly
increases stack utilization. Do not allow this under GCC.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index c0b801871e0b..aeb2cdea0b94 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -104,6 +104,9 @@ config UBSAN_UNSIGNED_OVERFLOW
 
 config UBSAN_OBJECT_SIZE
 	def_bool UBSAN_MISC
+	# gcc hugely expands stack usage with -fsanitize=object-size
+	# https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
+	depends on !CC_IS_GCC
 	depends on $(cc-option,-fsanitize=object-size)
 
 config UBSAN_BOOL
-- 
2.25.1

