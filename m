Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31E832E269
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 07:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhCEGmQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 01:42:16 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54545 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCEGmQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 01:42:16 -0500
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1256fxXP006284;
        Fri, 5 Mar 2021 15:42:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1256fxXP006284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614926520;
        bh=QKZEElj10xbGd/NNJdyWgOoxYJZM6VFwThohLXMmU6g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=upFq2mWj2/ex2pi4XCKZoeL3tu3xdapBN8rcP3CmhJ4O9ULerTiecCI7ardvGemjU
         DEAr1j5cbtD6VyReYW6XM4JUg8HIdP5NcI51YrzqD8zKhtunAX1nPyUxBCNSbPJynl
         szlSmsUfCRrQ8lJc+LfjgVb8ytM6NdZLdQC9cnfelF1Wo+wU2jVtnpOZR6a7R5ubI3
         JqeAskzkxiwnyvV7sLB2vNr88m+9RKrQ4yty9uKZ/YiFS6kG/FDleOklRIMXm290wy
         Yj+qWMh6lgEqZUkJrKsi3jYXKSqpfPzYPnkEDhiS5H2sG6iJ4YXXo072SXz3wmd6wq
         tKnTV0MIYNE1Q==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id 18so1407967pfo.6;
        Thu, 04 Mar 2021 22:42:00 -0800 (PST)
X-Gm-Message-State: AOAM532I+QtFcD7BJFfoNxk5sTY19zY/J6BjIeMmUEUV7taYUj0s/gHR
        v9aDIdNJGURXub034QbJbf5tG6Jg+sRhnqQAhXM=
X-Google-Smtp-Source: ABdhPJyYi6HSZT/MFIPgEDWgg+RuMrKImKVF3hozoDbjCEHrjYAC/GbYAVtZ+w1HxleSkvLML6dDY5grn+j9YjSaXQI=
X-Received: by 2002:a62:1b53:0:b029:1ee:8ff8:c706 with SMTP id
 b80-20020a621b530000b02901ee8ff8c706mr7180886pfb.76.1614926519528; Thu, 04
 Mar 2021 22:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-2-masahiroy@kernel.org>
 <798s9r5n-5nr8-1p1s-837-s07p72q72031@syhkavp.arg>
In-Reply-To: <798s9r5n-5nr8-1p1s-837-s07p72q72031@syhkavp.arg>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 15:41:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASsCokxgsMiOWq1wPyzpJN8KNprLb0YMSWiC6phzkTAmA@mail.gmail.com>
Message-ID: <CAK7LNASsCokxgsMiOWq1wPyzpJN8KNprLb0YMSWiC6phzkTAmA@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: collect minimum tool versions into scripts/tool-version.sh
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 7:10 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Thu, 4 Mar 2021, Masahiro Yamada wrote:
>
> > The kernel build uses various tools, many of which are provided by the
> > same software suite, for example, LLVM and Binutils.
> >
> > When we raise the minimal version of Clang/LLVM, we need to update
> > clang_min_version in scripts/cc-version.sh and also lld_min_version in
> > scripts/ld-version.sh.
> >
> > In fact, Kbuild can handle CC=clang and LD=ld.lld independently, and we
> > could manage their minimal version separately, but it does not make
> > much sense.
> >
> > Make scripts/tool-version.sh a central place of minimum tool versions
> > so that we do not need to touch multiple files.
>
> It would be better and self-explanatory if a script that provides the
> minimum version of a tool was actually called ... min_tool-version.sh or
> the like. Otherwise one might think it would give e.g. the current
> version of installed tools.
>
>
> Nicolas

You are right. I will rename it.

-- 
Best Regards
Masahiro Yamada
