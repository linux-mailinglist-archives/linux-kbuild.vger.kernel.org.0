Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3573B13D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jun 2021 08:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFWGUN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Jun 2021 02:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhFWGUM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jun 2021 02:20:12 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8893FC061756
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jun 2021 23:17:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id k5so912703pjj.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jun 2021 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tz2RBdudba5q9p5CtX8u2n7Y/c2CX7BU/uPpUa5EceU=;
        b=IfQNjiTjlHeOtyJvGTlaSnVIszGJHPIXd2ZLetG7fRg3/1qxDfxJBGaFvglBkjs0A9
         aOMIVfHWFPggoGKFJebTQaAcngMdomXFzJAZ41RUF+nNb5iUr+j1EYwDMOdnmcyBzx+S
         UXKJ+LYCQxpE3JB9b/Xuh6JN1PZmT/I96wE8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tz2RBdudba5q9p5CtX8u2n7Y/c2CX7BU/uPpUa5EceU=;
        b=tUs0NNHhEikbcb4XU8EnQm2sk5pBIWx2HbiNLs6anJ8woIiONo512YhA0le1thTNXX
         eHQX07P7JIIbgN8HzwDH2340Pklji3bTw29J7dZ5NNSvh+fmPUTZEukKT85yvHFTsFJk
         cKwQ35OpsWNLH0+ipjBqxiWFjfmPcQFElKbl8gQtwO2DHs0l0eQUuFlKcRaCz9cv/QLS
         mAnS5wxa+vbZ+UbP44k4h5X4XiSL+LY3uqpLWncNMl5e9xALT0houI1ETQaYba9/TBnS
         QKcosuMyJlXRjXUeOoK3IJ31bST0zCLcqOcqgcf9L7s8a9rE84dNnQAikbObgT1lJXw2
         YfmA==
X-Gm-Message-State: AOAM532bxhfaEBTfVO+6ukx22qvuU8PobKLKxusxeQF73Mwl65RSy3Aa
        HXiN10rll/eAivOHFuLpKsTL+Q==
X-Google-Smtp-Source: ABdhPJzn0CH+45cTEhcoIwl87qkwPrIemELQImLMLCSKtRYhh9WOlPotlexcZ8zGNKPJxyuXXn3TWw==
X-Received: by 2002:a17:90b:2241:: with SMTP id hk1mr7714688pjb.97.1624429074073;
        Tue, 22 Jun 2021 23:17:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z18sm1113249pfe.214.2021.06.22.23.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 23:17:53 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org,
        Nathan Chancellor <nathan@kernel.org>,
        Fangrui Song <maskray@google.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Bill Wendling <wcw@google.com>, Arnd Bergmann <arnd@arndb.de>,
        johannes.berg@intel.com, clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Martin Liska <mliska@suse.cz>,
        linux-toolchains@vger.kernel.org, x86@kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/3] no_profile fn attr and Kconfig for GCOV+PGO
Date:   Tue, 22 Jun 2021 23:15:50 -0700
Message-Id: <162442894704.2888450.8087873021886781652.b4-ty@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 21 Jun 2021 16:18:19 -0700, Nick Desaulniers wrote:
> The kernel has been using noinstr for correctness to politely request
> that the compiler avoid adding various forms of instrumentation to
> certain functions.
> 
> GCOV and PGO can both instrument functions, yet the function attribute
> to disable such instrumentation (no_profile_instrument_function) was not
> being used to suppress such implementation. Also, clang only just
> recently gained support for no_profile_instrument_function. GCC has
> supported that since 7.1+.
> 
> [...]

Applied to for-next/clang/features, thanks!

[1/3] compiler_attributes.h: define __no_profile, add to noinstr
      https://git.kernel.org/kees/c/380d53c45ff2
[2/3] compiler_attributes.h: cleanups for GCC 4.9+
      https://git.kernel.org/kees/c/ae4d682dfd33
[3/3] Kconfig: add ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
      https://git.kernel.org/kees/c/51c2ee6d121c

Note that I've tweaked the series slightly to move the PGO Kconfig change into
the PGO patch.

-- 
Kees Cook

