Return-Path: <linux-kbuild+bounces-284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB408092C7
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 21:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E501F210CD
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 20:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0307096E;
	Thu,  7 Dec 2023 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c8B/JvlL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098AE1713
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Dec 2023 12:53:14 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54cd8f5bb5cso1866425a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Dec 2023 12:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701982392; x=1702587192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oWIflf5hcpue6wGtlwNE/HkT4tbMsQSgIfDnrjtjjfg=;
        b=c8B/JvlL241AVApFlMOMEU71qJxiM19TKArDurZrBANlu7YBhDBXwSgkbfua/d8XtZ
         WfB9iTKD4UeUFE/1G8xm+4RNZWPdz87iSzi6rbarvzt1/pdZX4+ZJvEF8One39Dx8RGH
         iiFln6d4IqKX/xXVK6Rwv2ppGNiVpwEFRMGos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982392; x=1702587192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWIflf5hcpue6wGtlwNE/HkT4tbMsQSgIfDnrjtjjfg=;
        b=pLvkJBFrkGdNe0RN7lSf/wG3xmZdvajg/yelZpB7wQF9TxUIfJN3GrUD3kWlELhz8V
         58RJpRkrQrzFT/KBhmc89Xuwdv+PNXttoxhMKwzxQuixLSKzPTiaqDO+j4I/dxOiNGn9
         9GELzHnzxFpqEvya2co2i9dL5YVtpWIyBkO7E0z/HZO4WbriCrv/05C3EYow18O61ODH
         TZDa688oQcwkch3o/3FLeyQLtcypYEgucl9+yoR8VruZCx+P1vgbeHLFZphyCv719pef
         h3a/VDn2MpY09c6ZGopYeJfoJfOXq+x7b3omyIOh/IlIOsFeNTP5W/IVvS/Kjz6IMW8Y
         Qsug==
X-Gm-Message-State: AOJu0YwdnRlZwf0kERRNaUOxn8kuBZZrCeVbfrU5InVEI2NtYy2XAoDL
	d0ungICCnwpuwjBAKifZ8TEg8BpgQS/LWREVORKHfw==
X-Google-Smtp-Source: AGHT+IGlqecBeKpKJsPolkl+LHqMluq7H92QsuDLPCGLyyt/tYoOLIFC7+pQZSilRLUlakLEfiXMyZjPKdw0aG6O2m4=
X-Received: by 2002:a17:907:2948:b0:a19:a19a:eac0 with SMTP id
 et8-20020a170907294800b00a19a19aeac0mr1471204ejc.121.1701982392232; Thu, 07
 Dec 2023 12:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231203153401.GV8402@pendragon.ideasonboard.com> <20231207142723.GA3187877@google.com>
 <20231207143814.GD15521@pendragon.ideasonboard.com>
In-Reply-To: <20231207143814.GD15521@pendragon.ideasonboard.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 7 Dec 2023 13:52:53 -0700
Message-ID: <CAPnjgZ1q3yBeyYfjLumJ03HR7JM1xwN7sMbNJqfUWpsVxFTs4Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 7 Dec 2023 at 07:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Dec 07, 2023 at 10:27:23PM +0800, Chen-Yu Tsai wrote:
> > On Sun, Dec 03, 2023 at 05:34:01PM +0200, Laurent Pinchart wrote:
> > > Hi Simon,
> > >
> > > Thank you for the patch.
> > >
> > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote:
> > > > Add a script which produces a Flat Image Tree (FIT), a single file
> > > > containing the built kernel and associated devicetree files.
> > > > Compression defaults to gzip which gives a good balance of size and
> > > > performance.
> > > >
> > > > The files compress from about 86MB to 24MB using this approach.
> > > >
> > > > The FIT can be used by bootloaders which support it, such as U-Boot
> > > > and Linuxboot. It permits automatic selection of the correct
> > > > devicetree, matching the compatible string of the running board with
> > > > the closest compatible string in the FIT. There is no need for
> > > > filenames or other workarounds.
> > > >
> > > > Add a 'make image.fit' build target for arm64, as well. Use
> > > > FIT_COMPRESSION to select a different algorithm.
> > > >
> > > > The FIT can be examined using 'dumpimage -l'.
> > > >
> > > > This features requires pylibfdt (use 'pip install libfdt'). It also
> > > > requires compression utilities for the algorithm being used. Supported
> > > > compression options are the same as the Image.xxx files. For now there
> > > > is no way to change the compression other than by editing the rule for
> > > > $(obj)/image.fit
> > > >
> > > > While FIT supports a ramdisk / initrd, no attempt is made to support
> > > > this here, since it must be built separately from the Linux build.
> > >
> > > FIT images are very useful, so I think this is a very welcome addition
> > > to the kernel build system. It can get tricky though: given the
> > > versatile nature of FIT images, there can't be any
> > > one-size-fits-them-all solution to build them, and striking the right
> > > balance between what makes sense for the kernel and the features that
> > > users may request will probably lead to bikeshedding. As we all love
> > > bikeshedding, I thought I would start selfishly, with a personal use
> > > case :-) This isn't a yak-shaving request though, I don't see any reason
> > > to delay merging this series.
> > >
> > > Have you envisioned building FIT images with a subset of DTBs, or adding
> > > DTBOs ? Both would be fairly trivial extensions to this script by
> > > extending the supported command line arguments. It would perhaps be more
> > > difficult to integrate in the kernel build system though. This leads me
> > > to a second question: would you consider merging extensions to this
> > > script if they are not used by the kernel build system, but meant for
> > > users who manually invoke the script ? More generally, is the script
> >
> > We'd also be interested in some customization, though in a different way.
> > We imagine having a rule file that says X compatible string should map
> > to A base DTB, plus B and C DTBO for the configuration section. The base
> > DTB would carry all common elements of some device, while the DTBOs
> > carry all the possible second source components, like different display
> > panels or MIPI cameras for instance. This could drastically reduce the
> > size of FIT images in ChromeOS by deduplicating all the common stuff.
>
> Do you envision the "mapping" compatible string mapping to a config
> section in the FIT image, that would bundle the base DTB and the DTBOs ?
>
> > > meant to be used stand-alone as well, in which case its command line
> > > arguments need to remain backward-compatible, or do you see it as being
> > > internal to the kernel ?

It is great to see all this discussion! I did send a proposal to the
U-Boot ML about extensions but it was mixed up with other things, so
I'll start a new thread.

For now, I am really just waiting for this to be applied, before
talking too much about future possibilities.

Regards,
SImon

