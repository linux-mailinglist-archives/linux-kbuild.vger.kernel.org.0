Return-Path: <linux-kbuild+bounces-9941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E94C9B29C
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 11:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDBB3A1CF8
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3721326F476;
	Tue,  2 Dec 2025 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1AnABUKl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R6eOJyTo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2D21FF3F;
	Tue,  2 Dec 2025 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671517; cv=none; b=NBIHUAicFRr8Co6R1fVo2tfV8/VJR6xKIs2G4Ge4a7lNveRgCkQOoQfytKKfU1uyZxOafab26xtLw1jbYQrj3qqEmoIXR+0s4Yw8h8pTylNZiwquYQhl/9+1dpbMK1th39i0dp+6KQeBa7mJm21RaWW2o3HPsIwuyWs9QuCdCHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671517; c=relaxed/simple;
	bh=GKoYrB4w/Q4InIw6gndS9PG8v8tlDwKcbPzmVwbfZrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB8KFApqZsPuChEwvwUdYzJPvFg/RXf0AejSNGOoLJ7ND5GlUK4zJRy531SPmkZAcFlkN/Ao1PFu/Miqim0PLa468lSbLfQfntfJ+y2IdDh+/47n1jqWi/mlmrJuILkoHRG/VT36mODU0pVLP5ZLZYlRTKwveqAWlQ00a6LHYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1AnABUKl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R6eOJyTo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 2 Dec 2025 11:31:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764671513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=91NbIjc/8Ef8PaenZDmBnOTJmlpLklbV+rwOZpBNj2c=;
	b=1AnABUKlLOmwPLvX+ZRmzDJwM1qUDEbe//0Pgsm7HKejhqWxAfo655Zx6r+u0ZK3mwVjBl
	mnyMNV0MfpXgH4hhkbEIo2r0Ve6fh1j6E3LnKRwuXBsV96mAPe70eMfxlJf/eha8jgI3Iv
	OjpbceS/Y6EF+9z3HGyWwVs5rPFaVkrKvrM8un3MgMXaCOhskSFSrASoBwulJ3yHnKQ6IJ
	NrWHf7Oq23iJffi28qQM936IYU4GZbXaFp0NeeTeqA0a5m2yay78qmlDD5yOdjFWtmDmnz
	2LCP2Ec1c5gelGbptEPQtmb8ei5ULBuIx2QSG/pwqQTG697J1coO/Gci8fxuKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764671513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=91NbIjc/8Ef8PaenZDmBnOTJmlpLklbV+rwOZpBNj2c=;
	b=R6eOJyTop2unjBk8lh/PmH1ytphxnKSrxApA78gRhVKKbb+6dC/Q/KW8l7yrkRoXXBmyxr
	IDqIaOQhWkENbtAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, Nicolas Schier <nicolas@fjasle.eu>, 
	Chen-Yu Tsai <wenst@chromium.org>, Nicolas Schier <nsc@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251202112039-b03af7ec-ae06-41ab-914b-703940cc98a2@linutronix.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
 <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
 <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de>

On Wed, Nov 26, 2025 at 12:26:49PM +0100, Ahmad Fatoum wrote:
> On 11/26/25 8:16 AM, Thomas Weißschuh wrote:
> > On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
> >> On Thu, 20 Nov 2025 at 00:49, Thomas Weißschuh
> >> <thomas.weissschuh@linutronix.de> wrote:
> >>>
> >>> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > 
> > (...)
> > 
> >>>>  quiet_cmd_fit = FIT     $@
> >>>>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> >>>> -             --name '$(UIMAGE_NAME)' \
> >>>> +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> >>>
> >>> Remnant of a previous revision?
> >>
> >> The flags are there to allow extra options to be passed if needed.
> > 
> > Are they necessary for the module functionality added here?
> > If not I'd put them into a dedicated commit.
> > 
> >>>
> >>>>               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >>>>               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> >>>> +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
> >>>
> >>> I am wondering how module dependencies work without the depmod invocation
> >>> and modules.dep file.
> >>
> >> We have a mechanism to place a pre-build initrd with the filesystem,
> >> etc. into the FIT. But for this particular feature (suggested by Ahmad
> >> Fatoum) we are just providing the raw modules. Presumably another
> >> initrd would be needed to provide the startup files?
> > 
> > modules.dep is more than optional and generic startup files but an integral
> > part of a module tree. Without it, any module depending on another module's
> > symbols will fail to load. Also the modules will be unsigned, potentially
> > making them unloadable.
> 
> I'll use the occasion to elaborate a bit on why I thought adding modules
> is a good idea.
> 
> - You have a system boot from FIT and maybe even a r/o rootfs
> - You want to boot a different kernel without any userspace changes,
> e.g. to bisect
> - Fortunately, you have a build target that generates you a FIT with
> kernel, enabled device trees and all modules (including deps and such)
> - In the bootloader[1], you specify that a CPIO with a minimal init[2]
> that bindmounts /lib/modules in the initramfs over the rootfs modules
> before pivot_root
> 
> and that's it, you are running your new kernel with the old rootfs
> unchanged. I believe this would be really handy, which is why I
> suggested it.

The idea sounds good.

> > Ahmad's patch does produce a complete and fully
> > functional module tree by means of 'make headers_install'.
> 
> I originally thought that we could generate the CPIO normally as part of
> the kernel build and then we can readily depend on it in the rule that
> invokes make_fit.py.

That works, but it is not what the patch under discussion does, or did.

> If this proves to be too cumbersome, I think it's already an improvement
> if the user can manually run make modules-cpio-pkg and then make
> image.fit with the initrd specified. A single target would be neater of
> course, but I didn't intend for this to stall the series.

The single target idea would require 'modules-cpio-pkg' to not be a PHONY
target anymore but to properly track dependencies. Otherwise the CPIO and FIT
image will be rebuilt even if no sources change. Proper dependencies are always
better than PHONY targets, but it will be a bit of additional work.

> It can always follow later.

Yep. But for the patch as it is proposed I am still wondering how it will work
without modules.dep and friends.

(...)

