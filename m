Return-Path: <linux-kbuild+bounces-2110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B399066FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 10:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1456428722C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 08:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F3213D512;
	Thu, 13 Jun 2024 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fOhCO1gA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767F13D529
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267776; cv=none; b=aQM2O0vWBNge0x7gO9CbZidWnVYeDwzA9y7CqRWEhBfnqotepyHHwZweexTD6Xt/3exdlonq8zPxIpl2R/HPbjH2Nv/xIWrt13YX+3PWacl3y3kO8j33V7AmWOAQnSokVBIOKYkLjKyX93vtvh4kzMZOpRTPSmQ6wyHtVy67Ny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267776; c=relaxed/simple;
	bh=B+p84waxXOwElG0/87eHt/laWADkBk6xlYgmpwgMmxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zrg6eyzKS0oRPnG4lKwfgArETnl2A3l3l6DDUbkTkL1e4wg2bfH3ksZt/TnrRc2vqX5i9BwTFTo3CEhLFcDk+bKhomZOE+b1tCD0RJTQw+wl0ig9uOiYENnf27M3N46hjM9xAzK4hknxSktrbvO+ADz0QwL661S+KXw+TjZZqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fOhCO1gA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so7408751fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718267772; x=1718872572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybIQ5CeAWwcGafjH4//aR+7GcflfnxnbdHeF4JEy5gs=;
        b=fOhCO1gAmYExSLlCF/JODwFzoWVfSTIxqJdzLfaivaQNkGL5KK/71hGGtMJyLx32VI
         DZ02GpvOTTTEn23T7eA1ufoFYfpN0aHqVOSqCtHyhXWZ7kreDxf49H+Th5+uYBSWSSf0
         9xrZM8GjsgvC4Kln57Nhi4WLuj1czG80fqBdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267772; x=1718872572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybIQ5CeAWwcGafjH4//aR+7GcflfnxnbdHeF4JEy5gs=;
        b=CFewVmnxBoNZ72E9h9kTSMHZLz04eGSBj3HpaUEKnbsiEjxwYrqnZohMW1Jc8KzfZR
         PiZ6evVJB4unZacQ0PrJ3hTLoqvr0SesvYYBsa4Ufv32Zm12VZ/4jsbWoYgn/VhF9vjO
         MgwVimxUqkMo95DyhJC/LsSu5+ePkr4OBXVsn2rQdCuc7E6gOCZF63ztykFGuknLysEh
         Ktywl/VftdVyGpZR14Dr1vh04UOaXj9l13ywKFJlpBvYPZPWYdY+y5Nd1zbOAJucbwUl
         L0iGhMM9NlVlvjjoszABcaCpYYMzWR0gCUehaRjqg0X1TnIXVEHzWPEgY4+zoJylOl7c
         uDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlIWocCUZ5hYt5S6p8s1KMiP/WkIonuT6t4vl6cTECSuCoKQwcKC9N07luR+hBVAXjTqaSjxfl5SLgWsOO1xAMtLyPcjrZrvIR42KF
X-Gm-Message-State: AOJu0YwgqqN91sdgv1s1XELC/ZpsUWSIG63PBEXeyNtCDjxAn2lylOXo
	NnTsDAGpEdSu08lTfUqIUddETZ68NhkkJtyyvO8P5ihgdK9UJncQ3KBVh2QSv2Rp7JlS59924XZ
	Hb80yUv6578p0EZ14oH+/ENkhIr/FDXKY8Ag77AD0lYi7tsFbrHSW
X-Google-Smtp-Source: AGHT+IGMz0ZJMbYjSjQWA7KRhtlPsL+Cs6+uv48MtLgUAzgV0vU9/yghyhVPr647rsH0k2Jr1hfdruYMQ+IWpwmgdx0=
X-Received: by 2002:ac2:562a:0:b0:52c:831d:7eb3 with SMTP id
 2adb3069b0e04-52c9a3c74b7mr2536749e87.18.1718267771892; Thu, 13 Jun 2024
 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org> <CAFLszTiZ8PUvxHx4kfLZf18RqSczRwxCmCxZ_y6J2rpu03pA=w@mail.gmail.com>
 <CAGXv+5EWqzj3w=KaKBfviBXPms0baKx28S0n+bGZcLc3=fGK+g@mail.gmail.com>
In-Reply-To: <CAGXv+5EWqzj3w=KaKBfviBXPms0baKx28S0n+bGZcLc3=fGK+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 16:36:00 +0800
Message-ID: <CAGXv+5Gt5B35OEvQva7sh=MEHU=QYGD3fWzxbK_ZT-K13pf81w@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Simon Glass <sjg@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 3:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Jun 12, 2024 at 4:01=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Hi Chen-Yu,
> >
> > On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > The kernel tree builds some "composite" DTBs, where the final DTB is =
the
> > > result of applying one or more DTB overlays on top of a base DTB with
> > > fdtoverlay.
> > >
> > > The FIT image specification already supports configurations having on=
e
> > > base DTB and overlays applied on top. It is then up to the bootloader=
 to
