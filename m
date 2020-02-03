Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB697150038
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 02:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgBCBQf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Feb 2020 20:16:35 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52136 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgBCBQe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 20:16:34 -0500
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0131GGTU029545;
        Mon, 3 Feb 2020 10:16:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0131GGTU029545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580692577;
        bh=b19D1AbJ2hryu1fHOZp3o3F9T3zMTyA7G0L+R1skFec=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HY44w/A1h0VHq4bQjljFy7BtofqPboJ3MYZ0/8pMk9ngdTrztkV8Lzk5Fs28EUyuN
         iQPC6nEqgyUOzMNSj+NkptO8L7sLG08cS1KTs33xDmGtURt32UHA0jtGP3fCRxihSe
         iDny0uHIAV+omSQCZX2GYY2OK/GtBgv+z6V7PP8TmOZz2h5pL4/chf5B5C6j2lcx5T
         pHJNyX6R1TnjqzvieznOXPG40G+DldtOPb1a34ltJG+1OW61cJhfCvkkJNV7DO6j5+
         UnBCHpaSnVhx12qDI1xBILCgFpa3GPm47m4Gk0LXs+YMQUSpyWihDP6crFfpmD6LZ/
         nhPsIWL9jmPZA==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id b69so3400338vke.9;
        Sun, 02 Feb 2020 17:16:17 -0800 (PST)
X-Gm-Message-State: APjAAAUP3i1jrdXbdAE5RYYXGnBwYu1DIzzCInwCtlVX2OeBcbBnT7Ko
        2nvs8s2JX0+KJCcotK61XM7PKMVT1uRB86bmhjU=
X-Google-Smtp-Source: APXvYqw7Btcno4Kw0/kDabQq/zVWLz8wD83Yq/7gxs8FQVHeQX1S2usAAF6Bt6SF4el93IikqzefZIwNooIG59uIl6E=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr12419152vkc.12.1580692576167;
 Sun, 02 Feb 2020 17:16:16 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
In-Reply-To: <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 3 Feb 2020 10:15:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com>
Message-ID: <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Sun, Feb 2, 2020 at 3:45 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> >  - simplify built-in initramfs creation
>
> Hmm.
>
> This may simplify it from a _technical_ angle, but it seems to be a
> fairly annoying step backwards from a UI perspective.
>
> Now Kconfig asks a completely pointless question that most people have
> absolutely zero interest in. The old situation was better, I feel.
>
> Basically, I feel that from a "get normal users to test development
> kernels", our Kconfig pain ends up being the biggest hurdle by far.
>
> The kernel is easy to build and doesn't really require all that much
> infrastructure, but generating the config - particularly when it
> changes over time and you can't just say "just use the distro config"
> - is a big step for people.
>
> So honestly, while I've pulled this, I feel that this kind of change
> is going _exactly_ the wrong way when it asks people questions that
> they don't care one whit about.
>
> If I as a kernel developer can't find it in myself to care and go "why
> does it ask this new question", then that should tell you something.
>
> Why do we have this choice in the first place?



Generally, initramfs is passed from a boot-loader,
but some architectures embed initramfs into vmlinux
(perhaps due to poor boot-loader support??)

arch/arc/configs/tb10x_defconfig:CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
arch/unicore32/configs/defconfig:#CONFIG_INITRAMFS_SOURCE="arch/unicore/ramfs/ramfs_config"
arch/xtensa/configs/cadence_csp_defconfig:CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"

So, data-compression is useful - that's is what I understand.


For major architectures, vmlinux embeds a tiny initramfs,
which is generated based on usr/default_cpio_list.

We do not need data-compression for such a small cpio,
but handling it in a consistent way is sensible.
This is annoying from the users' PoV, I admit.



> And no, it's not a
> "simplification" to make life more complex for users.
>
>                    Linus



-- 
Best Regards
Masahiro Yamada
