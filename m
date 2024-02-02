Return-Path: <linux-kbuild+bounces-809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406E847417
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 17:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D671F22993
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 16:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56013146918;
	Fri,  2 Feb 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kka93wpx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26E1474C1
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Feb 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889648; cv=none; b=LMI8jPSug0vgNeb1z+nEpnF4xDBZ4pFZi3mGsBHSQc/UQDnrHMA69/EvIHLHfhoaTOQ9xkO2OXaZTwdCfLuSigQ+01bO3McvRt7cOeIuj72uItu/pmJkM1KLmmTJRxSwbTxutvGGM8U3bx6eeGtLXZaNn1//3sC7Tj8DtEaLf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889648; c=relaxed/simple;
	bh=oYeNmDReQ0o8Hi7zkitRSLGnxD6rDHMKKGtSDgYubJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CimxEOwNkHVWsem1U85v+gZWZEbCXWzdpH430Rs/y30RLdMg5hxtQ6exqw2LOfUoFzE7MXyejV5vCHoTiifmPODIljfqPHGBpNklCCb4dHD1Ol0/VNI8L4cqMav6K18HBEx10oFsR+F2eIrxiMruNSSkUWvEHm5uPHy5gdG9hZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kka93wpx; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68c4673eff5so12761016d6.1
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Feb 2024 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706889641; x=1707494441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlM2E+vFM6x1gYBWBbQul5h7DAB/tT/7YwYoaV32+5w=;
        b=Kka93wpxBO6WEMH4+4Z7DSdF/Yhgz5ZfctdMl3nHvlWfAZpQsFBLoaGzZa3Fu8X8hN
         H5kG/5LDWB/JTHMbjuLZFpBYMNK/oO78fJzJ8FOatcNmgvQTymIJ/+vFkEZqQ+k8S0rm
         Y3jE7H0VcQ2h4BXaKqGgY8igjeDjjk9X8XEXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706889641; x=1707494441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlM2E+vFM6x1gYBWBbQul5h7DAB/tT/7YwYoaV32+5w=;
        b=h1XwBZu3VkZ1kgKat0NAYoVguF3eOvgNtXUZlSPM2A4ypMMVR6PRJvucwF0g2S7Jcy
         4ioc35V8F2I8QSPRjcDZvEQlT5XQlMiTei90GZRCwRlRNT1/RMfpDJ/GtSOv5dEYLlqi
         SfDyUIdsQ2SvhBGXI1gny/qlpFb/+nQEu3YSsFQvKhloLz+9YfbpeOnIQPf5wQwnGaho
         6bHwSOh7Zbj6RgHacek+/S1Bcu/MpmyOmrKK18ZCnj9Gx9TfoJ9VNlyrWOi/KhOMX6mP
         nDvZVazVOjr94uGW/+N5F4L9lVldLNMPh2c1uDdzrJhCKa2Rtur7m2p4wkhqj0ZW5j6Q
         FgUg==
X-Gm-Message-State: AOJu0YxTMZH3sQVcykFIewDJTx3c8eWA5P1cCl/4QyBMcGhDJmypELq2
	4RBj3A7dcpgzfHNMyAe6UlHyzIRDNZ5FN6h+he+R9YthcVglmRKJbDS6s/bl0OJVq+w2jPfIKD9
	gmUPZ01nT1TWV1ICtHi/v55LeEVE/8s59AxFK
X-Google-Smtp-Source: AGHT+IEAtDv9RdBNZf/6HKAxa4ssPDtLQcYfqwHnhGGOsfCr4UYIG3ngzQ5l/JuijH6CZhTyru45RQNsG1FrZguXocM=
X-Received: by 2002:a05:6214:3384:b0:68c:5e07:63e9 with SMTP id
 mv4-20020a056214338400b0068c5e0763e9mr2651778qvb.24.1706889641399; Fri, 02
 Feb 2024 08:00:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231213121353.GA31326@willie-the-truck> <CAFLszTjfmSx1YMqzb2TsQf7sP4KrcQB=X7DY_HxRQp0J5HAppQ@mail.gmail.com>
 <CAK7LNAQRCDC03e=TVO=k4FuD2a2RdTy7yLr3UptQjVCX7pM1CA@mail.gmail.com>
 <20240109143349.GR1610741@bill-the-cat> <CAFLszTjwhy24UiT6kUJABMC1Xn0h9Q1q9fYpZZJg9DX8Vss9cA@mail.gmail.com>
 <CAFLszTjPAHd6RdO1mvatXC=yRS+h=sgJ_pMdyEnkROTx7yRpog@mail.gmail.com>
 <CAK7LNARsY6-rrx=sNFq6oFqpqf0s5S_=3DrUsCOS7zF0BXcoTg@mail.gmail.com> <CAL_JsqLYB0D5wAfedsb6tQp4EmD1AROgxiCncwO7gvA2p1C6Lg@mail.gmail.com>
