Return-Path: <linux-kbuild+bounces-13040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELREEHqC+mngPQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13040-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 01:51:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E25594D4CEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 01:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10A843019A36
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 23:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B695633A02B;
	Tue,  5 May 2026 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux486.org header.i=@linux486.org header.b="ETqCCur5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nm6++EBa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549033A9D1
	for <linux-kbuild@vger.kernel.org>; Tue,  5 May 2026 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025076; cv=none; b=hIk9Ks4niW8AzlZxnKdK6hiWPm1B+wVboUWRam+xHqsuZUbF6zSV0np4Nl/VbEbyMLw+nzSDAusNBi+ojy8S1/6187Hyal+YqheNcsfcWzr1C7DP0ddRuGhXkKPpIb8sZkDN9T3EIOa4DfBiAN4z0HO+QvTTRT9Fb5YAT4TwsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025076; c=relaxed/simple;
	bh=pBygMOIvcuEmJLrm4TLVkJJlAHBe4021GwpqcpfCYZE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OXAamF+5Osrgnji1ErJLYL+jR15qjbJWEWJaj/IkNgms6LwGRocBrz2xqO8Cht8EiAX6YVhx4OtI0QNG/IPZm0MeawMUiIgCRxCGVNWPNgxdqUpO9K3yfgrnPFdvCQ636wlhOwk7IUuV3ieF4QfexczmSIQOZ6OQuWZ50eoraYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux486.org; spf=pass smtp.mailfrom=linux486.org; dkim=pass (2048-bit key) header.d=linux486.org header.i=@linux486.org header.b=ETqCCur5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nm6++EBa; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux486.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux486.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D5A30EC001E;
	Tue,  5 May 2026 19:51:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 05 May 2026 19:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux486.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778025073;
	 x=1778111473; bh=DsdmlQBRl1WEYnbG+23DCmh6nqvhJEysjH+9kr4wIuw=; b=
	ETqCCur5QDXXA3UTD+fLfBP42xott512QTO5ogf6NASObS2RjTCgzKTTrXvG9YlG
	cay8Gi/zZbAv0trxTZVxhrdDQPsfGp4F1oxRYNxybD/FNi9bLhnHlERtfbOF+TWd
	GS2KOgL2HkLNCu3tMeix+qe1I7p0hMF53QVwRIiOBUfXNyIpmOEDApPfNeiUL0YW
	u4m5KJ1cVbBsBnbNhwDshji3EnP49J+8Ag9lMrsUQiQWMlqw0UPkrwDIJS7HrfLQ
	sPnU3KBgmWZIDc3qrTmCR90cbIbMoo9pSSqiDw2HHnVfmyzcFapvW/YdCqjXdE6j
	wcWiFJDss4ahDIwJqaG9oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778025073; x=
	1778111473; bh=DsdmlQBRl1WEYnbG+23DCmh6nqvhJEysjH+9kr4wIuw=; b=n
	m6++EBa5UqIBJTrblO66Jk+mAKMIKXpXt/dVZqgLZdc+xCpkL74t07peKX4u5ce9
	R3jyhs0lDSzOobESC4PXL0HMYoLYnZHN0u4xI2iOmy5SDlIz6A/9OYF767VWHkNC
	/XbASNQkbaL9I8ph5QK8ydyVs2uKc6PbkS5KyL1bgmgKhE3Ai1iRy252j/m8mVrD
	eQRBDO422U28fNFN3JkF1awGvl4cODxuV2JmNc33be1O7zgRI79nF2NJHCa81wSS
	cCi9qecvFXOQV+bUoHdhDmO3+Oco3aMulvOqN9L9uhjNeggEJrEw2/pH3xxBLTd/
	7b2Z7GKGKY7GIyDhQivqA==
