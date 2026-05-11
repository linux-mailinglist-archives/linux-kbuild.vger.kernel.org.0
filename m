Return-Path: <linux-kbuild+bounces-13114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMo2JjfDAWpwjgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13114-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 13:53:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0250D15C
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 13:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD46F301BF68
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F7A374187;
	Mon, 11 May 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KRCeTMIC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="suOnb/J/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B70372662;
	Mon, 11 May 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500181; cv=none; b=FTlNKj7/4eWQLidNgwZZEt3qTOWPAXc38nCfO75gSanydeakYF/Qic4v0AJkuxQMdHH7GdQ5CN8QJaee7t6K+aXnrUZdNnzkyS5O3HNVHXT2LYphgVfK4jrwtgVHqU+k6GveAkrm8XEt01Rl68LP+rh2DAHj0qoECOjV0Iv6j5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500181; c=relaxed/simple;
	bh=Vuthmbx+KbT08W6WtoHKrzlAgVisoKlpiYQ1uuuTK1Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FsBtRBWYv7YW+mlQr6vWg1eUAUe4/Q3Jl3vHe/5YBxOx4Yh15tecb76T6EWpRvyHKfgJcrv/qMOGC843264STYWFiE/w01MO07hDPxL8pR238liNCp1G3ua/M54YbIithwciU9fzMhwJMn/FavxCRzgqoOreUAdRKDXM5ey64Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KRCeTMIC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=suOnb/J/; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F11207A011B;
	Mon, 11 May 2026 07:49:37 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Mon, 11 May 2026 07:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778500177;
	 x=1778586577; bh=5vrmS288dug9ATXA6o/53uFikNkdoPDuNlhmtbvkQIE=; b=
	KRCeTMICn37bf56D29Cp1C5K7+y5bqnxZ4Pnf1lVjMxAY9Akju580z16KEb+OXd2
	5jBeGac1bg0XvTBp9JU3s0aS3CeVAEsBpvia2Aj2O634SyDlpkyhxQ+J3biGWrSl
	Pet9FPnOuHeicHwbyqUgaB+0/l7A+5Usce4tAnbjL3NW6FV+wPlYE+Ehse3ghha2
	c8VUJfov6Oo6Fj5FSoHqFkdryaj4gEFHOYB3SDC1Q0iRl0WvFm3w4CxFWGdZ18ZO
	lB3SY2LW36bRMF+wd1BOi0n0L+VBzc0MHPWH96uZiGi5Gk4uGKvZ/eRulnB5cx2M
	dW6P772j5L/gpKUXyuwOcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778500177; x=
	1778586577; bh=5vrmS288dug9ATXA6o/53uFikNkdoPDuNlhmtbvkQIE=; b=s
	uOnb/J/5tq99r8hqHprkGrodpzOnqj5S+2kmXtkggUD5VR+BzNJpS9oTv5ITBHmj
	275X8b9T+NhtUyTU6NwLjnvo1YKzJOGfE/IPnnpiQJkv6AsDfTeBdSq485lyYkoY
	M6WAAbdt17lsR6kJSKmx6OdTYbxvgiRvaQ2Xho+OkPdDWjz+qI7XglMvh+N44jGB
	tJRmMe49wU/EmzrImPSKDDu/C7AsvwHSNDI7sus96jD0sLZSUuNR2eTcZ94h607s
	/K4dudgqs7vBCKxRkg1+GvhHyWOhvrKLsyPg3+eDjZN4jRXARvBj4Q8jSD6CjdPy
	oHwKdqUsieOTr7rzCMx0A==
X-ME-Sender: <xms:UcIBapVWwRvKqqJtxnRcpocCAwGKIaD7GI7i9N7EUnZRFDbUHes3xA>
    <xme:UcIBakaPBmjk3nJBQFL7lpTuo0id1KEz4rg_222G7-0YEGTOOfDgCwJZbEmUN6Nd5
    vdwgYTOP10oXU_FjR4GKxSVorZMR4aRxi4pPi44lC6vlvbhxkB1dIlj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthho
    pehosggvrhhprghrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohepiigrshhloh
    hnkhhosehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgsuhhi
    lhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UcIBao-Qu1S0i8siwHCBKjm4BgDzqi7wmAls4uQRZALam71Q42EmAA>
    <xmx:UcIBavOO-_zGlmREuRyacqXg99o41jmIBVYMN1fiBWAs1CFt2wRKhg>
    <xmx:UcIBaphurNnRl7884jjCnFrOnXSZUDigYrkofdeHuGLP-1wowe7Xuw>
    <xmx:UcIBaik6Y0CY1Fj_PR0Ea4PDULVIMWLwXzHGEuPxZeaD1edLsDJvuQ>
    <xmx:UcIBakihuOw12KLLUDuLAjQm9cMT8cZ7WnOOS04Yuk_WsFWpe9Ouwlby>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 38B411060066; Mon, 11 May 2026 07:49:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYkZ7v-3APXo
Date: Mon, 11 May 2026 13:48:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Konstantin Khorenko" <khorenko@virtuozzo.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Oberparleiter" <oberpar@linux.ibm.com>
Cc: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>,
 "Mikhail Zaslonko" <zaslonko@linux.ibm.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Vasileios Almpanis" <vasileios.almpanis@virtuozzo.com>,
 "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Message-Id: <f6165240-a3b9-4612-8d25-d8ba3c36f42a@app.fastmail.com>
In-Reply-To: <20260511105052.417187-2-khorenko@virtuozzo.com>
References: <20260511105052.417187-1-khorenko@virtuozzo.com>
 <20260511105052.417187-2-khorenko@virtuozzo.com>
Subject: Re: [PATCH v4 1/1] gcov: use atomic counter updates to fix concurrent access
 crashes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C2C0250D15C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13114-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Action: no action

On Mon, May 11, 2026, at 12:50, Konstantin Khorenko wrote:
> On architectures where GCC inlines 64-bit atomic counter updates
> (x86_64, s390, ...) the test passes and the flag is enabled, preventing
> the compiler from merging counters with loop induction variables and
> fixing the observed concurrent-access crash.
>
> On architectures where the flag would introduce libatomic dependencies,
> it is silently omitted and behaviour is no worse than before this patch.

Tested-by: Arnd Bergmann <arnd@arndb.de>

I've checked this with my cross compilers now, and found the
external function calls on aarch64, csky, and hppa. On x86-64,
the trivial scripts did not reproduce that unless I also pass
"-m32 -msoft-float -mno-sse", which is what you get from 
KBUILD_CFLAGS.

      Arnd

