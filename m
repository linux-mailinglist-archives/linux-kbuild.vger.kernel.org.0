Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F21D3F5EE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 15:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbhHXNZU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 09:25:20 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30738 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhHXNZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 09:25:20 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 17ODOJNu031939;
        Tue, 24 Aug 2021 22:24:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17ODOJNu031939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629811459;
        bh=grKpIDVVa0DXNbUFm+HWcdf7lg+ce89Ce2iOZxfIe0o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q4f6jMRyugZkTS9VD7Ln1WK43K6EqEnA92mzveTQWy2JIlxC3iaXysWRsURBH+PgT
         ihCNc3eSDfMcOFMgV9ISd42xLBCJqh9G5oCDqUgqvLnCDaS7KX4u2DV/F/upihgMA5
         Qs0AL9LKLQ3UOul7NxwcteG+dBd4NkI/m/+KzwSj7h4TDZFf8Bma3X/AHEiVR9Syna
         U8OAsP/aNPnS300kSpQYm1vhml2hkofAD6GQUhT1BgX7m/DbgeoCXW0c1SmNa/L998
         jcl9W78gC+8EVqg81D9InALwb1nqIqjjxLSldQuG2ScdQbX4YyfTSeHHOGO1ooQDbS
         6bSS1sOwaR7xQ==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id w6so12223457plg.9;
        Tue, 24 Aug 2021 06:24:19 -0700 (PDT)
X-Gm-Message-State: AOAM530y3In98bGxK3HcOBDzn/3YRodR2smbxt9BJOtmO5a4JyLWOy3X
        8u6aLSh1ccDVhpGnN9nDmw5ik0A2OQuKJ5qmvJM=
X-Google-Smtp-Source: ABdhPJwoBOr8gzIw4uOJ60nLKBBLgv0JYwiUBwoPXLEvhi/Ks/X6dLtDh5lcqznBXWybHcdzFbifZj2KFZcpjRLt6MU=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr33424460plq.71.1629811458815; Tue, 24
 Aug 2021 06:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
In-Reply-To: <20210822192205.43210-1-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 24 Aug 2021 22:23:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6G11a-4_UZUtorBmmU6RzKeEkNjEzAWTpVv+LZR_=7A@mail.gmail.com>
Message-ID: <CAK7LNAQ6G11a-4_UZUtorBmmU6RzKeEkNjEzAWTpVv+LZR_=7A@mail.gmail.com>
Subject: Re: [PATCH 0/3] checkkconfigsymbols.py: Fix various bugs
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> Hi!
>
> This series fixes some issues in the checkkconfigsymbols.py script.
>
> The first patch fixes a bug in the --ignore option that makes the
> script check only the files matching the pattern instead of ignoring
> them.
>
> The second patch fixes a parsing error in the Kconfig files parser
> that makes it ignore 'if' statements after 'help' sections.
>
> The third patch prevents the user from using 'HEAD' refs in the
>  --commit option, because it doesn't really work.

Honestly, I didn't even know this script.

I added Valentin Rothberg, the main contributor
to this script.




> Thanks!
>
> -Ariel
>
> Ariel Marcovitch (3):
>   checkkconfigsymbols.py: Fix the '--ignore' option
>   checkkconfigsymbols.py: Fix Kconfig parsing to find 'if' lines
>   checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
>
>  scripts/checkkconfigsymbols.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
>
> base-commit: 36a21d51725af2ce0700c6ebcb6b9594aac658a6
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
