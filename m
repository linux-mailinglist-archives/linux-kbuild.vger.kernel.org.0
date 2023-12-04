Return-Path: <linux-kbuild+bounces-256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79A803C2A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 19:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2DA1F211A2
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Dec 2023 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B02228694;
	Mon,  4 Dec 2023 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSgdC2ML"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE24134
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Dec 2023 09:59:57 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso43033005e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2023 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701712796; x=1702317596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8KOWg0c793AA36Q8QFZqHeT1AW9T8lmslgvjW44SEH4=;
        b=CSgdC2MLzKvq4gTj6SA7h7FTU5RYjRJ7TXb7gnlJd1xhBzShlycc5RncBv6dJis3Kr
         j5jZ1ZmyiEIFw3eLPl9zYW+PFVal6ClXEdM50Ipv8Lf9UEhX+KF9PvPdBeRToGEQYRD0
         97LRIbM6X8zx2kf1U9V/HdRjOpT24XiOwvweA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712796; x=1702317596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KOWg0c793AA36Q8QFZqHeT1AW9T8lmslgvjW44SEH4=;
        b=bZ/Z7OHtOgFCWMRh3ss9Qd0xcKGM0pYljLk6u12RUAj8PWDGdGNLJ8Go5Ua09a4sm5
         Ef+ASY6NJnjMJRCjXjKXzE04XICVyk0zU1XB4zpK5PSHTrrNLFb1E+Npw7MnxtONOk7q
         nuOsq0BLpnBHQjo6XovGdkmWkl+wk/Oqpd4LYfVz6ikFOilk+/B8SpYsRNEUad+ztp+3
         lKMzxGDptmpi3bJ5/X2NEt+2dfy1YChMMpyi9kJMqSV0/r2G5fJLaXRYnqgoYRy7YPkJ
         /ticX9Mrf3mbVjGjUfOXVXVTZ1teqD+c6AbeS2k0F4T1us71WjFQO+eCbylr525x7rN/
         ULbQ==
X-Gm-Message-State: AOJu0Ywp4mtY72mxZsdO3Oyno0LEASlR3VbMn0h3aA3I0Ty6uR3EAYRz
	GIQjDbsIOjBGjr4hDKMXuh0lbM8mWuNu1PbMnIPMyQ==
X-Google-Smtp-Source: AGHT+IG9y2b3x3EFIttbTqFTC6lUNsW8T3erQgdzs+sKqO3l/YGV3YoWT8m4QD4w16gCT+utJ7qEYnOT1+OHrjImBF4=
X-Received: by 2002:a7b:ce0f:0:b0:40c:8ad:1ae5 with SMTP id
 m15-20020a7bce0f000000b0040c08ad1ae5mr1453493wmc.106.1701712796064; Mon, 04
 Dec 2023 09:59:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231203153401.GV8402@pendragon.ideasonboard.com>
In-Reply-To: <20231203153401.GV8402@pendragon.ideasonboard.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 4 Dec 2023 10:59:44 -0700
Message-ID: <CAPnjgZ0XWDO90cq_h6V_EoOX+kmGLBRZwgT5RURCwQBQFONDYg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Sun, 3 Dec 2023 at 08:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Simon,
>
> Thank you for the patch.
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
>
> FIT images are very useful, so I think this is a very welcome addition
> to the kernel build system. It can get tricky though: given the
> versatile nature of FIT images, there can't be any
> one-size-fits-them-all solution to build them, and striking the right
> balance between what makes sense for the kernel and the features that
> users may request will probably lead to bikeshedding. As we all love
> bikeshedding, I thought I would start selfishly, with a personal use
> case :-) This isn't a yak-shaving request though, I don't see any reason
> to delay merging this series.

OK, sounds good!

>
> Have you envisioned building FIT images with a subset of DTBs, or adding
> DTBOs ? Both would be fairly trivial extensions to this script by
> extending the supported command line arguments. It would perhaps be more
> difficult to integrate in the kernel build system though. This leads me
> to a second question: would you consider merging extensions to this
> script if they are not used by the kernel build system, but meant for
> users who manually invoke the script ? More generally, is the script
> meant to be used stand-alone as well, in which case its command line
> arguments need to remain backward-compatible, or do you see it as being
> internal to the kernel ?

The script as written is internal to the kernel, but I am sure it
could be expanded in some ways. I am waiting to see it merged before
worrying too much about what might happen in the future!

[..]

Regards,
Simon

