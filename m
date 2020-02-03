Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3001504C5
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 12:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgBCLAR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 06:00:17 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36183 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgBCLAR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 06:00:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id j20so4748474otq.3;
        Mon, 03 Feb 2020 03:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSvHNN+8r5amtyKmUg8emtWtzRdpFVJ7MMDiOIdoqoo=;
        b=LxNXUWdVPZ2zLmfQ7Pg53uu6Xy5JwPIBL2+3M6wV8VUu7ZySEi4Gpt+jZMm6Qn+0Px
         s8hFaGZ7r+TO7jxs1QKy1wzaxmIQJuQWOCUPU4bK+sk6qMDJPZMmWR4txAwi/OAZVjYu
         fKKpG3uvqg5lxhSNLHyUr3N3UR+U071xMS3Mp1pTNmAkIblJNwGvbqpBeFFGAvKYURk2
         slGU1cGjA8LrapNJHYKymS+qwXRdAcWblv6SGzQYM5cO0se2WphoD1zTvzztm2yNgEXu
         XdOjn1/wUjhROcs1fDS1TzBt7w1F91Clqa/qKsi7KL/joIIQl0W0BO0SCFz0CfYBy1U0
         CxOg==
X-Gm-Message-State: APjAAAW+k8cZWRg2LkWK4BzzkrmL84H6zdKXo4HD5PbcYLqMCoqjeOpR
        VG+4CmBpJpDcO6bS07kUzlPJCfAHbMxWmsgn7q4=
X-Google-Smtp-Source: APXvYqzIgEOEaL8DuU6yXLdqdxv9NXwCp/3gdAFi0sFpJIv6us2mrWb0MONCGISYKLRdjNXpciySPXw9HvYAXx4melE=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr17372599ots.250.1580727615977;
 Mon, 03 Feb 2020 03:00:15 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com> <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com>
In-Reply-To: <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Feb 2020 12:00:04 +0100
Message-ID: <CAMuHMdWerVTn-RvUOzHzGurY71NP9fNj+24EjnVkxnmp5g94jw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Mon, Feb 3, 2020 at 2:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Sun, Feb 2, 2020 at 3:45 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > >  - simplify built-in initramfs creation
> >
> > Hmm.
> >
> > This may simplify it from a _technical_ angle, but it seems to be a
> > fairly annoying step backwards from a UI perspective.
> >
> > Now Kconfig asks a completely pointless question that most people have
> > absolutely zero interest in. The old situation was better, I feel.
> >
> > Basically, I feel that from a "get normal users to test development
> > kernels", our Kconfig pain ends up being the biggest hurdle by far.
> >
> > The kernel is easy to build and doesn't really require all that much
> > infrastructure, but generating the config - particularly when it
> > changes over time and you can't just say "just use the distro config"
> > - is a big step for people.
> >
> > So honestly, while I've pulled this, I feel that this kind of change
> > is going _exactly_ the wrong way when it asks people questions that
> > they don't care one whit about.
> >
> > If I as a kernel developer can't find it in myself to care and go "why
> > does it ask this new question", then that should tell you something.
> >
> > Why do we have this choice in the first place?
>
> Generally, initramfs is passed from a boot-loader,
> but some architectures embed initramfs into vmlinux
> (perhaps due to poor boot-loader support??)
>
> arch/arc/configs/tb10x_defconfig:CONFIG_INITRAMFS_SOURCE="../tb10x-rootfs.cpio"
> arch/unicore32/configs/defconfig:#CONFIG_INITRAMFS_SOURCE="arch/unicore/ramfs/ramfs_config"
> arch/xtensa/configs/cadence_csp_defconfig:CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"

Note that the above are examples that do not actually work, as the files
referred to are not present in mainline (read below[1] why I have just
checked that ;-).

> So, data-compression is useful - that's is what I understand.

Yes it is, depending on your config.

> For major architectures, vmlinux embeds a tiny initramfs,
> which is generated based on usr/default_cpio_list.
>
> We do not need data-compression for such a small cpio,
> but handling it in a consistent way is sensible.
> This is annoying from the users' PoV, I admit.

I was also confused by this question, as by default you have
    CONFIG_RD_GZIP=y
    CONFIG_RD_BZIP2=y
    CONFIG_RD_LZMA=y
    CONFIG_RD_XZ=y
    CONFIG_RD_LZO=y
    CONFIG_RD_LZ4=y
so the old 'default ".gz" if RD_GZIP' looked like it would use gzip.
However, the tiny default initramfs ended up being uncompressed anyway
before, as until commit ddd09bcc899fd374 ("initramfs: make compression
options not depend on INITRAMFS_SOURCE"), INITRAMFS_COMPRESSION wasn't
taken into account for the default tiny initramfs...

So INITRAMFS_COMPRESSION_NONE is the right answer to retain the
old behavior? One might question why not to use gzip anyway, as
CONFIG_RD_GZIP=y is enabled by default, and would give a (small)
improvement of ca. 350 bytes ;-)
Hence there is some area for improvement...

Thanks!

[1] I'm still carrying a local patch for handling relative initramfs
    paths with O=, but it's been a while I actually used it.  Due to your
    recent changes, it no longer applies, and needs to be updated.
    But of course that is only useful if there are some real users...
    https://lore.kernel.org/lkml/1384467283-14806-1-git-send-email-geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
