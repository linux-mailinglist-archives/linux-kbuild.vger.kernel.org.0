Return-Path: <linux-kbuild+bounces-12257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLPNCln5w2kxvQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12257-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 16:03:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FDD3276F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 16:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D8A232A9695
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D722C3EDAA5;
	Wed, 25 Mar 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="SxNfTh8Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2VFyPLGA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3613EDAA4;
	Wed, 25 Mar 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450111; cv=none; b=abdlH5aUvJE9/HBWm0rU3MYVhz4ef/GEOR9t+VJ7iWxlzuA4d4sBUbTvgNoxeT6lEeLStHByRymofcyubtUeF9A4AEgt90bbbPWcl5wzQnbiNSYXBRYU38k3pN+KsghAH4BMnmEV1YOsAtco0qD6iBc/nuq/AQQ8n8T6Jw2fJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450111; c=relaxed/simple;
	bh=TDzhfhyTp/262lNODLpUml/v+J801pwk4JGI64fkrV4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqhJ3FLjR3+H9cb8bg/bVJpw4DzuhkvhM1wE1nCBujSlxH77lk7xF6h5kgSkBLAS1crlwsflnJghu+rcZNJCWUuOl5HDARrhxr6Q2aa+0TuuCA9TGxdStgoQUbAh28TfKk1pSiGkHAx7JNBbCy7c5NHOrMSlEqFSDyPbk2l4o1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=SxNfTh8Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2VFyPLGA; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B6836EC0276;
	Wed, 25 Mar 2026 10:48:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 25 Mar 2026 10:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774450108; x=1774536508; bh=t+4aDi00V9
	A0AOTTZWe7F8ddfx8iFgH3+qtpkTiAfRg=; b=SxNfTh8ZhzR1146kREz6NJzfj6
	P+AaIXoehugnmBMRNuBSqKnA7XmA3ZY+7s9oc/XVCp4/0+MqKN4jn72IkNGiYvjX
	RwBe7IEv+fxcTF6x2zyJ7tPCt4Fdhse6wadUA431xWiKKPKSzLivybajLpu8tmW5
	bLlDhyadm7Au62qjew4MAlexDTkSr5/+1nYK/yBmL6gpIy9mpOxxgdwXBB1WKXR6
	FTkigC5zKXE0mciFYYOU/h4m7ZE7ZX39DS42Cg7yvwibcaZs6LQAUylfb9j7jVRf
	lLfMPJLpmrz4+9XWqd2qcYzfQ3J08LfZokTOOaMl3whJcubBwzvAjU2o0tqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774450108; x=1774536508; bh=t+4aDi00V9A0AOTTZWe7F8ddfx8iFgH3+qt
	pkTiAfRg=; b=2VFyPLGAkDOSJaWwjyl8uDfQwbHMJml7BiQgdWPG/9eCPFgrFJg
	O/+jCWR6uxKCY4BuGVZKUroRDXk1XM9V7rEar/V0kbaJzIkkQJlXOtyg4sFD3XSQ
	H4IoXorAKq+0OHXG+1nSD5nBm5uLa+hN2pP9V7gbuU69A2ot7XXzJRTSNjqONwil
	dXcOvGMYpbJY+XtX9rmjl2NInyp/d6Z9Ozzg5SmPJvXk4fWtmvh39mkymdbHfuy3
	Mg7HK5LK++leEf/Mr0kwySWhrnSOp8txR1zLENfEHojayMwmdWg6tF30awAUZqYU
	BGTMC3flHOLisLXl53IxsxZc0NArrkOe3Ng==
X-ME-Sender: <xms:vPXDaQJxFxW9qHb-QARX_1DpsXK8aelHQ70beaG2IZls7XWUQY-CiQ>
    <xme:vPXDaaIHRGlvUbPle42m1xGHr5F0LsUuPLdom0zz9dedSGN_KDY8wBOUt-W3DZ1C6
    DfgM10iagWf4GbdxnuzQ827TpZsih6Mp__e7vgHSf2cv-2f-4YLhpI>
