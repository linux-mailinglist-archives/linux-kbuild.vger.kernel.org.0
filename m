Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B8740887E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 11:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238816AbhIMJrg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 05:47:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:54210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238829AbhIMJrb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 05:47:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476E06101B;
        Mon, 13 Sep 2021 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631526375;
        bh=dMPPuDRHM65WeGIQqOCXIclpyoW2nZck2KjQpwVUN4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cQqEUn16KT7WkEYmxHTy7B/eQWAeqGW5pAdU1YJIUxrX73wrEYkzkd4/XsBk45dv9
         /3eEy3clln58uY1J7VfuI9PI0a9DJvOzZWrZQDm8kQ2pllOlM2+dP8lQknujg57Z3U
         5gR0k1VUfhh663AUccm/9zIEpVca5vegVlIrLA3s=
Date:   Mon, 13 Sep 2021 11:46:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <YT8d5a6ZVW7JlsRl@kroah.com>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
 <20210913093256.GA12225@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913093256.GA12225@amd>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 13, 2021 at 11:32:56AM +0200, Pavel Machek wrote:
> Hi!
> 
> > >>  config WERROR
> > >>         bool "Compile the kernel with warnings as errors"
> > >>-       default y
> > >>+       default COMPILE_TEST
> > >
> > >That seems reasonable. It very much is about build-testing.
> > 
> > That and 2 more things IMO:
> > 
> > a. having developers be responsible for build warnings, not just
> >    build errors
> > 
> > b. having maintainers merge them more like they are build errors
> >    and not just some warnings that can be overlooked.
> > 
> > I don't see enough of a. or b.  :(
> 
> Do we really want developers treat warnings as errors? When the code
> is okay but some random version of gcc dislikes it...
> 
> Plus, there's question of stable. We already get ton of churn there
> ("this fixes random warning"). WERROR will only encourage that...

I will not be backporting this patch to older stable kernels, but I
_want_ to see stable builds build with no warnings.  When we add
warnings, they are almost always things we need to fix up properly.

Over time, I have worked to reduce the number of build warnings in older
stable kernels.  For newer versions of gcc, sometimes that is
impossible, but we are close...

thanks,

greg k-h
