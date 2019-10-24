Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FADFE39B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 19:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439985AbfJXRUn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 13:20:43 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:32558 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRUm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:20:42 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x9OHKbUV001990;
        Fri, 25 Oct 2019 02:20:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x9OHKbUV001990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571937638;
        bh=X23bDL68cN002ZG4vjr1DNrqzsSgoq+odkAdV8ks9P4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PYxXVwymeOVF3Nw7S+9OFg+qzL0KdB2pFJkquQFkuILYenO1OV84C4sUWxMVl8S1k
         WwmAIgYN2QlHGYxswHwUea1jObwxH/dzhBBgH8N2OtRGbF6yeFnMW7l0apvNOP2kW0
         MEcgANxI6aPcoJdcUvFspZwylzPsBieR//pag/t1maH5GnWaWVY9V9GwsoClWpYz9J
         oSEiz/1PdnF37n16w+r8zxJhkhKtvw74J1UCB8CTbLlcHZ2I2egSDlkF5XTmlPS26U
         mV8Ft/4HaRyWyVHzWn492rpTkCarJ8PVS314//cotE71WhPillMcXouFlnbohj9CHf
         j7a7nfdLZeEdw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id e12so5198287vsr.4;
        Thu, 24 Oct 2019 10:20:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVFYQACKCQ/0l4njuytsAYFuGVWbrLTdZQuk6KkkwozC0OkKJ6o
        FsrPdI0pHMiHA9yAA+Rn7LfhQRXXJ98MkJj7Ijs=
X-Google-Smtp-Source: APXvYqwkyHCfn4BcRNz0Y/e5InuX8dAQqnd7tQvU5CCv2EbJGNTbKkMq76OkFFPEee0L2c0YBMCWl2D07GfmTQ4iJvQ=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr197272vst.155.1571937637178;
 Thu, 24 Oct 2019 10:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191016051215.10909-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191016051215.10909-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 25 Oct 2019 02:20:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQE=rewN+ei8C=9jq-79ki=foPtXwxbXTAOSRYhw6kJAA@mail.gmail.com>
Message-ID: <CAK7LNAQE=rewN+ei8C=9jq-79ki=foPtXwxbXTAOSRYhw6kJAA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded variable, single-all
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 16, 2019 at 2:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When single-build is set, everything in $(MAKECMDGOALS) is a single
> target. You can use $(MAKECMDGOALS) to list out the single targets.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild.

>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ffd7a912fc46..710199f60c30 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1764,11 +1764,9 @@ tools/%: FORCE
>
>  ifdef single-build
>
> -single-all := $(filter $(single-targets), $(MAKECMDGOALS))
> -
>  # .ko is special because modpost is needed
> -single-ko := $(sort $(filter %.ko, $(single-all)))
> -single-no-ko := $(sort $(patsubst %.ko,%.mod, $(single-all)))
> +single-ko := $(sort $(filter %.ko, $(MAKECMDGOALS)))
> +single-no-ko := $(sort $(patsubst %.ko,%.mod, $(MAKECMDGOALS)))
>
>  $(single-ko): single_modpost
>         @:
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
