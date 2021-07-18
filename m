Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906F93CC859
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jul 2021 11:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhGRJk2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Jul 2021 05:40:28 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41022 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhGRJk1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jul 2021 05:40:27 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 16I9b8Dk028602;
        Sun, 18 Jul 2021 18:37:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 16I9b8Dk028602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626601029;
        bh=VP/7yr/B+ENgaIKa1/s5XFIZJMjO0e3ONBbcEfdKM7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zahNNZymfnZQDkdfwP8P/RVPjyOM8uWfAvIrkj8/8C9pCCGbxOong1VlEQMnTgnd3
         wEyqT0PwSFaMwMfd4ggtDdsPTdMrhlRMzthJtvLCiqV9m++ItLj9/iTllKzWERtrEw
         ROJCY3f0vD5XAcp8v4d318sDAyKuGXUUQXy+Ap1tPUu5sHcFO7n66c4l3B72r48IXY
         owcB1kS6dCzxpl3zF+khYpt9XI+pjVYmFgArY2P06NUolO3Qx+o6JZQLUcq4VYcpq1
         PKC5LTkDcZJ9hkqNcyeerdCpRrnotdIjTXMZVVgnIrj2TtkmHlJdAbryG3zOCkl5Tb
         hOWRL4tZLU/kw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id t9so15597148pgn.4;
        Sun, 18 Jul 2021 02:37:09 -0700 (PDT)
X-Gm-Message-State: AOAM531XKfwTQYX0hdPwa317rMj2gAqTrbcfJEEEeOBREfThzK0dv8t/
        OnCJmH5nq9yipGKm9t0l2pGIR7WpGoLshh5a8fM=
X-Google-Smtp-Source: ABdhPJyLY+vQ2PhiLGLAxJjHE06h78KKD3ksRb5lJ7vNzUhm5sbcTeEFqR4mzSDA7zPpuM3AIzjpEmxR/HAuHuNuvn4=
X-Received: by 2002:a63:d80a:: with SMTP id b10mr19578322pgh.47.1626601028449;
 Sun, 18 Jul 2021 02:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <ad9c50c54887bde41ae5de782248231c06a527c0.1626262835.git.rrichter@amd.com>
 <49b4c2512afba7a2c2ee39e10f14188ecfcdffc0.1626262835.git.rrichter@amd.com>
In-Reply-To: <49b4c2512afba7a2c2ee39e10f14188ecfcdffc0.1626262835.git.rrichter@amd.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Jul 2021 18:36:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpTBb8gyESBxzUcrz6vKw1MecnB5=xPd-CYfSFCC4hgA@mail.gmail.com>
Message-ID: <CAK7LNAQpTBb8gyESBxzUcrz6vKw1MecnB5=xPd-CYfSFCC4hgA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/kbuild: Document the kconfig choice default value
To:     Robert Richter <rrichter@amd.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 15, 2021 at 6:26 PM Robert Richter <rrichter@amd.com> wrote:
>
> Document how choice defaults are determined:
>
> Default of a choice is its first visible choice element [1]. Choice
> elements do not support default attributes. [2]
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/symbol.c?h=v5.14-rc1#n245
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/menu.c?h=v5.14-rc1#n494
>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 98c24183d8c3..e4d3463594e1 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -417,6 +417,9 @@ definitions of that choice. If a [symbol] is associated to the choice,
>  then you may define the same choice (i.e. with the same entries) in another
>  place.
>
> +The default value of a choice is set to the first visible choice element.


The default value of a choice is set to the first visible choice element
unless it is explicitly set by the 'default' property.

... is more precise.




> +Choice elements do not support the default attribute like menu entries do.

I doubt this info is useful.
Rather, is it even confusing?


choices support 'default' but
choice elements (i.e. choice values) do not.









> +
>  comment::
>
>         "comment" <prompt>
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
