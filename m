Return-Path: <linux-kbuild+bounces-13062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GueEf+W/Gn3RQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13062-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 15:43:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4A4E972A
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 15:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7856430039B9
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 13:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836583F0AB2;
	Thu,  7 May 2026 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="I8QbKEYN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WPsnMDgP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659F36C0CB;
	Thu,  7 May 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161404; cv=none; b=pbciLHMSyJlqS/TgbLJQs4lyG8Cp3qtKDQ47xQ7EmolQMkP6VXYILke01nV2zRMBd6UArr6v8ngTo09eGUF60kMFpcArRkSJ7M1Pb6qFAWbos2nDYTJg+X2AE6COS1nE06u6VHmtM+HBBOMll69AYxZNJukpKjenly9ithY0qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161404; c=relaxed/simple;
	bh=3DjHDTS5xFkM+UG3vD77K+uAGDt02pfQuyhDqP5LP2w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WnroEk2gp3uURocgUL5DtHwNBwNLfMYcq2Ap1QTNIcXBtP0y+2cwkKU7Mwd72talD/lC3x4X+YwjycFJeOIFETbym6T0fRs0XsmTJf1SrZEisN1uC3zoON3IWvX2akA4AnhUwoCd1f9WuEO61AdrXxRplVTM2xtTsKO5L3gE80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=I8QbKEYN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WPsnMDgP; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CF8D3EC008C;
	Thu,  7 May 2026 09:43:21 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Thu, 07 May 2026 09:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778161401;
	 x=1778247801; bh=jtkRB6gplJ05mBAs5H/wb2XE0uk9al8gua7nMF6wRzA=; b=
	I8QbKEYNYTCdjHsFRYJwtpNG1AkGYvHrOAjK1nEXjOUWICyFAAQkPuwXQXbQgSKE
	uWIE6dL5nHZqB5u/+8F9eOXdEQPl5z7qrY7giV+Yxhf2U6TnheghE1IbY8MWtGkJ
	pxlk6dIfUOeDp7O/dAP98lZWide1AYiLnPQDK5mg2KxCtulg85fmpa4zjmxtX0DL
	mA2Fw8Xow6eaPfPJ/NGElLOA0S+tQyO8u9bf+rgch9IwNpjsbN+Zx8MeAvDegiJi
	PnojRg8y757vIYNN8ks/yJUBehFNTwxb7rU51FEVjRPPBECNOoruNJOUDBiL7BU5
	WdJ+aIqYcJ5BQJSlDKsQ3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778161401; x=
	1778247801; bh=jtkRB6gplJ05mBAs5H/wb2XE0uk9al8gua7nMF6wRzA=; b=W
	PsnMDgP1VKkXTtBtQIg5ZLF83jktjHsF0K11S7359DMhtgNluidvRlEHmpySJlVJ
	/z0wrmWJKF+XTk+Ry4LsGjLkYC9nXBuIHBVqdjGdpTmzd1B6/7eDhX53gc4Nqw0P
	G8ZUxzNnyKw3dmh0b5siQFGlSmjxZyjR5B7MQN0LR7Y35W2XbWdeKajDHGmiAkK9
	gHW4lxrCkXyOg1ymPSlHwSQpsoEYfZpom00+5sv/4ez3P7ANBbGWs+psd3/rnlNu
	OLUxXVC7RLuyAxAnZ/skt30Nm/OFpIwp6h4TvY55lWSf51i3KRFPi4UIJWde+6qu
	6WPWI8A6vyVjccqyR9VwA==
