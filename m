Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1A65ED44D
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Sep 2022 07:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiI1Fjh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Sep 2022 01:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiI1Fjh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Sep 2022 01:39:37 -0400
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0089102C
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Sep 2022 22:39:33 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 28S5d3UK023029
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 14:39:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 28S5d3UK023029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1664343543;
        bh=j7WsjhYS8dKZSH3tfHHxY4XaYgKONTNLQPBqrbmADVY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fVub2KR1LwSTC3G9AB0fqvINJBuk8PTxXt6+AE0S40pG6YIUhTfLhVwOQUkZ9oF9f
         cr/OhPPD9BzP1xCC9T6d78wD91kiD8Pdqc1ivfNivK5yDdt9yr0P5zXb+5M0pJImDx
         3mL0bj5ZM3JeCIrjqyWrBv9RPAKhPXV76KRXJt4tDr96V2f7CcCvNPNYimVD0wfEfc
         D8KkbkXF4nNBQO0uIvZjNJTQb1H2qTTt5Fa4GVcdfqtGhudq83tCo2Me94L/VaKTKX
         rkee3ZXmSrgNvN2CIDvVmIeanidYzzjFmYJ8tIu5L7PcwEqEh1zXmme/61RTktg1ko
         f6KTtXt7TzUXA==
X-Nifty-SrcIP: [209.85.167.174]
Received: by mail-oi1-f174.google.com with SMTP id m81so14309622oia.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Sep 2022 22:39:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf2TRZwqhBRpuOiBH1DEYvl1a0sCFv0Ovv0/+bz2o0u5B3DMO68E
        YedzMGNER56mVZwcqs383z7PSF8i21H+EOkr5q4=
X-Google-Smtp-Source: AMsMyM7uHct7YRXfZazSKGBPNW1oA2o9WuqMb2pJY8Youe6pNhs8OyR+EZSe7NzQvBVK4irAMl27ry9bbatfCtOABQA=
X-Received: by 2002:a54:400c:0:b0:34f:9913:262 with SMTP id
 x12-20020a54400c000000b0034f99130262mr3443524oie.287.1664343542543; Tue, 27
 Sep 2022 22:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
 <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
 <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com> <e628cb91-0ed8-993e-7904-c7bf010b7462@infradead.org>
In-Reply-To: <e628cb91-0ed8-993e-7904-c7bf010b7462@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 28 Sep 2022 14:38:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATche7qAiTROUYsp9h4E6OEbvddYgArkZHx-OHxqqLwVQ@mail.gmail.com>
Message-ID: <CAK7LNATche7qAiTROUYsp9h4E6OEbvddYgArkZHx-OHxqqLwVQ@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: rewrite check-local-export in sh/awk
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Owen Rafferty <owen@owenrafferty.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 28, 2022 at 7:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> On 9/6/22 02:28, Masahiro Yamada wrote:
> > On Sun, Sep 4, 2022 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>
> >> On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> >>>
> >>> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> >>> ---
> >>
> >>
> >> Please input something in the commit log.
> >>
> >> I think the benchmark in v2 is worth mentioning
> >> because "awk is faster than bash" is one benefit
> >> of applying this patch.
> >>
> >>
> >
> >
> >
> > Applied to linux-kbuild. Thanks.
> >
> >
> > (V5 was not delivered to ML somehow,
> > but I found it in my mailbox.)
>
> Yeah, I haven't seen that one either.
>
> For whatever is in linux-next-20220927, I am seeing something
> unpleasant. I'm not positive that it's due to this patch, so I'm
> still checking/testing (but I'm about to leave home for awhile so
> I wanted to go ahead and let people know about this).
>
> I do N number of randconfig builds in a script (say 10).
> What I am seeing is that when an 'nm' error happens, the
> script is Terminated and not continued. E.g., if the error
> is on randconfig build #4, builds 5-10 are never started.
> The controlling script dies.
>


Hmm, I have not yet observed such an error.

If it happens depending on a particular configuration,
please share the .config file.





-- 
Best Regards
Masahiro Yamada
