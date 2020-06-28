Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B03B20C653
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 08:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgF1GAu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 02:00:50 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19303 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgF1GAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 02:00:50 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 05S60PuK008495;
        Sun, 28 Jun 2020 15:00:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 05S60PuK008495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593324026;
        bh=0Adi9oEkoNL+VTKk8ereW4+c8tkNY7OySZ7YBSe/YKA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ygVCF5vWbBSGukhyAOywf2WaTXP6fYyoAxX7QWOLXc+8IVvQ2G5qU9vgy2+yXttHC
         Bk670axVR0NwtO9z9L7iQWjChSdxt6tY5xlDdwacItFuCGVcGiYKZcOSX1fkAPRoPi
         kdFT7ixBknjCgX1CdZ8TH6rfpJ8DWSA5KR6iSSu5w05pczuMZZ9khc4G5FNAkPY5P6
         ZxQ70d1BIVYbpu8B37urtIiWh8lklTP3w5xA5cXcmhpCng9E/H7fZaAZDWtQ0FFi2S
         98iv/+N0VNBjzCkwR7JvNSJdfYAitaXW72n0JFgp2qn10kmHi2uwgk53z/SKtfUoyG
         MaA3aKbYEIWyg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id v1so7561923vsb.10;
        Sat, 27 Jun 2020 23:00:25 -0700 (PDT)
X-Gm-Message-State: AOAM530k89AAmSs5jO+yfXAgJDXHO6BTsWN6W0TaZRYx5dxP4+7ZjY72
        Xh2KkY3B6kF/PWm5PaRcj3xTyx1ct6fpV3KLddY=
X-Google-Smtp-Source: ABdhPJxgrePNlmZbq4ODpdCqz51OGKwCFn/JnfhPPtPIn9WGJz+XI26wgi75kbSCrE2XC7QDCT/X8jAgUv6zb+cIVPk=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr7470079vsi.179.1593324024627;
 Sat, 27 Jun 2020 23:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200213122410.1605-1-masahiroy@kernel.org> <202002251057.C4E397A@keescook>
In-Reply-To: <202002251057.C4E397A@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 14:59:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASw0YT8_itaa0OeZi8toV1TUj6EKCMbg6rchdYub0cgww@mail.gmail.com>
Message-ID: <CAK7LNASw0YT8_itaa0OeZi8toV1TUj6EKCMbg6rchdYub0cgww@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: fix gcc-plugins directory path in documentation
To:     Kees Cook <keescook@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 3:58 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 13, 2020 at 09:24:10PM +0900, Masahiro Yamada wrote:
> > Fix typos "plgins" -> "plugins".
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks!
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> Jon, can you take this?

I noticed this patch had fallen into a crack.

Applied to linux-kbuild now.
Thanks.





> -Kees
>
> > ---
> >
> >  Documentation/kbuild/reproducible-builds.rst | 2 +-
> >  scripts/gcc-plugins/Kconfig                  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> > index 503393854e2e..3b25655e441b 100644
> > --- a/Documentation/kbuild/reproducible-builds.rst
> > +++ b/Documentation/kbuild/reproducible-builds.rst
> > @@ -101,7 +101,7 @@ Structure randomisation
> >
> >  If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
> >  pre-generate the random seed in
> > -``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
> > +``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
> >  is used in rebuilds.
> >
> >  Debug info conflicts
> > diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> > index e3569543bdac..7b63c819610c 100644
> > --- a/scripts/gcc-plugins/Kconfig
> > +++ b/scripts/gcc-plugins/Kconfig
> > @@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
> >         source tree isn't cleaned after kernel installation).
> >
> >         The seed used for compilation is located at
> > -       scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
> > +       scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
> >         a make clean to allow for external modules to be compiled with
> >         the existing seed and will be removed by a make mrproper or
> >         make distclean.
> > --
> > 2.17.1
> >
>
> --
> Kees Cook



--
Best Regards

Masahiro Yamada
