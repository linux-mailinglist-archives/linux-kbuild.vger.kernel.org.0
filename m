Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F66B23B790
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Aug 2020 11:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbgHDJUE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Aug 2020 05:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHDJUD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Aug 2020 05:20:03 -0400
Received: from tartarus.angband.pl (tartarus.angband.pl [IPv6:2001:41d0:602:dbe::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F622C06174A;
        Tue,  4 Aug 2020 02:20:03 -0700 (PDT)
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.92)
        (envelope-from <kilobyte@angband.pl>)
        id 1k2t6r-00025G-El; Tue, 04 Aug 2020 11:19:49 +0200
Date:   Tue, 4 Aug 2020 11:19:49 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Ingo Molnar <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v10 4/8] usr: add support for zstd compressed initramfs
Message-ID: <20200804091949.GB9657@angband.pl>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
 <20200730190841.2071656-5-nickrterrell@gmail.com>
 <CAMuHMdUo5tfcEUaq4x_b9HJy25HXWmBZ3GPfqJy491zDsct5Rg@mail.gmail.com>
 <CA+icZUXGbV1x0YJn-0mLA2TtU2jWS6PO3bqdDrqJBMYOMS9Eog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+icZUXGbV1x0YJn-0mLA2TtU2jWS6PO3bqdDrqJBMYOMS9Eog@mail.gmail.com>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 04, 2020 at 09:25:23AM +0200, Sedat Dilek wrote:
> On Tue, Aug 4, 2020 at 8:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jul 30, 2020 at 9:13 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> > > From: Nick Terrell <terrelln@fb.com>
> > > * Add support for a zstd compressed initramfs.
> > > * Add compression for compressing built-in initramfs with zstd.

> > > --- a/usr/Kconfig
> > > +++ b/usr/Kconfig
> > > @@ -100,6 +100,15 @@ config RD_LZ4
> > >           Support loading of a LZ4 encoded initial ramdisk or cpio buffer
> > >           If unsure, say N.
> > >
> > > +config RD_ZSTD
> > > +       bool "Support initial ramdisk/ramfs compressed using ZSTD"
> > > +       default y
> > > +       depends on BLK_DEV_INITRD
> > > +       select DECOMPRESS_ZSTD
> > > +       help
> > > +         Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
> > > +         If unsure, say N.
> >
> > I'm aware you copied this from the other entries, but IMHO "default y",
> > and "If unsure, say N" are not a good combination.

> you are right - for new stuff it should be "default n".

It got already applied to Linus' tree with "y", and I think it'd be nice
to have it as a default.  Let's disable other compressors instead.

On the other hand, having an unsupported rd compressor results in a boot
failure that's not immediately obvious, so that's a reason for keeping
the setting as "y".

On the third hand, distributions default to either gz or xz, thus I'd say:
* let's have gz xz zstd default to y, all others to n
* drop bzip2 lzma1 completely
* distros can't switch the mkinitramfs default yet, but if RD_ZSTD=y now,
  they'll be able to once they drop support for old kernels in a few years

> What I am missing - still - is a note - that your user-space should
> have the correct bits to support zstd-initramfs.
> Unsure where to place such an information.

Looks like INITRAMFS_COMPRESSION_* have lengthy prose but are not shown in
menuconfig, while RD_*, with no such prose, are shown.

The prose itself is grossly obsolete, too.  I have some updates in:
    https://github.com/kilobyte/linux/commits/nobz2-v3
but that patchset needs rebasing and refreshing.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁
⢿⡄⠘⠷⠚⠋⠀ It's time to migrate your Imaginary Protocol from version 4i to 6i.
⠈⠳⣄⠀⠀⠀⠀
