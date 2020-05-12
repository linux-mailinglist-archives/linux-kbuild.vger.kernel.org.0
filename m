Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639411CFED7
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 22:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbgELUDE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 16:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731048AbgELUDD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 16:03:03 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4265C061A0C;
        Tue, 12 May 2020 13:03:03 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id 79so6334417iou.2;
        Tue, 12 May 2020 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ydBNEcd5JjVpqJREhbFVwOQSjJgZ8/B8S4hq59DFYUI=;
        b=kSL0hgpyZvKFtG6jUkv2yJwaQ0HcSZvAVxkp3oRhg+j18nHvsY8MhoKdWbuZuITaV+
         0W3H5cOPXOZTxZnNdTJL4+A7P2+tXZfRbw0f0wh2nB2J4DdRoDu9vL4lZ3SeY5k6JZ+f
         9XoVa9TLYBjWo8ZAIadjTr5tDuBZPQOjCZcV5j340VHpXc3lyvn9dQpZSAQiHriI+V6t
         B4yfgjaFTlzMu7pOanjZixh6A7oaFUzyj8OyEQctdk1woordxNGhBbUnbJOLaApkjJRb
         2M+3WXJIJ3C7FFTMXiKUqxXuyAve90W5J2aC2e46iIq29rEGl5H0mTugbLBq6D4Qgpyx
         Ft/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ydBNEcd5JjVpqJREhbFVwOQSjJgZ8/B8S4hq59DFYUI=;
        b=ScXlARRTBUGIfVWSLBTHMjYBZ1XyXY+NnvBVCRv53FG0RF7vP0+UAz4odYja12wexj
         RPOBliO8JUUyO7g182VCLrO/yNw1tW20iaIPVJvCXSO84VLNDAxyh7HnNKai3DOCZdF7
         yZe/V6KMPkeEN+YSphvfOIH7ncn4Ky/Yko29ZMKP4SZRPWUAcsa2DLk2fM8sm0CSGk8n
         SjYuY+kHiwgB0aNMT5+X0VY2sn8IwofDSNn8a/rNzMp11ASXVt6gJfHTn3rtaBYem9YM
         P/86ovY1A4wqmcQCY8vSVB4il5AnENEVz1/TH3Tht12BZn1idC6YPAbHLZeL/7Re5tn6
         /SQg==
X-Gm-Message-State: AGi0PuZQDekmCUHvqOZTfJZCX0kbdyry9Z7N6sSPqAEQT+sXgBf/l7iC
        G1zjqDifuMEtAtdfbB64YkKdiOR3ZrBUgNiFzeg=
X-Google-Smtp-Source: APiQypKk1yK2WAKjHItNoAMDLKx1oFZGQBa601MER7ujhE5fj1/HUMtFr2/9mbXtFloXKPikSOBAGdwm7SqhDQq2w4w=
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr11781247iow.163.1589313783081;
 Tue, 12 May 2020 13:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
In-Reply-To: <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 12 May 2020 22:02:51 +0200
Message-ID: <CA+icZUUSgkUM3oYUzDdhz9tdU+HGG+BMGwqJdb5RXZNNYHn5ng@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 12, 2020 at 9:23 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > > ><nick.desaulniers@gmail.com> wrote:
> > > >>
> > > >> As debug information gets larger and larger, it helps significantly save
> > > >> the size of vmlinux images to compress the information in the debug
> > > >> information sections. Note: this debug info is typically split off from
> > > >> the final compressed kernel image, which is why vmlinux is what's used
> > > >> in conjunction with GDB. Minimizing the debug info size should have no
> > > >> impact on boot times, or final compressed kernel image size.
> > > >>
> > Nick,
> >
> > I am OK with this patch.
> >
> > Fangrui provided the minimal requirement for
> > --compress-debug-sections=zlib
> >
> >
> > Is it worth recording in the help text?
> > Do you want to send v2?
>
> Yes I'd like to record that information.  I can also record Sedat's
> Tested-by tag.  Thank you for testing Sedat.
>
> I don't know what "linux-image-dbg file" are, or why they would be
> bigger.  The size of the debug info is the primary concern with this
> config.  It sounds like however that file is created might be
> problematic.
>

Hi Nick,

sorry, I try to explain the magic of "linux-image-dbg file".

In my workflow, I use the "scripts/package/{builddeb,mkdebian}"
shipped with the Linux-kernel as a base to build my Debian packages.

With enabled debugging (CONFIG_DEBUG_INFO=y) a
"linux-image-$KERNELRELEASE-dbg" Debian package is created.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/mkdebian#n203

As you can see below...

[ CONFIG_DEBUG_INFO_COMPRESSED=n ]

47      5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
424     5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb

[ CONFIG_DEBUG_INFO_COMPRESSED=y ]

47      5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
771     5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb

...there is minimal change in the size for the Debian package w/o
debug-infos - approx. 47M.
As said 424M vs. 771M for the dbg packages.

There is another big benefit checking my recorded stats:

$ grep 'cache size' stats/5.7.0-rc4-*/ccache-s.txt
stats/5.7.0-rc4-1-amd64-clang/ccache-s.txt:cache size
         4.7 GB
stats/5.7.0-rc4-1-amd64-clang/ccache-s.txt:max cache size
        10.0 GB
stats/5.7.0-rc4-2-amd64-clang/ccache-s.txt:cache size
         3.4 GB
stats/5.7.0-rc4-2-amd64-clang/ccache-s.txt:max cache size
        10.0 GB

So the cache of ccache is reduced: 4.7 GB vs. 3.4 GB

If you have any questions, "Don't ask to ask - just ask." :-).

Thanks.

Regards,
- Sedat -
