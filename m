Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECBDF1A2B
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 16:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfKFPkE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 10:40:04 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44274 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfKFPkE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 10:40:04 -0500
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xA6Fdjxb014243;
        Thu, 7 Nov 2019 00:39:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xA6Fdjxb014243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573054786;
        bh=wE/LvVLrB/JZtW3C52Gm068T4Aw49NfRM4jApBELfAs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nScaucjRCcgWZy5+lc5AHUr497AOQ/8IFuo6nuP+YdwqCuoAXOfqIsGsAhI9JOfMX
         rpnAIX0OWiKYv0n5qPs8w8Zj9Y4BLlOncGUrn7u6GqIz8NJp2Z6kcrOVP6/PFw62gy
         JiDpptuXRXpiW8WlPUo3SQCANsfSA28uJ+GtcwnfgJXGGLjEOjyD9XzBgDcCGQ8Wkv
         qpTwtbnlm/Uyf0pcAANzvCgMnlB3iqd0WMxGr2OpraOhmt+RhftS5VtAL4oPFAZsaw
         CMx6+CHdGeBMrAfbc6g0gu6CUjPkvi8DEFHVjOUmFXDnpY1I/AHpZ6YQTtuN5tbYyz
         gMaW5RtsTi3DQ==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id y129so16238713vsc.6;
        Wed, 06 Nov 2019 07:39:45 -0800 (PST)
X-Gm-Message-State: APjAAAWE157x9WJZ3zANiAoBZ6ILkGIOKl329aamblMV/szwmhMFssud
        Q3LCAbTEajnCHylSXpRuBLS/RPwUE4ZbsWftm00=
X-Google-Smtp-Source: APXvYqyYdahLGrjJirAdEnUrO5r5K1irlhVDTxi2h384bpkyHSv/QFwAp+XGDfplSLODwLTDMSId2gSly3EEdxySeY4=
X-Received: by 2002:a67:e290:: with SMTP id g16mr1627678vsf.54.1573054784354;
 Wed, 06 Nov 2019 07:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20191029123809.29301-1-yamada.masahiro@socionext.com> <20191029123809.29301-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191029123809.29301-5-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 7 Nov 2019 00:39:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATq5vK36hs0W3Ywu7j1xy6FgJxB7E3serAv6B1LmVA-nA@mail.gmail.com>
Message-ID: <CAK7LNATq5vK36hs0W3Ywu7j1xy6FgJxB7E3serAv6B1LmVA-nA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mospost: remove unneeded local variable in contains_namespace()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 29, 2019 at 9:38 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The local variable, ns_entry, is unneeded.
>
> While I was here, I also cleaned up the comparison with NULL or 0.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Fixed the typo in the subject ( mospost -> modpost )
and applied to linux-kbuild.


>
>  scripts/mod/modpost.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f7425f5d4ab0..f70b924f379f 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
>  static bool contains_namespace(struct namespace_list *list,
>                                const char *namespace)
>  {
> -       struct namespace_list *ns_entry;
> -
> -       for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
> -               if (strcmp(ns_entry->namespace, namespace) == 0)
> +       for (; list; list = list->next)
> +               if (!strcmp(list->namespace, namespace))
>                         return true;
>
>         return false;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
