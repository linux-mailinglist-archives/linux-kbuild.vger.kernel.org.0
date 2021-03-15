Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340C933C1AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhCOQZi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:25:38 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48194 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbhCOQZI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:25:08 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 12FGOs4P030816;
        Tue, 16 Mar 2021 01:24:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12FGOs4P030816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615825495;
        bh=8fR/k4S+x7zJcwVimEWtVYSZGWek5y8oJcBpe9Z1Yi4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E8MsSaQxGxgTFg3tR0era08mFakTDjLx8+8Z0Tqr5DTNS5dgNaxVCU+mq7DIrYg/b
         UpZnIwq3KTwLE5tciTnWkcMl8+FIGQdUy6h77AXizyBrqRNd9drRzdCGtIoeyF2N5q
         sqgFNlzLRLVPz9jQ12HvCjgbM3tCytH0fadiLZH4a/K4e90IQ/H3JgrixoXz6ZltZ6
         KQYGHJnM96S7PT+VccRPx9PTxeNwdnTaOaUZe640DnuXAMYeSH4X5sSuu/wram8ktv
         eK8NQv7t32n2l3iQLLR4Zy51grt7tN7sQScIIJuKxGS8dAt8V+V5nLCyIfKB2LKIpQ
         t8pUFhW6zOrpQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id a8so9047665plp.13;
        Mon, 15 Mar 2021 09:24:55 -0700 (PDT)
X-Gm-Message-State: AOAM53195XXRcnBdfIHys7wgNlJv30wrynfWobwuIeFu+I4NC83QkqQ1
        6HeEd8NHuo5Hs026nN5nPl37yQhF7xqVKPtnc9s=
X-Google-Smtp-Source: ABdhPJzHP7b6j7mjgLRsHEFFgwnPQPIGFgz/LIxXsbmvcn18OKnSiDrClLJJ+xqGzUH7q1yiFF8bRLDCTo6NenZbRZE=
X-Received: by 2002:a17:90a:fb54:: with SMTP id iq20mr13128873pjb.153.1615825494285;
 Mon, 15 Mar 2021 09:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210314043044.15926-1-unixbhaskar@gmail.com>
In-Reply-To: <20210314043044.15926-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Mar 2021 01:24:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQEYAiV7+19LXNs8-HjWNLvX4hGLvDVMjLXrshLb4BawQ@mail.gmail.com>
Message-ID: <CAK7LNAQEYAiV7+19LXNs8-HjWNLvX4hGLvDVMjLXrshLb4BawQ@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: Fix a typo in the file Kconfig.recursion-issue-02
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 14, 2021 at 1:33 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
> s/sematics/semantics/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  Documentation/kbuild/Kconfig.recursion-issue-02 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
> index df245fd7670d..0034eb494d11 100644
> --- a/Documentation/kbuild/Kconfig.recursion-issue-02
> +++ b/Documentation/kbuild/Kconfig.recursion-issue-02
> @@ -6,7 +6,7 @@
>  # make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
>  #
>  # The recursive limitations with Kconfig has some non intuitive implications on
> -# kconfig sematics which are documented here. One known practical implication
> +# kconfig semantics which are documented here. One known practical implication
>  # of the recursive limitation is that drivers cannot negate features from other
>  # drivers if they share a common core requirement and use disjoint semantics to
>  # annotate those requirements, ie, some drivers use "depends on" while others
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
