Return-Path: <linux-kbuild+bounces-1383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6D8911C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 03:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C679289CDB
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 02:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC03D35280;
	Fri, 29 Mar 2024 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gH8uu2E+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0E32C88
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680420; cv=none; b=s1qr8y0t7tkmSm1Qa/M/mdSvQ8YvYMqcSuRuenRfuW5EyfP4lLROxdoYMcr6CSe9CWVzDahRkOqsjwUVf0WOIxGxb9MHmCcHFTEuLofnzQJ+xLG7myo0VRHghJnPZh67u+y2b4BTy88NYlx6h2j/Y3WMrHBUHjI7isMAJEP67TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680420; c=relaxed/simple;
	bh=eWfj+aGYOh7tjs+jt01tO7AIQL8yDYNEfz5E//jamXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXUrPI8MolPzapKqb1sNEcR/ITeVkhxLhYFC4VdV3jhQYT8fgt7gV066YcfJzt1cOccp2H6gzRV2lmFeE0guAx6HD3aD/xkNApChNxIPm+Cp7EocwYaZFfJmcZ/09rdkNY1FK3k8JAr7sVjxAhzdasay/K/XH3svkGHPHqChcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gH8uu2E+; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6963c0c507eso16475906d6.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Mar 2024 19:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711680417; x=1712285217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srQfKT/BzMmZwEI+1YQrBRXDf12Tn35MF+VDUldciyU=;
        b=gH8uu2E+GKyyfIdZIjO9loj6nR0PmoPTt9O3ESBSvYWSYAacy2N48ApLV1zlytahOz
         b++sr17FGUBbBJpU5CAn3KIcPX6OJEH+DkejZzyYZO9fN6/uulSuYOMjdVTeWL32mdPk
         JSjoC5QKk2FR/WAwjeIZceoelpgN72SkR45ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711680417; x=1712285217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srQfKT/BzMmZwEI+1YQrBRXDf12Tn35MF+VDUldciyU=;
        b=qRZP61NQF0u7XNR1Un/llDMnJ838YFivQ1Z0C8zFXtfPEaBPFNNc+XJacQH3oaSHBQ
         3C+J3bLrEp9b1ShsO+b78RqZiszO9WWYUyOX7MzQqSFgAOWGQzWDWqA1asqZjxjJbgsw
         MyTaGKq5ohDteqe3CKdRVW9f2QkP5Y7JXYsllGH6XXNPfJjaPycyAPw6Liqp69jdlc/a
         A1BCYFHhZPc1I3xXiYARbyRCMMjte9szLlBKTsgodGlAzPqtOGt51qXpf2LuABtVat2O
         7QC8BJpQkBqYpC7tXVcqQtic8sRYFEbr79k6etlHRAUq1hg/NHHKDxEH+Ijem1hWi7bh
         obmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3kgF07RnAe1miSSzdWm95DA0+9qzLHApnTirpD0J9k0p/dzck0U3IWnMRbMBhlGHh5V9wCbg51V+lm49Sh9dy/sinjDhUCBtO4cd6
X-Gm-Message-State: AOJu0YylcwABLWMqyhvgVsukRKMkYS5h7/oZ/dUDp+ldbAEil3oCOQa8
	Ode6lpM/PjlSy33QA/nS00BEUiGGUD5WN5DPpJh/haiCZpeZ1Qxq5dm3JE4zfl7jndmsVN/X+4F
	Cm8CcmZ4N4yeIKrWT5fGBZyBc4YcENy3IBUx+
X-Google-Smtp-Source: AGHT+IFcNRIG4qyeHuU4viTDFJna3KUQm3AU7knSPFXXgF8+aPNLM3eXpw9YAj4qjYN4jlsYINmdFPQJFzf8SaGRmzE=
X-Received: by 2002:a0c:e948:0:b0:696:a309:1095 with SMTP id
 n8-20020a0ce948000000b00696a3091095mr6508219qvo.17.1711680416994; Thu, 28 Mar
 2024 19:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314042659.232142-1-sjg@chromium.org> <20240314042659.232142-3-sjg@chromium.org>
 <CAK7LNASWKyTXuPwj0_xaD=8_WfbXhejCe_Z+2Os2MD+mU_D5Fg@mail.gmail.com>
In-Reply-To: <CAK7LNASWKyTXuPwj0_xaD=8_WfbXhejCe_Z+2Os2MD+mU_D5Fg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 29 Mar 2024 15:46:45 +1300
Message-ID: <CAFLszTjpuMb7UGgGYZ9ybg7_ZBP_8GJwq=eA8=qc=2fTHKWOUw@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] arm64: boot: Support Flat Image Tree
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 27 Mar 2024 at 03:39, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Mar 14, 2024 at 1:28=E2=80=AFPM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Add a script which produces a Flat Image Tree (FIT), a single file
> > containing the built kernel and associated devicetree files.
> > Compression defaults to gzip which gives a good balance of size and
> > performance.
> >
> > The files compress from about 86MB to 24MB using this approach.
> >
> > The FIT can be used by bootloaders which support it, such as U-Boot
> > and Linuxboot. It permits automatic selection of the correct
> > devicetree, matching the compatible string of the running board with
> > the closest compatible string in the FIT. There is no need for
> > filenames or other workarounds.
> >
> > Add a 'make image.fit' build target for arm64, as well.
> >
> > The FIT can be examined using 'dumpimage -l'.
> >
> > This uses the 'dtbs-list' file but processes only .dtb files, ignoring
> > the overlay .dtbo files.
> >
> > This features requires pylibfdt (use 'pip install libfdt'). It also
> > requires compression utilities for the algorithm being used. Supported
> > compression options are the same as the Image.xxx files. Use
> > FIT_COMPRESSION to select an algorithm other than gzip.
> >
> > While FIT supports a ramdisk / initrd, no attempt is made to support
> > this here, since it must be built separately from the Linux build.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v11:
> > - Use dtbslist file in image.fit rule
> > - Update cmd_fit rule as per Masahiro
> > - Don't mention ignoring files without a .dtb prefix
> > - Use argparse fromfile_prefix_chars feature
> > - Add a -v option and use it for output (with make V=3D1)
> > - rename srcdir to dtbs
> > - Use -o for the output file instead of -f
> >
>
>
>
>
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -504,6 +504,21 @@ quiet_cmd_uimage =3D UIMAGE  $@
> >                         -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
> >                         -n '$(UIMAGE_NAME)' -d $< $@
> >
> > +# Flat Image Tree (FIT)
> > +# This allows for packaging of a kernel and all devicetrees files, usi=
ng
> > +# compression.
> > +# --------------------------------------------------------------------=
-------
> > +
> > +MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> > +
> > +# Use this to override the compression algorithm
> > +FIT_COMPRESSION ?=3D gzip
> > +
> > +quiet_cmd_fit =3D FIT     $@
> > +      cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > +               --name '$(UIMAGE_NAME)' $(if $(V),-v) \
> > +               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> > +
>
>
>
>
> A nit in your new code.
>
>
> $(if $(V),-v) does not work for KBUILD_VERBOSE env variable.
>
>
> It should be
>
>     $(if $(findstring 1,$(KBUILD_VERBOSE)),-v)

OK, thank you. I was assuming that V=3D0 would not be passed, but this
is better. I will send v12.

Regards,
Simon

