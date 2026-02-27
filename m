Return-Path: <linux-kbuild+bounces-11480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDSOB5lioWnIsQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11480-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 10:23:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC641B53FF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 10:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6D530A004C
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1F73624A3;
	Fri, 27 Feb 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pFRgZ2S+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wEf5fadu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CD36A009;
	Fri, 27 Feb 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183967; cv=none; b=akLjv0DzSrdgyagqij/BDSbpPq2w2hQFI/OVxmrSxnxuYd7HTFkYqLBKGAxLNHaGH9Tjtql9BpjvWsmSY7jekpxg7AFFBEu2nKr5A4vaQUkw4DM3lZ8H+L9yRFe2SwM0Gu+9cTXYQ3sGdsnuVFUE+zrRAvzXkyKQtCiiDr9VtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183967; c=relaxed/simple;
	bh=14lIq3uIsoTUXmXeDVf8trioPIFd+HXq/khzmZE0brs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ce33+txE7+K4BIUOI694arr1bS+Bq6Uub0pgwJERAk8Sddq4AYavGa8m5oqZ+Tl18otHblcQ5FmQ8eLMqc/FDvER6sT2SeFY//sRlk/v9BSLj6xntwPW8amS1CwDPf0hQp+bHAbK6zCP5KdRgZ+H6rpmB3UVbNSAAQnTxtpBzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pFRgZ2S+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wEf5fadu; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4155B7A015B;
	Fri, 27 Feb 2026 04:19:25 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 04:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772183965;
	 x=1772270365; bh=JUOpQRrexySp/N8/7Xbn2hL60opnNztghRSTNtZVCfA=; b=
	pFRgZ2S+66V4AEba7/PDWXhj/bc2oFfGU5KB4cZxnNEdyUtZqEwpQWML1vHTlYhO
	3IX0O9DFP3BqW06/JFUZ6jus7/M682rbOi+V7JfKfJqArfuJtLiG7qSR3Iv45TY0
	rLBsmsfqfz+9cJ0jfHbYIrxwdLyJ47LBu7odhPkbAhV/Q4wwko1BZ6Xiq2rtUY80
	pnSjZ9oUuUWUADJrXSj2JLOZy/YNP6MPGJI3MTjjxkXIda7H2vl126X6TsjHW8Q3
	A0gqHygUSYWpBO1PJ2PotzJ07hPniJj6r+9N8mWwAMwx/LM2C4eax/5KG+LhT1aR
	fEWA/vBIaSeAZsB1hxwE3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772183965; x=
	1772270365; bh=JUOpQRrexySp/N8/7Xbn2hL60opnNztghRSTNtZVCfA=; b=w
	Ef5faduaVmATnoE8irdpOJRm28k4vMHmdlL7e41XLQcdOhGBy06IQu146ncMpsC7
	8PeuPI44LgGb68+pMfqh1Q6zqiUiUxcXcWpFUX/VOT4NTqoHRY/4cSHaMK2KBZFp
	aNmzyPYuzRHJxMSNQaqvOFwXzUZD9yAbh3Hb+0OlplJPwHNKvoKcAXiLLgROCCqf
	jW1yyhkrCn0BEUnXfF2wSyGHhKB+dQRdX0QXXElo9vDsibBPfqPKDFM96KAFztUP
	bnEfOS3fcU8YnzqrG7EUTCkecOrKy3kt6qbG4VixJ3+Eo8DnibR48YRpHO10o0PL
	SzeQk7vxbft9B5GC4Fnuw==
X-ME-Sender: <xms:nGGhaaBT9g12G3SZQD4xogk0OkEAmDUynIvmF7zgT-HSDcXhQsGlGw>
    <xme:nGGhafUuEvQ9pBVI7BJORPartZ10eXUjUTCcfNL6rxOhN27CxaE7NuZGjoNPZ4c2z
    zSNKjNy_AGCVTggY31nbT_5v_fJh0WPisRcf8vqlVW69UhZeis2v2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsggtrghinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrth
    hhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehlihhnuhhtrhhonh
    higidruggvpdhrtghpthhtoheplhhinhhugidqhhgvgigrghhonhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhuhhdrnh
    gvth
X-ME-Proxy: <xmx:nGGhaUy4xg3r8GId7bwe1nNiYECzU9wZxY9i84eIWZHCCEeV80FvPQ>
    <xmx:nGGhaa2g9GcgvK3WLi9T6XX6pP14Euh43tnh8B23CEBCjqvZS-WW1g>
    <xmx:nGGhaZ-sHbgUpFHNNQN5pBFmtz8-zAcXGuxq1YiNM0F0tdsL1kceXw>
    <xmx:nGGhaSoP2h_UOv0i0fQGOvNxzwHdqKaTBB9owUVDoODNdvzqNPl8XA>
    <xmx:nWGhaRE53ELuZk5_JT_B7LLXXsxNdLDccwwQpisrmN1mJZVK2jG6Bi6e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B359A700065; Fri, 27 Feb 2026 04:19:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxRtHzFcvrMk
Date: Fri, 27 Feb 2026 10:18:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Brian Cain" <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Message-Id: <67674db4-4da2-484c-be59-c97144083179@app.fastmail.com>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
Subject: Re: [PATCH 0/9] kbuild: uapi: remove usage of toolchain headers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11480-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,arndb.de:email,arndb.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCC641B53FF
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 07:37, Thomas Wei=C3=9Fschuh wrote:
> Currently the test compilation of some UAPI headers requires a toolcha=
in
> libc headers. Remove that dependency.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Nice work!

Acked-by: Arnd Bergmann <arnd@arndb.de>

I had toyed around with a similar series, using a slightly different
approach of always using the in-kernel nolibc headers, and making
those compile across all architectures (using empty stubs for those
that are missing syscall entry functions).

I don't care much which way we do this as long as we can build test
the headers, but I wonder what your reason was for picking this
approach over the other.

     Arnd

