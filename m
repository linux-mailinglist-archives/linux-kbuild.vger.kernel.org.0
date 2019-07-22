Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9ABD6F700
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 03:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfGVBoR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Jul 2019 21:44:17 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:23415 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfGVBoQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jul 2019 21:44:16 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6M1hs7E000578;
        Mon, 22 Jul 2019 10:43:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6M1hs7E000578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563759835;
        bh=ihFGrpdJRXWV6Ks07QiM5tzjFEOd14pN1GFuo1AwMeA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SqmjZTaVLD6rsnDiAQ1IP/oyHiAcIZn8VgU+DgcNdapced6WSvl2SVvE+pOGUvqCr
         LyRi9ATny/DU4pl9LGnWHsj4eNk6yrxUEDDlL5zSl46Nc8o2PBWDID4qG9JewHaXp0
         g+YvmzT/BEjLJTdo34lrhuIPvl3QX2BnmtbrTDhmDYxjoeQ7GKa9AGzDo0dV9TI0dn
         yMxQB9ZS35pOLZJEv1QQ6+2a87dHaDGIv9dh86aL3b3VTMic/zdGg89/Za7E+HZBqd
         XgiRXveu7d7i/pgLT6vVpcziRRMdjJpBzP7a+qyheXCbV/9H8HKspERrEkkHwOWCFJ
         oau4fV+ZLWEbg==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id c4so14687012uad.1;
        Sun, 21 Jul 2019 18:43:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVC4rciga9lcUYDhmXU9esOh74i/gvj/HP/zH7glKTSmQdgO0Fb
        ZPwWeMppdsKkCc0zLQFqAnfOeh1AM9heTnqgSTY=
X-Google-Smtp-Source: APXvYqw97BlrN/r474Y8Bp8ad6pOTlGoj971hOvseuFvkJ6G0GogbMI+BFKp5sSEqUp98c+iLtkPKDP0uxvi9BtZ4oE=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr12274522uao.25.1563759834041;
 Sun, 21 Jul 2019 18:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
 <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com> <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
In-Reply-To: <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 22 Jul 2019 10:43:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2p8LjMJMAM9WMZymUXPVyDXDtXL094WHFhHamhShzEg@mail.gmail.com>
Message-ID: <CAK7LNAT2p8LjMJMAM9WMZymUXPVyDXDtXL094WHFhHamhShzEg@mail.gmail.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 21, 2019 at 12:38 AM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> Hi Masahiro,
>
> On Sat, 2019-07-20 at 11:40 +0900, Masahiro Yamada wrote:
> > On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
> > <Eugeniy.Paltsev@synopsys.com> wrote:
> > > As of today we are able to pass custom flags to dtc compiler but not
> > > to dtc preprocessor.
> > > This ability is required for including some board-specific header files.
> > > It allows us to pass defined constants to dts without their duplication
> > > in several places.
> >
> > How to use this option in a useful way?
> >
> > I see a bunch of defined constants under include/dt-bindings/.
> >
> > If you are talking about code duplication across architectures,
> > you can include arm dtsi from arm64 dts, or vice versa.
> > This was made possible by the symbolic links
> > in scripts/dtc/include-prefixes/.
> >
> > Could you please elaborate your issues if you cannot solve them
> > by the current strategy?
> >
>
> Here is the example:
>
> We have several FPGA-based boards (haps_hs, haps_hs_idu,...) which are involved
> in SW and HW automated verification. For some tests we randomize physical memory
> location so we patch 'CONFIG_LINUX_RAM_BASE' kconfig variable and 'memory' node in
> device tree. We want to keep number of patches as less as possible (to avoid
> conflicts on their applying) so we want to avoid duplication and pass
> 'CONFIG_LINUX_RAM_BASE' directly to dts by including it from
> 'include/generated/autoconf.h':
>
> ----------------------------->8------------------------------------
> memory {
>         device_type = "memory";
> -               /* CONFIG_LINUX_RAM_BASE needs to match low mem start */
> -               reg = <0x80000000 0x20000000>;  /* 512 */
> +               reg = <CONFIG_LINUX_RAM_BASE 0x20000000>;      /* 512 */



So, we need the kernel configuration to build DT?

I am scared with this idea.

I believe DT files should be able to be compiled
irrespective of the .config because they are
re-used for other projects.

devicetree-rebasing is a subset of the kernel tree
that collects DT.

If you upstream that patch, this will be broken, at least.

git://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git



-- 
Best Regards
Masahiro Yamada
