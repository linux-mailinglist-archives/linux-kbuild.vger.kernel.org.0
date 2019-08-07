Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D8884F96
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 17:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbfHGPQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Aug 2019 11:16:06 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16449 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfHGPQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:16:06 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x77FFoT3029200;
        Thu, 8 Aug 2019 00:15:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x77FFoT3029200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565190951;
        bh=zEpwwj/bLxz+9v/6upCujJWZYSqW9H3fcev3JpzI/Lk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1ndkH8qLrLH/y7/wQBWdR5qFvKHGa+YEYg5TRffXkgI4M4GKz+viXQBUgY5T69QQc
         81ZsxtR7yVQnsOUd3T8JJ3sV4Mtp8cLNVrjIHJqal8gAtml7qanNYNwOgJTg7VdQp3
         Gqaa13bWQi/+4ZrbJLYGdr6gz8f4sYL09K0jtY3tLO7S9xgWjbrTMHGYwIwI5efqGl
         hbMZiEVra3xHSvJ8vJ3pwEjSCAlzcqXudvqVaKQWVPvhR838mw4KSEjyJAZxRnBe+e
         xCY2HFR8CbksU5xdfFkXjtlAtMZyQtnXcjKqC+hQecvCI2zior45kaoZ67xJWPVf7j
         XT1O4FnUckGDg==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id j2so8339776uaq.5;
        Wed, 07 Aug 2019 08:15:50 -0700 (PDT)
X-Gm-Message-State: APjAAAXsxl++yE53Mne1kKvgeR1i/02UdnEC+yFrr51KLcTjfFenqyvU
        3YYNE7bpYNv3ncXnVX9rcykpFZTqZdu2wQYXKC0=
X-Google-Smtp-Source: APXvYqwFYu/U4TpFFkpb/skM+8T6jsaqv8DLQN8+IzXjCk4Dx2idEiJDAP7lQQbSTzOXxT9ruzU/W1Rar1fg/eXgrR4=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr6309131uaf.95.1565190949919;
 Wed, 07 Aug 2019 08:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190802102358.28408-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190802102358.28408-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 8 Aug 2019 00:15:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASfBWBqmBtA9kpbFDJD21HZfoHYexwA25jaJgn5CpPw=A@mail.gmail.com>
Message-ID: <CAK7LNASfBWBqmBtA9kpbFDJD21HZfoHYexwA25jaJgn5CpPw=A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: revive single target %.ko
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Don Brace <don.brace@microsemi.com>,
        Arend Van Spriel <arend.vanspriel@broadcom.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 2, 2019 at 7:24 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I removed the single target %.ko in commit ff9b45c55b26 ("kbuild:
> modpost: read modules.order instead of $(MODVERDIR)/*.mod") because
> the modpost stage does not work reliably. For instance, the module
> dependency, modversion, etc. do not work if we lack symbol information
> from the other modules.
>
> Yet, some people still want to build only one module in their interest,
> and it may be still useful if it is used within those limitations.
>
> Fixes: ff9b45c55b26 ("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod")
> Reported-by: Don Brace <don.brace@microsemi.com>
> Reported-by: Arend Van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.

>
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 571cf862d7a4..e4c7211f5a3b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -997,6 +997,8 @@ endif
>
>  PHONY += prepare0
>
> +export MODORDER := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
> +
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
>
> @@ -1766,6 +1768,10 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
>         $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
>  %.symtypes: prepare FORCE
>         $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> +%.ko: prepare FORCE
> +       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
> +       $(Q)echo $(build-target) > $(MODORDER)
> +       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost || { rm -f $(MODORDER); false; }
>
>  # Modules
>  PHONY += /
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
