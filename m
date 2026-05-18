Return-Path: <linux-kbuild+bounces-13249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBhQF1vHCmqf8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13249-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 10:01:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326756850F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 10:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0771A304EF40
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 07:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6473E1682;
	Mon, 18 May 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iy1QgBe2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qN1NmMMu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911733E1221;
	Mon, 18 May 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091006; cv=none; b=FvvHICbZP9i7WqsPk+Cne8j3vXNZ7r9rYUveEUa6/HHKYCDnPPKbnBOrKzIm2bkcM3Qblbg4ejFJJryySyYYGU6ynBDvRWHB3+XbUVzepx0QmD3UZTFM3pnhIpSlTnyCYxiUgUB5WqsY+IShnDYG+VTEz+FZ+tbZfpi45dYzdD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091006; c=relaxed/simple;
	bh=CBz2hh6/uzq8FP5lgUuysOEvdF4X/S44+bNJDQH+BIE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EJpfhnUMTn2RtmRbuxC2iaMZWRhxo6ZcOzchU4nzbJBWNHH0IYJz9nl2kwfHSPx7S4fJ4rrWGBfK78wUk92UzPa3XOVe/FdjnFXOttSYX6IHBs641iyrrkPNZFKnmmY6bgW3AN8tKo474Cp1QSgD2N2tWCB670YTKzMExMecbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iy1QgBe2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qN1NmMMu; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E89127A0073;
	Mon, 18 May 2026 03:56:40 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 03:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779091000;
	 x=1779177400; bh=jr9C5p2W4VajEq9hBtDLIqY0ryo+qiBcgXCFSTgbPJw=; b=
	iy1QgBe2+IZXESmRPm7g3L1uuMBTJAQfhI1hnOi2QSRn6XzwI/4018j6nwsAzlcs
	lvzsy/y90Q8YLiIB3WSaNfRiorlj820POJC/x6XqTag0l9fU+mTZ3zGlQCM7wv+I
	/MOqcEx1XRDYGM8MLA7ioz7J2830L0QfhCRqSeyzh+oZ5t/T/5hlkmXFFg5a04+E
	1St4nvVjz6Hf0tpSnNiU8GYJw4AU0dj5jmew2TORYdWDhURJr6GiFVryj6c6ydko
	ialHeghvp/wr+CHSOQAASyU+GWwD15qBOlbgPtluCls/dVBp5wwQEi5olHGBpywA
	bIYN4J3vUbFDDHsnBCMPHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779091000; x=
	1779177400; bh=jr9C5p2W4VajEq9hBtDLIqY0ryo+qiBcgXCFSTgbPJw=; b=q
	N1NmMMuO4eG063FBsFzNNO3qNeEhNy2tY6j0jPIpcX7Cm+aIkC7AuzMNpywz1Ad1
	Y1pjMeR2tTJtQjyuT96wRgg9tWxsMF4nlWH77qnmTGWIV5QF0A+0E9PwAEzpiFIr
	JFSPLMLWGv/sQsNhyK1h7lXwxn8XANMO5Hpshl6aojVoMT2jVYOg9tZqbTIV8WCq
	qagEwqQKMGWp1hzv4WgpP2B/HOyea3CWdgwk4aCwPTd9ew03jKWEN3MG+PgDeY4v
	4Rw5k987RjZNlLULLDXkX40Zo4ho57ThSz9ZMHm/3IZ20c7AoFT6slxQkF0Th5dY
	ucMDuMoF4hd+utP1atP3Q==
X-ME-Sender: <xms:OMYKalWQYkTJ14tIjWJwXWWD_yxjt66f_IQnCQLg_yKRnUdLnIt8Eg>
    <xme:OMYKagamjks7WYJ7W8Kb8EGWLodHmTlMJyzmZ7R52oS9Wi9DyNx2Eh07CrFpasBeK
    QvUxVoHZEqY1z4vANcNUXF6TsByVoPKEvBP_SmBlDuK6PzC1VDCq9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilh
    drtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnrghthh
    grnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OMYKamGkZ3Xa6BVHNlulQO3fKYWU78tIcE1nT6_-gaFoqCA6xxS6IQ>
    <xmx:OMYKap4D8PSFWCwGSo-3wPxHiLyggtZKgQuOyFOe0w3SQn6SFU_Qkw>
    <xmx:OMYKajxTN85OxvsVMIf3jfQW4mph2n2uLpKpgIOx_9iboYZe833oZg>
    <xmx:OMYKagMOM1PKMTwWbswHBVs4WyWZMBlXHUFRdWxCGQ2PlJa2Reg2uQ>
    <xmx:OMYKatYj4WXhWs1k2XXpIdqpPmtTEwbelnPdWbsRrA6tdrtx6r522KJK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 751721820082; Mon, 18 May 2026 03:56:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4SyA_u43ugN
Date: Mon, 18 May 2026 09:56:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org
Message-Id: <6e555229-ae10-4304-ac1c-3cb02278f77f@app.fastmail.com>
In-Reply-To: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
References: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
Subject: Re: [PATCH v2 05/16] arch/Kconfig: Remove tautological conditions from
 HAS_LTO_CLANG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1326756850F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13249-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:email,arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Action: no action

On Mon, May 18, 2026, at 01:05, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, two dependency lines in CONFIG_HAS_LTO_CLANG
> are always true because Clang will always be newer than 17.0.0, so they
> can be removed.
>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Semi-related to this: we discussed a few years ago that we may one
day no longer need both full-lto and thin-lto.

Is there still a need to keep supporting full-lto with clang-17+,
or can we expect everyone to use the thin version thee days?

        Arnd

