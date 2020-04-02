Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2BF19C770
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 18:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389547AbgDBQ4S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 12:56:18 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63937 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbgDBQ4S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 12:56:18 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 032Gtr9Q005498;
        Fri, 3 Apr 2020 01:55:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 032Gtr9Q005498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585846553;
        bh=6ZZoDoOKiCZcq/ELjV72AkOj4e/qsdQ44YNPFtPuBW8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Qef/44hV4oi6lVtA9aEQGVHWtWBg+upwuvIuUF5RzsTDVr8iCoGwoyMS/zzUB//yW
         ivhkcvQ16lcQFTyWhSz3aIS3sjw1w3ExXr//kgXfYO8WZpu6HQuFCgmQYiDu+9orgJ
         kksKUKZrEN0f6xzBUwp5n7KmzDFwN8l4FKDboebFz0pErsALzDlK7oR063CbnyaR/e
         qu25+T0Ikdvd1cPHQn0r+36Pc9WeaKHiccO9fhHY+rgRgvvw36Jx3BZu2UA+nUt8nK
         BeGMVl8mjAxr/1cPgxYoOprIxzsRuKjZeN5ZeP8cQRA4qtUO7xVwtUPXH2uFxOYsaJ
         U+LSe/LzhiHjg==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id z7so1480969uai.6;
        Thu, 02 Apr 2020 09:55:53 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ7WURFzjFP65raaTXvu1S1q4XWYsEh1Vq2wjdhJdpLpWek35A8
        esvZ5zLAdbZCNiESiNIII23wyl17uZ8VtNMvxeA=
X-Google-Smtp-Source: APiQypJLFBtRFCp1KNv12TF1yrRC4t7p1ncbvfY89mY7bO0lPUtT6oW7iq/ahpxZmtxOjvpVB3iMEH55n2NSvKgqhwc=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr3490973uak.95.1585846552265;
 Thu, 02 Apr 2020 09:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Apr 2020 01:55:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ49zWcZzGdnpkUBczR88DPHNRu2CFMOjvVVs5MB9MvVQ@mail.gmail.com>
Message-ID: <CAK7LNAQ49zWcZzGdnpkUBczR88DPHNRu2CFMOjvVVs5MB9MvVQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Fix several issues at qconf.cc
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 6:28 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Since its conversion to support Qt5, back on Kernel 3.14, the qconf.cc tool
> has been having some issues.  With Kernel 5.6 (and Qt 5.13) it doesn't
> work at all, on any of its modes.
>
> This patch series restore its functionality to what it had before Kernel 3.14.
>
> Now, all three modes should work as expected, and the layout will be shown
> with a vertical split, with the help messages at the botton, for both Single and
> Full modes.
>
> The Split mode should also work properly, with its horizontal split showing
> the main config items at the left and a per-items view at the right.
>
> Mauro Carvalho Chehab (6):
>   kconfig: qconf: clean deprecated warnings
>   kconfig: qconf: Change title for the item window
>   kconfig: qconf: fix the content of the main widget
>   kconfig: qconf: fix support for the split view mode
>   kconfig: qconf: remove some old bogus TODOs
>   kconfig: qconf: Fix a few alignment issues


Thank you for fixing several issues!

I will pick this series for v5.7-rc1 soon.



>
>  scripts/kconfig/qconf.cc | 90 ++++++++++++++++++++++++++++------------
>  scripts/kconfig/qconf.h  |  2 +
>  2 files changed, 66 insertions(+), 26 deletions(-)
>
> --
> 2.25.1
>
>


-- 
Best Regards
Masahiro Yamada
