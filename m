Return-Path: <linux-kbuild+bounces-203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC557FE051
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBFE1C20A1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C4339847;
	Wed, 29 Nov 2023 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YIKd2P8k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E911A8
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:27:52 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so16459566b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701286070; x=1701890870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gR6QlSoTlyq04eRwNKCnLLqDlXv6VkMGmXKmkbAaQ0=;
        b=YIKd2P8k4sSMCmJtAiaRX/RXoHwSEE0jNkpZy69FznQzOS1y8AWKOAlHZEhf90qKqG
         0qIgyp/EHkAVsEi/r4HZl0XbafWUCyhBF3qjyFLNJ3O6qtew+Yvl20lW6nvgB9aiKEUF
         w/pB6sC7iE90vxTNzTCV9hbpW7aBSUCh5roIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701286070; x=1701890870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gR6QlSoTlyq04eRwNKCnLLqDlXv6VkMGmXKmkbAaQ0=;
        b=M3P226yBmPwuZFE7CFsFOn2MfdM8FNyIQuGI7H8K+m1FuwserZQdwiE7iciiAHLZps
         6fHJsTW3tGli8djea4Zb6cjqQwg2cbWxU+YtcfgRvIv3gJ12zA8Kd7F1LZBwfKH2tg1C
         bwP+HIeROxvLPqkXbi5qfo2ALfICxGrJ7qxM2EA8j9CrPM0EFnCuRJGorIOGDwHd7iVm
         6bc82P9xjtNAs6PdHmEf5gHzNcxqI8EUu74ZYkj9LNd4l6DVG0WLIP+pHChCjsDWxYEs
         c6CGAZuvVl6hk5ilmntAhwt0Rr9zlSd1BxAjiLgFxriI1BWn3uHRy05EtemmERyONdnh
         /7ig==
X-Gm-Message-State: AOJu0Yxl0tAllGq42a3pFSGtxmc4wODAs8cs836kyHyVWTTN2cwRIndC
	nmNWEUFlkUwKvhJxN+kpG0AJevdjKb7xo7Rvrm+jDg==
X-Google-Smtp-Source: AGHT+IFHd0lnsDfy+Z0LdFjR7oopIOyEOsVSQwIRDwzAaCAHJiPxmbCa0ilD2wIXfA2WW2IAWhTwgbrifbGP3/TbFI4=
X-Received: by 2002:a17:906:ccc5:b0:a11:d323:c1bc with SMTP id
 ot5-20020a170906ccc500b00a11d323c1bcmr5061259ejb.19.1701286070318; Wed, 29
 Nov 2023 11:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de> <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
 <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de>
In-Reply-To: <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Nov 2023 12:27:38 -0700
Message-ID: <CAPnjgZ0UCkm5QCx+JXe1ggSshozPnOLB6cN=UoJyMn6S4wfFkg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	lkml <linux-kernel@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

On Wed, 29 Nov 2023 at 12:15, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 29.11.23 20:02, Simon Glass wrote:
> > Hi Ahmad,
> >
> > On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>
> >> Hi,
> >>
> >> a few more comments after decompiling the FIT image:
> >>
> >> On 29.11.23 18:21, Simon Glass wrote:
> >>> +    with fsw.add_node('kernel'):
> >>> +        fsw.property_string('description', args.name)
> >>> +        fsw.property_string('type', 'kernel_noload')
> >>
> >> The specification only says no loading done, but doesn't explain what it
> >> means for a bootloader to _not_ load an image. Looking into the U-Boot commit
> >> b9b50e89d317 ("image: Implement IH_TYPE_KERNEL_NOLOAD") that introduces this,
> >> apparently no loading means ignoring load and entry address?
> >>
> >> I presume missing load and entry is something older U-Boot versions
> >> were unhappy about? Please let me know if the semantics are as I understood,
> >> so I can prepare a barebox patch supporting it.
> >
> > Oh, see my previous email.
>
> Thanks.
>
> >
> >>
> >>> +        fsw.property_string('arch', args.arch)
> >>> +        fsw.property_string('os', args.os)
> >>> +        fsw.property_string('compression', args.compress)
> >>> +        fsw.property('data', data)
> >>> +        fsw.property_u32('load', 0)
> >>> +        fsw.property_u32('entry', 0)
> >>> +
> >>> +
> >>> +def finish_fit(fsw, entries):
> >>> +    """Finish the FIT ready for use
> >>> +
> >>> +    Writes the /configurations node and subnodes
> >>> +
> >>> +    Args:
> >>> +        fsw (libfdt.FdtSw): Object to use for writing
> >>> +        entries (list of tuple): List of configurations:
> >>> +            str: Description of model
> >>> +            str: Compatible stringlist
> >>> +    """
> >>> +    fsw.end_node()
> >>> +    seq = 0
> >>> +    with fsw.add_node('configurations'):
> >>> +        for model, compat in entries:
> >>> +            seq += 1
> >>> +            with fsw.add_node(f'conf-{seq}'):
> >>> +                fsw.property('compatible', bytes(compat))
> >>
> >> The specification says that this is the root U-Boot compatible,
> >> which I presume to mean the top-level compatible, which makes sense to me.
> >>
> >> The code here though adds all compatible strings from the device tree though,
> >> is this intended?
> >
> > Yes, since it saves needing to read in each DT just to get the
> > compatible stringlist.
>
> The spec reads as if only one string (root) is supposed to be in the list.
> The script adds all compatibles though. This is not really useful as a bootloader
> that's compatible with e.g. fsl,imx8mm would just take the first device tree
> with that SoC, which is most likely to be wrong. It would be better to just
> specify the top-level compatible, so the bootloader fails instead of taking
> the first DT it finds.

We do need to have a list, since we have to support different board revs, etc.

>
> >>> +        fsw.property_string('description', model)
> >>> +        fsw.property_string('type', 'flat_dt')
> >>> +        fsw.property_string('arch', arch)
> >>> +        fsw.property_string('compression', compress)
> >>> +        fsw.property('compatible', bytes(compat))
> >>
> >> I think I've never seen a compatible for a fdt node before.
> >> What use does this serve?
> >
> > It indicates the machine that the DT is for.
>
> Who makes use of this information?

U-Boot uses it, I believe. There is an optimisation to use this
instead of reading the DT itself.

Regards,
Simon

