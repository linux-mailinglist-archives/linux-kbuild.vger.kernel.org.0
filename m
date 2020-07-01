Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0086210EFC
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 17:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731759AbgGAPUo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 11:20:44 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44327 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731646AbgGAPUn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:20:43 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 061FKJP8023980;
        Thu, 2 Jul 2020 00:20:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 061FKJP8023980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593616819;
        bh=U+lNViw7WPGshCr+ih3fieJbmictIgFeba+61a+ci9Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xb1gKm+aqYD6Iz4kkBLvF/UeXSSIykW1wstaSoH3diP7m4RidwqYBkxqwlj7ue6j2
         oZBBq1bPotyL5PGWFH+PIwVprz7//p959TmjM3mU3igv665ihdp2u9SUagXzTa+Rx5
         KITnIJr7UjVlCb4woyjjPnlNwGgBWKEG468ZHwX5D1N7j1sn7oX4qxzJ5qXLqQMJ0T
         liMPhbySgRajTUh1iBzctsENGAOInmwDbpDfpXREflomSxGv8eJjoegdT/UH58pDm0
         VJY6wbSwzWjSXZWkKnCYhgqXboGVU4pTTRlIsD+5YtWUaPaI5OTtLEu4T2HCveh1uY
         Lf0Qve8dQxdzw==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id p25so5711851vsg.4;
        Wed, 01 Jul 2020 08:20:19 -0700 (PDT)
X-Gm-Message-State: AOAM531SrPwk2uWhsUM7YPhVP5yj4R+xpMkVZH3ZxPlYKPtrM8wAua2L
        vB4g2RqVl/gD+pCm2y2tgvYnBSSvuxX32bJNULY=
X-Google-Smtp-Source: ABdhPJwFFbcNFkstoDBspvohfOlkIVO9MMPf3L0RU2ABPtLyCu84FW5UR8Vc/gmiF9rrl/wbO/6LF106cE1TvkYAVAs=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr17435984vsc.181.1593616818552;
 Wed, 01 Jul 2020 08:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 2 Jul 2020 00:19:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ607UrHZ9Pa3QjdkWGhid95idCsMFq+GcZc8S-jHw1Tg@mail.gmail.com>
Message-ID: <CAK7LNAQ607UrHZ9Pa3QjdkWGhid95idCsMFq+GcZc8S-jHw1Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Fix split view search and debug info navigation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 30, 2020 at 3:26 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> This series fixes some issues with search while on split view and fix the
> broken hyperlink navigation.
>
> The first patches restore the pre-Qt5 conversion behavior. The last
> one implements navigation on a different way. I opted to keep this one
> in separate, as this one is a new feature.
>
> -


Series, I applied to linux-kbuild/fixes.
(I used v3.1 for 7/7)


If Maxim gives Tested-by or something,
I will append it.





> v3:
>
> - dropped a patch that it is not needed anymore;
> - hyperlinks should now work for non-visible items;
> - fixed a description at patch 3.
>
> Mauro Carvalho Chehab (7):
>   kconfig: qconf: cleanup includes
>   kconfig: qconf: make search fully work again on split mode
>   kconfig: qconf: make debug links work again
>   kconfig: qconf: re-implement setSelected()
>   kconfig: qconf: simplify the goBack() logic
>   kconfig: qconf: don't show goback button on splitMode
>   kconfig: qconf: navigate menus on hyperlinks
>
>  scripts/kconfig/qconf.cc | 169 +++++++++++++++++++++++----------------
>  scripts/kconfig/qconf.h  |  29 ++++---
>  2 files changed, 119 insertions(+), 79 deletions(-)
>
> --
> 2.26.2
>
>


-- 
Best Regards
Masahiro Yamada
