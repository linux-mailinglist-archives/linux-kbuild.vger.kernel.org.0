Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EDC5EE846
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Sep 2022 23:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiI1VYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Sep 2022 17:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbiI1VYL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Sep 2022 17:24:11 -0400
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E91255AC
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 14:24:10 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 28SLNtF2004975
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Sep 2022 06:23:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 28SLNtF2004975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1664400236;
        bh=OjiQ1doNog/JWhX86lsP3omApwC7zYFePhvL1UK0FWE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yHU9aG6pKjsGxnJXYXCgfW1e4Jto8de+dOBZPDmb5q/HPld0My5+iwewRVyIbkQJx
         SS/1oL9680sIYnWQLOo7zb2JyGkMK1owsg9CmCRnHazw88E9HV7cIAGoZnKOIrcD6r
         LnJvscySVbX/gJzCjINmRnALwgLf9MYghIB6qshiJ5C8lpF+L3619P4A1GngNu0qkJ
         /vjzwDVBN7HS5bhUGiglER9qbbZfleLdp93Y6YLLFFTrxNMmEDGDyS2wg0I85JbhKK
         gMP9YOyLBKhE7wfzf4A+0DsF8hKxQPM3tDhFEz1BC5mBSqMVkHQzdkFvxvmO8yRJRs
         5ZHzDx08dB4ww==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-131886d366cso7319106fac.10
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 14:23:56 -0700 (PDT)
X-Gm-Message-State: ACrzQf2/ButdM07qc/qsW6s2jljFpMxhb+zMyLX6RvB2MzQotaUIB7i1
        IYla9PSvBy5q/WvKPwLkZEYPZ/GUSxI+FaXZeLI=
X-Google-Smtp-Source: AMsMyM5QaERGmUmNYsGikUKPSIHfA17ssg2n+Up0k1P0HZnNsSsRCWBgihdwqY/bR4yHS5Wk2L69g/4nTVaqU07DrhE=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr6456370oab.287.1664400234933; Wed, 28
 Sep 2022 14:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
 <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
 <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
 <e628cb91-0ed8-993e-7904-c7bf010b7462@infradead.org> <CAK7LNATche7qAiTROUYsp9h4E6OEbvddYgArkZHx-OHxqqLwVQ@mail.gmail.com>
In-Reply-To: <CAK7LNATche7qAiTROUYsp9h4E6OEbvddYgArkZHx-OHxqqLwVQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 29 Sep 2022 06:23:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3-KoEiwqFTgNa4DPWrBYuPcy7mPpJ-6+dtYsa=bjaNQ@mail.gmail.com>
Message-ID: <CAK7LNAS3-KoEiwqFTgNa4DPWrBYuPcy7mPpJ-6+dtYsa=bjaNQ@mail.gmail.com>
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

On Wed, Sep 28, 2022 at 2:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Sep 28, 2022 at 7:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi,
> >
> > On 9/6/22 02:28, Masahiro Yamada wrote:
> > > On Sun, Sep 4, 2022 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >>
> > >> On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> > >>>
> > >>> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> > >>> ---
> > >>
> > >>
> > >> Please input something in the commit log.
> > >>
> > >> I think the benchmark in v2 is worth mentioning
> > >> because "awk is faster than bash" is one benefit
> > >> of applying this patch.
> > >>
> > >>
> > >
> > >
> > >
> > > Applied to linux-kbuild. Thanks.
> > >
> > >
> > > (V5 was not delivered to ML somehow,
> > > but I found it in my mailbox.)
> >
> > Yeah, I haven't seen that one either.
> >
> > For whatever is in linux-next-20220927, I am seeing something
> > unpleasant. I'm not positive that it's due to this patch, so I'm
> > still checking/testing (but I'm about to leave home for awhile so
> > I wanted to go ahead and let people know about this).
> >
> > I do N number of randconfig builds in a script (say 10).
> > What I am seeing is that when an 'nm' error happens, the
> > script is Terminated and not continued. E.g., if the error
> > is on randconfig build #4, builds 5-10 are never started.
> > The controlling script dies.
> >
>
>
> Hmm, I have not yet observed such an error.
>
> If it happens depending on a particular configuration,
> please share the .config file.
>
>


Owen provided the following fix-up.
I see his mail in my mailbox, but not in ML.
(Does the ML reject mails from non-subscribers?)




diff --git a/scripts/check-local-export b/scripts/check-local-export
index 0c049ff44aca..f90b5a9c67b3 100755
--- a/scripts/check-local-export
+++ b/scripts/check-local-export
@@ -8,6 +8,7 @@
 # EXPORT_SYMBOL should be used for global symbols.

 set -e
+pid=$$

 # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
 # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
@@ -20,7 +21,7 @@ set -e
 # Then, the following line will be simpler:
 #   { ${NM} --quiet ${1} || kill 0; } |

-{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
+{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill $pid; } } |
 ${AWK} -v "file=${1}" '
 BEGIN {




I squashed the diff to the original patch.
Thanks.




-- 
Best Regards
Masahiro Yamada
