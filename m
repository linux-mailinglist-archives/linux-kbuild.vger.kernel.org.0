Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E465F282B19
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJDOEN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 10:04:13 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:56081 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgJDOEN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 10:04:13 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 094E3oKG032416
        for <linux-kbuild@vger.kernel.org>; Sun, 4 Oct 2020 23:03:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 094E3oKG032416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601820231;
        bh=JGH2PRq1QmerAsaV/vRkh0SoAGqGjYn/bRBwktfxZdA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XJMmNtzWef/T16i/OvPHg8sIgJB/8AJ7OIC/G+UlzyjA3CG3OAnIAUj6PElw8wgJ8
         3uNJuztBboTaMe11DGqEouvVbM/OFRnjNUipLH+lV3XzBkizjQMJdtojN7m8eIaFOM
         uGz76WQ8Nxj1sJaIL3PvLQ7phcNJNfpbm3D+s1ZzGn/sqGy7xDZr6C9J7/mr0W5Gu2
         9IrsgO2h69kzJpzpsxJOSuTRH+LLmaz2vTmD9FtH92nrdgawrN4NO0NEUBDNmt1FIw
         cXYIwjaXhG8OaxK9DEpiPsGUGtAQml0U1AXwyE0hCkTDjz5S8oSA+zMDPo/foqsdow
         LSLphT3XY59GA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id nl2so1334933pjb.1
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Oct 2020 07:03:50 -0700 (PDT)
X-Gm-Message-State: AOAM533qQwgN8wsqYlT1TcEoC8fgOZv3sxOGauE6mTISUbG5O6ZwZPwb
        LKAKVQML77riBjlFB5obmWMjDAxHCHBiUCOS4N0=
X-Google-Smtp-Source: ABdhPJwwTgUZeUx9YoyhQTEOPlhAJFS/jay3yO0S0kIOmL3+T2l7ShZvO5fuvWgmy2/VdCRbXHflXeYPSdZB4RVP2qI=
X-Received: by 2002:a17:90a:e00e:: with SMTP id u14mr12210795pjy.153.1601820229882;
 Sun, 04 Oct 2020 07:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUUss+XGHxtSXB3WaRLODdQ0-Ln03N45NUQ=QaP49O3e0A@mail.gmail.com>
In-Reply-To: <CA+icZUUss+XGHxtSXB3WaRLODdQ0-Ln03N45NUQ=QaP49O3e0A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 4 Oct 2020 23:03:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARes+EEjue1ZNXZrKjWLjkv76NwEUyo_S6F3d=gni9XSA@mail.gmail.com>
Message-ID: <CAK7LNARes+EEjue1ZNXZrKjWLjkv76NwEUyo_S6F3d=gni9XSA@mail.gmail.com>
Subject: Re: Linux-5.9: Remove CC_FLAGS_USING via asflags-remove
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 4, 2020 at 10:29 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi,
>
> I wanted to get rid of CC_FLAGS_USING in lib/Makefile:
>
> ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)
> +asflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)
>
> ...it makes no sense to me to remove CC_FLAGS_FTRACE and not CC_FLAGS_USING.
>
> ccflags-remove-y (here: CONFIG_FUNCTION_TRACER=y) seems  to work but
> *not* asflags-remove-y.
>
> Am I missing something?
> It is getting overridden?
>
> Documentation/kbuild/makefiles.rst says:
> "...AFLAGS_$@ has the higher priority than asflags-remove..."
>
> How can I check if there is another AFLAGS_XXX interfering?
>
> I see -DCC_XXX in...
>
> lib/.crc-t10dif.mod.o.cmd
> lib/.crc-t10dif.o.cmd


This is compiled from a C source file.

lib/crc-t10dif.c



Why are you trying asflags-remove-y for lib/Makefile?

I see no assembly source file under lib/.

masahiro@oscar:~/ref/linux$ find  lib  -name  '*.S'
masahiro@oscar:~/ref/linux$







> I want to remove all -DCC_XXX assembler-options derived from lib/Makefile.
>
> Regards,
> - Sedat -



-- 
Best Regards
Masahiro Yamada