> > > apply said overlays and either use or pass on the final result. This
> > > allows the FIT image builder to reuse the same FDT images for multipl=
e
> > > configurations, if such cases exist.
> > >
> > > The decomposition function depends on the kernel build system, readin=
g
> > > back the .cmd files for the to-be-packaged DTB files to check for the
> > > fdtoverlay command being called. This will not work outside the kerne=
l
> > > tree. The function is off by default to keep compatibility with possi=
ble
> > > existing users.
> > >
> > > To facilitate the decomposition and keep the code clean, the model an=
d
> > > compatitble string extraction have been moved out of the output_dtb
> > > function. The FDT image description is replaced with the base file na=
me
> > > of the included image.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > This is a feature I alluded to in my replies to Simon's original
> > > submission of the make_fit.py script [1].
> > >
> > > This is again made a runtime argument as not all firmware out there
> > > that boot FIT images support applying overlays. Like my previous
> > > submission for disabling compression for included FDT images, the
> > > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > > applying overlays. Another case of this is U-boot shipped by developm=
ent
> > > board vendors in binary form (without upstream) in an image or in
> > > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> > > These would fail to boot FIT images with DT overlays. One such
> > > example is my Hummingboard Pulse. In these cases the firmware is
> > > either not upgradable or very hard to upgrade.
> > >
> > > I believe there is value in supporting these cases. A common script
> > > shipped with the kernel source that can be shared by distros means
> > > the distro people don't have to reimplement this in their downstream
> > > repos or meta-packages. For ChromeOS this means reducing the amount
> > > of package code we have in shell script.
> > >
> > > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@goo=
gle.com/
> > > [2]
> > >
> > >  scripts/Makefile.lib |  1 +
> > >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++------------=
--
> > >  2 files changed, 49 insertions(+), 22 deletions(-)
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > Some possible nits / changes below
> >
> > >
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index 9f06f6aaf7fc..d78b5d38beaa 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -522,6 +522,7 @@ quiet_cmd_fit =3D FIT     $@
> > >        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux=
 \
