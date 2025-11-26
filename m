Return-Path: <linux-kbuild+bounces-9907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B9C9301D
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2E68348014
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 19:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510AB27FD43;
	Fri, 28 Nov 2025 19:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmht+8Ko"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925F2080C8;
	Fri, 28 Nov 2025 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357628; cv=none; b=Y7/wNIYxbVX17Wr7VUIIbeFAB3xw9yYdIkd5E4QP3a+4ADa0dFL63zefUmrP9jLZQ8DS7jV1uP+EdYU4JvK66sNw04t7a4gXxojLdLdfyZGoy9ygn+qpTI9QEZvXFYsT6DZqZ+aK1GjpN4jmwiw6QSlH+s/P0swcAlINBYOaohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357628; c=relaxed/simple;
	bh=DXuAaf5STIKAoe84/D098t22vZNecRboTQaJHyXoD2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PabgjkK0IYbXX97vTCP92/4Qy2e/STopSJ69Y/FCJ6hR4wCRf7R3eBRYJSb/iYfstSf7ywUF/TVRoFLj122+wv9nntFZiepIvjKcK2CCtMr1xIXtT7l/ocDpwkiA0qv6l2LbizPycLbuLl0dTmhBIfc2ybeXILW19H+fPI0IbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmht+8Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F2FC4CEF1;
	Fri, 28 Nov 2025 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764357627;
	bh=DXuAaf5STIKAoe84/D098t22vZNecRboTQaJHyXoD2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmht+8Ko39eG7Fklvsw4YCvD+FQVgaoyTbzP8/LD/oWcdvoBnsvpvYV312fhyQSgO
	 0nGMMvBaVY7zYKbl3lvCQl4JnobwugvYQcK2iew0z6nyP9L0rkYs/aC231k6f/90hf
	 ehllF+xGiHaMpNm86RUUemag+d5fR/HNcKLpKokLLPgHUZrnSxR3QaPC7f2SyZV2X2
	 af8m6+ILmErvxBu0H9F5DBjoBljnFsbMX5ytGT8hjANZinC1mLEU9/c9/JdKKyzCJw
	 MmcdbuaLD65AZPKQ6ZShbDRNq+dAtSi+yKdEjz54tp3Rf1oQrgIaXrh/rtVwwG3WsU
	 1NlhWLdQOPeqg==
Date: Wed, 26 Nov 2025 22:03:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
Message-ID: <aSdrCFkUQup3qb-q@derry.ads.avm.de>
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
 <20251120063936.GA3321365@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120063936.GA3321365@ax162>

On Wed, Nov 19, 2025 at 11:39:36PM -0700, Nathan Chancellor wrote:
...
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 74bcb9e7f7a4516473481468a0fcf700c3bead33..20eec9e2dec4dda3fa0ef64a15b80dccdcb55f90 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -189,6 +189,22 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
> >  tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
> >  	@:
> >  
> > +modules-install: FORCE
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile
> > +	$(Q)rm -rf $@
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> > +
> > +quiet_cmd_cpio = CPIO    $@
> > +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
> > +
> > +modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio
> 
> This seems like a bit of a hack to generate gen_init_cpio this way but I
> am not sure it is worth moving usr/gen_init_cpio.c and
> usr/gen_initramfs.sh elsewhere (scripts?) to make it a most accessible
> hostprog right now... Nicolas, do you have any opinions on this?

Yes, it feels hacky to me, too.  After digging into this a bit, I am in
favor of moving at least gen_init* and friends to scripts/.  I can
prepare a patch in a few days.

Kind regards,
Nicolas

