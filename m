Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DD53EF13D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 20:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhHQSDk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 14:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhHQSDj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 14:03:39 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8801AC0613C1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 11:03:06 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d17so25685062plr.12
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6lswvnaMe+F2ActgzyrTI+M1fqtFvqoQVjkUc9W7PnY=;
        b=hc7K+FgwfduIEmInLkmKx4tsC08A3U83T2TJQO0/iX6/ecQCNh13QQgvwv0g0aZr1P
         C/PhRqHCrMbqua/jd3Gqrx5zn7Ac6f0ZVGmGYVnGq0D+l/CJHNWvNk//tMBgWo7EHI+1
         uVPiSbNmQcPMA1daymyGJxIa1nRAl4BzsDXq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6lswvnaMe+F2ActgzyrTI+M1fqtFvqoQVjkUc9W7PnY=;
        b=rKHGCnOYRKBZehiVxkXi6R7kkrCiKT5yH8E+ifDJWHY0ftkfL1/nrHGpDhrEkve0Rl
         v/Kp1AO637kt81UI+KCujqoI0FoQzXgQMHMmEVAcSDhjnigT7ns/Y04ki4MDg8SU2vu8
         93oXrcbnciw13ZDE5eJ2JSi16gB1Y9F+WAOhwlKKYYah7LRJA1xxKv8hIY4S9U0AjLJU
         esWnf4kDBxSK6QWLkh61Vww5Pvd5dEsw3NjID6xZUCLd4vcJ/ETUfiEcAukBEj8iDOAX
         VwUvtB/qLxWyulU4aboylaLwzuVdp9aYwGjXTZeOpqJBGQ/KDMiWIaHXjD+sNF/0brRh
         XYSg==
X-Gm-Message-State: AOAM5317F35HeXSS0bUAXpB9de9kA/kwtQJVK9qg5V/UaqUf+WgT30+7
        FBh9zHM5R+fuSYZSJY3+InWLhQ==
X-Google-Smtp-Source: ABdhPJzlKS3i2gojyo1afM12URywM46gRjxX8qksMOLbaaGKZX42XyMQ6PQLAlQx4xJTVC0G6dboKg==
X-Received: by 2002:a65:6398:: with SMTP id h24mr4682422pgv.367.1629223386078;
        Tue, 17 Aug 2021 11:03:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g2sm3325769pfi.211.2021.08.17.11.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:03:05 -0700 (PDT)
Date:   Tue, 17 Aug 2021 11:03:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
Message-ID: <202108171056.EDCE562@keescook>
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
> If you/Gustavo would prefer, I can upgrade that check to
> 
> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
> 
> I was just trying to save a call to the compiler, as that is more expensive
> than a shell test call.

I prefer the option test -- this means no changes are needed on the
kernel build side if it ever finds itself backported to earlier versions
(and it handles the current case of "14" not meaning "absolute latest").

More specifically, I think you want this (untested):

diff --git a/Makefile b/Makefile
index b5fd51e68ae9..9845ea50a368 100644
--- a/Makefile
+++ b/Makefile
@@ -859,11 +859,11 @@ KBUILD_CFLAGS += -Wno-gnu
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
 KBUILD_CFLAGS += -mno-global-merge
+# Warn about unmarked fall-throughs in switch statement only if we can also
+# disable the bogus unreachable code warnings.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough -Wno-unreachable-code-fallthrough,)
 else
-
 # Warn about unmarked fall-throughs in switch statement.
-# Disabled for clang while comment to attribute conversion happens and
-# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
 KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
 endif
 

-- 
Kees Cook
