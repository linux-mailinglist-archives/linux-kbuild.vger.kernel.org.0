Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B12C22A91
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 06:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbfETEAn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 00:00:43 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19914 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfETEAn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 00:00:43 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4K40QpC024101;
        Mon, 20 May 2019 13:00:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4K40QpC024101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558324827;
        bh=MebtkXNeeJ8Jzz6Ezkyq0CerOolN429GAA1nYiyPVZ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F1hXfjs33lXG36eIXyWaL61OGI4u6G2k7C60RtauYyMUIX2ITKOXq6itIhXDmgoO1
         Sywm/JDduKgqyTH/bg38wvFS8mR+2hmilo61zOzZTx67zqGJEUvapD7CNLur/R7y8Z
         Q5aazPzSspt1t1DVu0yncw8IGwdzj6/GE8iUNmV9w+7PR5jBDzc1vwNP2E/tleUqZ3
         esRFQo/iJDYBQSCOA4FJ6oBf4iWODx7szE0zW44DRiGmSufwRejVhhtSlvoPKBXN+9
         HYZNA+7NYca1OvdwIUK7oTJBDXLUab0fJZy7b8BIpoWsYZNYtZ+PFJxXiZAFiwXjjb
         MGztl/bi9lUTg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id c24so8062240vsp.7;
        Sun, 19 May 2019 21:00:27 -0700 (PDT)
X-Gm-Message-State: APjAAAVRWvCVFURn2LYaI4ffFNaHUOVZ6d7QGmvcOX+jN6nqTGu0SGmH
        GunEYASMu+vLnPG3l3eKvcKjgQoLaDMjdwqlorw=
X-Google-Smtp-Source: APXvYqzwgLFd2jzknLeu3sewSQkB2MYjaaXKCCR+0kzoDAkGzqV18tSS1eu9D+4ots57VrcJJH8hwSeFvR3B/BpzzZ4=
X-Received: by 2002:a67:d382:: with SMTP id b2mr18182087vsj.155.1558324826093;
 Sun, 19 May 2019 21:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com> <20190520095147.2021c218@canb.auug.org.au>
In-Reply-To: <20190520095147.2021c218@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 20 May 2019 12:59:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARp5n+tL+m9HCysJXt==5fnpH21DDoS2ruuW_6r6BJUDQ@mail.gmail.com>
Message-ID: <CAK7LNARp5n+tL+m9HCysJXt==5fnpH21DDoS2ruuW_6r6BJUDQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 20, 2019 at 8:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Sat, 18 May 2019 01:07:15 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > It checks not only real modules, but also built-in modules (i.e.
> > controlled by tristate CONFIG option, but currently compiled with =y).
> > Non-unique names for built-in modules also cause problems because
> > /sys/modules/ would fall over.
> >
> > I tested allmodconfig on the latest kernel, and it detected the
> > following:
>
> A powerpc ppc64_defconfig produces:
>
> warning: same basename if the following are built as modules:
>   arch/powerpc/platforms/powermac/nvram.ko
>   drivers/char/nvram.ko
>
> Which is a false positive since
> arch/powerpc/platforms/powermac/Makefile has
>
> # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
> # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
> # CONFIG_NVRAM=y
> obj-$(CONFIG_NVRAM:m=y)         += nvram.o
>
> Which means that this nvram.o will never be built as a module.
> --
> Cheers,
> Stephen Rothwell


BTW, arm64 defconfig also produces a false positive:

warning: same basename if the following are built as modules:
  arch/arm64/lib/crc32.ko
  lib/crc32.ko

CONFIG_CRC32 is a tristate option, but ARM64 selects CRC32.
So, CRC32 is always =y.


We must stop checking modules.builtin soon.
Sorry about noises.




-- 
Best Regards
Masahiro Yamada
