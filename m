Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD134198D2
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 09:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfEJHO7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 03:14:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27642 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfEJHO7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:14:59 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4A7EkkJ029507;
        Fri, 10 May 2019 16:14:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4A7EkkJ029507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557472486;
        bh=2dvd7gsOqS5caujGcl43LFp5btJbAWn4Wasqt7d4+98=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=drljGzn9+4Co5dEH0PwPJO0Jc7s+p1FgGVDKTgx0rdd66zuIK6wrv1svLbi0jXeiZ
         1IM+72lE30xAvkUwAo6R3xmEho9lGiXqJvpX+1p/ywgUdtZWqzmfFRN2Vg0i8xthZS
         OgWZjq9l9AE/4Kajq2a/t0xPAOqxbRoD0NhrB1Rjf6uXAj2gaaZXfaaQfpnWgvAWfo
         6QglxLLcAl9FCEvMfPGcNJ+ji0A93CaTVy6YEYnVPU9StNMLgqH5SlocgheKLuGy+N
         Cnu1ofIO6nUBHIoACQuSpmU0IEMLNDsgvdBxd/E5wuNWv1UUDv6hfwFT/zidKtkaej
         Om+tE5vq0M0Ow==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id q64so3049744vsd.1;
        Fri, 10 May 2019 00:14:46 -0700 (PDT)
X-Gm-Message-State: APjAAAXzCPO0HdiNfqV2gstgzYamKzyB6C9wL3LoIRD2Up2EEkZTsODd
        AQsJ0hGN+kmelbexrlR6dPnynShn0RL9TkLaHdc=
X-Google-Smtp-Source: APXvYqwsXfmXl1HUg25OPbzIyUTRb1Z9M7aj+O1N1gwoQox1Vw12RCUhrJkyGLjztYcrq7nJtNztqIV/Se75sto5CAI=
X-Received: by 2002:a67:f443:: with SMTP id r3mr4980062vsn.179.1557472485439;
 Fri, 10 May 2019 00:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com> <20190510062116.GA18014@kroah.com>
In-Reply-To: <20190510062116.GA18014@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 10 May 2019 16:14:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARuDrYEgR8_U=mK2E22bc4JL_b4_5=wvJMc0siZio8S+A@mail.gmail.com>
Message-ID: <CAK7LNARuDrYEgR8_U=mK2E22bc4JL_b4_5=wvJMc0siZio8S+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 3:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 10, 2019 at 03:12:05PM +0900, Masahiro Yamada wrote:
> > Kconfig updates the .config when it exits even if its content is
> > exactly the same as before. Since its timestamp becomes newer than
> > that of other build artifacts, additional processing is invoked,
> > which is annoying.
> >
> > - syncconfig is invoked to update include/config/auto.conf, etc.
> >
> > - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
> >   then vmlinux is relinked as well.
> >
> > If the .config is not changed at all, we do not have to even
> > touch it. Just bail out showing "No change to .config".
> >
> >   $ make allmodconfig
> >   scripts/kconfig/conf  --allmodconfig Kconfig
> >   #
> >   # configuration written to .config
> >   #
> >   $ make allmodconfig
> >   scripts/kconfig/conf  --allmodconfig Kconfig
> >   #
> >   # No change to .config
> >   #
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org> ?

OK.

For reviewers who do not know the context,
please see this comment from Linus:

https://lkml.org/lkml/2019/5/9/983



-- 
Best Regards
Masahiro Yamada
