Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422BE2CF68D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 23:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgLDWDO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 17:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgLDWDN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 17:03:13 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8048C061A52
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Dec 2020 14:02:27 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id hk16so3974223pjb.4
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Dec 2020 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=enW7VRg0zeMyiDIIOokOnpbP5Go5lgWeBVKjANCM8QE=;
        b=WSBivQGw0NWLYaFd2OPXxdWfo5/ZEqUNT+h7R43nqoDXNRmh7641AbBNX9GjdmhVaP
         ovd+v6GiD5CTuIZenDiMSBDlxmYd6x6o7x8tQbNsw8CbHcRoBB6wz5dQbLh0Hrq4yA8c
         RoGXszwIKaMlZbIQYlcz0HrYcstfZkVfTomvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=enW7VRg0zeMyiDIIOokOnpbP5Go5lgWeBVKjANCM8QE=;
        b=jBDPCyyXnbTeIR8gUnIHxAOPh0pnkuWiCSwxM/5y0pA1rObHHY+tJjhGCRr+zhwpU/
         Xw7gNNiCyxwDr/10ZpfobSKipgDS7WdXm03OiJG8SD40ebhjuZDIwV1z9zO7vLHZw6ld
         LvEO/qsGqS7CQqbqUeJQ0uXwT+wtHqzv5As6JjXfPpFdcuzjeqHe36ccbQfKb/nInd5F
         QWMGUV/ikwfe8mnb/C/Qq/7P/mtY04q4k2yNQD2TSGk8D7+8kbMBE+LA2dy9zycbrO3I
         fCjI3YppFlhN4jfKV48uHx9wivEhqEI1t8hGPKZLWQTWZ6OMot27dM0+tTWB2EBUigVZ
         eCug==
X-Gm-Message-State: AOAM532PDQhb1HNjaWiIfLMUp3ZtA0sZ6D2UGHF9nzKTGWjHEW8RCFFh
        G9nPvn0Rv/Hlox6yjPPoNYlZlw==
X-Google-Smtp-Source: ABdhPJwU6a9D2gVWjKe1CROF33gGSIaZEj8/GDUhF/uRcH+xF+acQH0ncmbYv1G3SVC4Cka04+puNw==
X-Received: by 2002:a17:902:6b:b029:da:725b:fcea with SMTP id 98-20020a170902006bb02900da725bfceamr5727914pla.16.1607119347328;
        Fri, 04 Dec 2020 14:02:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f92sm3353946pjk.54.2020.12.04.14.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 14:02:26 -0800 (PST)
Date:   Fri, 4 Dec 2020 14:02:25 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
Message-ID: <202012041402.97F582B00C@keescook>
References: <20201203125700.161354-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203125700.161354-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 03, 2020 at 09:57:00PM +0900, Masahiro Yamada wrote:
> Linus pointed out a third of the time in the Kconfig parse stage comes
> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
> and directly testing plugin-version.h for existence cuts down the
> overhead a lot. [2]
> 
> This commit takes one step further to kill the build test entirely.
> 
> The small piece of code was probably intended to test the C++ designated
> initializer, which was not supported until C++20.
> 
> In fact, with -pedantic option given, both GCC and Clang emit a warning.
> 
> $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
> <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
> $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
> <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
> class test { public: int test; } test = { .test = 1 };
>                                           ^
> 1 warning generated.
> 
> Otherwise, modern C++ compilers should be able to build the code, and
> hopefully skipping this test should not make any practical problem.
> 
> Checking the existence of plugin-version.h is still needed to ensure
> the plugin-dev package is installed. The test code is now small enough
> to be embedded in scripts/gcc-plugins/Kconfig.
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com/
> [2] https://lore.kernel.org/lkml/CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com/
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
