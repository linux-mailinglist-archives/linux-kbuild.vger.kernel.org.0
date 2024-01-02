Return-Path: <linux-kbuild+bounces-457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EF8225A7
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jan 2024 00:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD0128491E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jan 2024 23:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F64317752;
	Tue,  2 Jan 2024 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iwsov2jl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739317987
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jan 2024 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78102c516a7so954506185a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jan 2024 15:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704239218; x=1704844018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcnI3bjOE/JR4QqtkUBLMh58U0r2t5wK4lAWbaHcRMU=;
        b=Iwsov2jlHyi/b1Y2+3XLvr4rpFe9FCiBcOlXCybwQPcoigv3odwRKmk5KXGJRk8yhl
         9YETAq3DJWwuIBktD6ZwqjIHWRAfUYr+94j+eNYTFsG2POWrcLpvUVbFM2JtaiKjhTc4
         2007jM8wBDBX+Yd/RH1Rrs7vcEyv8bNHpl6V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704239218; x=1704844018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcnI3bjOE/JR4QqtkUBLMh58U0r2t5wK4lAWbaHcRMU=;
        b=Mq0AOUdFO5cyCRNYXqvrBSLfXYCCNWCkkBQxOErl3Df4q2lg7uSKz8q9Oz7gQGazmJ
         kamPATCvicAx/onu4N74jeE0O2W/me+ROZnrf2r2QshhoyUQb10NqeFXOMVlswSzrQaa
         DpQCMc7NYRdArgwB2xdubIc3ghalyxkfSXmgYYilsQ1SupwUXprUjps9QvaVQtg6cFM2
         MLSdQFtDiPSkg2iY5oMM+gR7vpdRv8FiFyN7HhHOPYYCAi17fdUxPUxXaYC13Ti7c9JC
         6NXJqYOLxoO/opTa5vVXrf4Cku3zYocLdvQCuvA/Er/RyFn9bJ4EFHRR9KhIIpdfHi1Z
         HkiQ==
X-Gm-Message-State: AOJu0YzQMEBw/FcxWnN+5qLPwpXKsGzBKjfWz8JJu8XOAgBSEWGHcM7/
	IS3xHJ6hMbxPVV6sJhLZWdDTctnP6ISTS+nqGc9M+UHfGzLN
X-Google-Smtp-Source: AGHT+IH0M0pBrGr+Sx5B7gKAHkWbx7yYmjWLkviFsxrNY5/tFuUA7GBmbX67T4+ylA4I/2XnnEJd068mD1x3ToVE8wM=
X-Received: by 2002:a05:6214:e8f:b0:67f:6348:ef8e with SMTP id
 hf15-20020a0562140e8f00b0067f6348ef8emr30015254qvb.17.1704239218454; Tue, 02
 Jan 2024 15:46:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231213121353.GA31326@willie-the-truck>
In-Reply-To: <20231213121353.GA31326@willie-the-truck>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Jan 2024 16:46:47 -0700
Message-ID: <CAFLszTjfmSx1YMqzb2TsQf7sP4KrcQB=X7DY_HxRQp0J5HAppQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, Dec 13, 2023 at 5:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote:
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
> > Add a 'make image.fit' build target for arm64, as well. Use
> > FIT_COMPRESSION to select a different algorithm.
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
> > Changes in v9:
> > - Move the compression control into Makefile.lib
> >
> > Changes in v8:
> > - Drop compatible string in FDT node
> > - Correct sorting of MAINTAINERS to before ARM64 PORT
> > - Turn compress part of the make_fit.py comment in to a sentence
> > - Add two blank lines before parse_args() and setup_fit()
> > - Use 'image.fit: dtbs' instead of BUILD_DTBS var
> > - Use '$(<D)/dts' instead of '$(dir $<)dts'
> > - Add 'mkimage' details Documentation/process/changes.rst
> > - Allow changing the compression used
> > - Tweak cover letter since there is only one clean-up patch
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
> >  Documentation/process/changes.rst |   9 +
> >  MAINTAINERS                       |   7 +
> >  arch/arm64/Makefile               |   7 +-
> >  arch/arm64/boot/.gitignore        |   1 +
> >  arch/arm64/boot/Makefile          |   6 +-
> >  scripts/Makefile.lib              |  16 ++
> >  scripts/make_fit.py               | 291 ++++++++++++++++++++++++++++++
> >  7 files changed, 334 insertions(+), 3 deletions(-)
> >  create mode 100755 scripts/make_fit.py
>
> I'll need Masahiro's Ack on the scripts/ changes before I can take this
> one.

Any thoughts on this request, please?

Regards,
Simon

