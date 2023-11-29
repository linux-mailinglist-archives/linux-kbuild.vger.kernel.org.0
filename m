Return-Path: <linux-kbuild+bounces-198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A17FE009
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E7A1C20821
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C68F5DF08;
	Wed, 29 Nov 2023 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OD3XxVK3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9506211B
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:01:20 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a0f49b31868so12691066b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701284479; x=1701889279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zeJS0+YXgcV8K2msfYPrZc7s+u+FFHEg7gVWXomud/s=;
        b=OD3XxVK33Jk4FAMbrbrcD5SIos1Wq3jYnO+UrQYXjUGimH9LEBs0EmZo8HKwDvjkWo
         7xMY5cvOo9ObxvdZ0WHJoqylxbhCzfXz4fqpD5Rd+6Ha0G0fd2fzCAY4+ycoJT4YsNFn
         f7x8+YUyDOyWcL9cT0vhxsElQge7hR3RhX99E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284479; x=1701889279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeJS0+YXgcV8K2msfYPrZc7s+u+FFHEg7gVWXomud/s=;
        b=jMmkjcGQXINsTFI7WUYpMjZyX1mhKcPhm5Kr+r7OhsvC+BKFN8BNlyru3g5NsbMBMd
         6PSdpBpO7AA0HakJBz5JO6lnbDxxWCIEjfTLuBBZkl94VtHUeJXLyQ0LrjjlUoFY3zBX
         rjXYD+N1rd3/5moHBbWk+3XUH5NewI+1REimw66V5w728yT3BJYEjzbt5TTNkhVuDBgR
         8XX6TmZehbd4Y6/h7Y22bCqkXvOMoHOFtfzC8VJ0kvoBm79iDfXRB0YdrLKZTYXr9v5i
         oNBpUo+t+02R51rtKPxprTOIRUTAkD/iGTNns/WbiH3IOJXFe+2MiYAWZU2ZCJz4tshC
         /VKg==
X-Gm-Message-State: AOJu0Yz7ODdinTdu11kYoKGlwubn6WP5s6DlDFJnMS6epjCm7Ojo3uQC
	TXeqp/Qiq5hMgEc6i/O5JUn+xQikwWnLZp7kviQ50A==
X-Google-Smtp-Source: AGHT+IFzwRelFfkIF8gvXqwP74fx2aLRF2MAfYe7wE5lNvZPbUHxwREC9GHnF7sxAQdl2nWuYhXn0vint48cvgP9igs=
X-Received: by 2002:a17:906:7245:b0:a01:e916:3584 with SMTP id
 n5-20020a170906724500b00a01e9163584mr12542566ejk.54.1701284479022; Wed, 29
 Nov 2023 11:01:19 -0800 (PST)
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
Date: Wed, 29 Nov 2023 12:00:59 -0700
Message-ID: <CAPnjgZ1e4cryN=Q8XufrdEcJoHfW5n-aN-F3pr2mTWA_0c5-Gg@mail.gmail.com>
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

The 'kernel_noload' type indicates that the load/exec address are ignored.

>
> Please Cc me on subsequent revisions. I am interested in testing that this works for barebox
> too.

There has been some discussion about this recently in U-Boot too,
along with a series [1] which you could try if you like.

The FIT spec[2] does not provide enough detail on exactly what
kernel_noload means and we should improve this at some point.

Regards,
Simon

[1] https://patchwork.ozlabs.org/project/uboot/list/?series=382849
[2] https://github.com/open-source-firmware/flat-image-tree



>
> Thanks,
> Ahmad
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>

