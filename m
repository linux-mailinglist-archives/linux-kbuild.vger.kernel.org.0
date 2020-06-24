Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7D9207D4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406555AbgFXUd1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406549AbgFXUd0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:26 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08718C061799
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:26 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id w3so2506322qvl.9
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wwQ0FnciQOJFFrw9pZwNR1174M1Ii6KWK+Cwx1DZR0E=;
        b=D5jMBEz7Lm5U+UfoGelxUyQqWOYc6Z+dLXzaDR1SoyT3D0mSDtKUxokHJAk6ca9TzV
         4mueVog2jOcmVS+jVjlFOcthTwG/yiHbkE9KBrSSXn5wKv43C8TlR+Cgbt0KoNrOQO9O
         owGlgSWarEMzSBvxtlWzfcQXQKNdv2ZE3V35XOQO9JLobrLz8Yl2Oqg2ofnVQSUcX7cV
         WTnphEXJJam/USPXIaROhEV6UnjgXvvwGpug+fLsCxrQtPsDK3qYgboxAvYEWoFvxtr6
         m6eXCYH8PEMH1MvefhDCIQOQ3Zw+2VmFPtKpPIPHPwUqkF/2Zm2/4J+lIul1mO034S+9
         DBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wwQ0FnciQOJFFrw9pZwNR1174M1Ii6KWK+Cwx1DZR0E=;
        b=iI85t0sXZfug6xmgf+HvwDRGFcls0yrlHKF4Fah04nuvhQhQGViT4KzalGGD9ldLqW
         ENqPBYuIN1CXR313HQ+uFKgX6SiSCcX7fEqWp/V0KJdvxGQTPnHGVpCBkvImc4VW5KMX
         UlIlAchBopW9QXWRlBeH7VCQnj84wNa4KGsEnhbNp7JtlQNDDvXvsBI6+EHL/X+bOo7Z
         97Mmw5/G/XYzYo440rEUNc2vbLSGNn710lqFh3AECbh0kEsIPMtZiZWUPfi+5CZA/WJH
         SsKn1fbjwLY2h4TO1Qn3arJ76/X8PccKZlrUhm14TGVec7DJbLqplOaIXmrSW817eL9o
         u4hg==
X-Gm-Message-State: AOAM531t/G8FW2gjMWyP5aLuzxuDcgN4G/TfAlaIlzMui3uEjZ93bvYN
        UQoYBfYiP9CVxcBUICAFe6ckdCOzXAr/I2gSTjA=
X-Google-Smtp-Source: ABdhPJxdY2l3AI8wfRrd83iTVnOoqT0z2xypmyGa8SBbcpKlWTHBGxwu1psE5fER0U56oerLL9wNd1erMNW/Ru+uB28=
X-Received: by 2002:ad4:4cc1:: with SMTP id i1mr3207160qvz.249.1593030805093;
 Wed, 24 Jun 2020 13:33:25 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:53 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-16-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 15/22] drivers/misc/lkdtm: disable LTO for rodata.o
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Disable LTO for rodata.o to allow objcopy to be used to
manipulate sections.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index c70b3822013f..dd4c936d4d73 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -13,6 +13,7 @@ lkdtm-$(CONFIG_LKDTM)		+= cfi.o
 
 KASAN_SANITIZE_stackleak.o	:= n
 KCOV_INSTRUMENT_rodata.o	:= n
+CFLAGS_REMOVE_rodata.o		+= $(CC_FLAGS_LTO)
 
 OBJCOPYFLAGS :=
 OBJCOPYFLAGS_rodata_objcopy.o	:= \
-- 
2.27.0.212.ge8ba1cc988-goog

