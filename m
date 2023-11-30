Return-Path: <linux-kbuild+bounces-220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8367FFC7F
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0A7281ABA
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06D59174;
	Thu, 30 Nov 2023 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CpFPyt1F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19F0170F
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:30:40 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a02ba1f500fso203356966b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701376239; x=1701981039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j1kEoDVz8FmA118BIct7BasaUqEKiq39maAWu6XgfrY=;
        b=CpFPyt1F1w6ken91peQku/clTFntwKIYj+QVeApvEoQ6+tEb3EDrUekIXWkRCkI1oi
         MKNUdA1sQxc6q1SFJ8KSbi+K6g0GM3oh60Iy+N25It8Z+Hw4mrxPmH/b91sWXW3jTwGq
         yOmC3ROPLfQWGMOPU7z9FGDzZ9Gb4qotV3fXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701376239; x=1701981039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1kEoDVz8FmA118BIct7BasaUqEKiq39maAWu6XgfrY=;
        b=LsI8vlLdOo9sL6kOWw9sTGOKjJ5UFJ49pZA4rBIrnXnGPSKMq4pUSEAKK7PYrOm6Rh
         o1fR87RSLzVMZMT9ZENmZFsOYIiAospItZ9V9SvL3nD0O8ThALO5FPW0icm4Coe39F+m
         I1QSoXnWRMMzoZPes7YhMXs6+RVrJnq107DTGcg2cGsAuV67KQ5mpvKV8tXrlbIiICI+
         zx5bf1kapos155+Tn3HlhBNLxvWGPtbLJCS2edk5tFmopKi+2Fgkn9s3KbsX4h4shhK2
         K0XF0aTRxab9a+xc3FHuahdig9aHmr5qd7+RN8XhXg/N5Wee6VyyBMdhEFbaWGFY6AIJ
         Ay/w==
X-Gm-Message-State: AOJu0YwNrtn15jjH/fJNR70wNsbfQNvExbODVrz1s+GoOsNT7eAm+lTU
	KrdiLK5ETjYQ33VpGvek+111V6JscjW84/QNmEYzJA==
X-Google-Smtp-Source: AGHT+IFIp7jl3Xe9SuGYh3OvQzZO3AxM5rdMcalwjeJ+luXeVJXVWymrXe3jpNkDnguFqELGcbxrl9p2GVcMiT0/cuQ=
X-Received: by 2002:a17:907:509d:b0:a0d:31:b455 with SMTP id
 fv29-20020a170907509d00b00a0d0031b455mr69707ejc.20.1701376238985; Thu, 30 Nov
 2023 12:30:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129172200.430674-1-sjg@chromium.org> <20231129172200.430674-3-sjg@chromium.org>
 <03595817-4698-46d3-b2d8-3bc40c7e723e@pengutronix.de>
In-Reply-To: <03595817-4698-46d3-b2d8-3bc40c7e723e@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 30 Nov 2023 13:30:25 -0700
Message-ID: <CAPnjgZ0G5DAFZj+nxVxMvNOg_wQKxwu06NAarUdVjurPYZ+tcw@mail.gmail.com>
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

On Wed, 29 Nov 2023 at 11:35, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 29.11.23 18:21, Simon Glass wrote:
> > Add a script which produces a Flat Image Tree (FIT), a single file
> > containing the built kernel and associated devicetree files.
> > Compression defaults to gzip which gives a good balance of size and
> > performance.
>
> Thanks for working on this. I think it's useful to have the kernel
> generate a FIT image out of the box. More complex use cases are always
> free to call mkimage with a custom ITS.
>
>
> > The files compress from about 86MB to 24MB using this approach.
> >
> > The FIT can be used by bootloaders which support it, such as U-Boot
> > and Linuxboot. It permits automatic selection of the correct
> > devicetree, matching the compatible string of the running board with
> > the closest compatible string in the FIT. There is no need for
> > filenames or other workarounds.
> >
> > Add a 'make image.fit' build target for arm64, as well.
>
> not that it matters much, but should this maybe called Image.fit
> as the other Image types are capitalized too?

I missed this comment earlier. I believe Image is intended to refer to
a raw image, with the other extensions being compressed versions of
these. So I believe it would be confusing for the FIT version to have
a capital I.

>
> >  EFI_ZBOOT_PAYLOAD    := Image
> >  EFI_ZBOOT_BFD_TARGET := elf64-littleaarch64
> >  EFI_ZBOOT_MACH_TYPE  := ARM64
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1a965fe68e01..e1c06ca3c847 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -496,6 +496,19 @@ quiet_cmd_uimage = UIMAGE  $@
> >                       -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
> >                       -n '$(UIMAGE_NAME)' -d $< $@
>
> Doesn't hardcoding a load address and entry address here defeat the point
> of having FIT as generic portable image format?
>
> At least barebox will try to place the kernel image at physical address 0 and
> will exit with an error message if no SDRAM is located at that address.
> The recommendation in that case is to omit load and entry address altogether
> to have barebox find a suitable location, but I see now that the FIT specification
> requires a load and entry address. What would happen if U-Boot tries to load this
> FIT image on a board that has no DRAM at address 0?
>
> Please Cc me on subsequent revisions. I am interested in testing that this works for barebox
> too.

I have added you.

Regards,
Simon