X-ME-Sender: <xms:-Zb8afITD7A_Y-cwa2F1ccYQ5l3UME7gjdRQJzfYLo9N5OZTx4c72g>
    <xme:-Zb8ad-9_ZwUpowTj-FlOfk4w5PMynt__0YMksoE5iUk1EIF7MsZm65-C8IK7u9e9
    4t2Q9E5iUX-cirKfg7NSSvQll7yhQcnHb3-OWGT-tf_0tbpFIudNt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdejiedvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:-Zb8aSF70mvBlJ95YudALOZ_DTJ50Lyq7iwtJeonVSfEvJdw7HfxHg>
    <xmx:-Zb8aYhaKlRAUQegyR_a77bHs-f4pumGmzeexpesuu0R_FEivWPhWQ>
    <xmx:-Zb8afhDKWhkhiT-IsfPjv8DaUYELSN2XH6QMCv4n_5z6zr75ivVpQ>
    <xmx:-Zb8abn_YMOrv_8nrjId0bit1H5cJgXdHt3YJ5yL5THnNmkSTo1A-g>
    <xmx:-Zb8aYdixTShNXr-rn-YTduMylbYZuo-H7rx2ssauGP4pfxM3y90-Am2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62BD11060065; Thu,  7 May 2026 09:43:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A6WLQDAqktbJ
Date: Thu, 07 May 2026 15:43:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Konstantin Khorenko" <khorenko@virtuozzo.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Mikhail Zaslonko" <zaslonko@linux.ibm.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>,
 "Vasileios Almpanis" <vasileios.almpanis@virtuozzo.com>,
 "Andrew Morton" <akpm@linux-foundation.org>
Message-Id: <c66e6c37-2068-4adc-bd25-3f8aad9c5195@app.fastmail.com>
In-Reply-To: <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
 <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
 <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent access
 crashes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8EB4A4E972A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13062-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026, at 15:31, Peter Oberparleiter wrote:
> On 28.04.2026 22:56, Arnd Bergmann wrote:
>> On Wed, Apr 22, 2026, at 14:51, Konstantin Khorenko wrote:
>> 
>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/ring_buffer_benchmark.ko] undefined!
>> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/preemptirq_delay_test.ko] undefined!
>> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/synth_event_gen_test.ko] undefined!
>> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/remote_test.ko] undefined!
>> 
>> ERROR: modpost: "__aarch64_ldadd8_relax" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> 
>> Since I build only with CONFIG_COMPILE_TEST=y, it looks like these
>> are the files that explictly enable GCOV, and likely all others
>> would run into the same issue.
>
> So the use of -fprofile-update=prefer-atomic in the kernel causes link
> errors on systems for which GCC does not support built-in atomic ops for
> the 64 bit profiling data type. Your test triggers this due to
> CONFIG_COMPILE_TEST but as you stated this would hit all GCOV users on
> such systems.
>
> I can see multiple approaches to address this issue:
>
> 1. Drop the patch
>    => not preferred - crash would still remain, and the consistency
>    improvements would be lost

This might be an option for the moment, until we have a better
solution though.

> 2. Make -fprofile-update dependent on !COMPILE_TEST
>    => would enable randconfig compiles with COMPILE_TEST=y

This would still leave the same build failure for any actual users
on the affected systems (x86-64 and arm64 at least), right?

> 3. Make -fprofile-update dependent on the result of a test-compile of a
>    user space test program (not sure if there is an easier way to
>    determine whether built-in atomic ops are available for the gcov
>    type)
>    => would enable fix + improvements for all environments, where
>    they are supported, but requires slightly more complex changes in
>    linux/Makefile

This seems fine to me, but I wonder which architectures actually
support it at the moment. I assume you are successfully using it
on s390, but if the two most commonly used architectures don't
support it, it's not clear to me who else actually can.

> 4. Provide wrappers for GCC libatomic => kernel atomic functions
>    => would enable fix + improvements for GCOV users on all systems
>    But: bigger change + linker errors mentioned above suggest that
>    GCC libatomic function names may be arch specific which makes this
>    approach more complex

The lack of libatomic support in the kernel has come up a few times
before, when driver writers attempted to use standard C11 _Atomic
variables. I think so far we have always reverted back to the kernel's
own atomic_t implementation here, mostly because kernel developers
are more comfortable with the existing memory model, which seems
to have some subtle differences from the C11 semantics.

      Arnd

