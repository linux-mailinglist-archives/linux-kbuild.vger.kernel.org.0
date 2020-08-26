Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E232F253027
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 15:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgHZNn7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 09:43:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59894 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730362AbgHZNnw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 09:43:52 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07QDhVZZ017506;
        Wed, 26 Aug 2020 22:43:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07QDhVZZ017506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598449412;
        bh=AaxZbHVRT0B0WvZikEwb9JWwetPJbNAYgChkXhtLU/4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHMK4EGand39S2bqnysrwLJP/j+JKJqhZ6WDelFO0RLQZJsp25s47HGyGEXuFrIGq
         B2zeQiKlftfbTtfZWlLDfmudbtBBcP+B391mM8nw8UA1l4aKckQaAUFEdvh1VIVmQH
         DrdvyZlYuvVay4GokTI+8OnsF6VWLMjxM0182pzwQluOv9+36qJhk2y1ODyYyit6Ed
         P9AAmctGTGIp8N0fz2dTb+q6wgDm/SEpDooEr0pybpizxrMrABqJr25erseZ+y0/Yh
         vqI3WyoWORYGggSaAfMW2lt98F7f3MeGG2+1tmYayRvQDAHk8wwEmNDW30qau6sy5B
         ehDslBLFYRYRQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id 10so908151plg.8;
        Wed, 26 Aug 2020 06:43:32 -0700 (PDT)
X-Gm-Message-State: AOAM531GLFU+9hRRe8pDhFlxEy3Touu4+PfpStYzVJ968uY8nV38RJSs
        DjatMgdSG6aekPD/YXSf0DMIahSjiogupG5BtQ8=
X-Google-Smtp-Source: ABdhPJz13Sy2/Q9wbfyRiULMActNdPAGMXRL1XnLaw9V24/B2oLh1P9bHcVJN+jbAwl9+mYbc1HFqDR9eH50CCZafbA=
X-Received: by 2002:a17:90a:8904:: with SMTP id u4mr6379800pjn.87.1598449411630;
 Wed, 26 Aug 2020 06:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200816123248.97770-1-sedat.dilek@gmail.com> <CA+icZUUnP5JQCzMG=pMQFwqQBHy78au6E0eJCod0YOARbHoLrw@mail.gmail.com>
In-Reply-To: <CA+icZUUnP5JQCzMG=pMQFwqQBHy78au6E0eJCod0YOARbHoLrw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Aug 2020 22:42:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzGLCeEDHHEAzMtEBO_B3D0tGwe7n5fLesdXca-+NL+g@mail.gmail.com>
Message-ID: <CAK7LNAQzGLCeEDHHEAzMtEBO_B3D0tGwe7n5fLesdXca-+NL+g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Simplify DEBUG_INFO Kconfig handling
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 9:04 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Just a friendly ping.
>
> - Sedat -
>
> On Sun, Aug 16, 2020 at 2:32 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > While playing with [1] I saw that the handling
> > of CONFIG_DEBUG_INFO can be simplified.
> >
> > [1] https://patchwork.kernel.org/patch/11716107/


Applied to linux-kbuild.

Sorry for the delay.



-- 
Best Regards
Masahiro Yamada