X-ME-Received: <xmr:vPXDaXVaaZ7xCEQDlvCGODFoW3gu0SF7LZ9X3JzbWxIf3xlWOe_IdF3f9w5B0cJ7PrsgUhPnmDimIiUWrr464CYGeWmWXGe7UVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepleefge
    evleffudegtdelgfejjeejheekieegueeivdeihfeljefhkeevieevtedtnecuffhomhgr
    ihhnpehshihsthgvmhgurdhiohdpohhpvghnghhrohhuphdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgv
    thdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnh
    hstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrrdhfrghtohhumhesphgvnhhguhhtrhhonhhigidruggvpd
    hrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthht
    ohepshhjghestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvg
    hishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhig
    qdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vPXDabmftNTnluZ0tRrhF0dBgW3DYyjMlUqYQIPcVIPGo-7Ar-wF8w>
    <xmx:vPXDaVmItwcQRUNtfYxsKdF1REPwTvh0FRVPPlIMEhKhI-cVbJeE4g>
    <xmx:vPXDaTbkZEAKsf6VTu5GnuNsPP1T6P8-3urXu9q5rrIZUV6Ix_ZIew>
    <xmx:vPXDafSD48yh5BiTnlZHmtQNU9vXRRBao0naKWEAvPkhqQLx8OgNAw>
    <xmx:vPXDabNntFl6rJfZgdQRelSO12vwbCOE22DGKW8s2DgzfrBSLNc6rmm7>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 10:48:28 -0400 (EDT)
Date: Wed, 25 Mar 2026 15:48:26 +0100
From: Janne Grunau <j@jannau.net>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <20260325144826.GA2137845@robin.jannau.net>
References: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
 <ab621gToQqSAGHsw@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab621gToQqSAGHsw@levanger>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-12257-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,jannau.net:dkim,jannau.net:email,opengroup.org:url,robin.jannau.net:mid]
X-Rspamd-Queue-Id: 74FDD3276F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 04:18:46PM +0100, Nicolas Schier wrote:
> On Fri, Mar 20, 2026 at 03:30:32PM +0100, Janne Grunau wrote:
> > The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> > target to build a cpio containing modules") is incompatible with
> > initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> > be a link and directory at the same time.
> > Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> > that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> > module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> > 
> > Tested with Fedora distribution initramfs produced by dracut.
> > 
> > Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > Hej,
> > 
> > this patch allows to produce modules-cpio initramfs which are compatible
> > with initramfs with merged /lib and /usr/lib (/lib as symlink to
> > /usr/lib). I expect initramfs of distributions with merged /usr to have
> > a merged /usr as well. This is at least true for Fedora initramfs built
> > with dracut.
> > 
> > I'm not sure whether the trickery to avoid repeated '/' is justified. It
> > is necessary to add a slash between "$@" and a non empty
> > $(INSTALL_MOD_PATH) to avoid make failures due to non existing
> > .tmp_modules_cpio when INSTALL_MOD_PATH without leading slash is used.
> > modules-cpio-pkg`.
> > 
> > Better or shorter ways to document this not completely obvious behavior
> > would be appreciated.
> > 
> > Janne
> > ---
> >  scripts/Makefile.package | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..ab18cf81622ae319380528c401f9aeb6d32070c6 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -195,7 +195,9 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
> >  .tmp_modules_cpio: FORCE
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile
> >  	$(Q)rm -rf $@
> > -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile \
> > +		INSTALL_MOD_PATH=$@$(if $(INSTALL_MOD_PATH),/$(INSTALL_MOD_PATH:/%=%)) \
> > +		modules_install
> 
> Thanks for the patch along with its detailed description!
> 
> For completeness: I'd rather use $(addprefix):
> 
>     INSTALL_MOD_PATH=$@$(addprefix /,$(INSTALL_MOD_PATH:/%=%))
> 
> but as POSIX states:
> 
> | Multiple successive <slash> characters are considered to be the same
> | as one <slash>, except it is implementation-defined whether the case
> | of exactly two leading <slash> characters is treated specially.
> https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/

argh, I did read this but confused myself by the second part to think it
was only for leading slashes.

> there is no need for handling possible repeated slashes here.  So, from
> my point of view we can keep it as simple as:
> 
>     INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH)
> 
> as a trailing slash in INSTALL_MOD_PATH should not be a problem here.

ack, I'll just do that and I would have sent it if I did not confuse
myself with the POSIX wording.

> 
> >  
> >  quiet_cmd_cpio = CPIO    $@
> >        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
> > @@ -263,7 +265,7 @@ help:
> >  	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> >  	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
> >  	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
> > -	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
> > +	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive (modules installed in INSTALL_MOD_PATH (default: /))'
> 
> Please break that line, e.g.:
> 
> 	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
> 	@echo '                        (modules installed in INSTALL_MOD_PATH (default: /))'
> 
> 
> Fixes: 2a9c8c0b59d3 (\"kbuild: add target to build a cpio containing modules\")

I saw it more as an additional thing but without the complications of
suppressing repeated slashes the change is easy enough

thanks,
Janne


