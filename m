Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871082CCB29
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgLCAqI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgLCAqI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:46:08 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6F7C061A49
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:49 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t18so193099plo.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=momj+ASHgDWNBxEWCpbYT3s2xBxAd5KeNj7yfrmXJ4k=;
        b=J+UiHoEEgerhs/xVR+QdCDPPoxkgHW42MgeCYEP5ZKzf7Vvn4mu1VCtSWvVzwKZB05
         9IhO2K9pkWg0FX/FPQ0tO6LB9WweTORmn2J7OMPzRrV3rXwlbo5KSyQXc/GWZ07BB0TK
         Tfab9wMOgBc1pnTcUA0ZNC1ry+dKUWeoPPeNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=momj+ASHgDWNBxEWCpbYT3s2xBxAd5KeNj7yfrmXJ4k=;
        b=oYK3lQwFPjrjPNzgG0RkJazlHtczdunrgKDuIduIaEQ9/phGueQsoycp5QsNJkZbay
         lUWYIg5KWYM9b3vz/ii9g74GNOfJWWAwPSNaJo3kKhscDY+TRiaGBXSMUrTk42e2jk4p
         9hVASLDlcy0bvb1W94fPF9MhSr20R2Y0u8U6p0vBv+6PG2gsyLld50aTEnNpfvKJpRCD
         qs8wA2QhNYSPENO3l6d1CWNJsDMc68txNSR9VsDfaiOFdqyko7G2QoY4n4TIVh6W6GXb
         Tng3jAMDpjBMunC9YC7Y2lFQuF5GMJZLviT+7p3EmdMY8zJdO44n6NlPRbzlw+82fEoC
         msww==
X-Gm-Message-State: AOAM533GWOPWy98xgdLApt8200+figTLNnLQmhrfI1bvDyiAuVFRyez3
        5G3PDHva3Q+EY+0CRGLlRgHpLg==
X-Google-Smtp-Source: ABdhPJz7IimuMbq8NNgEZKFOWjQEbfSl4zo0aZDs3ZgHm/hyGTkmgZC5RM5dMSOQOdUowmLVJIq/ug==
X-Received: by 2002:a17:90b:3355:: with SMTP id lm21mr527519pjb.115.1606956289515;
        Wed, 02 Dec 2020 16:44:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y25sm231806pfn.44.2020.12.02.16.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:46 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
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
Subject: [PATCH v2 3/7] ubsan: Disable object-size sanitizer under GCC
Date:   Wed,  2 Dec 2020 16:44:33 -0800
Message-Id: <20201203004437.389959-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=21c865d368e205cfd26bd9d13e0f9f89f171384b; i=L4GcuPKCev5MNqQc0RCGb8oc+Sj9uj4IyIr1ANDlbWc=; m=PBJG7bVEbrc41Z+BEj2wLGOXm7yrIzzNY1qvha6xoa8=; p=jGS9rva7ilUpon3Qx1DX+0oWwKBNC+al8p6dZtl31EM=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPMACgkQiXL039xtwCbIUQ/+OkV vjffTNt2uERV7vMRuPwpM9Ir02sn2AX3wrTDxTrLYtPKqDQ6Nv0c6If7kt/ix1Z9j6iPVez1vmnT7 N3DCeyorgb97zQFmYBlpuyEHsIix9bA2anZmEsjoB1l0ipZbjuPM2TiXeD+MppW23DcZkVyrhwXe5 ztJkUJ4H2yark/GEYoKKRqU99wCbLNkcd+UqpOEKZramY8SmOXaWZOrARgDtd9mEWSvQ5ZU0cFQxV cmki5bWEQ4VjPbJNFbICL19bQ67TR/fhZk8BkUbW0+YNozVxOCgkRA64YO+CZHnw3kUq5fcP0y/Dl VVqQ1VAvlBXwSZxjrbZxfdY7PtVGDkIUwuWqECT0wgn0Uv8KYFVPABjnI379t1+JrPiQ338pGRCIJ yL5xJCYeuZOKTFinRoko5o9qODMwVFpx/3CAmafnoItqQ9mrD9Oo/a3sCliuPaXSD1Dn6+ISruKdm s1Tv5MeTaEMHnAnsCgr7ZPExglNSNE2hhlciEJhqcOsad6qivPuIoeVt1qIQxfHMhZv56BH15ndSZ zvn0HcwnYU87shYo5CmlStdL4qMi+TaX9t8zUmiAt4mgDgWnzcD9h04B5WKo6Uf0+AaaDUjJd+ZmZ BuA2kGzeINXkrbt45W/br+R2YMpnWBFPx8go/Psajs84OaxalYGLC2AGy0MzUeVQ=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC's -fsanitize=object-size (as part of CONFIG_UBSAN_MISC) greatly
increases stack utilization. Do not allow this under GCC.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 05147112b355..4190a99b1eaa 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -113,6 +113,9 @@ config UBSAN_UNSIGNED_OVERFLOW
 
 config UBSAN_OBJECT_SIZE
 	def_bool UBSAN_MISC
+	# gcc hugely expands stack usage with -fsanitize=object-size
+	# https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
+	depends on !CC_IS_GCC
 	depends on $(cc-option,-fsanitize=object-size)
 
 config UBSAN_BOOL
-- 
2.25.1

