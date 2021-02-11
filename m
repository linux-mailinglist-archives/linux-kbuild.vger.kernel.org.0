Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031743191E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 19:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhBKSJe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 13:09:34 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45357 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhBKSH0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 13:07:26 -0500
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11BI68ph007158;
        Fri, 12 Feb 2021 03:06:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11BI68ph007158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613066769;
        bh=aS3nyEL/blW5wl23rHjvf+MLUviMkrYPfXwTmR8wSjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S9kLixX3pD9FKGMhONjpCHVDG75yKZ74Txol3Cn0AjuwMtTh0TJ6ATylA9FAa9DMy
         DqC1QnFzpnoRgp9NMmwa+RMmQeXWDxOhxGWPLOFS6M+rCF64KssgHZLTl5SNgSFZ6M
         8A7a8gZqdjzUgnmZq5hiUSp1uTc5+pSgc+HIrhdLM6Agm38Ha2NA9paC9lb7OQw7DP
         8uw45aa2PZLCSsSF+DJJTYpKu4fmXuiNZ4cVgDmpktHh+tLjWm+dfZt/KfUIbp8CrF
         q6hrGdTISGbOBAtCmeCt2f8bgxb43jer/ooS0QvsZdMNWY8XMfBpJ2yjb76Jpu8/Q0
         vQqwtED9eB/Ng==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id c11so4157368pfp.10;
        Thu, 11 Feb 2021 10:06:09 -0800 (PST)
X-Gm-Message-State: AOAM53339D35ytcJxSq0m3rQ7Rtjn0tLvTbBoILv0enhtj6lXkNilr0u
        BmC+3AOAyF0wJQ24bdbiiCTy9Zm2TCXiUKydZoM=
X-Google-Smtp-Source: ABdhPJymrPJ4TnzIzA6fnOCPyy8ei4axUeafKAFXotWbnBd8ynLlFgfGCbZg4JDAwoq8DGKqnLOxw4gaaHyISNxJUgw=
X-Received: by 2002:a62:2f07:0:b029:1bb:5f75:f985 with SMTP id
 v7-20020a622f070000b02901bb5f75f985mr8783784pfv.76.1613066768263; Thu, 11 Feb
 2021 10:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20210211061416.3747231-1-masahiroy@kernel.org> <YCUKVyMcVoNDAYJv@gunter>
In-Reply-To: <YCUKVyMcVoNDAYJv@gunter>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Feb 2021 03:05:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARa11O-N_q=m57He7G6-2tmemmhtkwN5UQu6cnf7MtZog@mail.gmail.com>
Message-ID: <CAK7LNARa11O-N_q=m57He7G6-2tmemmhtkwN5UQu6cnf7MtZog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 11, 2021 at 7:43 PM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Masahiro Yamada [11/02/21 15:14 +0900]:
> >Stephen Rothwell reported a build error on ppc64 when
> >CONFIG_TRIM_UNUSED_KSYMS is enabled.
> >
> >Jessica Yu pointed out the cause of the error with the reference to the
> >ppc64 elf ABI:
> >  "Symbol names with a dot (.) prefix are reserved for holding entry
> >   point addresses. The value of a symbol named ".FN", if it exists,
> >   is the entry point of the function "FN".
> >
> >As it turned out, CONFIG_TRIM_UNUSED_KSYMS has never worked for ppc64,
> >which has been unnoticed until recently because this option depends on
> >!UNUSED_SYMBOLS hence is disabled by all{mod,yes}config. (Then, it was
> >uncovered by another patch removing UNUSED_SYMBOLS.)
> >
> >Removing the dot prefix in scripts/gen_autoksyms.sh fixes the issue.
> >Please note it must be done before 'sort -u', because modules have
> >both ._mcount and _mcount undefined when CONFIG_FUNCTION_TRACER=y.
> >
> >Link: https://lore.kernel.org/lkml/20210209210843.3af66662@canb.auug.org.au/
> >Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks a lot for the quick fix. This fixes the ppc64 build issue on my end:
>
>     Tested-by: Jessica Yu <jeyu@kernel.org>
>
> Do you plan to take this through the kbuild tree? If so, please let me
> know when you've applied it, then I can undo the temporary workaround
> I currently have in modules-next.
>
> Thank you!
>
> Jessica


Applied to linux-kbuild/fixes.


-- 
Best Regards
Masahiro Yamada
