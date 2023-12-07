Return-Path: <linux-kbuild+bounces-283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217A808ACA
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 15:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4E11F2142B
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541251D697;
	Thu,  7 Dec 2023 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hFvfub1k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73227B9;
	Thu,  7 Dec 2023 06:38:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CA62669;
	Thu,  7 Dec 2023 15:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701959847;
	bh=zXe+jRGFsIALQDiNPjUbby+TY+TBluHe2uMVYoZajGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFvfub1kMNWT+sajOcN5s7Ix3DNF2A6Pkg5dQ9Y7g9Coz6OmKJnCPKj2yL9gUCwUK
	 8mnLCDDOxUytTLxkyTZeJGqrH5UF7H7W1qtp4hNUzgp15DJZLkbLfPcGsN6exWkTrZ
	 O1MzrHNjifnFuxyRI9lkqoozUdRpBmc8Z61b/zJ0=
Date: Thu, 7 Dec 2023 16:38:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
Message-ID: <20231207143814.GD15521@pendragon.ideasonboard.com>
References: <20231202035511.487946-1-sjg@chromium.org>
 <20231202035511.487946-3-sjg@chromium.org>
 <20231203153401.GV8402@pendragon.ideasonboard.com>
 <20231207142723.GA3187877@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207142723.GA3187877@google.com>

On Thu, Dec 07, 2023 at 10:27:23PM +0800, Chen-Yu Tsai wrote:
> On Sun, Dec 03, 2023 at 05:34:01PM +0200, Laurent Pinchart wrote:
> > Hi Simon,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote:
> > > Add a script which produces a Flat Image Tree (FIT), a single file
> > > containing the built kernel and associated devicetree files.
> > > Compression defaults to gzip which gives a good balance of size and
> > > performance.
> > > 
> > > The files compress from about 86MB to 24MB using this approach.
> > > 
> > > The FIT can be used by bootloaders which support it, such as U-Boot
> > > and Linuxboot. It permits automatic selection of the correct
> > > devicetree, matching the compatible string of the running board with
> > > the closest compatible string in the FIT. There is no need for
> > > filenames or other workarounds.
> > > 
> > > Add a 'make image.fit' build target for arm64, as well. Use
> > > FIT_COMPRESSION to select a different algorithm.
> > > 
> > > The FIT can be examined using 'dumpimage -l'.
> > > 
> > > This features requires pylibfdt (use 'pip install libfdt'). It also
> > > requires compression utilities for the algorithm being used. Supported
> > > compression options are the same as the Image.xxx files. For now there
> > > is no way to change the compression other than by editing the rule for
> > > $(obj)/image.fit
> > > 
> > > While FIT supports a ramdisk / initrd, no attempt is made to support
> > > this here, since it must be built separately from the Linux build.
> > 
> > FIT images are very useful, so I think this is a very welcome addition
> > to the kernel build system. It can get tricky though: given the
> > versatile nature of FIT images, there can't be any
> > one-size-fits-them-all solution to build them, and striking the right
> > balance between what makes sense for the kernel and the features that
> > users may request will probably lead to bikeshedding. As we all love
> > bikeshedding, I thought I would start selfishly, with a personal use
> > case :-) This isn't a yak-shaving request though, I don't see any reason
> > to delay merging this series.
> > 
> > Have you envisioned building FIT images with a subset of DTBs, or adding
> > DTBOs ? Both would be fairly trivial extensions to this script by
> > extending the supported command line arguments. It would perhaps be more
> > difficult to integrate in the kernel build system though. This leads me
> > to a second question: would you consider merging extensions to this
> > script if they are not used by the kernel build system, but meant for
> > users who manually invoke the script ? More generally, is the script
> 
> We'd also be interested in some customization, though in a different way.
> We imagine having a rule file that says X compatible string should map
> to A base DTB, plus B and C DTBO for the configuration section. The base
> DTB would carry all common elements of some device, while the DTBOs
> carry all the possible second source components, like different display
> panels or MIPI cameras for instance. This could drastically reduce the
> size of FIT images in ChromeOS by deduplicating all the common stuff.

Do you envision the "mapping" compatible string mapping to a config
section in the FIT image, that would bundle the base DTB and the DTBOs ?

> > meant to be used stand-alone as well, in which case its command line
> > arguments need to remain backward-compatible, or do you see it as being
> > internal to the kernel ?
> 
> [...]
> 
> ChenYu

-- 
Regards,

Laurent Pinchart

