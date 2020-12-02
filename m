Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBB32CB1E1
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 01:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgLBA4b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 19:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgLBA4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 19:56:30 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65149C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 16:55:50 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id x24so113762pfn.6
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 16:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UzsHy5/emXeVWru8+uPi1WYeTWfpYGo0ObdkjXASAEg=;
        b=VB4F3Sf0vy55RucLl+hsq9yR6VwaVxld23LtTP91FownMD+jmpaoHKAJhvLf4PzotJ
         mNcjwLqMNp0AzVyDm7Ma4QrjZbzgGbNV0xdChEdw7dFobD4RqrTsard/ILEuKbYiar6+
         TtZvYLTPTUWTd0oguKsvUpq5xHVvuHNNbuhwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UzsHy5/emXeVWru8+uPi1WYeTWfpYGo0ObdkjXASAEg=;
        b=ehtHK88oy6qzwQbIPfmfl+OLSJwn99QZ2Os9QaYz1PDppYp9rUC01zA1nttC4wevdG
         kFuKGfcwOsESzVkkRLqTkWsCgFore+Poi3GXl/0k5JJN3D6+3rTbvKpbi6dMpWKGPNij
         925SYggCDMKeDvsDf1tZEI6Z4+DgzHfbmXoF/11GVkLrsKLkD+maQt0pqNNvj/7c1DFt
         BHO+mdQ/bdrUT5hRGjRRxve2oqu0m8ol1QyQI9dORzkA6EDQOhpDV//YAgFc7N8s9sag
         /QZVEdFHgiY+xQuHrZXPcD6WUESsEc8oWuWZMFNlcsZC8DhurdshNv+UKzxeRsKLULVe
         6D0w==
X-Gm-Message-State: AOAM531nh8t6oP6kfxLoTWgwPrORZ28TBAFSpvfg5Ymaapnt1LIVOFwD
        d5ls8z9rrgBQ7i1Kcvb4z5WU8Q2eK69JBNzx
X-Google-Smtp-Source: ABdhPJws+QKJO6n7SVqw5640UqBCNIBdJwEC/DsjKgv0EDsRIBPaxAE1l1D/IAkF+11qMiRd3gMWBQ==
X-Received: by 2002:aa7:92c7:0:b029:197:e36f:fc5c with SMTP id k7-20020aa792c70000b0290197e36ffc5cmr45108pfa.62.1606870549891;
        Tue, 01 Dec 2020 16:55:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f15sm91816pju.49.2020.12.01.16.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 16:55:48 -0800 (PST)
Date:   Tue, 1 Dec 2020 16:55:47 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
Message-ID: <202012011652.27ADF5FDB6@keescook>
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
 <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
 <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
 <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 28, 2020 at 10:28:31AM -0800, Linus Torvalds wrote:
> On Fri, Nov 27, 2020 at 11:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > As for the cc1plus cost, I got a similar result.
> >
> > Running scripts/gcc-plugin.sh directly
> > took me 0.5 sec, which is a fourth
> > of the allmodconfig run-time.
> >
> > Actually, I did not know this shell script
> > was so expensive to run...
> 
> So it turns out that one reason it's so expensive to run is that it
> does a *lot* more than it claims to do.
> 
> It says "we need a c++ compiler that supports the designated
> initializer GNU extension", but then it actually includes a header
> file from hell, rather than just test designated initializers.
> 
> This patch makes the cc1plus overhead go down a lot. That said, I'm
> doubtful we really want gcc plugins at all, considering that the only
> real users have all apparently migrated to clang builtin functionality
> instead.
> 
>         Linus

>  scripts/gcc-plugin.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/gcc-plugin.sh b/scripts/gcc-plugin.sh
> index b79fd0bea838..59db87bff456 100755
> --- a/scripts/gcc-plugin.sh
> +++ b/scripts/gcc-plugin.sh
> @@ -8,8 +8,8 @@ srctree=$(dirname "$0")
>  gccplugins_dir=$($* -print-file-name=plugin)
>  
>  # we need a c++ compiler that supports the designated initializer GNU extension
> +test -e "$gccplugins_dir/include/plugin-version.h" &&
>  $HOSTCC -c -x c++ -std=gnu++98 - -fsyntax-only -I $srctree/gcc-plugins -I $gccplugins_dir/include 2>/dev/null <<EOF
> -#include "gcc-common.h"
>  class test {
>  public:
>  	int test;

I'm fine dropping this -- I think the need for that portion of the
script's test has evaporated as we've brought the minimum GCC version
up into the neighborhood of "modern".

As for dropping GCC plugins entirely, I'd prefer not -- the big hold-out
for the very paranoid system builders is the randstruct plugin (though
they tend to also use the entropy one too). Clang's version of randstruct
has not gotten unstuck yet.

-- 
Kees Cook
