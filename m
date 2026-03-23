Return-Path: <linux-kbuild+bounces-12148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHwsOjrzwGkSPAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12148-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:00:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 171DE2EE020
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BC3D300460F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150A636EA9F;
	Mon, 23 Mar 2026 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Q4v0qSqV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QKI8n+1y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80929BD9A;
	Mon, 23 Mar 2026 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252845; cv=none; b=jPlbdRCcl9OsPEM4WFXRDT1+Yl2CUAJGQpL7iqdU0Elg5pCK/vr2o/oWIT9J7gORbsc5tnCrglVCI5h8ihMgEffQgRpyJ4ymy6UXAYRGNO5HMnc7VK7iSlUpyiCqlI1aYaYQZlMaMSWtkqBOkjtoQg9pyksBYxp+x610n/K8RLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252845; c=relaxed/simple;
	bh=8Xzy68ibMSjPHFdKYgn8Txsq1pazKXZsQO98PECkwQk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GhxIQftCICCHNvDqePlUqgXE0gG5mLg8c8YVH8aHHdzJk3EEJw0e3UQImnUb3EkZMOaeB2t3twQIwlrcIVQ83dw6/cjp8GHJwRCvb1zJFW1opgW/hxhq+oiSb1XM99xkwyJpqZXg7IJaKxy2uKb8CjqQWWq+IAH6F+2cwzDZH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Q4v0qSqV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QKI8n+1y; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B55C9EC01C3;
	Mon, 23 Mar 2026 04:00:41 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-03.internal (MEProxy); Mon, 23 Mar 2026 04:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774252841;
	 x=1774339241; bh=ahNZBT3UKtkfPRUQ0dmTVXR+3jFla3v2yy/o2ErGnb8=; b=
	Q4v0qSqVG/xHcEo6j1AUr1Uv4BgKmbCafCWBE0PPCHwn6FqXrM7oCY3FCEoUwWu3
	Pl4VI3ViaokTfmGFQEhDHkr6K4GRrFw4nJBtjTV1vXDlscE5mhbjeky23Mhv1X36
	37PZLtjE+Z9x52+PydsqrXhSXB4cKeYLXNNVmvyPaF7noMzPam///5vYiD8qyCSq
	V1Y/OZh8ayCpEgtpxPoV3PeQMxwGOmmBcGhvi1sUavOEoMa73VlgK6PMnPe2/C7C
	Y7zq0XU1g7MgYspfgmDEVqYtJWdi2B2H6UPtRl4QeepmvgbYOnJQFd/A5k7Kcwb/
	lP0LvmIgMcqyZ2rlFZYS4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774252841; x=
	1774339241; bh=ahNZBT3UKtkfPRUQ0dmTVXR+3jFla3v2yy/o2ErGnb8=; b=Q
	KI8n+1ybymxT55nAB5/jisKmAXhzqVtMjnGwyqzyHKvgKR7FYDraOlbseakSUo0z
	+ecddqFl9NYcUHItbSANNr/C7SJ/8yvEktuGhCFybNNV/KPyB2aj08KtCGoKghQV
	2QHgplj6VnFrsW2CHEYCWHVPrSxfWHYbTz/yRetX0bOgUv5pur8fLLLq7T+SrPlN
	mIfwcNzfbSgph/LkZqnLhggCRW73XKF1j71hlFhaqPN7JAQ3M+vagFwlLkBPbeLm
	zqIFE2QjH9NG2ChuRQfJppJtii1330RGATpJwjNLWX/UZqp0c3Sm56jD5H7oIGFM
	zYRUn68+xoq+iBXArihXA==
X-ME-Sender: <xms:KfPAacAnW-vORnnpt9Hc58_ZIMgB6dLMymk6zglUDhr0UCDKohS69Q>
    <xme:KfPAaRL2XxTzZTRKqYoHBsbQhtEf8FtMLYPYZWCdoGl00EPLeHAM_b0Ft5l2QJ5Zq
    cVZPEQUfWF7erOdMTaLmNow0JRUT5iFYLuOaoJls3-SCwxHZm5DCsI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrihhtvghshhdrlhhishhtsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmrghsrghhihhrohihsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehihhhorhdrshholhhoughrrghisehlihhnuhigrdguvghv
X-ME-Proxy: <xmx:KfPAaT_PO7zgxGZ-RrlfLdU5ZDHembkSUV-ynJwpMrnOl_21h9tnUA>
    <xmx:KfPAaeXqz_xfe441Kf_Sh9phSjcAUg2JZZg5Am6dY9lMKsLPk8sYvQ>
    <xmx:KfPAaVTORtP1FUFHLjHenjQSVCYker-ooAD5jSKm5eGzgCOYb7TdUg>
    <xmx:KfPAae2ydQ0W-XbUaHOhwbXIUnFMuShwFYXmDIEnDA2n3josOQYKDw>
    <xmx:KfPAaZufEv8dsEWXf4nEl-atNr5D1XC1_1rAf0xu2LJXSV98ocO8xdrE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1A37700065; Mon, 23 Mar 2026 04:00:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Auc-q4hEjBcJ
Date: Mon, 23 Mar 2026 08:59:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Venkat Rao Bagalkote" <venkat88@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, tamird@kernel.org,
 "Steven Rostedt" <rostedt@goodmis.org>, ihor.solodrai@linux.dev,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Peter Zijlstra" <peterz@infradead.org>
Message-Id: <eb864f61-9fa7-4366-bda0-eee586a8e0ad@app.fastmail.com>
In-Reply-To: <2026032350-stardust-unselfish-ad61@gregkh>
References: <20260323072422.25730-1-venkat88@linux.ibm.com>
 <2026032350-stardust-unselfish-ad61@gregkh>
Subject: Re: [PATCH] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable
 warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[messagingengine.com:query timed out,arndb.de:query timed out];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	TAGGED_FROM(0.00)[bounces-12148-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	NEURAL_HAM(-0.00)[-0.936];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 171DE2EE020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026, at 08:36, Greg KH wrote:
> On Mon, Mar 23, 2026 at 12:54:22PM +0530, Venkat Rao Bagalkote wrote:
>> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
>> used. This results in a compiler warning on linux-next builds:
>> 
>>   warning: 'nvram_mutex' defined but not used [-Wunused-variable]
>> 
>> Remove the unused definition to avoid the warning.
>> 
>> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> ---
>>  drivers/char/nvram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
>> index 9eff426a9286..2ce3307663ed 100644
>> --- a/drivers/char/nvram.c
>> +++ b/drivers/char/nvram.c
>> @@ -53,7 +53,7 @@
>>  #include <asm/nvram.h>
>>  #endif
>>  
>> -static DEFINE_MUTEX(nvram_mutex);
>> +static __maybe_unused DEFINE_MUTEX(nvram_mutex);
>
> If it is never used, why not actually delete it?  This just papers over
> the real issue :(

It's used on ppc32, atari and x86, but not ppc64.

However, I see that all the implementations that have the
mutex in their code path also have an inner spinlock that
does the same thing, while the mutex is a renmant from my
613655fa39ff ("drivers: autoconvert trivial BKL users to
private mutex").

I'm fairly sure we can actually remove it.

      Arnd

