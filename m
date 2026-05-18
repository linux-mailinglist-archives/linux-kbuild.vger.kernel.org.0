Return-Path: <linux-kbuild+bounces-13250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAmUIvfGCmqf8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13250-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 09:59:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A98568475
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 09:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD853003EA3
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 07:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC24B3AEF4C;
	Mon, 18 May 2026 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WRZM9xmq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D/JARF58"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A25D30568D;
	Mon, 18 May 2026 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091184; cv=none; b=md4ZjxajmWXPrzVJceLcz/iJ7mcqgh+89AczUiUkzlu7r9TDeW2Tp9Z3o+NUrkQOiMUzLEyCVisIiUz0zd+7zOOWtCqxONpDI3OCziK7XSf7B4wFzlcwICOSQFwioyIWF2uFEUftSC/C++X+mLa3y962C1hsIWlE82AZXm9wuFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091184; c=relaxed/simple;
	bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DEWNHFvyzMdQBikzhEzpabNIFZ+5ULpfFjyLDDtTPOlWZHtiQiyzTGkiTMdV1+UQ2LOXbkL0D5uRKdDHethbetk0sbNVaHvP91zKmgJ+IG2bDWqngatiIaxtwa1tQ+LHd3ABwZPsexZX57ykvwa8iaVrWlOUsJRzQbf+Lb3m/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WRZM9xmq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D/JARF58; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B89747A00F0;
	Mon, 18 May 2026 03:59:42 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 03:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779091182;
	 x=1779177582; bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=; b=
	WRZM9xmqxYtj848T5aFJJlnIYwPS6O9ybs6W29pknf0tC4wgq5l77xmRAxzv9JwQ
	WOPRSBcNjEmowEEafT9br1z7OqRJ2rHi+nCysCcQDjdtmU0WBH82NEgYoUIyCR71
	7nmy1H/MicUoArmow7nI9gw3+W7eBtbjVNdoaP6dIVxCdMlPqw15eZjKL4h1yRsh
	5O20JVS3wkocI3pAs0D61RyAiEx9u1q4NyYp7DP03eQndnuKf+t/sMHHIiQ8M7l7
	2KoGG/V38wQjhR6q8ON33Fsbb6UDH/koBMcOI+Fq11sOikPhVTPrr25Jlz6PnBr4
	mKz/r+3Y1i7T3f3KMbVy9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779091182; x=
	1779177582; bh=+KmCn+mTkHPH5ZAxqmSOpN0WELh6JdKYdne5LrRISsg=; b=D
	/JARF58TJUSQyLqcyWaZ7MqPWcIgBRFuKktKuaTg01c+1N9g2qwn1TJKQNWMRS9b
	eY0BRZ4Ib+R2hYaHDWx6jSNrNWEygyRxWEr22Fewe8WZ7cOwsaEHGzgoTdVmDlDZ
	Ueh+oH8X0zb4pwUq1DmmtHGJ+gdUga8CSlhSN8WghBZ+FbBcY2Kqq81WJhyOeBs6
	hwaN7ty3THg8IQQeoT0RHr2+I6COFjKkZPegNX9RA/HK2IYFbSkObLZ+1VDTkuKj
	/khzyCWhOmTck8v/WP2ZAihg9C3AXE9gGEcBerXbhDFYGeI+J2yonjNogPHma9u/
	DE0T5+iTZHVWQdTYgOhGw==
X-ME-Sender: <xms:7sYKanlFumOsSXzPRXll5tBlTGd3P5AHxZAYS91BP97FWuq7_bfWLg>
    <xme:7sYKaloe1aX6tmZ592PNpWE59Xd3ZLQTBQ4A_MW-EGQdVjewZYv-XsDJPsWUNkQuj
    xAlby08Sm6ZU3Wg6g-4K7xti5LJrHb_5UNFZEEurQmUak7MEq38VRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpth
    htohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7sYKanKZW10_0xy0319p16Qm3Y90W9h4WRyTkj6QVUdr1dlIXg4CKw>
    <xmx:7sYKanCU2VP7CU3Lty98GicAXKJI-oBIje6SIiJHY5fbNRdip4lnqA>
    <xmx:7sYKasvuC_YchdmY5x1Pq8FPqG404sFheA7oMlNv-L4SiMyb5stehg>
    <xmx:7sYKalR59GWKK7B8x9jZBc9fktB7xia56M9Hn0BPfyLlcbSiztiSmw>
    <xmx:7sYKaiGn-PLoZwslguTORBU6KFDLe973_QcEE9wkPs2h6lbox8Z32ZG1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1EBD8182007A; Mon, 18 May 2026 03:59:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0NnAMceuwWo
Date: Mon, 18 May 2026 09:59:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <994710ea-450d-41cf-a381-33bcae5ad5fc@app.fastmail.com>
In-Reply-To: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
References: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
Subject: Re: [PATCH v2 07/16] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E2A98568475
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13250-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,armlinux.org.uk:email]
X-Rspamd-Action: no action

On Mon, May 18, 2026, at 01:05, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the '!ld.lld || ld.lld >= 16' dependency of
> CONFIG_ARCH_MULTI_V4{,T} is always true, so tit can be removed from both
> symbols.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Arnd Bergmann <arnd@arndb.de>

