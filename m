Return-Path: <linux-kbuild+bounces-3110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE87958941
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6DFC1F21AB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140253D982;
	Tue, 20 Aug 2024 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PEpS2rfq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D126383AB
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164142; cv=none; b=b+iopjUwREvYQGQefnZMxMKZ8e0hDjca0utoVghE7ctDC7AslTSUevUGr+dS4F7LYHaqaLOYjEFL1z+L2IC18yBI3nkzN75IgX7V66mOChuJ8c+/1QShdpC1dvLKPu9pm6NQtKg1noBysEq2/8fXmDqzrxltG51/isSwnuFqHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164142; c=relaxed/simple;
	bh=wHKmjGio8uBVeb/+6AMWzzsMkaS36/MGLma6QOkBaBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANBsr8xo3WqnL64pulllZqAj90XOi7ec3PQKiPoxKtz4O1UNLji7oDWNNUt8Tu7rXf6bZ6qeQKqJjZMxtEWlBP3ctAxION2m45/r7iPpGtKfHZHIAnpFB9Hy642WOeAF79IDlvQ+oMRca0sjNF2swHYu0YFv1TQtOgAhYLRnnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PEpS2rfq; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 20 Aug 2024 08:28:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724164138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMVmTEdCE1WXAMTSCJk+Aaa5KEYfu+AdLb4LUNiBWXs=;
	b=PEpS2rfqZmgs4Y0OYH1HtaShvgVCfFOGp004T4zaXFl+f4fDXxJg++wWW2hWlf0ClmBoaM
	maJEzmWjK+NrFMQsw/AnVyMi4TDrJBRl/waYuVXFXPDWdlFlqjLkxPuJBxIVS3UZBzlvA+
	sbt0LMaF4lC7jSqYY3Wpyh9OMmrgg8w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
Message-ID: <c7jdqfgb2cavfvu2obojgbccq56cevd5ojaiptp3riz5sxebhh@k4bk3vv6f3jv>
References: <20240817151147.156479-1-jose.fernandez@linux.dev>
 <CAK7LNAQMMTRX94dJVWiaB5iVFQcVwCUXGQFEHQN_S0ZWjQTZKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQMMTRX94dJVWiaB5iVFQcVwCUXGQFEHQN_S0ZWjQTZKw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On 24/08/18 09:35PM, Masahiro Yamada wrote:
> On Sun, Aug 18, 2024 at 12:12 AM Jose Fernandez
> <jose.fernandez@linux.dev> wrote:
> >
> > Add a new debug package to the PKGBUILD for the pacman-pkg target. The
> > debug package includes the non-stripped vmlinux file, providing access
> > to debug symbols needed for kernel debugging and profiling. The vmlinux
> > file will be installed to /usr/src/debug/${pkgbase}. The debug package
> > will be built by default and can be excluded by overriding PACMAN_EXTRAPACKAGES.
> >
> > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > ---
> > v1->v2:
> > - Use the new PACMAN_EXTRAPACKAGES [1] variable to allow users to disable the
> > debug package if desired, instead of always including it.
> >
> > [1] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/
> >
> >  scripts/package/PKGBUILD | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > index fbd7eb10a52c..d40d282353de 100644
> > --- a/scripts/package/PKGBUILD
> > +++ b/scripts/package/PKGBUILD
> > @@ -5,7 +5,7 @@
> >  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> >  pkgname=("${pkgbase}")
> >
> > -_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}
> > +_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers debug}
> >  for pkg in $_extrapackages; do
> >         pkgname+=("${pkgbase}-${pkg}")
> >  done
> > @@ -106,6 +106,15 @@ _package-api-headers() {
> >         ${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
> >  }
> >
> > +_package-debug(){
> > +       pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> > +       depends=(${pkgbase}-headers)
> 
> 
> Why is this dependency necessary?
> 
Hi Masahiro,
My thinking was that you may need System.map in combination with vmlinux for
debugging with tools like crash. I don't have a strong opinions on this, so I'm
I can remove it if you or others think it's not necessary.

> > +
> > +       cd "${objtree}"
> > +       mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> > +       install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> > +}
> > +
> >  for _p in "${pkgname[@]}"; do
> >         eval "package_$_p() {
> >                 $(declare -f "_package${_p#$pkgbase}")
> >
> > base-commit: 869679673d3bbaaf1c2a43dba53930f5241e1d30
> > --
> > 2.46.0
> >
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

