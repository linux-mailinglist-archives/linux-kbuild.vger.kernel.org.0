Return-Path: <linux-kbuild+bounces-200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D87FE00F
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7230F282DD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89C374C8;
	Wed, 29 Nov 2023 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OLxi/U9X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB7D170E
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:03:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5098e423ba2so207351e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701284589; x=1701889389; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eqFuufKBS903oC+09D1OgJlE8YGZvK320Etdppu6ukQ=;
        b=OLxi/U9XBNwHTtVxzR3ob93N6V3VET6+XiUhjek4TZASdl1k+KBqk/qk7IoenpU/Uy
         IkzvqGyyteioAAIRemANxOQeJIHV7jmoJJp4ib71axLBQ2obiivVZHZ/DNZ+htpfSZ3o
         Ej78sGPZ++yXwnsDSwE7tGXpBEBCAUZFDPLDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284589; x=1701889389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqFuufKBS903oC+09D1OgJlE8YGZvK320Etdppu6ukQ=;
        b=KOd36ntjH7+qMooKTC71fYKJOLLMUug0aV/6IEBVmHBK0QBYqPBQbB7CnBmpfVLTa1
         pq/jeqRN60cbuj56bOTiNacBgktNfib7LJJy90iGbZ8cHSqXS8CBp88kqGgpx2sH6ww+
         LqyAo+bD7nQFlPyWzsKMXLfYQSHObJqXwErhePCkb1CPJ0CtXLtCrQRKcnTYceGQjCZ6
         HbNiuj72Jr8ucimgjvkoRTt/HSqZjw2m6TqVvA9wk/yYTo6V16ocB3r0wXk1F8ykmTgK
         gPzNNaqXWhMRoWW3nwEv6b+O2/aoCKxJHz9nExr0gAuI8P6SOSWgtReHww3umV+/kzpa
         xDUw==
X-Gm-Message-State: AOJu0YzZW0QhvybU6PLrUGjlcNZe0Y3B9ALaLuPG30/O8zX/Qna2ghQX
	6q9BK2XoRtKpbHvrPOTYafUb5HlXy203pV1vSHEtYg==
X-Google-Smtp-Source: AGHT+IFVXUrZjpsbk8/VnzdMqcgpeht/p4RMDUy/Er0zzFvjxFoqfqyI6+x7cYid7etTRdTN+BrdV820tcBQ82gj6bM=
X-Received: by 2002:a05:6512:2343:b0:509:455c:9e3d with SMTP id
 p3-20020a056512234300b00509455c9e3dmr12103134lfu.18.1701284588464; Wed, 29
 Nov 2023 11:03:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de>
In-Reply-To: <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Nov 2023 12:02:57 -0700
Message-ID: <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
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

On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hi,
>
> a few more comments after decompiling the FIT image:
>
> On 29.11.23 18:21, Simon Glass wrote:
> > +    with fsw.add_node('kernel'):
> > +        fsw.property_string('description', args.name)
> > +        fsw.property_string('type', 'kernel_noload')
>
> The specification only says no loading done, but doesn't explain what it
> means for a bootloader to _not_ load an image. Looking into the U-Boot commit
> b9b50e89d317 ("image: Implement IH_TYPE_KERNEL_NOLOAD") that introduces this,
> apparently no loading means ignoring load and entry address?
>
> I presume missing load and entry is something older U-Boot versions
> were unhappy about? Please let me know if the semantics are as I understood,
> so I can prepare a barebox patch supporting it.

Oh, see my previous email.

>
> > +        fsw.property_string('arch', args.arch)
> > +        fsw.property_string('os', args.os)
> > +        fsw.property_string('compression', args.compress)
> > +        fsw.property('data', data)
> > +        fsw.property_u32('load', 0)
> > +        fsw.property_u32('entry', 0)
> > +
> > +
> > +def finish_fit(fsw, entries):
> > +    """Finish the FIT ready for use
> > +
> > +    Writes the /configurations node and subnodes
> > +
> > +    Args:
> > +        fsw (libfdt.FdtSw): Object to use for writing
> > +        entries (list of tuple): List of configurations:
> > +            str: Description of model
> > +            str: Compatible stringlist
> > +    """
> > +    fsw.end_node()
> > +    seq = 0
> > +    with fsw.add_node('configurations'):
> > +        for model, compat in entries:
> > +            seq += 1
> > +            with fsw.add_node(f'conf-{seq}'):
> > +                fsw.property('compatible', bytes(compat))
>
> The specification says that this is the root U-Boot compatible,
> which I presume to mean the top-level compatible, which makes sense to me.
>
> The code here though adds all compatible strings from the device tree though,
> is this intended?

Yes, since it saves needing to read in each DT just to get the
compatible stringlist.

>
> > +        fsw.property_string('description', model)
> > +        fsw.property_string('type', 'flat_dt')
> > +        fsw.property_string('arch', arch)
> > +        fsw.property_string('compression', compress)
> > +        fsw.property('compatible', bytes(compat))
>
> I think I've never seen a compatible for a fdt node before.
> What use does this serve?

It indicates the machine that the DT is for.

Regards,
Simon

