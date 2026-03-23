Return-Path: <linux-kbuild+bounces-12207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ6vNo2IwWn+TgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12207-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:38:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A42FB64D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C26B31CE5BC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C360C3BADA5;
	Mon, 23 Mar 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="rb8gdWzQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="opOP0Cn4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77373C943B;
	Mon, 23 Mar 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288748; cv=none; b=Dpu3E4LRS8aJsyKLSord3X9tdUkeLrZGUKSoRrXofZZU7ibfc7i5nbj8ls7FFdSZDO5ve4zy4KHz8Z78NIwIJczSXClfqNNeDOYdyEH6tditkDw3shbhIC3fINgo8f7yd9PPVY+RADYT3nK/2966nCramc3UI3SlBVzgYxlWmD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288748; c=relaxed/simple;
	bh=j1FWHe9jwWjkNs9gzjJNhlaEifSnDtsRil6HrY0/wds=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MNZ3h4Z4Q1lNTd1D4cg/f7klYST8NY2nAN5Ild8LJzGTqhGJZAHw56iBMUVDETNRc1QMOmeLPolvW3tzuBkxQuoWFhZXcuXGsh3+HWryZtbBM7vETqkTjuRS2jF0x1YR2P+yiCz8f2IO53Fu2oXiTSCvGswKc8RPSTzL6/J9JG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=rb8gdWzQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=opOP0Cn4; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E716D14001FA;
	Mon, 23 Mar 2026 13:59:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 23 Mar 2026 13:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774288745;
	 x=1774375145; bh=9//ngg5kruKbTXJVMtBYvuO2Yyk5sA4yoS9uHWcYrNw=; b=
	rb8gdWzQVB5tVaNMZwPuConUKvmU822ggoi5oYQm0vM0a02VJp5nSwpsad+tRnpK
	/miIFh0la18u/BMLyobqy5Ud+kw3bjiAfMZH8gjDnpC2GVZcjGhA3xNIWySICxX0
	LHCCgvQBXvmPjT0p5ShIrS2s6Syl07Dn625JBa0re8YmE6S0LURYtqXMmVo1oKuj
	Htjw5XmqmWpc41JQPd9oiJxlGfqDSWz5rPpfXGSUMwVB4SPJHMjxPyIkXFpAuhIi
	j62XN71hM16XUKF/7qYQpvIkllJdvBJ/KNTHNKEdUAS3i0aIys2U5thsaN2H2ywn
	8DezqVbSfaqH3jIaQ3dFyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774288745; x=
	1774375145; bh=9//ngg5kruKbTXJVMtBYvuO2Yyk5sA4yoS9uHWcYrNw=; b=o
	pOP0Cn4bvlSZuEaksJvdfg05x8HVkeAyEz0y29TJh18EQ2KQdTHlwKJlSMRKJWqN
	IPAmAeIHRZXSNTj6DCtyV4qnqXz5eFoE2qXYePxvPB/zjsk9amuY+hCi1j39q1u4
	IyfBuY3rVWXagnh1+zAAHSvOYmsq25vCmWu/RNEOYGN8GCzAMuTjxLqogv3BYePG
	ejCXMYnnd+fHyDDZTGKaWp6hHOfc/2ARVmIayFYokNGvIjnRQ4ODPoum8z0xGiX9
	JecXlCWzcKi13GcD6iPg2DvKeq1xqZyxlU9nrpXIW5znZng9UJf0rdpXxFfP7upe
	d17voTdmfLIKJatMgWLMg==
X-ME-Sender: <xms:aX_BaZtlt5TvwsgmuXNStxRb4wvwoAPnYiApLGAKgVQwgxJic-BTKA>
    <xme:aX_BadRY0gcV1cpIAtgpC9xTrolETBK875HgJOcOSlOD7167i2ykkMAb3VZv5Il7r
    fcMLo4lzuarkkmF7fzTuBIYi9h8IlsOtaVRRu2ZErRpfXa7mfYxAHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudelfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrihhtvghshhdrlhhishhtsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegthhhlvghrohihsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:aX_BaelCqb8kBDifuG9xZCCkolGtkjL57aUvhwlx2PrTq44MWS3DQg>
    <xmx:aX_BaQisoIx-yth0qKcTpXtesnC_IwxK7D1gSOA2n3ynjitJhzxRXQ>
    <xmx:aX_BaTQiGM-2boqCwl-kMf25dz8QWvNoL5qnuEKsWrn-Wwe2HZaHDw>
    <xmx:aX_BadjjGRmY6WBMtQbWCvxirw6Iktw96dlR0nOzNK_FmOiK5XkuPw>
    <xmx:aX_Bad3IPYan2AFPPeAdLSNcEZEzppxnYv0gOD7JjIK_M2Xn4u74tsQG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 83BEB700065; Mon, 23 Mar 2026 13:59:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AKWsChL5O-hF
Date: Mon, 23 Mar 2026 18:58:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <chleroy@kernel.org>,
 "Venkat Rao Bagalkote" <venkat88@linux.ibm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, tamird@kernel.org,
 "Steven Rostedt" <rostedt@goodmis.org>, ihor.solodrai@linux.dev,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Peter Zijlstra" <peterz@infradead.org>
Message-Id: <00d4c865-3068-4f98-a32f-e9565cf1499d@app.fastmail.com>
In-Reply-To: <e6db8617-6b12-4f90-967d-85c9f7805823@kernel.org>
References: <20260323073220.25798-1-venkat88@linux.ibm.com>
 <e6db8617-6b12-4f90-967d-85c9f7805823@kernel.org>
Subject: Re: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable
 warning
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12207-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.882];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: 3E5A42FB64D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026, at 11:14, Christophe Leroy (CS GROUP) wrote:
> Le 23/03/2026 =C3=A0 08:32, Venkat Rao Bagalkote a =C3=A9crit=C2=A0:
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..2fd744bf9093 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -308,8 +308,10 @@ static long nvram_misc_ioctl(struct file *file,=20
> unsigned int cmd,
>   		}
>   #endif
>   		break;
> -#ifdef CONFIG_PPC32
>   	case IOC_NVRAM_SYNC:
> +		if (IS_ENABLED(CONFIG_PPC64))
> +			break;
> +
>   		if (ppc_md.nvram_sync !=3D NULL) {
>   			mutex_lock(&nvram_mutex);
>   			ppc_md.nvram_sync();

Right, this works as well, though I still like the idea better
of removing the mutex and all its callers, leaving the locking
to be done inside of the individual operations, as they all
do.

     Arnd