In-Reply-To: <CAL_JsqLYB0D5wAfedsb6tQp4EmD1AROgxiCncwO7gvA2p1C6Lg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 2 Feb 2024 09:00:29 -0700
Message-ID: <CAFLszTghBXCuSJTqnaA8vweYu2CKf-4y-X0Pr7Zg9qdyGGCE0Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Rob Herring <robh@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 31 Jan 2024 at 15:03, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 30, 2024 at 3:16=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Fri, Jan 26, 2024 at 1:04=E2=80=AFAM Simon Glass <sjg@chromium.org> =
wrote:
> > >
> > > Hi,
> > >
> > > On Wed, 17 Jan 2024 at 06:14, Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Hi Masahiro, Tom,
> > > >
> > > > On Tue, 9 Jan 2024 at 07:33, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Tue, Jan 09, 2024 at 11:01:42PM +0900, Masahiro Yamada wrote:
> > > > > > Hi Simon,
> > > > > >
> > > > > >
> > > > > > On Wed, Jan 3, 2024 at 8:47=E2=80=AFAM Simon Glass <sjg@chromiu=
m.org> wrote:
> > > > > > >
> > > > > > > Hi Masahiro,
> > > > > > >
> > > > > > > On Wed, Dec 13, 2023 at 5:14=E2=80=AFAM Will Deacon <will@ker=
nel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote=
:
> > > > > > > > > Add a script which produces a Flat Image Tree (FIT), a si=
ngle file
> > > > > > > > > containing the built kernel and associated devicetree fil=
es.
> > > > > > > > > Compression defaults to gzip which gives a good balance o=
f size and
> > > > > > > > > performance.
> > > > > > > > >
> > > > > > > > > The files compress from about 86MB to 24MB using this app=
roach.
> > > > > > > > >
> > > > > > > > > The FIT can be used by bootloaders which support it, such=
 as U-Boot
> > > > > > > > > and Linuxboot. It permits automatic selection of the corr=
ect
> > > > > > > > > devicetree, matching the compatible string of the running=
 board with
> > > > > > > > > the closest compatible string in the FIT. There is no nee=
d for
> > > > > > > > > filenames or other workarounds.
> > > > > > > > >
> > > > > > > > > Add a 'make image.fit' build target for arm64, as well. U=
se
> > > > > > > > > FIT_COMPRESSION to select a different algorithm.
> > > > > > > > >
> > > > > > > > > The FIT can be examined using 'dumpimage -l'.
> > > > > > > > >
> > > > > > > > > This features requires pylibfdt (use 'pip install libfdt'=
). It also
> > > > > > > > > requires compression utilities for the algorithm being us=
ed. Supported
> > > > > > > > > compression options are the same as the Image.xxx files. =
For now there
> > > > > > > > > is no way to change the compression other than by editing=
 the rule for
> > > > > > > > > $(obj)/image.fit
> > > > > > > > >
> > > > > > > > > While FIT supports a ramdisk / initrd, no attempt is made=
 to support
