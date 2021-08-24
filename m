Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A2B3F5F35
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 15:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbhHXNdp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 09:33:45 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39391 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237539AbhHXNdp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 09:33:45 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17ODWYf6013733;
        Tue, 24 Aug 2021 22:32:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17ODWYf6013733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629811955;
        bh=j/k7gQQ5rcheWIFS9kTtHhs7q+yMlORMz7nITinR2Ds=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xDIoXgT6ovciswl+50kD56ZetG7jkQF3DDXxh7MBR5hvbAEFhZzILigwf1SPQmNrU
         kVxUuOGrNXjokX4FrHd1kFRhQzpEbg/n0BvIpzJYaMILlGi+Z3nDSGDvJc+8Bzr3mW
         qs5AoqMk7yiDq+zlivlJJMx8eiaCbyNe9VzhgWAEVPykhSH/75+D35Qm15hWkTFgJQ
         dfMq5rK1X2mVJjtP/6GneM5mO0r9DOfAI8Z0ndEp0xGm7oZPrV67pRNn82BC/siUTN
         WVuEuKqxYW3+eiilSl6OTWquRlkKqjbhTqTKzmTxoLKkywXA1O2lf74E5b06H6/0RN
         u9oWXa/13SL7Q==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id d17so12217630plr.12;
        Tue, 24 Aug 2021 06:32:34 -0700 (PDT)
X-Gm-Message-State: AOAM531i3USIaDIdt1j9MyMkSUeUmAQfXQVpukZDUHQHJdLqcqoYyzTw
        5npXVTHP3bXl3m108v6jANKiiTlUFXnxoLk5VKw=
X-Google-Smtp-Source: ABdhPJxJuwE4qIXW/u9RoUzp9rdRXu3C4zF9HbP+SpIbDOCmoqMBQwc6+YtCwzEBD2zMFypOsYBkkqu8gDkg2UMEwGU=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr33455408plq.71.1629811953985; Tue, 24
 Aug 2021 06:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com> <20210822192205.43210-4-arielmarcovitch@gmail.com>
In-Reply-To: <20210822192205.43210-4-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 24 Aug 2021 22:31:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmSmTTPRWcgcPF8kRntSFuaPkLD0A=xuz=CAp4SzxV=Q@mail.gmail.com>
Message-ID: <CAK7LNARmSmTTPRWcgcPF8kRntSFuaPkLD0A=xuz=CAp4SzxV=Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 4:23 AM Ariel Marcovitch
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


Better than doing nothing.
So, applied to linux-kbuild.





> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---
>  scripts/checkkconfigsymbols.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index 875e9a2c14b2..6259698e662d 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -103,6 +103,9 @@ def parse_options():
>                       "continue.")
>
>      if args.commit:
> +        if args.commit.startswith('HEAD'):
> +            sys.exit("The --commit option can't get use the HEAD ref")
> +
>          args.find = False
>
>      if args.ignore:
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
