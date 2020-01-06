Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8692131735
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 19:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgAFSFY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 13:05:24 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61774 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFSFX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 13:05:23 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 006I54ue013464;
        Tue, 7 Jan 2020 03:05:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 006I54ue013464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578333905;
        bh=ilQorFqS+zyMuayxMN+IpKjCHeBpG/ajISHuV8eMShA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=21siazaPoePAzfB8/BUG0CJf9TlDNifIdYb4d8oCT5/8Vnhd3vpxxFN7aQnQClJcC
         Dv1gauvi0G+OWGz64vgtgQs/NGjIuOB7wxUMnkc1/lMND0+iA1S7nirIquujt/UyXl
         L2zZG3jh9NZhkJVlxbwtpu1rdmimspym7LRQkrwPCN5TnuNz6J8VnV51nyJ/Q5Vea1
         vq7RJv2rkxQLP6jpPJKUEEcoYzJYJIWiJ4KiVn4OegQ2504degVDMM3HuM+j7syuQr
         9yLZ+zEX6vG7isP50NmeVaPYLo9G+bea2WZWkZqGB6XWQGFh2dAYrJCwsfGmWA7TR7
         p5U/l8tk+rWJg==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id g15so32203108vsf.1;
        Mon, 06 Jan 2020 10:05:05 -0800 (PST)
X-Gm-Message-State: APjAAAX7VgDErFB2Wo08hv4xXA1bxFxUAOMou+s2T8ZSoXVjw5Dw6Rys
        lQgR0WnrDhTnvSZ/fjEnKbnn6mIELU2v8GDbZIc=
X-Google-Smtp-Source: APXvYqzLMthNv/omDtOFD3rCYekMf0c1Qo8cZvSZACuUeY6SdmL+pxCYSI/AmGugkfWuMqx1ZrBVHHzsnB9zi04Vhwg=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr44112854vsa.181.1578333903950;
 Mon, 06 Jan 2020 10:05:03 -0800 (PST)
MIME-Version: 1.0
References: <1575979754-184896-1-git-send-email-john.garry@huawei.com> <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com>
In-Reply-To: <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 7 Jan 2020 03:04:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+XHGete9u2SV7fTj3HpROQmzfuJhV8tXW_xXkoPOYvg@mail.gmail.com>
Message-ID: <CAK7LNAS+XHGete9u2SV7fTj3HpROQmzfuJhV8tXW_xXkoPOYvg@mail.gmail.com>
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

On Mon, Jan 6, 2020 at 6:18 PM John Garry <john.garry@huawei.com> wrote:
>
> On 10/12/2019 12:09, John Garry wrote:
>
> Hi Masahiro,
>
> Could you please consider this patch?
>
> Thanks,
> John
>
> > Recently there has been some work in reporting and fixing bugs in booting
> > an allmodconfig kernel - here are a few examples:
> >
> > https://lore.kernel.org/linux-edac/304df85b-8b56-b77e-1a11-aa23769f2e7c@huawei.com/T/#t
> > https://lore.kernel.org/linux-ide/bdf02e03-86a1-3d35-2908-28187f504495@huawei.com/T/#t
> > https://lore.kernel.org/netdev/CADYN=9LCPfbpwdTWKw03B22-y3Text=RWXW7XP7wJBHYsMOgrA@mail.gmail.com/
> > https://sourceforge.net/p/openipmi/mailman/message/36871567/
> >
> > If we want to boot an allmodconfig kernel we may still want to force some
> > loadable modules built-in, like UART drivers. Or just still turn off some
> > configs.


I do not understand why you need to use merge_config.sh
for this purpose.

KCONFIG_ALLCONFIG=<path-to-your-config-fragment> make allmodconfig

should work.




-- 
Best Regards
Masahiro Yamada
