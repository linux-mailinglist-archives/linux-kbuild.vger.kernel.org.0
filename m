Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7A6C9620
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 03:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfJCB1L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 21:27:11 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49234 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfJCB1K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 21:27:10 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x931Qkxq032090;
        Thu, 3 Oct 2019 10:26:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x931Qkxq032090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570066007;
        bh=x6/8l8kVsC1NbNuoqq4xa9uPDopH488YlyQtX+qP+3U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kUSSaEsDmZz8ALmJHVOaLQGYfBrsuUIYZCgjVjDx6ZEgkw0Ei0TaP05NDwD3aQBnx
         JXuM+slUKDoOBTu7+hzWsF7LNWO5ogCaacgz6BW1MMhfCy2nZMwiyVXIU1suq/QNjs
         WmrsfRc8HHAXCOvASsIFh2Nt986I9B6UGR60htgeWpRPG1ZxEV6yLI9mJsyHrp6N/H
         BjXA//0rtpdzUTiRkYlFTZrapg1xSizFGsGlPZFGvXLzmsjn68Mf1l2lB3Lg5kLFQg
         fgoE2jrolyP8hbawBJYtTTJFUoskrwrciZbP7td06xhv/Lh6WIZwTrx2nz5x0Aliug
         B8EJPrwoiTYGA==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id u31so380833uah.0;
        Wed, 02 Oct 2019 18:26:46 -0700 (PDT)
X-Gm-Message-State: APjAAAU+OkGKMvn2f936XI8xH9FIz/NdjbRTyx8USMtNa8R5FLqJKdZz
        uf5Vt1YNXAYNKbNXhM06LEhoAL7rAHDd6uP/mlg=
X-Google-Smtp-Source: APXvYqzd0f8HET8II/UsIBzv70d/UG4czUDbi94oH82Ta/IsxIWI235KX/if2tQktrEkYTlgpyqXUkKUig5vpKEcNxw=
X-Received: by 2002:ab0:20b4:: with SMTP id y20mr3537503ual.121.1570066005679;
 Wed, 02 Oct 2019 18:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927134108.GC187147@google.com> <20191002185701.GA29041@linux-8ccs>
In-Reply-To: <20191002185701.GA29041@linux-8ccs>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 3 Oct 2019 10:26:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbKVEf8Q82k5374UOQVxFJX1U7eU4ywW-LdGvHOq+tPw@mail.gmail.com>
Message-ID: <CAK7LNATbKVEf8Q82k5374UOQVxFJX1U7eU4ywW-LdGvHOq+tPw@mail.gmail.com>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

H Jessica,

On Thu, Oct 3, 2019 at 3:57 AM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Matthias Maennich [27/09/19 14:41 +0100]:
> >On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
> >>
> >>I was hit by some problems caused by the module namespace feature
> >>that was merged recently. At least, the breakage of
> >>external module builds is a fatal one. I just took a look at the code
> >>closer, and I noticed some more issues and improvements.
> >>
> >>I hope these patches are mostly OK.
> >>The 4th patch might have room for argument since it is a trade-off
> >>of "cleaner implermentation" vs "code size".
> >>
> >Thanks Masahiro for taking the time to improve the implementation of the
> >symbol namespaces. These are all good points that you addressed!
>
> Agreed, thanks Masahiro for fixing up all the rough edges! Your series
> of fixes look good to me, I will queue this up on modules-next this
> week

Since these are bug fixes,
please send them before v5.4.

Thanks.



> with the exception of patch 4 - Matthias, you are planning to
> submit a patch that would supercede patch 04/07, right?
>
> Thanks!
>
> Jessica



-- 
Best Regards
Masahiro Yamada
