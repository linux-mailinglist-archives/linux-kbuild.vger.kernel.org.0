Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01A6135E1D
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 17:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733158AbgAIQWJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 11:22:09 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29762 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731343AbgAIQWJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:22:09 -0500
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 009GLifj010250;
        Fri, 10 Jan 2020 01:21:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 009GLifj010250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578586905;
        bh=yo+GdRESSwyawMbYolTNwdLoskihhykp3SyuoUcakJs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YVUpxGt/Fe2PZmbdg6Ir3mJh/zq8Rji+CBU+tsr9RB56M/5+tAY2sihGybSzaTEig
         mS8uIKIt+pFbViLgeTRJoUg4tfG6si5RZtCmWT5B+ayb9l1HQtXlAaUE2aHuhJwpao
         rNN08ZO6cguqyY+vqC6ZG4QFhVX63OM3JD3Xqppi8Yt4Mq7OyIqxv/pXnZKyqtqRI7
         mDinlOT8hjCRI4bc3mDpoEVhBN/mjkcyTXUO0OHFF5naiWzhaxjuzgBokvof0Bb6BT
         BW8DSKPwr4OWrnmJAmYy4vca3BGH3olLJ8a/1ppBmew7F4FTS83LEHFHgpsP0aXkbR
         r9NkWNgEVbnmw==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id w67so2126109vkf.1;
        Thu, 09 Jan 2020 08:21:45 -0800 (PST)
X-Gm-Message-State: APjAAAWy4lkiGng0GHtEU5rsB7ND2rSfbsdlrTlCY/KQN3mmyWqXJO4u
        5wErJXEafEDzpg9JRZM12fT0b8SH4/M6EfI0nMM=
X-Google-Smtp-Source: APXvYqw5UWQ5vMiYxNxR5AgY5N4tyRgqG2rjsD3ihucIIWCZA/GENSrRZQE0dkLA16m7WBh2fMcMmBuQb4NSXyM3RYU=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr7206932vkb.26.1578586904074;
 Thu, 09 Jan 2020 08:21:44 -0800 (PST)
MIME-Version: 1.0
References: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
 <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com> <CAK7LNAS+XHGete9u2SV7fTj3HpROQmzfuJhV8tXW_xXkoPOYvg@mail.gmail.com>
 <538733b2-19af-9a66-f8d2-03e0f6ca7b25@huawei.com>
In-Reply-To: <538733b2-19af-9a66-f8d2-03e0f6ca7b25@huawei.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 10 Jan 2020 01:21:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARtznvDh9fuQn5O5S-u6JNk-gcNr61Em=e7T4DN8CrX_g@mail.gmail.com>
Message-ID: <CAK7LNARtznvDh9fuQn5O5S-u6JNk-gcNr61Em=e7T4DN8CrX_g@mail.gmail.com>
Subject: Re: [PATCH] merge_config.sh: Add option for allmodconfig
To:     John Garry <john.garry@huawei.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 7, 2020 at 6:19 PM John Garry <john.garry@huawei.com> wrote:
>
> On 06/01/2020 18:04, Masahiro Yamada wrote:
> > On Mon, Jan 6, 2020 at 6:18 PM John Garry <john.garry@huawei.com> wrote:
> >>
> >> On 10/12/2019 12:09, John Garry wrote:
> >>
> >> Hi Masahiro,
> >>
> >> Could you please consider this patch?
> >>
> >> Thanks,
> >> John
> >>
> >>> Recently there has been some work in reporting and fixing bugs in booting
> >>> an allmodconfig kernel - here are a few examples:
> >>>
> >>> https://lore.kernel.org/linux-edac/304df85b-8b56-b77e-1a11-aa23769f2e7c@huawei.com/T/#t
> >>> https://lore.kernel.org/linux-ide/bdf02e03-86a1-3d35-2908-28187f504495@huawei.com/T/#t
> >>> https://lore.kernel.org/netdev/CADYN=9LCPfbpwdTWKw03B22-y3Text=RWXW7XP7wJBHYsMOgrA@mail.gmail.com/
> >>> https://sourceforge.net/p/openipmi/mailman/message/36871567/
> >>>
> >>> If we want to boot an allmodconfig kernel we may still want to force some
> >>> loadable modules built-in, like UART drivers. Or just still turn off some
> >>> configs.
> >
> >
> > I do not understand why you need to use merge_config.sh
> > for this purpose.
> >
> > KCONFIG_ALLCONFIG=<path-to-your-config-fragment> make allmodconfig
> >
> > should work.
> >
> >
>
> Right, I could use that. But generally some people like to use
> merge_config.sh directly:
>
> ./scripts/kconfig/merge_config.sh [-a] fragment
>
> so nice to have -a option for completeness.
>


Honestly, I am getting scared
about people extending this script more and more
to do what they want.

Since allmodconfig works enough for this usecase,
I do not see a good reason to add the new option.

-- 
Best Regards
Masahiro Yamada
