Return-Path: <linux-kbuild+bounces-5489-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62967A123B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 13:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2671887BDA
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9537D215164;
	Wed, 15 Jan 2025 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uj0qkWiH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v0BoDTQn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8122475E2;
	Wed, 15 Jan 2025 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943980; cv=none; b=ih5FwPrKnpYa7k9DTks2J2eKL2xQrB5UoI1paUgzyJr568SIM4fp/Nf1cRfz5WQRVZqllpMtpfBvfPctqDFpPofhE0mpbftBvqsOnSeK+si6LIWvkT2PjdrycXQzR3mrZPMsds5YS2X+CUmdzspVR/p/xTTcUjCAs/DRb1SJ+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943980; c=relaxed/simple;
	bh=SEi3OXYW72ryJgMV9rqn8zuBcUU/wVY3ji2gwWJ3c8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv6ltzAqyR1KoB4nP+4B0KCMcbysGC6lPAGVA8nvVX4TqtTijfO9e4GjhipjPy1LGDOryZOjFJHfcp80YIhnjmgZhyrXqEh9F/g4x2/v0Vc6JGvWb/llRweS4o4QXF0dn6ZOZ+J4/3C/MRxorqtgOElxkAtze9ilEUarLfN96+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uj0qkWiH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v0BoDTQn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 15 Jan 2025 13:26:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736943975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6d6SgkhUSyqRwmZawfrB96eHNM5untwrAFDhIFtLNE=;
	b=uj0qkWiHDiAKrR1Kpo4bFN0m7iisRJ48OoXUVAPiEYll7JEcV2xXUcpCP5Kie3V9ZdDXsB
	Yl2MyNZdKZy3/1e8cVx56fJXL+sfFScUL5aluxMQfHpVBEkZ22haGn4dFJPgE92SDXPggh
	rel+CR0kgYAiFNxt/NW9oaxA3fC9OgLLgQmRaPF7b4kN616S09vj5ARm0OyMTNaXtYysmE
	pW2IDqTzZ2K9khm31OOTr+YwDxVzo1E9ZOF67rsedKH7miyMqd5cNMz6Vt0PlkdtfRdrrS
	h4FJIVxw+cB8NtKZ6GjGDIg3ERyH+lUravJSV5qNO8sL7yM5a8xIIxUhcZRumA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736943975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6d6SgkhUSyqRwmZawfrB96eHNM5untwrAFDhIFtLNE=;
	b=v0BoDTQn+hpyAc1zsCsUzhX0IO/MpFuXyXEXog5WYZHlHAqODrN+Sf3cXewFVznD7iC5kA
	3SbgQE9IzBgvMDAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add kconfig utility scripts
Message-ID: <20250115132235-f8c9c9ac-714f-4836-baaa-07250c92e349@linutronix.de>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
 <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
 <Z4el2qEV1xZIMBfk@bergen>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4el2qEV1xZIMBfk@bergen>

On Wed, Jan 15, 2025 at 01:11:06PM +0100, Nicolas Schier wrote:
> On Wed 08 Jan 2025 13:34:28 GMT, Thomas Weiﬂschuh wrote:
> > There are various utilities in scripts/ which work with kconfig 
> > files.
> > These have currently no maintainer.
> > As most patches for them are applied through kconfig/kbuild anyways,
> > add an explicit maintainership entry.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..2bd414fb3e6d6515b57a57a5f3d4d735137edcce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12385,6 +12385,9 @@ Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> >  F:	Documentation/kbuild/kconfig*
> >  F:	scripts/Kconfig.include
> > +F:	scripts/checkkconfigsymbols.py
> > +F:	scripts/config
> > +F:	scripts/diffconfig
> 
> Thanks!
> 
> Does it make sense to add scripts/extract-ikconfig also?  It does not 
> handle kconfig language at all, but linux-kbuild would probably still a 
> good place for review.

scripts/extract-ikconfig should be maintained together with
kernel/configs.c. Today both are formally unmaintained.
linux-kbuild picking up both looks reasonable to me.

> Nevertheless,
> 
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks!

