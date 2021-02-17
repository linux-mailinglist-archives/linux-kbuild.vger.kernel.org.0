Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EB631D59A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Feb 2021 08:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhBQHD5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Feb 2021 02:03:57 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:49141 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQHD4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Feb 2021 02:03:56 -0500
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11H72lIm022478;
        Wed, 17 Feb 2021 16:02:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11H72lIm022478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613545368;
        bh=E1RLv4/hlDSK/JAIVwLXtUV86s2XAsZpcBxtZyFWB18=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PfIBeEV2phEKnmhFmw+03MjCkyAWCCGR8KDP2uTuBQB3evYCeqqqeUyxpAxvc6di1
         cNVedLMGWTeWCLHFuwvjYypcEBUr5Lv/IgIYJzbw2wWjx2OVGls1TUwTd7xLj7r6cJ
         jvxHGUsJ4FdXd4l3J8HulI1Zt3YhQDEwImr6/Y1HPZhlyCqIrxGj+Jbm0hAekSKLR1
         ivbUhg4q0TUfZKRo9UxoeMYtKnOo0ShtCKrtxgSzKwYrUCoNTOaydDY7HBJ4Z6IsrX
         9mlDIJTE0WXuG/d+9rauZkQDsHt0D5fT93tpN91OazmmSwmsQnPUroMHiiu38p9Cuj
         DOce2ighCj1sw==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id w18so7823742pfu.9;
        Tue, 16 Feb 2021 23:02:48 -0800 (PST)
X-Gm-Message-State: AOAM5308Qn4ZdccmbHmJUl9n4bO6niFqiAeE+RRV2lu3Fq7HjWqy0tnD
        pJ8dwIHtyNG23FusADafyuQXGg2pALjtrnO55cI=
X-Google-Smtp-Source: ABdhPJxKDpcaYvfx0b/i7FFnrPbrcRu4r1etXIPAHil6i22L6iSu+cypHsxDAUNFxSo3WaZ/cip+05e3tgOIplb2loA=
X-Received: by 2002:a63:575e:: with SMTP id h30mr22503796pgm.7.1613545367403;
 Tue, 16 Feb 2021 23:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20210216213312.30462-1-nathan@kernel.org>
In-Reply-To: <20210216213312.30462-1-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 17 Feb 2021 16:02:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARcy52b6aGtV1mgq3rehtnwo7sm7TkNHc9H4bGu9Qdu8Q@mail.gmail.com>
Message-ID: <CAK7LNARcy52b6aGtV1mgq3rehtnwo7sm7TkNHc9H4bGu9Qdu8Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Remove # characters from compiler string
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michael Fuckner <michael@fuckner.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 17, 2021 at 6:33 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When using AMD's Optimizing C/C++ Compiler (AOCC), the build fails due
> to a # character in the version string, which is interpreted as a
> comment:
>
> $ make CC=clang defconfig init/main.o
> include/config/auto.conf.cmd:1374: *** invalid syntax in conditional. Stop.
>
> $ sed -n 1374p include/config/auto.conf.cmd
> ifneq "$(CC_VERSION_TEXT)" "AMD clang version 11.0.0 (CLANG: AOCC_2.3.0-Build#85 2020_11_10) (based on LLVM Mirror.Version.11.0.0)"
>
> Remove all # characters in the version string so that the build does not
> fail unexpectedly.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1298
> Reported-by: Michael Fuckner <michael@fuckner.net>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---


After some thoughts, I decided to apply this as-is for now.


Ideally, the part "AOCC_2.3.0-Build#85"
could be escaped like "AOCC_2.3.0-Build\#85"
so that the original version string is preserved.

I know it is impossible because escape sequence
handling in Kconfig is buggy.

So, I accept dropping problematic '#' characters entirely,
and I agree this is the safest fix.

When I have time, I might want to revisit this with a Kconfig fix.


Applied to linux-kbuild. Thanks.






--
Best Regards
Masahiro Yamada
