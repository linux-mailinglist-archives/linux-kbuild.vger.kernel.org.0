Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF55540314B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 01:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240862AbhIGXCD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 19:02:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhIGXCC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 19:02:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6092861102;
        Tue,  7 Sep 2021 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631055656;
        bh=kHnfxPhEOAnwY1MUQw8NYYGGLbqdN/3pOfbI6jN+LBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R5gbCsMig6H84rEHqOOirst5pvNsOjwcy1ZPOyheoeknOJPA8B4f/FYmS0CgxzHBf
         o6HdDds2j/15RmnAz/dBUT0WCI0I+pYDEqA9l9QOxjrZfeMXimvsJ9w5uBF2rZHEQO
         AWGbQR6VrcGr/JdVaaH/L2cF+Ff0J7SMaBJSUBSwVv2kXEVrSJpy6wEVx5t4BMrAqW
         LlJw8BF4aa1VQoiXooafqZFzSU0y14qxGELzzwkYh+MRaM2u8eFvBg8b0vGCDwrlhN
         t9+Clxgg54rkQKvHreGlzeYAjpFeZADF4WmB440qldtDZFyEkqS1BIO295HtBZzQB/
         HpXso1e4caS0Q==
Date:   Tue, 7 Sep 2021 16:00:51 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
Message-ID: <YTfvI2it1G2yBiD/@MSI.localdomain>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 08, 2021 at 12:14:19AM +0200, Marco Elver wrote:
> On Tue, Sep 07, 2021 at 01:30PM -0700, Nick Desaulniers wrote:
> > On Tue, Sep 7, 2021 at 12:16 PM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> [...]
> > > I'm not going to revert that change. I probably will have to limit it
> > > (by making that WERROR option depend on certain expectations), but
> > > basically any maintainer who has code that causes warnings should
> > > expect that they will have to fix those warnings.
> > 
> > I'm not 100% against it; I think it could land in a more useful
> > variation. But it would be good to discuss that on-list, and give it
> > time to soak. This is a conversation we should be having with CI
> > maintainers IMO, and folks that maintain the build infra, at least.
> > I'm happy to kick off that discussion with this RFC.
> 
> Here's a datapoint: I had to disable CONFIG_WERROR on a bunch of syzbot
> instances which started failing because of -Werror [1], because syzbot's
> time is better spent on fuzzing, and having the odd warning in some
> subsystem penalize fuzzing of the entire kernel is not appropriate.
> 
> [1] https://github.com/google/syzkaller/commit/e096c0a2a414e487412c9669426780ce5acdde9d
> 
> Getting the kernel built is a hard requirement for any sort of runtime
> testing. Once the kernel is built, runtime testing of various subsystems
> can proceed in parallel. A single warning in some odd subsystem
> penalizing the _entire_ kernel's testing progress is inappropriate. The
> severity of a use-after-free bug found by runtime testing is orders of
> magnitude more severe than some "unused variable" warning. Now such a
> warning would delay finding bugs at runtime on many CI systems that
> haven't yet disabled the warning.
> 
> I'm predicting most distributions and runtime-focused CIs will disable
> the warning.
> 
> I have formulated this in the form of a patch below, that might move
> this new Kconfig option towards its appropriate usecases by default.
> 
> The intent is not to dispute the usefulness of -Werror, but select the
> appropriate usecases by default, limiting friction for all those who can
> do little more than say CONFIG_WERROR=n.
> 
> Thanks,
> -- Marco
> 
> ------ >8 ------
> 
> From: Marco Elver <elver@google.com>
> Date: Tue, 7 Sep 2021 23:12:08 +0200
> Subject: [PATCH] kbuild: Only default to -Werror if COMPILE_TEST
> 
> The cross-product of the kernel's supported toolchains, architectures,
> and configuration options is large. So large, that it's generally
> accepted to be infeasible to enumerate and build+test them all
> (many compile-testers rely on randomly generated configs).
> 
> Without the possibility to enumerate all possible combinations of
> toolchains, architectures, and configuration options, it is inevitable
> that compiler warnings in this space exist.
> 
> With -Werror, this means that an innumerable set of kernels are now
> broken, yet had been perfectly usable before (confused compilers, code
> with warnings unused, or luck).
> 
> Distributors will necessarily pick a point in the toolchain X arch X
> config space, and if unlucky, will have a broken build. Granted, those
> will likely disable CONFIG_WERROR and move on.
> 
> The kernel's default configuration is unlikely to be suitable for all
> users, but it's inappropriate to force many users to set CONFIG_WERROR=n.
> 
> This also holds for CI systems which are focused on runtime testing,
> where the odd warning in some subsystem will disrupt testing of the rest
> of the kernel. Many of those runtime-focused CI systems run tests or
> fuzz the kernel using runtime debugging tools. Runtime testing of
> different subsystems can proceed in parallel, and potentially uncover
> serious bugs; halting runtime testing of the entire kernel because of
> the odd warning (now error) in a subsystem or driver is simply
> inappropriate.
> 
> Therefore, runtime-focused CI systems will likely choose CONFIG_WERROR=n
> as well.
> 
> The appropriate usecase for -Werror is therefore compile-test focused
> builds (often done by developers or CI systems).
> 
> Reflect this in the Kconfig option by making the default value of WERROR
> match COMPILE_TEST.
> 
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 8cb97f141b70..11f8a845f259 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -139,7 +139,7 @@ config COMPILE_TEST
>  
>  config WERROR
>  	bool "Compile the kernel with warnings as errors"
> -	default y
> +	default COMPILE_TEST
>  	help
>  	  A kernel build should not cause any compiler warnings, and this
>  	  enables the '-Werror' flag to enforce that rule by default.
> -- 
> 2.33.0.153.gba50c8fa24-goog
