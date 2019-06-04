Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2515C33C5C
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 02:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfFDAVb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 20:21:31 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36595 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFDAVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 20:21:31 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x540LKt0006403;
        Tue, 4 Jun 2019 09:21:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x540LKt0006403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559607683;
        bh=APZcexSV89nKauT4vBIl3gS58qFiYwKK9p2I6qG79nY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RG5hnOARSB8ic3rujoJMGiClq4PuogzjxGR7EUFUpkG9YwoPRXIVzi9kJvv0681wY
         xgP3n9LrL1DfS6E7CzfMfmYNa5E0hkvyCbE1/LeaQVrIp7Bx5X7HeCwWrP7oGHksfB
         T0cModnqOtdbuk0YZ0hghmgHtNgXPKhj+kZBIKYWMTgDB4fBjeVJZEU7IM6mZIjLBL
         eOprPRNzhZgdokF61T2BQnA76KTmwYJsZS07S/nCrc85WdaeZB+YQXUndzreNMrEZk
         73CvQU3pNK2gGLbDbHmLq84Hi5nnWqDtmfbBMnIo8ZJJWjQIJmBZAeSkKWSch6s5t7
         hO4jcxbK4ByCQ==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id 130so803300vkn.9;
        Mon, 03 Jun 2019 17:21:21 -0700 (PDT)
X-Gm-Message-State: APjAAAW4cLBKA/OnN1dyBSoHCRKiMSft/4L9nLw4cK38K/atONjmAlpJ
        Lz7XwTZjrKTY9nFDpxHPpt19hPHowUa2ciPaSKI=
X-Google-Smtp-Source: APXvYqxiZRzIs4Cap7bpogirc4u1gGTjgxQBdj49dRgl72OOqyWPQq28tKBPcq4yGa/1/kO2554X/hbYSZKPw3aU4bs=
X-Received: by 2002:a1f:ac05:: with SMTP id v5mr10434723vke.34.1559607679960;
 Mon, 03 Jun 2019 17:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <20190524174011.GA23737@ravnborg.org>
 <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com> <20190603173328.GA11045@ravnborg.org>
In-Reply-To: <20190603173328.GA11045@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 09:20:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWsd-MSUtD69O05EZsVhcJTj7dh92MASzUoYR_it66AQ@mail.gmail.com>
Message-ID: <CAK7LNASWsd-MSUtD69O05EZsVhcJTj7dh92MASzUoYR_it66AQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam, Jani,

On Tue, Jun 4, 2019 at 2:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro/Jani.
>
> >
> > Following the obj-y pattern,
> > I want to make header-test-y relative to $(obj).
>
> I also considered this and agree this is better.
>
> Otherwise we end up with a spaghetti of dependencies across the tree.
>
> What I made just fit the purpose I had that day,
> which is no excuse for bad design.
>
> > I prefer this:
> >
> > quiet_cmd_header_test = HDRTEST $@
> >       cmd_header_test = echo "\#include \"$*.h\"" > $@
> >
> > $(obj)/%.header_test.c:
> >         $(call cmd,header_test)
>
> Even better - good.
>
> We call it HDRTEST - so why not just go for that name:
>
>     hdrtest-y += headerfile.h
>
> ??
>
> The current proposal with "header-test-y" hurts the eye a little with
> two '-', and all other variables uses only one '-' as is today.
> (generic-y, obj-y etc).
>
> This is bikeshedding but is was itcing me a little.

I do not have a strong opinion.
I leave it to Jani. Either is fine with me.


There are variables that contain two '-'.
'no-clean-files', 'subdir-ccflags-y', etc.


--
Best Regards
Masahiro Yamada
