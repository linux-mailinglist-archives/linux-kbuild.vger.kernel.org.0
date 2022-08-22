Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C56359CAE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Aug 2022 23:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbiHVVgb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Aug 2022 17:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbiHVVga (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Aug 2022 17:36:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0BB52E67
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Aug 2022 14:36:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a16so8787836lfs.3
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Aug 2022 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5ru0aABhHpkFT/xNIs3ZgPkQqBJ5OZsLkRi6XtgKWDc=;
        b=dcayZoNHlCo4X2lBZCOuItLTviaZ8g58d6ch9c4HiqsrmeMeUSPmuGQecK7tHnrrcU
         BGZDNtotPI8KTh71ufRsdBAJD9I0Wn/JaS/a7cuRQDPcdnZDdr/puIhkK7LQ17LqLP5m
         F7mSDEKTuFxE0vpJK7tIpCoMZbPYmyZue3712Yl2OWgNZkQLUxtOw67pP67r7PPaDnhE
         Dr5EV0ORbmC57dz2HQvVdfUabDG0a3X94rd8sabU5Gtm3YMD/R+b5qXEve4IGMY19D6n
         BGVAXE8R6X58ZONsUKzTfAJuS/dmi8A3ymiKeFW/UExxBF4ePGcUFyPDhIOVZoMoPMMc
         aMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5ru0aABhHpkFT/xNIs3ZgPkQqBJ5OZsLkRi6XtgKWDc=;
        b=DliFygIlpVKLXStrYORL0shaRRLj/M9yw4lVmILReSSDJuZl+1GMJI7dZuRHV7vtq3
         lbT2h87f/bmXYcDEgDrmP4YIniw/J6Sa89cqYJC72SJXMqdydu6eqN1SnXfXLdW14/2U
         mLdZ6SIvPBf/oUbct2x26ONUIshA9b4An6GaOhLLJMz1SaMclwis/oQSSAfiXWElJWlX
         nO0IEgLfTZfEArPMChFM6A0rmgzQUuOcWMt9fjk3hvhdWVtOOQWJhfRksb7+KszqNqDF
         fD6QJZgOxSBhNvwrpjcgr+5ES1gUDYBre5D+VdRTp2tC28ageN2e5Wv4cyo4wavf09px
         23gg==
X-Gm-Message-State: ACgBeo0dfLeNo5QtzoqV572ocqe+YaxRpaRA7QzfhaOA/0ofitZJXkrY
        gNGx31HsOejhzNkH+Do1ez80N+bidNf1TKmCoK5gzA==
X-Google-Smtp-Source: AA6agR4VQdfm3FFb0/UvTwdOZ1B/U6O/llTvGCtgfXsaf06xvjwNGX6p0asM/se/N286IcpWF+PmcstxsiQQmfXjyoo=
X-Received: by 2002:a05:6512:33d6:b0:492:c423:1672 with SMTP id
 d22-20020a05651233d600b00492c4231672mr7240817lfg.432.1661204186888; Mon, 22
 Aug 2022 14:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANXV_XwgZMCGXijfoUyZ9+KyM6Rgeqiq-sCfubyj_16d-2CN=A@mail.gmail.com>
 <20220815013317.26121-1-dmitrii.bundin.a@gmail.com> <CAKwvOdnnSAozX8bQ9HeSw12BV9OjpzyDmXk_BGczjVVQNN+7tQ@mail.gmail.com>
 <CANXV_Xw2wzwDdJkyV1nHPQm2JTt48SLrNc7YwrfcxOwuFA-z3w@mail.gmail.com> <CAKwvOdkiq_byi1QeCvSGb2fd+0AJ1k9WNnsHJMeaaQcPRy1Wxg@mail.gmail.com>
In-Reply-To: <CAKwvOdkiq_byi1QeCvSGb2fd+0AJ1k9WNnsHJMeaaQcPRy1Wxg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Aug 2022 14:36:14 -0700
Message-ID: <CAKwvOdkPwbD-c0V-up2Ufzb-Uh7LLyD12X0FKeBa=hn+cSPA9Q@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: add debug level and macro defs options
To:     Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Isabella Basso <isabbasso@riseup.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 22, 2022 at 9:45 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> > So it seems like a reasonable choice to provide a debug info
> > level config that would explicitly set the level without relying on
> > implicits. The default value of the config is set to -g2 to not change
> > the build behavior that was before introducing the option. And it
> > works for both older and newer versions of GCC/Clang in the same way.
> > The benefits of the -g1 option are indeed questionable except that it
> > produces an image with ~20% less in size.
>
> Until there's a concrete need, YAGNI.

Or add -g1 to CONFIG_DEBUG_INFO_REDUCED.
-- 
Thanks,
~Nick Desaulniers
