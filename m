Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEAD150561
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 12:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgBCLia (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 06:38:30 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55227 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgBCLia (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 06:38:30 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 013BcLkM023532;
        Mon, 3 Feb 2020 20:38:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 013BcLkM023532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580729902;
        bh=1PSKW49SzMn2cJ0cVLR8p8oQ9UmN07qckyWBVdYUJ2s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1D/m8iAi1vG02UMNdn/wCglI7KCU8cszFmIiN2r/H1+80+N6YxLJhOiVO7HXicfdR
         o+4zsCFwTtgUM1T/iYq6Ih6l0AkXSfXDpHpQVPqX4HmZSMZesojH+2s7z53rqtDYTF
         S30KblamGvRIvvhIEkTypTUzPD1nxXrh1HaY8aYD0EYEdizptwCD5LcQ1SPCaC4ClP
         DASuAgVg0CyVTbmr9oaF9vQocPQW4v3wLAgrEERVvuil1E+fqviXqjp0EYVyAOqr3x
         k2aNk8/pZNKwg2lXLII9LRQu5mziyXxSH+DyAEHrhumbDOy6UfrGi5VgOYVMN/AuJv
         +9WyBW3LP0Nsw==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id i4so4006249vkc.3;
        Mon, 03 Feb 2020 03:38:21 -0800 (PST)
X-Gm-Message-State: APjAAAUVx0P3CO19ZYYNjrxjTSB9cJAe8tDvatxLv/QLEX0Oim97G3dR
        3pVIYBni3/iD5jgHQYyXFCy7ju+JEB3nndx007A=
X-Google-Smtp-Source: APXvYqzZEtJynZEbP+eisZbsUTSXn/m6/NYTRnhItnFRqJmqxS4xC3fEkqWJfaSVXhLlbMFJ0QZ5Jx46nFW7absrCJQ=
X-Received: by 2002:a1f:bfc2:: with SMTP id p185mr13814951vkf.73.1580729900721;
 Mon, 03 Feb 2020 03:38:20 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
 <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com> <CAMuHMdWerVTn-RvUOzHzGurY71NP9fNj+24EjnVkxnmp5g94jw@mail.gmail.com>
In-Reply-To: <CAMuHMdWerVTn-RvUOzHzGurY71NP9fNj+24EjnVkxnmp5g94jw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 3 Feb 2020 20:37:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOJGnL62ADL76V_jMm356+1rGxqBRt=BBpvvy+iASniw@mail.gmail.com>
Message-ID: <CAK7LNAQOJGnL62ADL76V_jMm356+1rGxqBRt=BBpvvy+iASniw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Geert,

On Mon, Feb 3, 2020 at 8:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Mon, Feb 3, 2020 at 2:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Sun, Feb 2, 2020 at 3:45 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > >  - simplify built-in initramfs creation
> > >
> > > Hmm.
> > >
> > > This may simplify it from a _technical_ angle, but it seems to be a
> > > fairly annoying step backwards from a UI perspective.
> > >
> > > Now Kconfig asks a completely pointless question that most people have
> > > absolutely zero interest in. The old situation was better, I feel.
> > >
> > > Basically, I feel that from a "get normal users to test development
> > > kernels", our Kconfig pain ends up being the biggest hurdle by far.
> > >
> > > The kernel is easy to build and doesn't really require all that much
> > > infrastructure, but generating the config - particularly when it
> > > changes over time and you can't just say "just use the distro config"
> > > - is a big step for people.
> > >
> > > So honestly, while I've pulled this, I feel that this kind of change
> > > is going _exactly_ the wrong way when it asks people questions that
> > > they don't care one whit about.
> > >
> > > If I as a kernel developer can't find it in myself to care and go "why
> > > does it ask this new question", then that should tell you something.
> > >
> > > Why do we have this choice in the first place?
> >
> > Generally, initramfs is passed from a boot-loader,
> > but some architectures embed initramfs into vmlinux
> > (perhaps due to poor boot-loader support??)
> >
> > arch/arc/configs/tb10x_defconfig:CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
> > arch/unicore32/configs/defconfig:#CONFIG_INITRAMFS_SOURCE="arch/unicore/ramfs/ramfs_config"
> > arch/xtensa/configs/cadence_csp_defconfig:CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
>
> Note that the above are examples that do not actually work, as the files
> referred to are not present in mainline (read below[1] why I have just
> checked that ;-).
>
> > So, data-compression is useful - that's is what I understand.
>
> Yes it is, depending on your config.
>
> > For major architectures, vmlinux embeds a tiny initramfs,
> > which is generated based on usr/default_cpio_list.
> >
> > We do not need data-compression for such a small cpio,
> > but handling it in a consistent way is sensible.
> > This is annoying from the users' PoV, I admit.
>
> I was also confused by this question, as by default you have
>     CONFIG_RD_GZIP=y
>     CONFIG_RD_BZIP2=y
>     CONFIG_RD_LZMA=y
>     CONFIG_RD_XZ=y
>     CONFIG_RD_LZO=y
>     CONFIG_RD_LZ4=y
> so the old 'default ".gz" if RD_GZIP' looked like it would use gzip.
> However, the tiny default initramfs ended up being uncompressed anyway
> before, as until commit ddd09bcc899fd374 ("initramfs: make compression
> options not depend on INITRAMFS_SOURCE"), INITRAMFS_COMPRESSION wasn't
> taken into account for the default tiny initramfs...


Because there was a bug in old usr/Kconfig.


See the following dependency in the old code:

config INITRAMFS_COMPRESSION
        depends on INITRAMFS_SOURCE!=""


In the default .config, INITRAMFS_SOURCE is "".
Hence, CONFIG_INITRAMFS_COMPRESSION is undefined.
So, suffix_y gets empty in usr/Makefile.

That is why the cpio was not compressed
even though CONFIG_RD_GZIP=y



> So INITRAMFS_COMPRESSION_NONE is the right answer to retain the
> old behavior?

Yes, INITRAMFS_COMPRESSION_NONE retains the previous behavior.

But, as far as he I understood what Linus said,
"we do not care".


> One might question why not to use gzip anyway, as
> CONFIG_RD_GZIP=y is enabled by default, and would give a (small)
> improvement of ca. 350 bytes ;-)
> Hence there is some area for improvement...


GZIP is not the only compression algorithm.

Somebody may want to disable RD_GZIP,
then enable RD_XZ.
If we allow the data compression,
Kconfig must ask "which compression algorithm".


So, if Kconfig would siltently choose something
as default, INITRAMFS_COMPRESSION_NONE would be the best.




>
> Thanks!
>
> [1] I'm still carrying a local patch for handling relative initramfs
>     paths with O=, but it's been a while I actually used it.  Due to your
>     recent changes, it no longer applies, and needs to be updated.
>     But of course that is only useful if there are some real users...
>     https://lore.kernel.org/lkml/1384467283-14806-1-git-send-email-geert@linux-m68k.org/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Best Regards
Masahiro Yamada
