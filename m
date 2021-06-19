Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8B03AD6CF
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jun 2021 04:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbhFSCr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Jun 2021 22:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhFSCr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jun 2021 22:47:59 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0923DC061574
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021 19:45:48 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id p13so9218536pfw.0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021 19:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zAYV7wMM7Ezv8dDkbAjr47uPXYKTsdhdBtQn9j9OFnQ=;
        b=Q2OJ2V/f8FZEH317J3bz6jJZxIGjbRaNkKQIRx821VhRbFsIHrPq+Zay4VGnDoiem3
         h5LzzP3EtTb95X3yOnHsnK0DXz+ppJPbmxOjwonoz6Vp5YBhvZqOmANEITrlb7cwBX66
         OHR4Cr7BDqNiJ6hJrDmkmpm82iFxhnS7Uk1do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zAYV7wMM7Ezv8dDkbAjr47uPXYKTsdhdBtQn9j9OFnQ=;
        b=IwhCRiAiyi1Gbjjut/aXZJLceoIuO+1lthNqTsgH4QRafSsmwckEMQSpB7/nl7GPTg
         4nVIMLCAca4mOdwTtZ6OxEl9M2eoXDr1RIXj3Xf32ULI8ilX5JY0fzY3cFTBRrQwPr7W
         ttAj9914RzHbCmlqddwUUOB7uXcr/SOr7qKSAFgY5WpKRRETYI2fYGvORaeMKokjcCJV
         BZIaRJ9I+ktzBG5HBmiwkAZ2EEQf4JLOMZfNJFn8SM5hHKTNadgzbrJLrNxTAx+LBbdr
         Ptdg5oIqe9FTvMcE8tsqlJsTnvB1KTPvZJAZn//sEIATUx9HoNHJZfannvyoztOLGsJi
         GxmA==
X-Gm-Message-State: AOAM530mVWdqwyNe5bKDtcRVGJzXzuQFXoLdamM+/HNP4WRT9qU1eHHQ
        OstwjjSHvgNTCp0DkpzvXaXJlQ==
X-Google-Smtp-Source: ABdhPJweZiwRILILciRX6LD55JeoGO8LssAH/WdscRnLKM2PzFFoKdbgNhnxUUkHKzp2FHsJS7btNw==
X-Received: by 2002:a62:6581:0:b029:2ef:bcb1:c406 with SMTP id z123-20020a6265810000b02902efbcb1c406mr8009133pfb.28.1624070747426;
        Fri, 18 Jun 2021 19:45:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h21sm8559917pfv.190.2021.06.18.19.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 19:45:46 -0700 (PDT)
Date:   Fri, 18 Jun 2021 19:45:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 0/2] no_profile fn attr and Kconfig for GCOV+PGO
Message-ID: <202106181945.AC10BF38ED@keescook>
References: <20210618233023.1360185-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618233023.1360185-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 18, 2021 at 04:30:21PM -0700, Nick Desaulniers wrote:
> When we say noinstr, we mean noinstr.  GCOV and PGO can both instrument
> functions. Add a new function annotation __no_profile that expands to
> __attribute__((__no_profile__)) and Kconfig value
> CC_HAS_NO_PROFILE_FN_ATTR.
> 
> Base is
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/clang/pgo.
> 
> Nick Desaulniers (2):
>   compiler_attributes.h: define __no_profile, add to noinstr
>   Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO

Oh, awesome! Thanks for the fast work on this. If there are no objections,
I'll apply this in front of the PGO series and put it in -next.

-Kees

> 
>  include/linux/compiler_attributes.h | 12 ++++++++++++
>  include/linux/compiler_types.h      |  2 +-
>  init/Kconfig                        |  3 +++
>  kernel/gcov/Kconfig                 |  1 +
>  kernel/pgo/Kconfig                  |  3 ++-
>  5 files changed, 19 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 4356bc4c0425c81e204f561acf4dd0095544a6cb
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 

-- 
Kees Cook
