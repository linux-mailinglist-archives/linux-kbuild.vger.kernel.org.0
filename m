Return-Path: <linux-kbuild+bounces-221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9057FFC8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F091C20E82
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C010054FBD;
	Thu, 30 Nov 2023 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VAgxEePj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F0D10FF
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:32:30 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so200425566b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701376349; x=1701981149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyV2gGCTHlRr6FFC1cUH0SLaifrXymYajx2/Ty5GB1w=;
        b=VAgxEePj53u5EM//Qi/HrAclM1gseJ6DJ9FsYCnbBB4v9BLaidfAAhnzc809l7Qudq
         JYWJ77C/pssWrK13CNxq1FUGoZWTwCzS6OtBRRgMmp/3qwFZCRUd2LNkmhVysbrpM6Nm
         BVEKIsB++DDuOz7040X4eIEX7q3fcyZapA/AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701376349; x=1701981149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyV2gGCTHlRr6FFC1cUH0SLaifrXymYajx2/Ty5GB1w=;
        b=Lx8J98C+1ChWzT2uGOftWjLG1aiM1s+mxrycMFceidvP1uirj9tESF15Q4gPo7ywPy
         Q2EBCHE3plKXISMzg6a+PkNs+C4eu+6zMsMQq642SOG2n5qdQcZfbZ34op8p15t3T9Xq
         QSA6ZhUTsjUj1mr/4GTa5n9pjk50joA9NkMI9Tu6RaoHzBnUHljJc2cJqvGwIrfYybh0
         3VsL8s+xsirGBUGrbtpuiZAXcDYXe5TkrH/BBgX6m9sSGOwYH7qnCM5gz3Id8mKTmCLk
         c3dUS7t47iJqerlSUfewyHWaIkyBnfRdclaIAw3aZ9S8acWuzCJSdeLlrk67pozL4p6r
         D4BA==
X-Gm-Message-State: AOJu0YzHuXnujxj4oDblJl2TdL1luK2tGHyqb7dSLMSHT21W8uUGVG9C
	tCnJgS2cfSdiTo6bwoJDr/H/AWpz/MkHvxriZxOfEA==
X-Google-Smtp-Source: AGHT+IHch7YUz9AbRflkh8eyE87tR9bbxlt1KhgjFd/Th7L8HVFlQINXZUmMZzuBhflV8YKfOIRD582CZAmHBaA7wGo=
X-Received: by 2002:a17:907:9148:b0:a19:a19b:7890 with SMTP id
 l8-20020a170907914800b00a19a19b7890mr79310ejs.83.1701376348966; Thu, 30 Nov
 2023 12:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <CAK7LNARRYWhFyTXRXPC_z6RL=KUW6pO-Lsz1mgGd1jxPiHxe+w@mail.gmail.com>
In-Reply-To: <CAK7LNARRYWhFyTXRXPC_z6RL=KUW6pO-Lsz1mgGd1jxPiHxe+w@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 30 Nov 2023 13:32:17 -0700
Message-ID: <CAPnjgZ2y=EONroCbCA7AqVaaax1Sdujy1A3NwFugwxiug490tA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	lkml <linux-kernel@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Thu, 30 Nov 2023 at 08:39, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Nov 30, 2023 at 2:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
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
> > This features requires pylibfdt (use 'pip install libfdt'). It also
> > requires compression utilities for the algorithm being used. Supported
> > compression options are the same as the Image.xxx files. For now there
> > is no way to change the compression other than by editing the rule for
> > $(obj)/image.fit
> >
> > While FIT supports a ramdisk / initrd, no attempt is made to support
> > this here, since it must be built separately from the Linux build.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v7:
> > - Add Image as a dependency of image.fit
> > - Drop kbuild tag
> > - Add dependency on dtbs
> > - Drop unnecessary path separator for dtbs
> > - Rebase to -next
> >
> > Changes in v5:
> > - Drop patch previously applied
> > - Correct compression rule which was broken in v4
> >
> > Changes in v4:
> > - Use single quotes for UIMAGE_NAME
> >
> > Changes in v3:
> > - Drop temporary file image.itk
> > - Drop patch 'Use double quotes for image name'
> > - Drop double quotes in use of UIMAGE_NAME
> > - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> > - Avoid hard-coding "arm64" for the DT architecture
> >
> > Changes in v2:
> > - Drop patch previously applied
> > - Add .gitignore file
> > - Move fit rule to Makefile.lib using an intermediate file
> > - Drop dependency on CONFIG_EFI_ZBOOT
> > - Pick up .dtb files separately from the kernel
> > - Correct pylint too-many-args warning for write_kernel()
> > - Include the kernel image in the file count
> > - Add a pointer to the FIT spec and mention of its wide industry usage
> > - Mention the kernel version in the FIT description
> >
> >  MAINTAINERS                |   7 +
> >  arch/arm64/Makefile        |   9 +-
> >  arch/arm64/boot/.gitignore |   1 +
> >  arch/arm64/boot/Makefile   |   6 +-
> >  scripts/Makefile.lib       |  13 ++
> >  scripts/make_fit.py        | 289 +++++++++++++++++++++++++++++++++++++
> >  6 files changed, 322 insertions(+), 3 deletions(-)
> >  create mode 100755 scripts/make_fit.py
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 14587be87a33..d609f0e8deb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1585,6 +1585,13 @@ F:       Documentation/process/maintainer-soc*.r=
st
> >  F:     arch/arm/boot/dts/Makefile
> >  F:     arch/arm64/boot/dts/Makefile
> >
> > +ARM64 FIT SUPPORT
> > +M:     Simon Glass <sjg@chromium.org>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscri=
bers)
> > +S:     Maintained
> > +F:     arch/arm64/boot/Makefile
> > +F:     scripts/make_fit.py
> > +
> >  ARM ARCHITECTED TIMER DRIVER
> >  M:     Mark Rutland <mark.rutland@arm.com>
> >  M:     Marc Zyngier <maz@kernel.org>
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 1bd4fae6e806..18e092de7cdb 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -36,6 +36,8 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
> >  $(warning Detected assembler with broken .inst; disassembly will be un=
reliable)
> >  endif
> >
> > +KBUILD_DTBS      :=3D dtbs
>
>
> Please remove this, and hard-code
>
>  image.fit: dtbs

OK

>
>
>
> >
> >  $(obj)/Image: vmlinux FORCE
> >         $(call if_changed,objcopy)
> > @@ -39,6 +40,9 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
> >  $(obj)/Image.zst: $(obj)/Image FORCE
> >         $(call if_changed,zstd)
> >
> > +$(obj)/image.fit: $(obj)/Image FORCE
> > +       $(call cmd,fit,gzip)
>
>
> The gzip parameter is not used.
> Please do
>
>      $(call cmd,fit)

I do want to be able to control the compression algo. I added a
FIT_COMPRESS for that, so that this arg is used.
>
> In the python script, functions are separated with two blank lines,
> but there is only one blank line between parse_args() and setup_fit().
>
>
> I do not mind either way because it does not contain any class,
> but please keep consistency.

OK

Regards,
Simon

