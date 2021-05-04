Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB2F37319B
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 22:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhEDUtH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 16:49:07 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64918 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhEDUtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 16:49:07 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 144KlW6k031795;
        Wed, 5 May 2021 05:47:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 144KlW6k031795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620161252;
        bh=m5JrldgIlUzDPQw5tCAmJQCeVUpmSZmtNrwSFdv7t0c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WCoZAgsUXZ9InMGX429e0xhUb/2XOaMydB46P5STOK5XEsho8Q7ELlSONI2am4EyE
         4gw/B4uWECCOncD9lhQl3K3m1IvxeQo6ku8MvT/F7/km9c2Iy8lpMx2/mGAAlS0xxH
         pTYhLdfGfzhveMRmh+vp/Qsby+9Yf6RAw/WlW11Xs5KmFJ6UsqsQYWvCLIw8sy4wbB
         6VFa+0fFzImA0okQEzZxVerJRoy2uzlWIoBirsCQakeCuYE/XIWC9iQo/7BylQsYqq
         ZDC7hrZQMfSqEUxcCObF/W4y7MeFjZGkMzruPOiB3ZRtmyagnKyHQREcinlTm/yLiP
         PeLQJ98nO71XQ==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id e2so5993040plh.8;
        Tue, 04 May 2021 13:47:32 -0700 (PDT)
X-Gm-Message-State: AOAM53088LcKmjNoqdGKaCochQZi2slVQvo2RX9yngJn0z4MjsxbpyhB
        cC/B5UGcOKhiAXPTfu2ZhMvKyRpjMd++zn2JCTI=
X-Google-Smtp-Source: ABdhPJwdo8JYmppansdASpwWYG/jSTUXvcQJN0yFdwrAghR6Mkq4NZvSVaKxfBuu2t3CkalV4BgU5gOtF7YvGUfe0lQ=
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id
 r11-20020a1709028bcbb02900eca19221cfmr28236178plo.71.1620161251576; Tue, 04
 May 2021 13:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200614144341.1077495-1-masahiroy@kernel.org>
 <20200614144341.1077495-2-masahiroy@kernel.org> <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
In-Reply-To: <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 5 May 2021 05:46:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com>
Message-ID: <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: unify cc-option and as-option
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 5, 2021 at 5:17 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> Hi,
>
> So... I realized it's been a while:
>
> On Sun, 2020-06-14 at 23:43 +0900, Masahiro Yamada wrote:
> > cc-option and as-option are almost the same; both pass the flag to
> > $(CC). The main difference is the cc-option stops before the assemble
> > stage (-S option) whereas as-option stops after it (-c option).
> >
>
> But, I had noticed for a while now that M= build for an out-of-tree
> driver were causing some trouble. Not really completely "out-of-tree"
> but rather backported (https://backports.wiki.kernel.org/).
>
> And then I finally narrowed it down to this commit, specifically this:
>
> >  # Return y if the compiler supports <flag>, n otherwise
> > -cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /dev/null)
> > +cc-option = $(success,mkdir .tmp_$$$$; trap "rm -rf .tmp_$$$$" EXIT; $(CC) -Werror $(CLANG_FLAGS) $(1) -c -x c /dev/null -o .tmp_$$$$/tmp.o)
>
> What happens is that we're doing
>
>  make -C /path/to/kernel M=/path/to/driver
>
> But /path/to/kernel may be the installed distro kernel headers, and thus
> not be writable to the user doing the driver compile. Obviously, the
> user may need to 'sudo' anyway to install the result, but if just test-
> compiling, or even as better practice to not run everything as root,
> this ".tmp_$$" dir cannot be created.
>
> IOW, this broke compiler option detection when KBUILD_EXTMOD=/M= is
> used. It seems this is still supported (documented in kbuild docs), so
> I'm kind of hoping it could be fixed? But OTOH, I really don't know how,
> perhaps just using "mktemp -d" here instead of the hardcoded temp dir?
>
> Thanks,
> johannes
>


 - This commit touches scripts/Kconfig.include.
 - External module builds (M= builds) never invoke Kconfig

Putting these two together, your claim is really odd.
If external module builds invoke Kconfig,
your kernel is already broken.

If you claim this is an issue,
please describe how to reproduce it in *upstream* kernel.
I do not know (or care about) your backport kernel.


--
Best Regards
Masahiro Yamada
