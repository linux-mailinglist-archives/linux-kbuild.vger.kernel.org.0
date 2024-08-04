Return-Path: <linux-kbuild+bounces-2800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A05946C0D
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 05:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB361C20C44
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 03:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE452320B;
	Sun,  4 Aug 2024 03:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2qIJLz2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4129A5
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 03:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722742211; cv=none; b=aLRtR8lBOxmeBwUIwuP91/v2uq+RXyi/AJDDAEC94TOxZmU7maO8vawkgHYr4+rw3QA6Sl2sNCOeshwegEyFWOqzLpStTYp9gBi1FzuppZXqez2jmxHW4Dchp73pub//Vi9YTec3xCclI4+a/5t4bIWfh0D0FFX0A2NbcxvW91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722742211; c=relaxed/simple;
	bh=XBPWBMVuOLPUUvpQJXbOZ2QD2P9LqyvbBZwqhj+q4fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etUtZkooxH6AdhCbsypN8BYOwzmPH9IaYw+JXGCLF896mFHBiRhGtyL9amIikvntlSvLbFC+8RyAdMqHzChtCFGQA7N36RdAP1SyC993ozyLCibmsAa0IrdZ2a9DPEtQO/0sliNiY0LHzq7zoqJoSl+6XqCxx9SQWp+8hYtAjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2qIJLz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D29C4AF0E
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 03:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722742211;
	bh=XBPWBMVuOLPUUvpQJXbOZ2QD2P9LqyvbBZwqhj+q4fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G2qIJLz2Cy3HQwoZsDTY7OhF3KmhANFjRjA02J1KSEyIxEHrjHNIVUUYmATOiZ2j5
	 SprS3KWxRO9rL67YPa5wmI7z7cNmjdNAXmm9nFyUvvyaAYl9/R8StWNQqueYYQSYJj
	 nYNGu9DRX58tJqLGmqn5O0ZjD15s0Igm+o532RZXSubPEnOOZf1ZulwaZSJ8m91a4O
	 eaioIysFa80Klqo3EjHcP/08P974OrZoUJWQGHjtZODEfiEviqTz1YwUdSodRA7lD0
	 UhGLq4XMgL0rfgng1MAvXKHkkVZk7aAsQ+VhvgNiCJHhAnumr0nwEpzfwbyeA/z8kL
	 mOiP6nTwT15yQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so137105441fa.1
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Aug 2024 20:30:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjNEbkOOsgPrCKKbulR5bYIBy1ufOKA4GCUnUPzfPZwWeXziohR/F/WLHC+4/GMEbP7w8rzn9jE66afHoWK0NIBzsd3t0J4PnCensN
X-Gm-Message-State: AOJu0YycDmxbFMBtEF0VLcw8ZTEtxJuPf08zdJfllKu8N+dcnDZPIa0N
	3Yc95bkDF+RR+Wv6TUGNetYtgisWotFcKtam818e38YlKtIcR4D2SLSKHPaTf67lGCtlL/0NFU/
	kkHjHApbBUj5tVJrEpnXNhotMLTE=
X-Google-Smtp-Source: AGHT+IFsd/7Q9Tn9jDA7l4hHuYugwTd4pl8Y3qp5FQYkIqUaS4sj+Wgm4jfF7Ub+gZR4utYO06KCNwZqBuL+SoJozY0=
X-Received: by 2002:a05:6512:3e22:b0:52c:e05f:9052 with SMTP id
 2adb3069b0e04-530bb3b4581mr6193010e87.47.1722742209665; Sat, 03 Aug 2024
 20:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
 <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com> <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
In-Reply-To: <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 4 Aug 2024 12:29:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNARfgd=uqot6QxK5njHVXhb06yJXrJ+j=F=Uzh=6a6mm=Q@mail.gmail.com>
Message-ID: <CAK7LNARfgd=uqot6QxK5njHVXhb06yJXrJ+j=F=Uzh=6a6mm=Q@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: sedat.dilek@gmail.com, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 7:18=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> Hi Sedat, all,
>
> The mixed quoting is confusing me a bit, hopefully not to the point
> where I miss some questions.
>
> On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> > >
> > > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19|2=
2|T0)'
> > > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZSTD)=
 -19 > $@
> > > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(ZST=
D)
> > > -22 --ultra > $@
> > > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > >
> > > -sed@-
> > >
> > > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gmai=
l.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD6=
4.
> > > >
> > > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35Mi=
B
> > > > greater linux-image Debian file.
> > > >
> > > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > > >
> > > > So, I checked the used compression-level of ZSTD in the build-proce=
ss:
> > > >
> > > > [ vmlinux.bin.zst ]
> > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinu=
x.bin.zst
> > > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
> > > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > > bin.zst
> > > >
> > > > [ amdgpu.ko.zst ]
> > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0'=
 |
> > > > grep amdgpu
> > > >  zstd -T0 --rm -f -q
> > > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1=
-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > > >
> > > > Here some numbers:
> > > >
> > > > [ Values in KiB ]
> > > > $ du -k amdgpu.ko*
> > > > 29264   amdgpu.ko
> > > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > > 4260    amdgpu.ko.zst_T0-22
> > > > 4308    amdgpu.ko.zst_T0-22-ultra
> > > >
> > > > $ time zstd -T0 -v amdgpu.ko
> > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > Note: 2 physical core(s) detected
> > > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdgpu=
.ko.zst)
> > > >
> > > > real    0m2,496s
> > > > user    0m0,448s
> > > > sys     0m0,064s
> > > >
> > > > $ time zstd -T0 -19 -v amdgpu.ko
> > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > Note: 2 physical core(s) detected
> > > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdgpu=
.ko.zst)
> > > >
> > > > real    0m22,821s
> > > > user    0m22,759s
> > > > sys     0m0,080s
> > > >
> > > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) every=
where.
> > > >
> > > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> > > >
> > > > NOTE: -22 w/ or w/o ultra has no big effect here and increases even
> > > > more build-time.
> > > >
> > > > What do you think?
> > > >
> > > > Thanks.
> > > >
> > > > Best regards,
> > > > -Sedat-
> >
> > [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> > ("kbuild: add support for zstd compressed modules") ]
> >
> > Debian/unstable AMD54 ships kmod version 32+20240611-1.
> >
> > To use better/higher ZSTD compression-level for
> > CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?
> >
> > DIFF for Linux-6.10.1:
> >
> > $ git diff scripts/Makefile.modinst
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index 0afd75472679..2a8b37c80cbf 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > quiet_cmd_xz =3D XZ      $@
> >       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> > quiet_cmd_zstd =3D ZSTD    $@
> > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
> >
> > $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> >        $(call cmd,gzip)
> >
>
> The compression tools (zstd, xz, etc) are used predominantly for two
> separate topics - kernel image and kernel module compression.
>
> Off the top of my head: in the former case, reasonable compression is
> used by all tools. Be that zstd, lzo, lzma, you name it.
> Honestly I don't know why and what's the merit behind the levels chosen.
>
> In the modules case, things are also consistent where the default
> compression level is used throughout.
> Here it makes sense to keep the default since you can consider that
> the decompression can be done by either kernel or user-space. Where
> each comes with it's limitations:
>
> The in-kernel one does not support ultra levels for zstd (or it used
> to at some point) IIRC. The kmod tools themselves rely on the zstd
> library liked in, although if one is using busybox then zstd
> compressed modules were not supported last time I checked (a year or
> so ago).
>
> So for example: you can have zstd --22 modules, if the kernel + kmod
> are new enough (have in-kernel decompression) things will fail. If
> they're not, things will work just fine.
>
> Which is why, I think it's up-to your distro/builder to choose the
> policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make ...
> modules_install`.
>
> Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> during make modules_install **depending** on the components used and
> their version.


Ah, it is nice.
I remembered a patch that adds a new CONFIG option to specify the
compression level,
but it is possible via ZSTD_CLEVEL.


Currently, multithreading (-T0) is always on in scripts/Makefile.modinst,
but this is questionable to me.



--
Best Regards
Masahiro Yamada

