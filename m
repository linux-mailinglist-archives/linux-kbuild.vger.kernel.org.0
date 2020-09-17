Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148AD26E097
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Sep 2020 18:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgIQQYF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 12:24:05 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:44220 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728481AbgIQQXl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 12:23:41 -0400
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-03.nifty.com with ESMTP id 08HGAHUr028024;
        Fri, 18 Sep 2020 01:10:17 +0900
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08HG7gI6018043;
        Fri, 18 Sep 2020 01:07:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08HG7gI6018043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600358862;
        bh=mTFyjjqzXwQDDrMyMujceAFrT3D5DZ9GB1b6zo1PGhc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fa78KBoicbBAy01paEcUSp8fmnMryefGfPNS4tUgw51hgHWq/Cp1QPvMSjfD/03qZ
         gZgIuGTWiTa2HlIojJO5N1xcqjus6kgP6nrJLwBmf3OyfexWFKMb1nejxfLCOvxt1H
         kE2aBfb5Ap1L4u5IE9+DgIMjSdB+eMFjdcHbDbIwhA3EAyYqadDeKq/Dqm4P4QEk+D
         ekPJlK7SnmV9ekKWRKtSYPtYNzx29OKHy7YFNPkSAdtuKv3hOzE/AhJLxFgBn2mObo
         eKx6D08slxorJ68rq75s6+6sB6TsLwutZF6u/rJqIysDcV9CBQTqKw8G+NAeJXO8G4
         r/2E1s0XN06HQ==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id bg9so1381550plb.2;
        Thu, 17 Sep 2020 09:07:42 -0700 (PDT)
X-Gm-Message-State: AOAM532V9j4O06xUrTr8eSFryrYcUu/al7nVcBKPoTcLoclgjK9oQPvn
        rlKSIr8/2qC4yXV3DqgOuYleSpVRuE7ul3s1e2I=
X-Google-Smtp-Source: ABdhPJyYtKoecVKJ4p4q8GvkALfQxoh8kWu6Zn933Jnd1KOE0dbHt+z3ujosBSBVRwagqWsw+1cOp71SkjMOAYA2pJ8=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr9333071pjb.87.1600358861790;
 Thu, 17 Sep 2020 09:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200908221638.2782778-1-masahiroy@kernel.org>
 <20200908221638.2782778-2-masahiroy@kernel.org> <boris.20200909155725@codesynthesis.com>
In-Reply-To: <boris.20200909155725@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 18 Sep 2020 01:07:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGojQgQ4oAvW6XkOwo0BiLiZdzOruvYqOQAVdhdtyTpA@mail.gmail.com>
Message-ID: <CAK7LNASGojQgQ4oAvW6XkOwo0BiLiZdzOruvYqOQAVdhdtyTpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: fix incomplete type 'struct gstr' warning
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 9, 2020 at 11:09 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > Currently, get_relations_str() is declared before the struct gstr
> > definition.
>
> Yes, I also ran into this while building the kconfig code with MSVC.
> I just moved the struct gstr definition before lkc_proto.h #include
> but your fix works just as well.
>
> Acked-by: Boris Kolpackov <boris@codesynthesis.com>
>
>
> > BTW, some are declared in lkc.h and some in lkc_proto.h, but the
> > difference is unclear. I guess some refactoring is needed.
>
> Yes, please. My (potentially incorrect) understanding is that lkc_proto.h
> was for functions that are not (or should not be) used by clients but
> should nevertheless have prototypes due to -Wmissing-prototypes. I,
> however, believe this no longer holds and so would vote to merge
> lkc_proto.h into lkc.h.
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/boris.20200909155725%40codesynthesis.com.



Applied to linux-kbuild/fixes.



-- 
Best Regards
Masahiro Yamada
