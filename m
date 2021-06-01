Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFD0397A82
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jun 2021 21:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbhFATPH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Jun 2021 15:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFATPG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Jun 2021 15:15:06 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F53C06174A
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Jun 2021 12:13:23 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y15so223916pfn.13
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jun 2021 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F2nIYNp74XkoIbaKwSbgXhOoOC//P+XAXbK1h22Ceac=;
        b=lkbfMl1Gmq+Nf/7ubjo1OqC7uT9K9Mr6mhUY2FEZSmrJPHAB0auG9k9uCBtbvFW7E+
         f0Q4vvjVo8XzLVCG/jM1Z4nwD1CiBbxVqshZ7h96EbGppBXf8gK9pANmLngrz86A9IVM
         wK3esYJdGgKwBvpr7YAwjV41Fe0DLQWWzprys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2nIYNp74XkoIbaKwSbgXhOoOC//P+XAXbK1h22Ceac=;
        b=qSWnphr6DDzs/Acwh1xOlKnhLuSNcTHg4W4P+C74sLsuOJUSAazd6Tn9wI9KjG9UJI
         RB8ZibGWMIux0KQBDpJZctjnPJWcysYGN1SoKHmdWWFS2RdT01BT1S1Hvnajn5lrYWhy
         DibAkygdQrfjYJZX8To1u5ssw9No1Ztu9ItewMQ0NoY+uX2Ku8XiUo+gBcGxWb5pEjy8
         nL2ejqyKnAXtELCoVYDOj3pTVVqEp3nH/V2x9Klcs7u+L8iIrlgnMJL0rccCAeeXDVah
         ZOuHI2VhMY+d7kodAXfYwokIHhSNKjrXnzs6iLoA8Z59W5q1WL6P3OqBt6XJtc52qiDT
         k6hQ==
X-Gm-Message-State: AOAM533T3zCTGArrcafSC6CwyQYvQqR39fL3ibI7Y2TuMFValF8bxztB
        A3+PFWUolPwpz7rmmIeHD242gg==
X-Google-Smtp-Source: ABdhPJz37ayunvn9ok1+ENdFPwZxrGi7OsloH6vD2nAp9cdyVRqX1z2+Tmk0IHTTo9v7cTVgjj829w==
X-Received: by 2002:a05:6a00:14cb:b029:2be:1466:5a28 with SMTP id w11-20020a056a0014cbb02902be14665a28mr23125434pfu.55.1622574803092;
        Tue, 01 Jun 2021 12:13:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u18sm5029856pfl.9.2021.06.01.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:13:22 -0700 (PDT)
Date:   Tue, 1 Jun 2021 12:13:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bill Wendling <morbo@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jarmo Tiitto <jarmo.tiitto@gmail.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
Message-ID: <202106011210.B5A8881214@keescook>
References: <20210531202044.426578-1-morbo@google.com>
 <e22afde4-e312-4589-cf2e-3c35219d7249@kernel.org>
 <CAGG=3QVdXxLf0T9+n9FidrRcfdWY36m-i=4kPRJjOojWhjiywg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QVdXxLf0T9+n9FidrRcfdWY36m-i=4kPRJjOojWhjiywg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 01, 2021 at 01:24:39AM -0700, 'Bill Wendling' via Clang Built Linux wrote:
> On Mon, May 31, 2021 at 1:29 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On 5/31/2021 1:20 PM, Bill Wendling wrote:
> > > Future PGO features may create other files in /sys/kernel/debug/pgo. So
> > > rename the kernel's raw profile data file to "vmlinux.profraw" to make
> > > which part of the kernel the file is for more explicit.
> > >
> > > Note that future files in /sys/kernel/debug/pgo should follow a similar
> > > naming convention.
> > >
> > > Signed-off-by: Bill Wendling <morbo@google.com>
> >
> > Guess this clears up my confusion around the module patches :)
> >
> To clarify, Jarmo did those patches on his own. I just wanted to
> clarify the naming convention. :-)

Is the expectation that there would be 1 file per module in
/sys/kernel/debug/pgo/ after the modules patch?

> 
> -bw
> 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > > ---
> > >   Documentation/dev-tools/pgo.rst | 6 +++---
> > >   kernel/pgo/Kconfig              | 7 ++++---
> > >   kernel/pgo/fs.c                 | 2 +-
> > >   3 files changed, 8 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
> > > index b7f11d8405b7..0200449c4843 100644
> > > --- a/Documentation/dev-tools/pgo.rst
> > > +++ b/Documentation/dev-tools/pgo.rst
> > > @@ -76,7 +76,7 @@ The PGO kernel support creates the following files in debugfs:
> > >   ``/sys/kernel/debug/pgo/reset``
> > >       Global reset file: resets all coverage data to zero when written to.
> > >
> > > -``/sys/kernel/debug/profraw``
> > > +``/sys/kernel/debug/pgo/vmlinux.profraw``
> > >       The raw PGO data that must be processed with ``llvm_profdata``.
> > >
> > >
> > > @@ -108,7 +108,7 @@ using the result to optimize the kernel:
> > >
> > >      .. code-block:: sh
> > >
> > > -      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > > +      $ cp -a /sys/kernel/debug/pgo/vmlinux.profraw /tmp/vmlinux.profraw

And if so, these instructions would change (in the future) to something
like:

     $ cp -a /sys/kernel/debug/pgo/*.profraw /tmp/prof/

?

-Kees

-- 
Kees Cook
