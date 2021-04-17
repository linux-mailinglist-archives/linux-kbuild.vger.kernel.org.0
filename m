Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054493631FA
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 21:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhDQTgm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 15:36:42 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24947 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbhDQTgm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 15:36:42 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13HJZqmc013042;
        Sun, 18 Apr 2021 04:35:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13HJZqmc013042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618688153;
        bh=hkh5YwuJBIOBjPiu6hBZE5+OCCrOzZnlnU6cXAwLvTY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZK3XIqNT/fCa8ImCuvX+cDcQTtmH4rQ6sXxD0QhdjI25bmRu04tR4OVAc2CdfXoLp
         99YVsJ97jUfNaIdFiYrOAEFpaicKwL8uaDTpjraqcAdATICBoKKKzMgSbxDlWKYeRZ
         kMxLeGMHd1jUSAusYNcS7YdgGX1MwqQY1bPiOO84tOwwGAFkRSgAmzPtOReD5Vmzy2
         YQApshMt9mKZxriuipk1nQCa6f+94TVRZYDORtb1iIWaZKZwV4co3hNVX7Pp5+QheH
         P/uBSjooCqTmifCZUTC1cwtHjTjeG02fVk/fgva+K4VtrAQoG/GFJxwNaf8zIOXLN+
         wlCOiZZ7QqYAg==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so18196308pjh.1;
        Sat, 17 Apr 2021 12:35:52 -0700 (PDT)
X-Gm-Message-State: AOAM530kXdrOvGw6ylR/jxCph0fN9fsHTD1Yx7YmjCuz+DSeTReO62Bd
        YR4CyGkb3gu2jAtjBYL6S/SfomziXD3XEsyWGww=
X-Google-Smtp-Source: ABdhPJyiH91xXT+6zU7vn+mvPE0jUTNiMhDdgt0LZHv/4PQBIi/IYiCHtOLaUUe6kYHvSR01SInIGyrud/tn7vU1GTQ=
X-Received: by 2002:a17:90a:1056:: with SMTP id y22mr15383723pjd.153.1618688151869;
 Sat, 17 Apr 2021 12:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com> <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com>
In-Reply-To: <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Apr 2021 04:35:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpjUP+MvnUed68a074H2EPVeD5+KLzecAuFxxi_72eZw@mail.gmail.com>
Message-ID: <CAK7LNASpjUP+MvnUed68a074H2EPVeD5+KLzecAuFxxi_72eZw@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 9:43 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Apr 15, 2021 at 1:19 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Rather than check the origin (yikes, are we intentionally avoiding env
> > vars?), can this simply be
> > ifneq ($(CLIPPY),)
> >   KBUILD_CLIPPY := $(CLIPPY)
> > endif
> >
> > Then you can specify whatever value you want, support command line or
> > env vars, etc.?
>
> I was following the other existing cases like `V`. Masahiro can
> probably answer why they are done like this.

You are asking about this code:

ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif


You can pass V=1 from the Make command line,
but not from the environment.


KBUILD_VERBOSE is intended as an environment variable,
but you can use it from the Make command line.


Work:
 - make V=1
 - make KBUILD_VERBOSE=1
 - KBUILD_VERBOSE=1 make

Not work:
 - V=1 make



The behavior is like that before I became the maintainer.
In my best guess, the reason is,
V=1 is a useful shorthand of KBUILD_VERBOSE=1,
but it is too short. It should not accidentally
pick up an unintended environment variable.










-- 
Best Regards
Masahiro Yamada
