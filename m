Return-Path: <linux-kbuild+bounces-3201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D804295DED2
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 17:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93032282E69
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2C117C985;
	Sat, 24 Aug 2024 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jQcstUe2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56E17ADFC
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Aug 2024 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724515013; cv=none; b=WXhulTx55YkCQa93b4yUZvWAVUHEBq27V7vxkk0EMUDCOLiRjOoM3lNwRbfU2DpwsH/IBcJ19zVEuyPJdM/8bVurlDZ7j99cexcjFzk+5keJtZM6tWYxLNliolb6KxPgbjU067TE3sl4T5U6SXdteKD9YLxg8HGQo+wJRhaGLrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724515013; c=relaxed/simple;
	bh=cH8aHlkkvy3AJcT28JS8H06Tuu93vqYDtf91zpYvvos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb1tjB8MrARNK8eXBIrwD1Pp7Mg93W3NNKX9/tTdFHz+lKrLoh3gHzEcHnKkNPLQ2UBEyiJyQumCVWAUsXCFD0ifgJIhky/cyuFK2Dg5n0AXBsC2bSUvu+/G6va728bR6oEPPtOeF/A6AXFEOBsraiZkwVcx0BmBzHp/r4qq75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jQcstUe2; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 24 Aug 2024 09:56:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724515009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eF/7OoLTWUFbTpYva7BloMQq5z8RTcoIJY3gbukztj4=;
	b=jQcstUe2X36+Ezh7KVKRvNCfAkNQ/tP/dOyo7pyrpYeCwCsrClW1TXeN5meOPm1uvUqHjT
	vdjPPyFZvuJLc++fiw3nr5da+e9bqpgimuDj+VngnWEY3mH8t3NREFTf5hSA61iqQpkLYN
	2i0Z7cVHf8CX0iwL9i4MCe5k8bOUe/U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
Message-ID: <ft72yuyrztnlptk5muuypdcatm7ugiys6sbvjhxruszat5e22o@kv7jrgphxg2v>
References: <20240817151147.156479-1-jose.fernandez@linux.dev>
 <20240817-brave-labrador-from-eldorado-e929a8@lindesnes>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817-brave-labrador-from-eldorado-e929a8@lindesnes>
X-Migadu-Flow: FLOW_OUT

On 24/08/17 05:54PM, Nicolas Schier wrote:
> On Sat, Aug 17, 2024 at 09:11:47AM -0600, Jose Fernandez wrote:
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
> >  	pkgname+=("${pkgbase}-${pkg}")
> >  done
> > @@ -106,6 +106,15 @@ _package-api-headers() {
> >  	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
> >  }
> >  
> > +_package-debug(){
> > +	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> > +	depends=(${pkgbase}-headers)
> > +
> > +	cd "${objtree}"
> > +	mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> > +	install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> > +}
> > +
> 
> If you like to also include debug stuff for kernel modules, you might
> want to have a look at scripts/package/builddeb's install_linux_image_dbg.

Hi Nicolas, thank you for the suggestion. I'll iterate on the debug stuff for
kernel modules in a follow-up patch to keep this one focused on vmlinux.

