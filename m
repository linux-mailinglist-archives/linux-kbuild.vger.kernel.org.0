Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7915333C10B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhCOQDT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:03:19 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64640 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhCOQDJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:03:09 -0400
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 12FG2pvB018743;
        Tue, 16 Mar 2021 01:02:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 12FG2pvB018743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615824171;
        bh=WHafvxgXwJIi5nVcmPrmtV1om/zvYnRjnPqdCIaD86o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TdfY6Uyt7TlQSVx03s3MV0gg8Cg+4lapq0GIQWe0rpVCZFT33e7RDbJARoGIeLyb1
         Nb9UW1Iv4zg6qcDBk1o6ZWM0XZpgpmTTnmDhFOUDVB+rolLZA7zOIFaz/05wC2SOwW
         DALAXQNkarBoTlCvUBMKMv1Ab2sASF/Q6GDPemI/7js7hmALilLThGUdhvwuRlAr0O
         phgdtD99EhiMko3vWudOHY4LCMI8t0/1kAuXb+R6qoRJx4y2p1Gb2eDfkd9YBVTk/8
         Wd54ACi+lgSKvUZodF9CtBQAPwU5DF2oYWektRIB6qFSfAsTnQOvgR98EB2XPCnoXf
         rLOLsOsD+zTwQ==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id b23so6862229pfo.8;
        Mon, 15 Mar 2021 09:02:51 -0700 (PDT)
X-Gm-Message-State: AOAM530SNyIdRfp0k+hdDE8FliyEQ11lhRdqPTL0uGJRFdE1aIABMzwn
        50jL3rRQmN8jyepJpC0eIrqaVsnb4sze+t9DAw0=
X-Google-Smtp-Source: ABdhPJx/iHnHUHvgZENUGptxuRHsb+juu64zNyf0ivmKtIL6SUieGY2UvMMJZzxghVMusR5nm5DHAhCJCjgm79wLn54=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr228612pgq.7.1615824170753;
 Mon, 15 Mar 2021 09:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194836.372585-1-masahiroy@kernel.org> <20210313194836.372585-7-masahiroy@kernel.org>
 <boris.20210315115747@codesynthesis.com>
In-Reply-To: <boris.20210315115747@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Mar 2021 01:02:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLx+C2C7M7kNMhRz=W4SbvtKQ8Hca_hbzkU8JY0z9nww@mail.gmail.com>
Message-ID: <CAK7LNASLx+C2C7M7kNMhRz=W4SbvtKQ8Hca_hbzkU8JY0z9nww@mail.gmail.com>
Subject: Re: [PATCH 07/13] kconfig: move conf_set_all_new_symbols() to conf.c
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 15, 2021 at 7:07 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > This function is only used in conf.c. Move it there together with the
> > randomize_choice_values() helper.
> >
> > [...]
> >
> > diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> > index f946ab49ef50..d0d5acecb530 100644
> > --- a/scripts/kconfig/lkc.h
> > +++ b/scripts/kconfig/lkc.h
> > @@ -57,7 +57,6 @@ const char *zconf_curname(void);
> >  const char *conf_get_configname(void);
> >  void sym_set_change_count(int count);
> >  void sym_add_change_count(int count);
> > -bool conf_set_all_new_symbols(enum conf_def_mode mode);
> >  void set_all_choice_values(struct symbol *csym);
>
> A number of people package kconfig as a library that is then used
> in various projects outside of the Linux kernel. Removing this
> function breaks the library ABI and potentially such project. For
> example, I call conf_set_all_new_symbols() from my libbuild2-kconfig
> build system module[1].


There is no such ABI in Kconfig.


> I know you don't care much for such out-of-kernel usage, still, this
> (and the previous commit) feels like superficial reshuffling of code
> and perhaps it's worth not breaking things unless there is something
> substantial to gain?
>
> [1] https://github.com/build2/libbuild2-kconfig/blob/master/libbuild2-kconfig/libbuild2/kconfig/init.cxx#L938


confdata.c is linked to all flavors of Kconfig
(conf, mconf, gconf, and qconf).

conf_set_all_new_symbols() and randomize_choice_values()
are apparently only used by the text-base conf.
They need to go to the correct location.



-- 
Best Regards
Masahiro Yamada
