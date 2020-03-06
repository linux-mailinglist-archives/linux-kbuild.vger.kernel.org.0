Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A2517BC83
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2020 13:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgCFMR1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Mar 2020 07:17:27 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgCFMR0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 07:17:26 -0500
Received: by mail-ot1-f68.google.com with SMTP id i14so2204485otp.5;
        Fri, 06 Mar 2020 04:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XxqhTkVe9CvcMbnhVkoOtD7xWPU2yvO/vQcxe/RtjbA=;
        b=OcGzQA7+FqmZP12WK/8K/nJGuU8rwXJz0l1xHQpqTPrqCKR6ClXjsp24lhMmcbyqf3
         N9foCBnj9pAPLERMpPnccO0Uz+cAyxutaVt//5GPwYmhtweAAvVG+CaX3Z4zdh05la9Z
         iKRAuRjMOGMAbrDA0ayE8e33fE5rOaSTxonzVpKx3E5DVZANxAK/h9dx4aM37rvzlezW
         OqyWkEMI3ldT8rfwHUzrim/oZfcsVgstcxqU7bT6VufPI0O62S8l/ipJAfLHUWbHDIE3
         gX3hN1jOZe8nCSrjE/ADQV5E9jORlllRnbQRBg4/NlwfAnV4Vk1dEHsBa5Dr1Qm0dBLj
         ZbAA==
X-Gm-Message-State: ANhLgQ0R4rKzX8ZheDeuZ/pa3Oggq+vabEjh4qLRR625+bjo5YzbUlTn
        f1VvEb8JbBz6f1oPYmusuBJameQXdDDsFbMvFOsaJg==
X-Google-Smtp-Source: ADFU+vuJ+BYG1vuglT5s23PLlapfDrFaoXzGNMlzNeLZAOPvMqXejVopvRC8E+qWfgs8r3jk8rX7Tr6ECp47LWsPLCY=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2215931otk.145.1583497046255;
 Fri, 06 Mar 2020 04:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20200302062340.21453-1-masahiroy@kernel.org> <20200302062340.21453-2-masahiroy@kernel.org>
In-Reply-To: <20200302062340.21453-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 13:17:15 +0100
Message-ID: <CAMuHMdWUvKXOU1LWZ-Vmb_tTe8b1wHrWFW6dEnENNSs0S7AvWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: make 'imply' obey the direct dependency
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Mon, Mar 2, 2020 at 7:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
> This does not meet the dependency 'BAZ depends on BAR'.
>
> Unlike 'select', what is worse, Kconfig never shows the
> 'WARNING: unmet direct dependencies detected for ...' for this case.
>
> Because 'imply' is considered to be weaker than 'depends on', Kconfig
> should take the direct dependency into account.
>
> For clarification, describe this case in kconfig-language.rst too.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This fixes some issue with "imply SND_SOC_WCD934X".
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
