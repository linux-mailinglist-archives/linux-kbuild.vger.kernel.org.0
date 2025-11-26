Return-Path: <linux-kbuild+bounces-9864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F71C8862E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 08:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E9C5356BF2
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 07:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7865D288C39;
	Wed, 26 Nov 2025 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e64wx9sd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1J7X0wYX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C3285071;
	Wed, 26 Nov 2025 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764141402; cv=none; b=P3o12V7eNqoGBYMwT3kUaF72eV5TvF1aXKa/uqk+WRrsQ+gEQ3WnV2FxjTD2qZzdgXCkp51/Q3r+ezV743FwpqaDets2AEYT0iHQjoThKwlLBCPWh7AfAyxY89j7oXt90kxtlnbJ+dqo6oRCE916Rxbv8fP2OKBrxaorLYhxKpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764141402; c=relaxed/simple;
	bh=W2U9c5dnm0gBkFez+jTAwoDoBmB7c56L1xDC6s2xtqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chjwdknZ8GrrueeCFXOwFKML2FmDYVoOyV3toZtAh2t2tdhxj0NnabtJU72C57PSOigJ+2B/yyntwayVb5nfMKHnBMZjYB7X93psXEjQLpif61vmzGMjQsTeaomDYjD6fouGJI+qlXWs1aA3OCEqFuOtMv4IwxsFC5hYMJbZAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e64wx9sd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1J7X0wYX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 26 Nov 2025 08:16:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764141398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMPNPgQF7EFk8fZKuStuZmZpYxMUfWjshcS2iwRDj7E=;
	b=e64wx9sdKMuAEOyk8Ro45BZ1y0o6TbClP2QFvNwkTubvJICUftVL00usk1GF5F1Ur9fhHb
	zDxvA8+xsqyAS6ACr7/lOV86yiO+gHdJp3H7MzAUARaRJg7FRpQqBLPN/kN0gvaV9Y5SuU
	/9T5JDzA3EvVsiN5/FirnXlmZ9Occf5VJp3erFgWe7xk6DgnelVhqCRKe8OwutoLPnaCkp
	Pd4XazZC/wBf7VVx/PgAnGcy8kSm2JPAr8Di8WAzIOaQUjrAZU7kSY9Ut1yFDeM5RtxURC
	C+b9zezBlueOwThohMlP1VqTdUlrb/qvXb14uxTZNXj4wD9uWLOd0u57BvpSlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764141398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMPNPgQF7EFk8fZKuStuZmZpYxMUfWjshcS2iwRDj7E=;
	b=1J7X0wYXyqqb80DXylWtfuTcneoc2Y16RiVLcGXa65CVSpk04p3MRtRZdh8t9N9Qu0TBc1
	LNcWmrqXea02cMDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, 
	Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>

On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
> On Thu, 20 Nov 2025 at 00:49, Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:

(...)

> > >  quiet_cmd_fit = FIT     $@
> > >        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > > -             --name '$(UIMAGE_NAME)' \
> > > +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> >
> > Remnant of a previous revision?
> 
> The flags are there to allow extra options to be passed if needed.

Are they necessary for the module functionality added here?
If not I'd put them into a dedicated commit.

> >
> > >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > > +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
> >
> > I am wondering how module dependencies work without the depmod invocation
> > and modules.dep file.
> 
> We have a mechanism to place a pre-build initrd with the filesystem,
> etc. into the FIT. But for this particular feature (suggested by Ahmad
> Fatoum) we are just providing the raw modules. Presumably another
> initrd would be needed to provide the startup files?

modules.dep is more than optional and generic startup files but an integral
part of a module tree. Without it, any module depending on another module's
symbols will fail to load. Also the modules will be unsigned, potentially
making them unloadable. Ahmad's patch does produce a complete and fully
functional module tree by means of 'make headers_install'.

> > >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> > >
> > >  # XZ
> > > --
> > > 2.43.0

