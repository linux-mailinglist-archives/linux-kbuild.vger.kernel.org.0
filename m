Return-Path: <linux-kbuild+bounces-2109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9A906580
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 09:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5253A280FBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A593061674;
	Thu, 13 Jun 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aRGa2+TB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D712C53D
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264744; cv=none; b=uQ6zcM/OdIrlHjL4gb7vXI6tm/YVbzJkBtU+oIlCFzJfkAqU7FEBMK6g3wVUMtD5g84fn7umHbyHUnjRoCzdUVROf0GcpYZ0yvhJCKuG19hArKjJfCl4Hvk2nTZC35DwyJ8weQOo/sPJPbPEK2GKvgNq6aYtrIoh0ucW1yYP0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264744; c=relaxed/simple;
	bh=zpSZlBDNL9kD22wlVaHzbNHGdJH3kmVNXx0DVn3Zo3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRKDjl7+oFAAmCEf0RaZ3nmauFi+SQSK2R5RB2Sm3zF+ftuWCnYb4VuWiHDhJyTXNmmT36eaRTprsZN4DtGuV8Lg7atBAILw9nLHCn53/3ZI4BhNLcxdssDuEukqo+0V61hkAHEN3e6UZglp8Hy1fjuNaOihvq4haLJbCuRO9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aRGa2+TB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295eb47b48so915565e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jun 2024 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718264741; x=1718869541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoUfCuEwCpKD3p7FxzACAXcXvlyOy49T5PY4S52/dYw=;
        b=aRGa2+TBRGzI+whXmimQkuuMNYQr8dyJReIpnNWOBBv0gNAv+2fXbp1xxXQB8KDsoH
         Ozi10JJ825H465GsTQBw3Lnnin/HjjI+hce+aag5+IvNoS6hTQ6Oa6EKpxBiKW24vp3Z
         RFAe/boN0YYb+vzjz9zZjFWnDRI/dfpZkUklw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264741; x=1718869541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoUfCuEwCpKD3p7FxzACAXcXvlyOy49T5PY4S52/dYw=;
        b=NCO85wmjrq27/n9HEFmehjPztm1zx3ykAY6ILyO+obV+PAJyi0kv6IB8H5tbxJHK14
         qnFDCYLYUMWliqBkeS3OorOrPX8RSONOcZMqf0MCqizjF8DJVuA/PVJfqcF9kgf10ggk
         th0rbRyPc1g/r3tU0oBcNi+wYHPQCoDk7vLutPGuAUtbXFav5uN6SmH2wkg6TG2efQRE
         7ODhvTm5KfPaRXdA/FZYjSdRz0fKS6SatQuu6onBZ3Bdf8oHYMz4SU/O9TlhBoKMTOYo
         60566EJT3TYrFpvHYI6Q1DstIAs5wVzDklEMhC+pnpkqCef5yet26RBGSiRXnD+sxBwi
         BObw==
X-Forwarded-Encrypted: i=1; AJvYcCUywYyawPU8oBe1v6okv8HPmGBhPbLPPJGHkPlK0jHczCxqhmXNkGEcwT/NEE04ZmM2A4rmIs0+DMkixmXA0qScqzRh6zI0aVa8Dr6K
X-Gm-Message-State: AOJu0Ywdourlq8NDUpQZ4kjwuSflvgUtGwehyNU6mOQSmI2tyjy4Ghu3
	VJouZ5tLLeI0vvfM6lC7A7BXeitYUxj2onxF5f1JFFL6CnDevOVB8qcuv/3WSs9n+DNWfLxGN7G
	h7hWK4eZQ2g2xEML79lv0wCtZ9RIczvlcau2yKAQO8VtOa1Ltzw==
X-Google-Smtp-Source: AGHT+IFohhnbj+ujWXuBp7B872HT1zslnjHk74kghMDGpyR2SNGGhCGzrpwImSaQn0vZ4TVmJ50FK8HjmRPKO23dV4c=
X-Received: by 2002:a05:6512:3687:b0:52c:983f:8ad with SMTP id
 2adb3069b0e04-52c9a3fd4camr2542032e87.47.1718264740824; Thu, 13 Jun 2024
 00:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org> <CAFLszTiZ8PUvxHx4kfLZf18RqSczRwxCmCxZ_y6J2rpu03pA=w@mail.gmail.com>
