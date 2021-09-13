Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A4A408963
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 12:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbhIMKwv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 06:52:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238690AbhIMKwu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 06:52:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF84960F12;
        Mon, 13 Sep 2021 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631530295;
        bh=IhPIOl/NMzmrDUdQKEmqfIrz63UGwWOSS7/ZZTB+y0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GlRcHrWvyTlfET/uSqrfMr4HviMxaajNjqPm7yNSwGqV3rPiaepZNfvg6vJv0YJJF
         JZ6N8P/cODT+bI7R7rdqlhe/hratbkSowmt56+vYba/WMgbTXjWDDCO6iVfYGeqtUW
         395/rvJ8KL756rVGr1g6tD7ADX4qcz2iqFxRYkPk=
Date:   Mon, 13 Sep 2021 12:51:33 +0200
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
Message-ID: <YT8tNfXkbFmGtYbe@kroah.com>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
 <20210913093256.GA12225@amd>
 <YT8d5a6ZVW7JlsRl@kroah.com>
 <20210913100230.GB11752@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913100230.GB11752@amd>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 13, 2021 at 12:02:30PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > Do we really want developers treat warnings as errors? When the code
> > > is okay but some random version of gcc dislikes it...
> > > 
> > > Plus, there's question of stable. We already get ton of churn there
> > > ("this fixes random warning"). WERROR will only encourage that...
> > 
> > I will not be backporting this patch to older stable kernels, but I
> > _want_ to see stable builds build with no warnings.  When we add
> > warnings, they are almost always things we need to fix up properly.
> 
> Well, everyone _wants_ to see clean builds... unless the price is too
> high.
> 
> > Over time, I have worked to reduce the number of build warnings in older
> > stable kernels.  For newer versions of gcc, sometimes that is
> > impossible, but we are close...
> 
> You clearly can't backport this patch, but for 5.16-stable, you'll
> have it in, and now warnings are same as errors... and I don't believe
> that's good idea for stable.

I do, it will force us to keep these trees clean over time.

And it will be in 5.15, not 5.16 :)

Worst case, we disable it in 4 years when gcc 15 or so generates so
many errors we can't resolve them in this old kernel.

thanks,

greg k-h
