Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC20163F70
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 09:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgBSIm1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 03:42:27 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38480 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbgBSImY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 03:42:24 -0500
Received: by mail-oi1-f194.google.com with SMTP id r137so3474135oie.5;
        Wed, 19 Feb 2020 00:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcGrTtSZqo75NtjJJ7mVC6SXcJFXr8kJ31jQXw/H/KQ=;
        b=NyWvCZmb/ZhQuWuhTB6KcDNc6/NifMcxvCzFi0KeeNpo0KBdzXEhQNeRpwWFBTW+SC
         rr/KEcuzwVkx+DZroLcnUPZlftpDYzmEwoyLK7Ci8+auP4LXhAYfJdivbjnL54fj+ylx
         MYbzSc9FhXx+Ud98tw3fVOEoOs/0otB0ClAD4e72BBj8GT12tW1OQfaaLmV3wXsYMKOX
         l0PGGeKwEYZX+jTqbZI1X58F6KWkGHOH8fYbUn5dXUXK/BcNIni9sn+wHVC6wXXfDQ9A
         3ESbxREPl1rg2EZoYspUTbzaixSlXtTVrG8xzptprJxz67x92Fmc8chfJwvvpLFlCch7
         XlrQ==
X-Gm-Message-State: APjAAAW6V1G0Jt5ZOJT8M5ZhB+SAfegdtKIjFlzxZg6TB18GYS9szwYW
        O6t3gkH94OzOBRCIzt1oahXAURv6gHNI8JWkJ0knDkV4
X-Google-Smtp-Source: APXvYqwXN+JTU40xx/WiTO9R063gRnVxxMUOM08YTvRovwTavoMCLPf3oKtDrBoe6c7DGxqkQRQZoNf+fGvgE1SDjlw=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr3748069oia.148.1582101742559;
 Wed, 19 Feb 2020 00:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org>
In-Reply-To: <20200219074950.23344-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 09:42:10 +0100
Message-ID: <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Wed, Feb 19, 2020 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> The 'imply' statement may create unmet direct dependency when the
> implied symbol depends on m.
>
> [Test Code]
>
>   config FOO
>           tristate "foo"
>           imply BAZ
>
>   config BAZ
>           tristate "baz"
>           depends on BAR
>
>   config BAR
>           def_tristate m
>
>   config MODULES
>           def_bool y
>           option modules
>
> If you set FOO=y, BAZ is also promoted to y, which results in the
> following .config file:
>
>   CONFIG_FOO=y
>   CONFIG_BAZ=y
>   CONFIG_BAR=m
>   CONFIG_MODULES=y
>
> This ignores the dependency "BAZ depends on BAR".
>
> Unlike 'select', what is worse, Kconfig never shows the
> "WARNING: unmet direct dependencies detected for ..." for this case.
>
> Because 'imply' should be weaker than 'depends on', Kconfig should
> take the direct dependency into account.
>
> Describe this case in Documentation/kbuild/kconfig-language.rst for
> clarification.
>
> Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> a symbol implied by y is restricted to y or n, excluding m.
>
> As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> possible value is BAZ=n.
>
> Having said that, this case was probably "We don't care" at that time
> because Kconfig did not handle 'depends on m' correctly until
> commit f622f8279581 ("kconfig: warn unmet direct dependency of tristate
> symbols selected by y") fixed it.
>
> Backporting this to 4.19+ will probably be fine. If you care this
> problem on 4.14.x, you need to backport f622f8279581 as well.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot! This fixes the build issues in
https://lore.kernel.org/alsa-devel/CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com/

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