In-Reply-To: <CAFLszTiZ8PUvxHx4kfLZf18RqSczRwxCmCxZ_y6J2rpu03pA=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 15:45:29 +0800
Message-ID: <CAGXv+5EWqzj3w=KaKBfviBXPms0baKx28S0n+bGZcLc3=fGK+g@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Simon Glass <sjg@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 4:01=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Chen-Yu,
>
> On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > The kernel tree builds some "composite" DTBs, where the final DTB is th=
e
> > result of applying one or more DTB overlays on top of a base DTB with
> > fdtoverlay.
> >
> > The FIT image specification already supports configurations having one
> > base DTB and overlays applied on top. It is then up to the bootloader t=
o
> > apply said overlays and either use or pass on the final result. This
> > allows the FIT image builder to reuse the same FDT images for multiple
> > configurations, if such cases exist.
> >
> > The decomposition function depends on the kernel build system, reading
> > back the .cmd files for the to-be-packaged DTB files to check for the
> > fdtoverlay command being called. This will not work outside the kernel
> > tree. The function is off by default to keep compatibility with possibl=
e
> > existing users.
> >
> > To facilitate the decomposition and keep the code clean, the model and
> > compatitble string extraction have been moved out of the output_dtb
> > function. The FDT image description is replaced with the base file name
> > of the included image.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This is a feature I alluded to in my replies to Simon's original
> > submission of the make_fit.py script [1].
> >
> > This is again made a runtime argument as not all firmware out there
> > that boot FIT images support applying overlays. Like my previous
> > submission for disabling compression for included FDT images, the
> > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > applying overlays. Another case of this is U-boot shipped by developmen=
t
> > board vendors in binary form (without upstream) in an image or in
> > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> > These would fail to boot FIT images with DT overlays. One such
> > example is my Hummingboard Pulse. In these cases the firmware is
> > either not upgradable or very hard to upgrade.
> >
> > I believe there is value in supporting these cases. A common script
> > shipped with the kernel source that can be shared by distros means
> > the distro people don't have to reimplement this in their downstream
> > repos or meta-packages. For ChromeOS this means reducing the amount
> > of package code we have in shell script.
> >
> > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@googl=
e.com/
> > [2]
> >
> >  scripts/Makefile.lib |  1 +
> >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++--------------
> >  2 files changed, 49 insertions(+), 22 deletions(-)
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> Some possible nits / changes below
>
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 9f06f6aaf7fc..d78b5d38beaa 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -522,6 +522,7 @@ quiet_cmd_fit =3D FIT     $@
> >        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> >                 --name '$(UIMAGE_NAME)' \
> >                 $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > +               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> >                 --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> >
> >  # XZ
> > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > index 263147df80a4..120f13e1323c 100755
> > --- a/scripts/make_fit.py
> > +++ b/scripts/make_fit.py
> > @@ -22,6 +22,11 @@ the entire FIT.
> >  Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
> >  zstd algorithms.
> >
> > +Use -d to decompose "composite" DTBs into their base components and
> > +deduplicate the resulting base DTBs and DTB overlays. This requires th=
e
> > +DTBs to be sourced from the kernel build directory, as the implementat=
ion
> > +looks at the .cmd files produced by the kernel build.
> > +
> >  The resulting FIT can be booted by bootloaders which support FIT, such
> >  as U-Boot, Linuxboot, Tianocore, etc.
> >
> > @@ -64,6 +69,8 @@ def parse_args():
> >            help=3D'Specifies the architecture')
> >      parser.add_argument('-c', '--compress', type=3Dstr, default=3D'non=
e',
> >            help=3D'Specifies the compression')
> > +    parser.add_argument('-d', '--decompose-dtbs', action=3D'store_true=
',
> > +          help=3D'Decompose composite DTBs into base DTB and overlays'=
)
>
> I wonder if we should reserve -d for --debug? I don't have a strong
> opinion though.

Seems reasonable. I'll make it use the capital -D then.

