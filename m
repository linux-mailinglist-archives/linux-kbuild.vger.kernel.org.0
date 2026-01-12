Return-Path: <linux-kbuild+bounces-10504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79446D123A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 12:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A22630041A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B92D500963;
	Mon, 12 Jan 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kILFB66J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SJWZ9Ny6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wa8BTrz7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="57+DaGLO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39C30171A
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216473; cv=none; b=FnxQBPA6Lzn5zDnnI8DcEsSlB47D90gSgGD49v6cLW5pISY2DFsEuVfuwjCosufRWqOQJhdHay2XVDG99axLasbb6ZhQYIEkc8nvICQEHmx9Okwc3X1XwtlmtpvcVDvdaLVyP9HISN4DC9hGVf54e2RXK3Z4Y45SMrU1uPwdj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216473; c=relaxed/simple;
	bh=EMAElTEWXEvClHUnuljWLTry5QkeCZO4eMnwyFwfThU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkP63cejlhSjAtdI2QJIV3ZqOGW6xwwDFrsGuI4AU4siz32ssXQEZpadQTnWdxKhmKLi0B1+RLaWK94fDtOtVUwFDHMAYScG320lKJ9jqtjyTk43sL1xsyczU1/13bzHwK9utJqdrfV8JhELjvKA5YLtlKdYDwI+m+7dPqm+bEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kILFB66J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SJWZ9Ny6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wa8BTrz7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=57+DaGLO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED2F733736;
	Mon, 12 Jan 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768216470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMAElTEWXEvClHUnuljWLTry5QkeCZO4eMnwyFwfThU=;
	b=kILFB66JwFS5e9HeYpONtoeUE3/inqrKuoCtlAL5sApejhyz/ksVkZQ7gy4kVmI0W5ryPT
	u8/+hKKTcVjsrZt3xpMD260XEWZeFmsIs7GBMcdkic39D7IPgLRJzSewyPrOFmszuY6UJ7
	eeY9DJmTOI791GFO+qTsTezc1qaBbpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768216470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMAElTEWXEvClHUnuljWLTry5QkeCZO4eMnwyFwfThU=;
	b=SJWZ9Ny6Z/LbrxuHSjE8Ldpmon75kqZrZV6K9VvvU/vCqVMKz6T271BnWz8tb5CoU3Ln1A
	5TFvEMPc8W926WBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wa8BTrz7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=57+DaGLO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768216468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMAElTEWXEvClHUnuljWLTry5QkeCZO4eMnwyFwfThU=;
	b=wa8BTrz7+9pybdcoEpmv6QKnX9wT8yM8i2xiJOtElVptW3I0JnCaKxAtlM2WUHeNgpGjA+
	55JMvwT5NItJWbXPxXPTe9aIJbWjB+hVXaqwdW8bfG6b81BnfjsQ2KpcM9b8FTAOApoDQJ
	8NIvZ7u7Z/Z3nZpJFyBh8zw11fgyW2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768216468;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMAElTEWXEvClHUnuljWLTry5QkeCZO4eMnwyFwfThU=;
	b=57+DaGLOPRsiTyzKWa5NSZs0KG0LpJKq0Oq+3G/PYo07hbvSnV+piRi4RRi4BeOcuMjBZU
	KGGpRzZM69eY0dBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFDC73EA63;
	Mon, 12 Jan 2026 11:14:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SbZFMZTXZGlMJQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Mon, 12 Jan 2026 11:14:28 +0000
Date: Mon, 12 Jan 2026 22:14:28 +1100
From: David Disseldorp <ddiss@suse.de>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts: headers_install: filter ignored configs
 via sed
Message-ID: <20260112221428.6f1ce9fe.ddiss@suse.de>
In-Reply-To: <20260112114650-7d38ec05-adfd-4f65-8605-67b051fcdeaf@linutronix.de>
References: <20260107205239.6390-1-ddiss@suse.de>
	<20260107205239.6390-2-ddiss@suse.de>
	<20260112114650-7d38ec05-adfd-4f65-8605-67b051fcdeaf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: ED2F733736
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Hi Thomas,

On Mon, 12 Jan 2026 11:51:41 +0100, Thomas Wei=C3=9Fschuh wrote:

> Hi David,
>=20
> On Thu, Jan 08, 2026 at 07:39:42AM +1100, David Disseldorp wrote:
> > The sed script currently prints any CONFIG_ entries carried in installed
> > headers. A subsequent shell script parses this output to check whether
> > the found CONFIG_ values should be ignored or not.
> > Drop the unnecessary sed output post-processing and instead skip over
> > ignored CONFIG_ values as part of initial processing. =20
>=20
> The exlusion logic is going to go away completely soon:
> https://lore.kernel.org/lkml/20260112-headers_install-config-leak-v2-0-4d=
8084444603@linutronix.de/
> (My series is probably going through the asm-generic tree)
>=20
> Our patches will conflict.

Looks good, I'm happy to drop this patch in favour of your removals.
Patch v2 2/2 should still be relevant and apply relatively cleanly.

Thanks, David

