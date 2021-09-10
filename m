Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFF1406593
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Sep 2021 04:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhIJCPJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 22:15:09 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32783 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhIJCPJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 22:15:09 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 18A2Djon010955;
        Fri, 10 Sep 2021 11:13:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 18A2Djon010955
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631240026;
        bh=udWjwfq60F1tLUm1m72YBO5+pyGaJaRnnlyiYr4sAfE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0XX9KQjQjryldcYbWVmumEwcAwLbQvGI71V4r9jNi5tE/NScXniByF9byz7RBE/6X
         mrRztoQgkQfumszF/YjLIAgZYi3nfaAa0P3aMkefxpjS8Kgn/vFue62f1SUaRD0L74
         t2TRt4YcUgyQhRM9zYoZPjqVpvSczO1BxlgPnti3R/U+WLmkEcNj0rIlNE8Vb3XdCJ
         MeHu48ANoDQYKFm7f1zC6uTO4xcIwOO6n21XiyUgzFytVANcZ7Y2BREo0mPbznHFJS
         nAl9g2HBZdXJmNpc2O0sdA4LgjO7L/mqGZ1k2CZLjk4E4C0bf44yhzVuIC0u45HBo7
         MwdIlhNeBUfsA==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id k23-20020a17090a591700b001976d2db364so418224pji.2;
        Thu, 09 Sep 2021 19:13:46 -0700 (PDT)
X-Gm-Message-State: AOAM532PF+sYMl7Jo7ZuJoLLKDy1vPs0sOwJ9hjZ7p2gxXo6jj9RTvKh
        cwH6YoOcIG6OAikS88fAQ78Qtw1Ho9DihX9g4Zs=
X-Google-Smtp-Source: ABdhPJzsQEVxfZfrPHtmSoiJqpIaQCbePzktoUaB9fjFhHO8qjDLzEBmXpWaRfbbZkOqp2DwuT5bFmnqZJO2BlsLKL0=
X-Received: by 2002:a17:902:e04d:b0:13a:70c9:11b8 with SMTP id
 x13-20020a170902e04d00b0013a70c911b8mr5250710plx.82.1631240025345; Thu, 09
 Sep 2021 19:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210901145212.478066-1-arielmarcovitch@gmail.com>
In-Reply-To: <20210901145212.478066-1-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 10 Sep 2021 11:13:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHTL_djSLXVyuvn1mOtvumNAKo8iE7tQiyONxtJ3a4xg@mail.gmail.com>
Message-ID: <CAK7LNAQHTL_djSLXVyuvn1mOtvumNAKo8iE7tQiyONxtJ3a4xg@mail.gmail.com>
Subject: Re: [PATCH v2] checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Valentin Rothberg <valentinrothberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 1, 2021 at 11:52 PM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> As opposed to the --diff option, --commit can get ref names instead of
> commit hashes.
>
> When using the --commit option, the script resets the working directory
> to the commit before the given ref, by adding '~' to the end of the ref.
>
> However, the 'HEAD' ref is relative, and so when the working directory
> is reset to 'HEAD~', 'HEAD' points to what was 'HEAD~'. Then when the
> script resets to 'HEAD' it actually stays in the same commit. In this
> case, the script won't report any cases because there is no diff between
> the cases of the two refs.
>
> Prevent the user from using HEAD refs.
>
> A better solution might be to resolve the refs before doing the
> reset, but for now just disallow such refs.
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/checkkconfigsymbols.py | 3 +++
>  1 file changed, 3 insertions(+)


Applied to linux-kbuild. Thanks.

> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index b9b0f15e5880..c57c990c3244 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -102,6 +102,9 @@ def parse_options():
>                       "continue.")
>
>      if args.commit:
> +        if args.commit.startswith('HEAD'):
> +            sys.exit("The --commit option can't use the HEAD ref")
> +
>          args.find = False
>
>      if args.ignore:
>
> base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
