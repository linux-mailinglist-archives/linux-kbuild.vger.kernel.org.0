Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23392C12F8
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2019 06:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbfI2EAG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Sep 2019 00:00:06 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62160 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfI2EAG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Sep 2019 00:00:06 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x8T40102019634;
        Sun, 29 Sep 2019 13:00:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x8T40102019634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569729602;
        bh=woyYg5ZX3LH+X72yt3rLwXDVMvzanzz7a9iBSSuatNc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t9blx5JNwA2UaReQ0OtqgxMt2qkyq6fRdEWIqVBpfzw5Dcgl75zPLpiYwjcPseREK
         GuJ+hEebEny+qrz6qwgp81Sol5lbX7iU/eWEW3nGcVvtSbvEo1LRxD7jS83q4/8Mzg
         Lc27PpMNjTjJCNtXVLcNkH9Xt+4x1SgJBf+H9m9yTQS7GzuLjV4SYx5qyc9O/amsyB
         PFhYNGg5zvuT/05Y0mMR95gWVkZd/yHrhPX/Hv16ktW6aBWjYOx09+avkR5wM5b9NC
         67qrIO/ySR4RBao+XXr3bvflIqjbJ0E3Vz5/jyU5gg/pbhBaiZtoOjH4cPn8mnYj15
         yAncEkYBNkqOg==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id m22so4528879vsl.9;
        Sat, 28 Sep 2019 21:00:02 -0700 (PDT)
X-Gm-Message-State: APjAAAV9sSrekqwA2nIAcNHvqwvoYja5yRS4OMs8Q+3TA4cdctl9Y5q7
        ZD0IrO5+tZ3qOhvZIz+6dHlNjilVz4KprfY+D1M=
X-Google-Smtp-Source: APXvYqymY9M6kRY90i07BR10rMIYHpst/c0y6tGNx5PqcwpwENOpzdBCUbYJvLcYdOoYY5n4PgwRujfqSkxiAQG5Cbg=
X-Received: by 2002:a67:ec09:: with SMTP id d9mr6522939vso.215.1569729601029;
 Sat, 28 Sep 2019 21:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
 <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com>
In-Reply-To: <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 29 Sep 2019 12:59:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
Message-ID: <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.4-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Sun, Sep 29, 2019 at 11:57 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 28, 2019 at 11:41 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Please pull some more updates for v5.4-rc1
>
> I pulled this, but I'm not sure if I'm going to keep it.
>
> There's thousands of lines of changes because of the header-test-y
> thing, and I'm honestly considering just getting rid of that thing
> entirely.
>
> It has no actual upside that I can tell, and it's extremely annoying.
> It pollutes the tree with hundreds of *.h.s files, which messes up
> filename completion, and just generally is ugly and annoying.
>
> So I've unpulled for now, and I'm not sure I want to pull more noise
> for this mis-feature.
>
>                 Linus




The concept of header test is to make sure every header
is self-contained, so that headers can be included in
  either
#include <linux/foo.h>
#include <linux/bar.h>
  or
#include <linux/bar.h>
#include <linux/foo.h>


Of course, you can argue that it is addressing hypothetical issues
"what if the include directives are arranged in this order?",
that nobody has been hit before.

If this test is just annoying, shall we remove
the 'header-test-y' syntax and include/Kbuild entirely?

But, at least, I want to continue compile-testing
uapi headers that are exported to user-space.

This is useful to detect a broken uapi header
that is never be able to be compiled in user-space.

For example,
https://lkml.org/lkml/2019/6/19/104


So, I'd like to keep usr/include/Makefile
at least.


-- 
Best Regards
Masahiro Yamada