> > >                 --name '$(UIMAGE_NAME)' \
> > >                 $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > > +               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > >                 --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> > >
> > >  # XZ
> > > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > > index 263147df80a4..120f13e1323c 100755
> > > --- a/scripts/make_fit.py
> > > +++ b/scripts/make_fit.py
> > > @@ -22,6 +22,11 @@ the entire FIT.
> > >  Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
> > >  zstd algorithms.
> > >
> > > +Use -d to decompose "composite" DTBs into their base components and
> > > +deduplicate the resulting base DTBs and DTB overlays. This requires =
the
> > > +DTBs to be sourced from the kernel build directory, as the implement=
ation
> > > +looks at the .cmd files produced by the kernel build.
> > > +
> > >  The resulting FIT can be booted by bootloaders which support FIT, su=
ch
> > >  as U-Boot, Linuxboot, Tianocore, etc.
> > >
> > > @@ -64,6 +69,8 @@ def parse_args():
> > >            help=3D'Specifies the architecture')
> > >      parser.add_argument('-c', '--compress', type=3Dstr, default=3D'n=
one',
> > >            help=3D'Specifies the compression')
> > > +    parser.add_argument('-d', '--decompose-dtbs', action=3D'store_tr=
ue',
> > > +          help=3D'Decompose composite DTBs into base DTB and overlay=
s')
> >
> > I wonder if we should reserve -d for --debug? I don't have a strong
> > opinion though.
>
> Seems reasonable. I'll make it use the capital -D then.
>
> > >      parser.add_argument('-E', '--external', action=3D'store_true',
> > >            help=3D'Convert the FIT to use external data')
> > >      parser.add_argument('-n', '--name', type=3Dstr, required=3DTrue,
> > > @@ -140,12 +147,12 @@ def finish_fit(fsw, entries):
> > >      fsw.end_node()
> > >      seq =3D 0
> > >      with fsw.add_node('configurations'):
> > > -        for model, compat in entries:
> > > +        for model, compat, files in entries:
> > >              seq +=3D 1
> > >              with fsw.add_node(f'conf-{seq}'):
> > >                  fsw.property('compatible', bytes(compat))
> > >                  fsw.property_string('description', model)
> > > -                fsw.property_string('fdt', f'fdt-{seq}')
> > > +                fsw.property('fdt', b''.join([b'fdt-%d\x00' % x for =
x in files]))
> >
> > This looks right to me. It would be nice to use an f string but I
> > don't know how to do that with bytes.
>
> Me neither. Switching the format to an f string doesn't work:
>
>   File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 324, in <module>
>     sys.exit(run_make_fit())
>              ^^^^^^^^^^^^^^
>   File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 298, in run_make=
_fit
>     out_data, count, size =3D build_fit(args)
>                             ^^^^^^^^^^^^^^^
>   File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 288, in build_fi=
t
>     finish_fit(fsw, entries)
>   File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 161, in finish_f=
it
>     fsw.property('fdt', b''.join([f'fdt-%d\x00' % x for x in files]))
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> TypeError: sequence item 0: expected a bytes-like object, str found

    bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii")

Seems to work.

ChenYu

> > But do you need the inner [] ?
>
> Nope. Will remove.
>
> >
> > >                  fsw.property_string('kernel', 'kernel')
> > >      fsw.end_node()
> > >
> > > @@ -193,21 +200,9 @@ def output_dtb(fsw, seq, fname, arch, compress):
> > >          fname (str): Filename containing the DTB
> > >          arch: FIT architecture, e.g. 'arm64'
> > >          compress (str): Compressed algorithm, e.g. 'gzip'
> > > -
> > > -    Returns:
> > > -        tuple:
> > > -            str: Model name
> > > -            bytes: Compatible stringlist
> > >      """
> > >      with fsw.add_node(f'fdt-{seq}'):
> > > -        # Get the compatible / model information
> > > -        with open(fname, 'rb') as inf:
> > > -            data =3D inf.read()
> > > -        fdt =3D libfdt.FdtRo(data)
> > > -        model =3D fdt.getprop(0, 'model').as_str()
> > > -        compat =3D fdt.getprop(0, 'compatible')
> > > -
> > > -        fsw.property_string('description', model)
> > > +        fsw.property_string('description', os.path.basename(fname))
> > >          fsw.property_string('type', 'flat_dt')
> > >          fsw.property_string('arch', arch)
> > >          fsw.property_string('compression', compress)
> > > @@ -215,7 +210,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
> > >          with open(fname, 'rb') as inf:
> > >              compressed =3D compress_data(inf, compress)
> > >          fsw.property('data', compressed)
> > > -    return model, compat
> > >
> > >
> > >  def build_fit(args):
> > > @@ -235,6 +229,7 @@ def build_fit(args):
> > >      fsw =3D libfdt.FdtSw()
> > >      setup_fit(fsw, args.name)
> > >      entries =3D []
> > > +    fdts =3D collections.OrderedDict()
> > >
> > >      # Handle the kernel
> > >      with open(args.kernel, 'rb') as inf:
> > > @@ -243,12 +238,43 @@ def build_fit(args):
> > >      write_kernel(fsw, comp_data, args)
> > >
> > >      for fname in args.dtbs:
> > > -        # Ignore overlay (.dtbo) files
> > > -        if os.path.splitext(fname)[1] =3D=3D '.dtb':
> > > -            seq +=3D 1
> > > -            size +=3D os.path.getsize(fname)
> > > -            model, compat =3D output_dtb(fsw, seq, fname, args.arch,=
 args.compress)
> > > -            entries.append([model, compat])
> > > +        # Ignore non-DTB (*.dtb) files
> > > +        if os.path.splitext(fname)[1] !=3D '.dtb':
> > > +            continue
> > > +
> > > +        # Get the compatible / model information
> > > +        with open(fname, 'rb') as inf:
> > > +            data =3D inf.read()
> > > +        fdt =3D libfdt.FdtRo(data)
> > > +        model =3D fdt.getprop(0, 'model').as_str()
> > > +        compat =3D fdt.getprop(0, 'compatible')
> > > +
> > > +        if args.decompose_dtbs:
> > > +            # Check if the DTB needs to be decomposed
> > > +            path, basename =3D os.path.split(fname)
> > > +            cmd_fname =3D os.path.join(path, f'.{basename}.cmd')
> > > +            with open(cmd_fname, 'r', encoding=3D'ascii') as inf:
> > > +                cmd =3D inf.read()
> > > +
> > > +            if 'scripts/dtc/fdtoverlay' in cmd:
> > > +                # This depends on the structure of the composite DTB=
 command
> > > +                files =3D cmd.split()
> > > +                files =3D files[files.index('-i')+1:]
> >
> > spaces around +
>
> Will fix.
>
> > > +            else:
> > > +                files =3D [fname]
> > > +        else:
> > > +            files =3D [fname]
> >
> > I do wonder if the code from '# Get the compatible' to here would be
> > better in a separate, documented function, to keep things easier to
> > understand?
>
> I'll see what I can do. In that case I'll drop your Reviewed-by.
>
>
> Thanks
> ChenYu
>
> > > +
> > > +        for fn in files:
> > > +            if fn not in fdts:
> > > +                seq +=3D 1
> > > +                size +=3D os.path.getsize(fn)
> > > +                output_dtb(fsw, seq, fn, args.arch, args.compress)
> > > +                fdts[fn] =3D seq
> > > +
> > > +        files_seq =3D [fdts[fn] for fn in files]
> > > +
> > > +        entries.append([model, compat, files_seq])
> > >
> > >      finish_fit(fsw, entries)
> > >
> > > --
> > > 2.45.1.288.g0e0cd299f1-goog
> > >
> >
> > Regards,
> > Simon

