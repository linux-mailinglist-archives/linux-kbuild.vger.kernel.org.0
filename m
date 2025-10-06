Return-Path: <linux-kbuild+bounces-9008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B0BBDED9
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8313AD3B4
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 11:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE54272E56;
	Mon,  6 Oct 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2/QMU1jI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DebXIjT8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7081DE885;
	Mon,  6 Oct 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751669; cv=none; b=R/NOvCynmcfwvK6RtiRzuL8zOsh5cSYOfKCoe4D9Xnun6/PfPilVmrnBAV8LYAqxMUDyhZRhk4tSEHrQUJqZjoH901noAx1b7r0ReIC0PP44AHhewvJ1KCx/gyDA2den+X+wAwXlt5XGAawL8bNjrsOT1AxZ5QwmITNMA+ftbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751669; c=relaxed/simple;
	bh=ZioiUwG6MMI3RYHIagvcyaGc2VcCk8wb2cXw3UsKQhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhtSWNzw9aQ5slyHrChq6hrGN1T15XRBfLWTViKtVOEDlB7DrmI+AVlfydWVYywjSjJALQWi3WXB/+VM5PGBtTuEt0jZPIAgJqfr324wvr7BDQ8/T+fHPiJwn6BD0scQpbosRUPwc2EPkbkQ/aUHGOQZ2sCbYzhuMRhgpRmtjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2/QMU1jI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DebXIjT8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 6 Oct 2025 13:54:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759751666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aR2LAGESFeEdUWhrwgsYFq+0kZdVFXXGOVupZSsLo7k=;
	b=2/QMU1jIA3wMjsTYEPGtdrfYVCUtjyFAwrqA40qdXQPkFLasbDcW0H3EdjBBGi7Wc8U2wX
	pUtcJg6GHe/DGsZ444ny8iTCGV84QFVeeJKo1q9yKZEK7N+ESlBMgTEFLnYF4zdpnrtOZb
	MXznp6QJr9eEr2mfuFcb0S6opcpI/G4a33Mn0Qrt+HuttFBSGLtOv9+/08TMzYt0VxjMa+
	9aLt1jnBVA8fU0pl1JFRE4dcBSPlZTsPWQng6y0Bi33VIoYnhTZXCbTFq4cx2M8hPeLYTa
	CYEm/DIR5OVEtFixLmHchnOcfoyefj8u9oGldcc5TR4ifgaP8d+JiwvhwD37yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759751666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aR2LAGESFeEdUWhrwgsYFq+0kZdVFXXGOVupZSsLo7k=;
	b=DebXIjT8E7jq/kQwE626PrSSM2gEyK2qy/NEJ/DzE33P9dYazX2JA4EF1IsvbDPJQ2EI6Y
	e619KSwk1NqIPcAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: Strip comments before size type check
Message-ID: <20251006134850-c8671ee1-d038-4efb-99e4-747c7898eafd@linutronix.de>
References: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>
 <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
 <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>

On Mon, Oct 06, 2025 at 01:22:01PM +0200, Geert Uytterhoeven wrote:

(...)

> > > diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> > > index 21c2fb9520e6af2d..75dfdce39e7f4610 100755
> > > --- a/usr/include/headers_check.pl
> > > +++ b/usr/include/headers_check.pl
> > > @@ -155,6 +155,9 @@ sub check_sizetypes
> > >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> > >               check_include_typesh($included);
> > >       }
> > > +     # strip comments (single-line and C99 only)
> > > +     $line =~ s@\/\*.*?\*\/@@;
> > > +     $line =~ s@\/\/.*$@@;
> >
> > C99/C++ comments are rejected in UAPI headers, so this line can be dropped.
> 
> 'git grep "//" -- "*uapi*.h"' disagrees...

The ones I see from this call are either
a) in tools/
b) within a larger /* */ block
c) in URLs (http://...)
d) in headers which are not real UAPI headers (drivers/staging/gpib/uapi/gpib_ioctl.h)
e) ignored by the header check tools (include/uapi/linux/coda.h)

The UAPI headers are checked against -std=c90 which does not allow C99 comments.
See usr/include/Makefile.


Thomas

