Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3408B4A9E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2019 11:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfIQJfW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Sep 2019 05:35:22 -0400
Received: from mail-40132.protonmail.ch ([185.70.40.132]:51051 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfIQJfV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Sep 2019 05:35:21 -0400
Date:   Tue, 17 Sep 2019 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
        s=protonmail; t=1568712918;
        bh=7al/T7V+BY7NjSZ3yvHA/yYuZG9e2Bk22StX9CKMVk4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=e4vIQB3/ek87t2wke2ANUNusBnbTVWIcoFZ38xRO+RsNAgqHQ68bwGUxW3I0+pC1U
         SMgWFisYL4+sGAEvTxGuN9NccZR0KxyyuH8QeIMgofR2/BbX3YYcCIcq9IF9iDTf6p
         kXNBD093B6RmoIhtrR97jSvg6zLsYtVf8moUxBNM=
To:     Palmer Dabbelt <palmer@sifive.com>
From:   Aurabindo Jayamohanan <mail@aurabindo.in>
Cc:     Anup Patel <Anup.Patel@wdc.com>,
        Troy Benjegerdes <troy.benjegerdes@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: RE: [RFC] buildtar: add case for riscv architecture
Message-ID: <lMUhcsewB9GAKeZH2cH-zl3vFME8u2z5IzCqDBFhtT2IbG71vhHnjrlHKbhyxFee5XFe1X1gRllNJBR9e9dQlC0vbIpSffL_y0pLb46VddQ=@aurabindo.in>
In-Reply-To: <mhng-4e30fb12-057c-425c-a867-ecf93e080ed9@palmer-si-x1e>
References: <mhng-4e30fb12-057c-425c-a867-ecf93e080ed9@palmer-si-x1e>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.8 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.2
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Sunday, September 15, 2019 12:57 AM, Palmer Dabbelt <palmer@sifive.com> =
wrote:

> On Sat, 14 Sep 2019 06:05:59 PDT (-0700), Anup Patel wrote:
>
> > > -----Original Message-----
> > > From: linux-kernel-owner@vger.kernel.org <linux-kernel-
> > > owner@vger.kernel.org> On Behalf Of Palmer Dabbelt
> > > Sent: Saturday, September 14, 2019 6:30 PM
> > > To: mail@aurabindo.in
> > > Cc: Troy Benjegerdes troy.benjegerdes@sifive.com; Paul Walmsley
> > > paul.walmsley@sifive.com; aou@eecs.berkeley.edu; linux-
> > > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > > kbuild@vger.kernel.org
> > > Subject: Re: [RFC] buildtar: add case for riscv architecture
> > > On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
> > >
> > > > > None of the available RiscV platforms that I=E2=80=99m aware of u=
se compressed
> > > > > images, unless there are some new bootloaders I haven=E2=80=99t s=
een yet.
> > > >
> > > > >
> > > >
> > > > I noticed that default build image is Image.gz, which is why I thou=
ght its a
> > > > good idea to copy it into the tarball. Does such a copy not make se=
nse at this
> > > > point ?
> > >
> > > Image.gz can't be booted directly: it's just Image that's been compre=
ssed
> > > with the standard gzip command. A bootloader would have to decompress
> > > that image before loading it into memory, which requires extra bootlo=
ader
> > > support.
> > > Contrast that with the zImage style images (which are vmlinuz on x86)=
, which
> > > are self-extracting and therefor require no bootloader support. The
> > > examples for u-boot all use the "booti" command, which expects
> > > uncompressed images.
> > > Poking around I couldn't figure out a way to have u-boot decompress t=
he
> > > images, but that applies to arm64 as well so I'm not sure if I'm miss=
ing
> > > something.
> > > If I was doing this, I'd copy over arch/riscv/boot/Image and call it
> > > "/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confus=
ing to
> > > me because I'd expect vmlinuz to be a self-extracting compressed
> > > executable and not a raw gzip file.
> >
> > On the contrary, it is indeed possible to boot Image.gz directly using
> > U-Boot booti command so this patch would be useful.
> > Atish had got it working on U-Boot but he has deferred booti Image.gz
> > support due to few more dependent changes. May be he can share
> > more info.
>
> Oh, great. I guess it makes sense to just put both in the tarball, then, =
as
> users will still need to use the Image format for now.
>

Uncompressed vmlinux is already copied by default. This patch just adds the
Image.gz into the archive as vmlinuz. But as you said, since the name vmlin=
uz is
reserved for self extracting archives, should I keep the original name Imag=
e.gz ?

