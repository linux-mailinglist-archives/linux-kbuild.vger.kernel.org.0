Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E08F3493C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 15:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhCYOKr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 10:10:47 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:26095 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhCYOKj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 10:10:39 -0400
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12PEAGql015579;
        Thu, 25 Mar 2021 23:10:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12PEAGql015579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616681417;
        bh=iQMYfP4L+HyiOQ8RE1EhrH58Te4u5LVK5xmT6nTI+0E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fKd8Mx+67bZ13cC+zu4OPRzyNU5LtNK9v1m62Tv39QS6u29KMkDsELWF9LLDpNgcH
         zKbsaEWyPLxgBnOIzpOWT+9j1Q7l2+zi1DVBw11w/Vc1hjR/3FF+EmZCqSqIZuj2Ow
         zfTLRsSUChvqYjTZklJ6bHwy/W1bb1Sy29y4D3odrlN6lPBzhWB2o7qjuafjVFaeoy
         hQtQVyIexGEUMleabmS/lGdX06rjZAVFvbJlT/s6qUJ4lm/A5VWnrsi+ykEOgkm5Kc
         0VATPha12xUlsuQX4rMZrw93VEMu3WN0EVvbbkGPIvB3n92UQwH629m1XyiJUoGa8I
         Tojpqo4uY4eAQ==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id q5so2181079pfh.10;
        Thu, 25 Mar 2021 07:10:17 -0700 (PDT)
X-Gm-Message-State: AOAM530e/Qc9bEDKFsIJx5jZIH95EczpWExewDqc8c6d0XHBNleS9Bsj
        64yCMfr1/eFMaUj2THTOOEKUry3FYBpwJOkEaGA=
X-Google-Smtp-Source: ABdhPJx4impjrhvCdqsgvM/RHxeMTc3ZP1ExJXCq3+pMeD6Oj7tFoa7CV0PRhkKaRVj5zxW5bvleuanai/tC1PXZZN0=
X-Received: by 2002:aa7:8814:0:b029:21d:d2ce:7be with SMTP id
 c20-20020aa788140000b029021dd2ce07bemr8084370pfo.80.1616681416400; Thu, 25
 Mar 2021 07:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210322213806.089334551@goodmis.org> <20210322214032.293992979@goodmis.org>
 <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
 <20210324095417.49c6377b@gandalf.local.home> <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
 <20210325095039.7202d675@gandalf.local.home>
In-Reply-To: <20210325095039.7202d675@gandalf.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 25 Mar 2021 23:09:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASS70K6vWz6pxkvgPKmRGYvpt+OwAa2ZZT5OMGW4ZJW_Q@mail.gmail.com>
Message-ID: <CAK7LNASS70K6vWz6pxkvgPKmRGYvpt+OwAa2ZZT5OMGW4ZJW_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim users
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 25, 2021 at 10:50 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 25 Mar 2021 15:20:13 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> >
> > The root cause of inconsistency is that
> > you mix up space-indentation and tab-indentation.
> > I do not know if it is a standard way either.
>
> This is the default way emacs has edited perl files for as long as I can
> remember (back to 1996). It became my standard of editing perl files just
> because of that. For everything else, I use tabs.
>
> >
> > For example, scripts/checkpatch.pl uses only tabs,
> > which I think is more robust.
>
> Probably because Joe probably uses vim ;-)
>
> >
> > Unfortunately, we do not have standardized indentation style
> > for scripts yet, and people can go in any direction.
> >
> > The editorconfig patch [1] proposed to always use 4-space
> > indentation for *.pl files.
> > (that is, do not replace 8 spaces with a tab).
>
> I rather have all tabs, or the tab and spaces. I find 8 spaces to be a
> waste of memory and disk space.
>
> >
> > I do not know whether the kernel will adopt .editorconfig or not,
> > but if that patch is applied, your 1/2 will be a step backward.
>
> My 1/2 only made it consistent, as the original code had the tab/spaces mix
> and just a few lines that were modified by others broke it by adding all
> spaces.
>
> >
> > My got-feeling is, you will never reach the goal as long as
> > you adopt a strange indentation style, which is obscure
> > to other contributors.
>
> I'm guessing this is not strange to other perl developers who uses emacs.
>
> >
> > Not all people use vim.
>
> I don't use it either. I was trying to make vim match emacs. Of course for
> those that use something else, it wont help. I'm curious, what's your main
> editor that you use?


I use emacs.

I have some setups in my ~/.emacs
although I am not an expert of emacs lisp.


(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook
          (lambda()
                (setq cperl-indent-level 8)
(setq cperl-tab-always-indent t)
            (setq tab-width 8)
            (setq indent-tabs-mode t)
            ))




Then, emacs can understand that
my preference is tab-indentation
with 8 character width.







>
> > I am not interested in 1/2 either.
>
> OK.
>
> >
> > If you insist on this patch set, apply it to your tree
> > and send a pull request by yourself.
>
> I'm fine with that.
>
> >
> >
> > [1]: https://lore.kernel.org/lkml/20200703073143.423557-1-danny@kdrag0n.dev/
>
> Thanks for the link.
>
> -- Steve



-- 
Best Regards
Masahiro Yamada