X-ME-Sender: <xms:cYL6aRvrKJKQmGXbVRffwH_wjfpqvDkIWJiqlTWuOlk2rpjq7bKRBQ>
    <xme:cYL6aVQwGQGTTrcXsdgVNHbqrimWCbJe4nTruG-s1FlngcxkZi7G2IE4dvU9eOvA6
    Awlq3h9N1H1eR3rUI3y8rN-ADTlydxFgsxNC4HgT5tcE7kHxU_sUhyr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeftdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdetnhgurhgvficugggrlhgvnhgtihgrfdcuoegrnhguhies
    lhhinhhugiegkeeirdhorhhgqeenucggtffrrghtthgvrhhnpeegtdffieffuddvuedtud
    dtgeejheevvedutedtvedvgeffgeduhfegieevjeegveenucffohhmrghinheplhhinhhu
    giegkeeirdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnugihsehlihhnuhiggeekiedrohhrghdpnhgspghrtghpthhtohepfedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhstghhihgvrhdqohhsshesrghvmh
    druggvpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cYL6aVrOxfa9_U69fa8FI0oYr6qcSxb5wii2-okwYzGlxf-qqeQDZQ>
    <xmx:cYL6afY7YPksQQswV7Qd3VKLH11o53DNejbGxc5zSlw7sICbKVPhWQ>
    <xmx:cYL6aVQHAqlyVZh_GbULjotKZ0gevb3ME8ZDFPOKVNpgw0tKZRuIfA>
    <xmx:cYL6ae4XdGyhY0HjgFCocyzaBzw9EdSBsBLRErBgBDhWm-4IovtDBg>
    <xmx:cYL6aTSAfKm-vspk5gP4-LpP94uZa4MvZ7vpkJVxoFJjpci4QJIE29ce>
Feedback-ID: ifbd64b11:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5A9A3700065; Tue,  5 May 2026 19:51:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjK4HV-VrZTg
Date: Tue, 05 May 2026 16:49:29 -0700
From: "Andrew Valencia" <andy@linux486.org>
To: "Nicolas Schier" <nschier-oss@avm.de>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org
Message-Id: <1b5a27d4-808c-45de-928a-2310c7e26857@app.fastmail.com>
In-Reply-To: <20260414-marvellous-saffron-toad-8aaefb@l-nschier-aarch64>
References: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>
 <advGKvtLfEb1vwNK@levanger>
 <cc85769a-3f61-45bc-8773-322d3435bd83@app.fastmail.com>
 <20260414-inescapable-true-armadillo-1ab7f3@l-nschier-aarch64>
 <20260414-marvellous-saffron-toad-8aaefb@l-nschier-aarch64>
Subject: Re: Kconfig olddefconfig nukes 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E25594D4CEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux486.org:s=fm1,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux486.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-13040-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux486.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andy@linux486.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux486.org:dkim,linux486.org:url]

Hi, Nicolas.  Thanks for your helpful comments, I went off and read code and tried many scenarios based on your comments.

On Tue, Apr 14, 2026, at 3:04 AM, Nicolas Schier wrote:
> > Running 'make olddefconfig' (w/o a specific x86 arch) lets 
> > arch/x86/Makefile choose a defconfig file for reference (cp. head of 
> > arch/x86/Makefile).  If ARCH=x86 (or unspecified on any x86 machine), 
> > the output of `uname -m` is evaluated.  If ARCH=i386 is explicitly 
> > given, the 32bit defconfig will be chosen, no matter what kind of x86 
> > the build host is; and the other way around for ARCH=x86_64.

All my comments which follow are for an existing 32-bit config, a new kernel.org source tree, on a 32-bit build machine.  The starting point config is from a Linux-libre project config, config-6.18.18-gnu:

https://linux486.org/pickup/olddefconfig/config-6.18.18-gnu.txt

"make olddefconfig" results in a config with CONFIG_64BIT=y.  "make ARCH=i386 olddefconfig" results in a 32-bit config with no mention of CONFIG_64BIT at all.  "make ARCH=x86_64 olddefconfig" results in the same config as "make olddefconfig", as does "make ARCH=x86 olddefconfig"

I propose to you that 64BIT be a proper config item for all x86en, 32-bit and 64-bit.  For 64-bit, "CONFIG_64BIT-y" and for 32-bit "# CONFIG_64BIT is not set".  This results in config files fully describing what they need to build--and guiding any future olddefconfig to stay with what has previously been selected.

> > Thus, if you build a 32bit kernel with your 32bit config file on a 
> > x86_64 host, you have to use
> > 
> >    make ARCH=i386 olddefconfig
> > 
> > if you want to use 'olddefconfig' to let the config keep the 
> > CONFIG_64BIT=n setting.
> > 
> > Does that help?

Very much so.  The remaining suggestion I make is that the default be selected so that an old 32-bit config, on a 32-bit build machine, by default (i.e., without explicitly setting ARCH) generate a 32-bit new config when olddefconfig is used.  This obviously would depend on the "uname -m" value.

A small patch to (1) preserve the resolution of the 64BIT config item on all x86, plus (2) choose a default value guided by uname -m when ARCH is the general x86 value:

https://linux486.org/pickup/olddefconfig/uarch.diff.txt

Thank you for your help!
Andy

