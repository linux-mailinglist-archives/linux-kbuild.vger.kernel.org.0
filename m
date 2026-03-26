Return-Path: <linux-kbuild+bounces-12281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAqDOIAQxWkI6AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12281-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 11:54:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 417DE333D39
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 11:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AE1030A8497
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 10:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B9135E921;
	Thu, 26 Mar 2026 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="O1m81ia3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fv2rKV2v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445592F4A14;
	Thu, 26 Mar 2026 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521963; cv=none; b=TvGkcQBu0RB6LlgywwDfKnRQuFSDqdKlv8LXpCR1o9sW54nvhM2LgtPmzLDwPJjnlvlPDkAqGRAjaBCc02eqdidn9jZqB+8MLQ077YARwOozueGeR5lP2gdQKoIFMyyfbZL+ypEjKd0WxIva1V9YujqEKo1KpPo96Fm/i4olXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521963; c=relaxed/simple;
	bh=VUGycamZ2GbzBt6uAHNcMjQPIaPr6XcTjuTQ9TK69Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tnq/wQHnIWm/b0pCi029DroZ4V9C4KHTJ+k1BLGGahhVOyulroOZ1gzfsaMGIGz4ZT4cZC0GNFUoWrI9mJM7I6C6OlUtmbZG9i8dxFQYAw0yft3UXzkwJ5V+qn3CI0mmd0LEDwZ2wTr2azs4SlHnLKA53IXDgwMrn0w49Z+18YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=O1m81ia3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fv2rKV2v; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id F27AD1D001A7;
	Thu, 26 Mar 2026 06:45:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 26 Mar 2026 06:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774521959; x=1774608359; bh=W+JCLRCkA0
	ASoJW9bT7a1jcbUSYq4+wQKXt0nxQXoTk=; b=O1m81ia33MWMDNxkRYh+5Qg5on
	SDFYMi32TQ+8KBO0NET6ALSVkHL0DKrYbYiY8PxjCL2dcRn5xVxDyUXapqVmNXwj
	xRoXkpBMgb4iG8q5SHImr77sp3mjpk3Fs79Cx1KHGumNDh78me8esItqvsPIKozg
	DqJJVe7VdYzcuQh4vmVzIIZRxz/VR5SdLcB4l/acdRvNq6EomM1gyeWgGuIqjIEc
	dAcl8XcNLWZTLKD3CVKu6AqROUhorJ8IZwGNT6182Cshr8GxPGphTGx2HgW958YB
	5wOpaVCQiN1cxKCGnWQS5Gt0HDtnWqL0pIS1cnaJSVUWQ1+SkqLPg7BSWi8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774521959; x=1774608359; bh=W+JCLRCkA0ASoJW9bT7a1jcbUSYq4+wQKXt
	0nxQXoTk=; b=fv2rKV2vmv0/Sbx8lxugrzpTdxVe0X2gb72JACIpXd7OJxLTP1I
	4gGsd143vPG0qOwb6m9XNAvHX5e3bVzVLbQn5tdDQp2ikAF3b8XhS5ayGtQd5Br0
	8xYYbgL3OztvIprqZzS3lsPIllECGmPzmh0Rr8byah2hJQZ2ZAdOvHDxFzRPGI7M
	UYnV4EML0+4IErt+lcZULhxfzNKpDT/0bW0C+CC4UmNG/Y36AF7+mR8pUOx6XuUc
	qlWyriabe8bjsJVXT3eLlewJtZCNZJGDwxBhTrqCQvzLgzaK8YfhnTp6SKA/4Tb0
	R64ISkTbrDpr/tSt76n0uOfSbaXv1azeELA==
X-ME-Sender: <xms:Zw7FaZc9ACOdDbaM7nA2992_w4ZD9uWIrh8Hw6lAT8A6wYQxzz72bw>
    <xme:Zw7FaYzfqqCjSprj8nXyzGX8VKghJYs9Sq8VyDQf7jBG8z6a5o0LFZG1p3kkBnT-V
    CO4SM3ymnhJsLfBFG_N3HDoWYXDWEIBC74gS_0XzEZa5u4GG_piQ0LP>
X-ME-Received: <xmr:Zw7FaY3ddOJPdTE_jAkkosGcrzGxaInitElS31jJZdpLjVVsUQ4Fn-WHOO4kIiaY6rt1SzPw1A_oEIVuhUOsaDtvVl8Ebr9Ii0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeetgf
    evheehieehjeejudetveffiedtleetgefgveffleehgeeftdduudethfejgfenucffohhm
    rghinhepshihshhtvghmugdrihhopdhkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdp
    nhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgrth
    hhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrrdhfrghtohhumhesphgvnhhguhhtrhhonhhigidruggvpdhrtg
    hpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohep
    shhjghestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghish
    hsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhk
    sghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghl
    vgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Zw7Faew7cWIIiUkhxm25vx4SUHlT_lUWcSXjS091FsU-wemYUIvbnA>
    <xmx:Zw7FadWMEbzg82PzPrkWQMsr4Pp2FeJHwz-FVeCohFyBSs7zWxSQ6Q>
    <xmx:Zw7Faa8ser42k0FJZEBseAVj_cAyWwJJVw7eqDUlCda_YqZ61ZMx5Q>
    <xmx:Zw7FaQu4gKrreTUlXVzGLzhs4C1vFQpxaJ9-QmGR76zDej2PMMCw0A>
    <xmx:Zw7FaQ44ULp2v7jXSbDbyoZdZQxmAm-v3jfxD3BOSGkzTt_reJJ01zC7>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 06:45:58 -0400 (EDT)
Date: Thu, 26 Mar 2026 11:45:57 +0100
From: Janne Grunau <j@jannau.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <20260326104557.GC2137845@robin.jannau.net>
References: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-12281-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:dkim,jannau.net:email,systemd.io:url,robin.jannau.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 417DE333D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:57:25PM +0100, Janne Grunau wrote:
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> 
> Tested with Fedora distribution initramfs produced by dracut.
> 
> Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> Fixes: 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> Cc: stable@vger.kernel.org
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hej,
> 
> this patch allows to produce modules-cpio initramfs which are compatible
> with initramfs with merged /lib and /usr/lib (/lib as symlink to
> /usr/lib). I expect initramfs of distributions with merged /usr to have
> a merged /usr as well. This is at least true for Fedora initramfs built
> with dracut.
> 
> Janne
> ---
> Changes in v2:
> - drop pointless avoidance of repeated slashes
> - comment the changed Makefile rule
> - break long modles-cpio-pkg help text to 2 lines
> - imported Simon's Rb:
> - add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> - Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
> ---
>  scripts/Makefile.package | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..c19b88b346d0632cc99e74617d79b07d81d48635 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -195,7 +195,8 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  .tmp_modules_cpio: FORCE
>  	$(Q)$(MAKE) -f $(srctree)/Makefile
>  	$(Q)rm -rf $@
> -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +	# Prepend INSTALL_MOD_PATH inside the staging dir

The comment needs to be indented with spaces. With a tab it gets printed
to the shell.

I'll send a v3 tomorrow

Janne