> > > > > > > > > this here, since it must be built separately from the Lin=
ux build.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Changes in v9:
> > > > > > > > > - Move the compression control into Makefile.lib
> > > > > > > > >
> > > > > > > > > Changes in v8:
> > > > > > > > > - Drop compatible string in FDT node
> > > > > > > > > - Correct sorting of MAINTAINERS to before ARM64 PORT
> > > > > > > > > - Turn compress part of the make_fit.py comment in to a s=
entence
> > > > > > > > > - Add two blank lines before parse_args() and setup_fit()
> > > > > > > > > - Use 'image.fit: dtbs' instead of BUILD_DTBS var
> > > > > > > > > - Use '$(<D)/dts' instead of '$(dir $<)dts'
> > > > > > > > > - Add 'mkimage' details Documentation/process/changes.rst
> > > > > > > > > - Allow changing the compression used
> > > > > > > > > - Tweak cover letter since there is only one clean-up pat=
ch
> > > > > > > > >
> > > > > > > > > Changes in v7:
> > > > > > > > > - Add Image as a dependency of image.fit
> > > > > > > > > - Drop kbuild tag
> > > > > > > > > - Add dependency on dtbs
> > > > > > > > > - Drop unnecessary path separator for dtbs
> > > > > > > > > - Rebase to -next
> > > > > > > > >
> > > > > > > > > Changes in v5:
> > > > > > > > > - Drop patch previously applied
> > > > > > > > > - Correct compression rule which was broken in v4
> > > > > > > > >
> > > > > > > > > Changes in v4:
> > > > > > > > > - Use single quotes for UIMAGE_NAME
> > > > > > > > >
> > > > > > > > > Changes in v3:
> > > > > > > > > - Drop temporary file image.itk
> > > > > > > > > - Drop patch 'Use double quotes for image name'
> > > > > > > > > - Drop double quotes in use of UIMAGE_NAME
> > > > > > > > > - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> > > > > > > > > - Avoid hard-coding "arm64" for the DT architecture
> > > > > > > > >
> > > > > > > > > Changes in v2:
> > > > > > > > > - Drop patch previously applied
> > > > > > > > > - Add .gitignore file
> > > > > > > > > - Move fit rule to Makefile.lib using an intermediate fil=
e
> > > > > > > > > - Drop dependency on CONFIG_EFI_ZBOOT
> > > > > > > > > - Pick up .dtb files separately from the kernel
> > > > > > > > > - Correct pylint too-many-args warning for write_kernel()
> > > > > > > > > - Include the kernel image in the file count
> > > > > > > > > - Add a pointer to the FIT spec and mention of its wide i=
ndustry usage
> > > > > > > > > - Mention the kernel version in the FIT description
> > > > > > > > >
> > > > > > > > >  Documentation/process/changes.rst |   9 +
> > > > > > > > >  MAINTAINERS                       |   7 +
> > > > > > > > >  arch/arm64/Makefile               |   7 +-
> > > > > > > > >  arch/arm64/boot/.gitignore        |   1 +
> > > > > > > > >  arch/arm64/boot/Makefile          |   6 +-
> > > > > > > > >  scripts/Makefile.lib              |  16 ++
> > > > > > > > >  scripts/make_fit.py               | 291 ++++++++++++++++=
++++++++++++++
> > > > > > > > >  7 files changed, 334 insertions(+), 3 deletions(-)
> > > > > > > > >  create mode 100755 scripts/make_fit.py
> > > > > > > >
> > > > > > > > I'll need Masahiro's Ack on the scripts/ changes before I c=
an take this
> > > > > > > > one.
> > > > > > >
> > > > > > > Any thoughts on this request, please?
> > > > > > >
> > > > > > > Regards,
> > > > > > > Simon
> > > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > As I mentioned before, I am concerned with having
> > > > > > the same "compatible" entries, with different contents,
> > > > > > as you use the "compatible" string as an ID to selecting
> > > > > > the target config node, right?
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > $ fdtdump  arch/arm64/boot/image.fit
> > > > > >
> > > > > >         ...
> > > > > >
> > > > > >         conf-10 {
> > > > > >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > > > > > "tq,am642-tqma6442l", "ti,am642";
> > > > > >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4x=
xL carrier board";
> > > > > >             fdt =3D "fdt-10";
> > > > > >             kernel =3D "kernel";
> > > > > >         };
> > > > > >
> > > > > >         ...
> > > > > >
> > > > > >         conf-25 {
> > > > > >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > > > > > "tq,am642-tqma6442l", "ti,am642";
> > > > > >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4x=
xL carrier board";
> > > > > >             fdt =3D "fdt-25";
> > > > > >             kernel =3D "kernel";
> > > > > >         };
> > > > >
> > > > > I had asked Rob a while ago about if having the same compatible f=
or two
> > > > > functionally different machines is a feature, or a bug, and I don=
't
> > > > > think either of us fully agreed either way. I'd be leaning toward=
s
> > > > > saying the above example is a bug in the dts files, it's just not=
 been a
> > > > > bug people have worried about before due to (sadly) how little th=
e
> > > > > top-level compatible has been used.
>
> I much prefer being able to use compatibles over filenames.

So do I.

There is no check that each dts has a unique compatible string (e.g.
in the first position). Perhaps we should add that and have vendors
fix up their strings?

[..]

>
> Rob

Regards,
Simon

