Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9FC24E466
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 03:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgHVBMk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 21:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgHVBMi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 21:12:38 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304D7C061573;
        Fri, 21 Aug 2020 18:12:37 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id z195so66560oia.6;
        Fri, 21 Aug 2020 18:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=+mgx7nIrSpwGQvUnnGZmtTvze/7hVXMdlFzKwysIgnA=;
        b=GiJl8vVGMg0uk1KXVffNo8wN2+Ymv+e/7XmWnm/XcNIDNH9+U+3uLxyL6ISjEdpc2N
         w030kA9zMwEbCaOf5UlhxO2jD94TaWYtt+qe/xmXOnUF0dPJpKxlYbAMW2qQ6ofiwWkJ
         Ytk8X+sWJ6vYURcrKf2Orsw+Wh/GSmoaajdqX4uXDPzhGUSTg0orKJ1jvyAYHBsudXuc
         cuQ+Q2ie75Z3jPt7eY2sWXmoGVSPHG6u4WpEFdjTTcGr48LATXyPS/1jOx7cDUrkAeT+
         D2UfvQOW/qAVriDjsfwZV+PpQpKW+34eZp1usW1GuZw/YCysJXeZxXL/6mSLzpOVfdTt
         1+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=+mgx7nIrSpwGQvUnnGZmtTvze/7hVXMdlFzKwysIgnA=;
        b=PNOCUKeB2UttlVpP//OCrZSTkZif6pN5IQIlIFAKC0CFIYxf5Hux1LaLIXTuPvtb0t
         R/sjNUcwQgtaIar3R7pWWfvMpMj1Mzr/PRTMPoJNzMil8ZsZn7RfJ/RkbayIGjxHHiXF
         MYmzn87bvFssAOoza83Q/1Zre1ddfBhFgQWHYJfL9C6Q12pX1VsRZ1g83ExSp/I/MPIL
         3dD+45YjmGpw7kTe34dRDB+5oSAnJMuWJqMyxIJ7s3jc1bkypncryqKfl6rtsxYe/JnE
         XB4bh2WThF9DwTCkdSvSiF6tMu3zaaf1l2E/TFMFvNhbXLowYbHtK2ywHWR609oNQVO2
         VAjQ==
X-Gm-Message-State: AOAM531MYL/g1czwWzDL11mErStSbM27ZpdoLNHH2bbtpb2c0nNDMqaX
        6J8rpZkb2++DJRBEf5pMyZE+/8MPOmZxd/Q6VzA=
X-Google-Smtp-Source: ABdhPJya1ikQ4BLm7jQaEEsiDkeI2gTFF9XLwaHL25s8IObwz+27BcRDBJ0IuLoXah+NeWRMFHPzraZgjbtKOgTV1FY=
X-Received: by 2002:a05:6808:311:: with SMTP id i17mr3687524oie.72.1598058756993;
 Fri, 21 Aug 2020 18:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <CAKwvOdkUfOnzWH1d7-qAP-PFvkLeahoA8jZdkZEp4-PNFXL_JA@mail.gmail.com>
In-Reply-To: <CAKwvOdkUfOnzWH1d7-qAP-PFvkLeahoA8jZdkZEp4-PNFXL_JA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 22 Aug 2020 03:12:25 +0200
Message-ID: <CA+icZUUPTx8-kRKNJDeeqy=9q-KjH9qVyzk757w0XkO8YpE6vA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kbuild: clang-tidy
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 22, 2020 at 3:06 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I improved gen_compile_commands.py,
> > then rebased Nathan's v7 [1] on top of them.
> > To save time, I modified the Makefile part.
> > No change for run-clang-tools.py
> >
> > "make clang-tidy" should work in-tree build,
> > out-of-tree build (O=), and external module build (M=).
> >
> > This version keeps the previous work-flow.
> > You can still manually run scripts/gen_compile_commands.json
> >
> > 'make compile_commands.json' or 'make clang-tidy' is handier
> > for most cases. As Nick noted, there is 3 % loss of the coverage.
> >
> > If you need the full compilation database that covers all the
> > compiled C files, please run the script manually.
> >
> > [1] https://patchwork.kernel.org/patch/11687833/
>
> Thank you for the work that went into this series.  The only reason I
> started focusing on compiling the kernel with Clang 3.5 years ago was
> that I simply wanted to run scan-build (clang's static analyzer,
> enabled by this series) on the kernel to find bugs to start
> contributing fixes for.  Turned out compiling the kernel with Clang
> was a prerequisite, and I've been distracted with that ever since.
> Thank you both for completing this journey.

/me donates Nick a "EoJ" (End Of Journey)

- Sedat -

>
> >
> > Masahiro Yamada (8):
> >   gen_compile_commands: parse only the first line of .*.cmd files
> >   gen_compile_commands: use choices for --log_levels option
> >   gen_compile_commands: do not support .cmd files under tools/ directory
> >   gen_compile_commands: reword the help message of -d option
> >   gen_compile_commands: make -o option independent of -d option
> >   gen_compile_commands: move directory walk to a generator function
> >   gen_compile_commands: support *.o, *.a, modules.order in positional
> >     argument
> >   kbuild: wire up the build rule of compile_commands.json to Makefile
> >
> > Nathan Huckleberry (1):
> >   Makefile: Add clang-tidy and static analyzer support to makefile
> >
> >  MAINTAINERS                                 |   1 +
> >  Makefile                                    |  45 +++-
> >  scripts/clang-tools/gen_compile_commands.py | 245 ++++++++++++++++++++
> >  scripts/clang-tools/run-clang-tools.py      |  74 ++++++
> >  scripts/gen_compile_commands.py             | 151 ------------
> >  5 files changed, 361 insertions(+), 155 deletions(-)
> >  create mode 100755 scripts/clang-tools/gen_compile_commands.py
> >  create mode 100755 scripts/clang-tools/run-clang-tools.py
> >  delete mode 100755 scripts/gen_compile_commands.py
> >
> > --
> > 2.25.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkUfOnzWH1d7-qAP-PFvkLeahoA8jZdkZEp4-PNFXL_JA%40mail.gmail.com.