> >      parser.add_argument('-E', '--external', action=3D'store_true',
> >            help=3D'Convert the FIT to use external data')
> >      parser.add_argument('-n', '--name', type=3Dstr, required=3DTrue,
> > @@ -140,12 +147,12 @@ def finish_fit(fsw, entries):
> >      fsw.end_node()
> >      seq =3D 0
> >      with fsw.add_node('configurations'):
> > -        for model, compat in entries:
> > +        for model, compat, files in entries:
> >              seq +=3D 1
> >              with fsw.add_node(f'conf-{seq}'):
> >                  fsw.property('compatible', bytes(compat))
> >                  fsw.property_string('description', model)
> > -                fsw.property_string('fdt', f'fdt-{seq}')
> > +                fsw.property('fdt', b''.join([b'fdt-%d\x00' % x for x =
in files]))
>
> This looks right to me. It would be nice to use an f string but I
> don't know how to do that with bytes.

Me neither. Switching the format to an f string doesn't work:

  File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 324, in <module>
    sys.exit(run_make_fit())
             ^^^^^^^^^^^^^^
  File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 298, in run_make_f=
it
    out_data, count, size =3D build_fit(args)
                            ^^^^^^^^^^^^^^^
  File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 288, in build_fit
    finish_fit(fsw, entries)
  File "/ssd1/wenst/linux/src/scripts/make_fit.py", line 161, in finish_fit
    fsw.property('fdt', b''.join([f'fdt-%d\x00' % x for x in files]))
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: sequence item 0: expected a bytes-like object, str found

> But do you need the inner [] ?

Nope. Will remove.

>
> >                  fsw.property_string('kernel', 'kernel')
> >      fsw.end_node()
> >
> > @@ -193,21 +200,9 @@ def output_dtb(fsw, seq, fname, arch, compress):
> >          fname (str): Filename containing the DTB
> >          arch: FIT architecture, e.g. 'arm64'
> >          compress (str): Compressed algorithm, e.g. 'gzip'
> > -
> > -    Returns:
> > -        tuple:
> > -            str: Model name
> > -            bytes: Compatible stringlist
> >      """
> >      with fsw.add_node(f'fdt-{seq}'):
> > -        # Get the compatible / model information
> > -        with open(fname, 'rb') as inf:
> > -            data =3D inf.read()
> > -        fdt =3D libfdt.FdtRo(data)
> > -        model =3D fdt.getprop(0, 'model').as_str()
> > -        compat =3D fdt.getprop(0, 'compatible')
> > -
> > -        fsw.property_string('description', model)
> > +        fsw.property_string('description', os.path.basename(fname))
> >          fsw.property_string('type', 'flat_dt')
> >          fsw.property_string('arch', arch)
> >          fsw.property_string('compression', compress)
> > @@ -215,7 +210,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
> >          with open(fname, 'rb') as inf:
> >              compressed =3D compress_data(inf, compress)
> >          fsw.property('data', compressed)
> > -    return model, compat
> >
> >
> >  def build_fit(args):
> > @@ -235,6 +229,7 @@ def build_fit(args):
> >      fsw =3D libfdt.FdtSw()
> >      setup_fit(fsw, args.name)
> >      entries =3D []
> > +    fdts =3D collections.OrderedDict()
> >
> >      # Handle the kernel
> >      with open(args.kernel, 'rb') as inf:
> > @@ -243,12 +238,43 @@ def build_fit(args):
> >      write_kernel(fsw, comp_data, args)
> >
> >      for fname in args.dtbs:
> > -        # Ignore overlay (.dtbo) files
> > -        if os.path.splitext(fname)[1] =3D=3D '.dtb':
> > -            seq +=3D 1
> > -            size +=3D os.path.getsize(fname)
> > -            model, compat =3D output_dtb(fsw, seq, fname, args.arch, a=
rgs.compress)
> > -            entries.append([model, compat])
> > +        # Ignore non-DTB (*.dtb) files
> > +        if os.path.splitext(fname)[1] !=3D '.dtb':
> > +            continue
> > +
> > +        # Get the compatible / model information
> > +        with open(fname, 'rb') as inf:
> > +            data =3D inf.read()
> > +        fdt =3D libfdt.FdtRo(data)
> > +        model =3D fdt.getprop(0, 'model').as_str()
> > +        compat =3D fdt.getprop(0, 'compatible')
> > +
> > +        if args.decompose_dtbs:
> > +            # Check if the DTB needs to be decomposed
> > +            path, basename =3D os.path.split(fname)
> > +            cmd_fname =3D os.path.join(path, f'.{basename}.cmd')
> > +            with open(cmd_fname, 'r', encoding=3D'ascii') as inf:
> > +                cmd =3D inf.read()
> > +
> > +            if 'scripts/dtc/fdtoverlay' in cmd:
> > +                # This depends on the structure of the composite DTB c=
ommand
> > +                files =3D cmd.split()
> > +                files =3D files[files.index('-i')+1:]
>
> spaces around +

Will fix.

> > +            else:
> > +                files =3D [fname]
> > +        else:
> > +            files =3D [fname]
>
> I do wonder if the code from '# Get the compatible' to here would be
> better in a separate, documented function, to keep things easier to
> understand?

I'll see what I can do. In that case I'll drop your Reviewed-by.


Thanks
ChenYu

> > +
> > +        for fn in files:
> > +            if fn not in fdts:
> > +                seq +=3D 1
> > +                size +=3D os.path.getsize(fn)
> > +                output_dtb(fsw, seq, fn, args.arch, args.compress)
> > +                fdts[fn] =3D seq
> > +
> > +        files_seq =3D [fdts[fn] for fn in files]
> > +
> > +        entries.append([model, compat, files_seq])
> >
> >      finish_fit(fsw, entries)
> >
> > --
> > 2.45.1.288.g0e0cd299f1-goog
> >
>
> Regards,
> Simon

