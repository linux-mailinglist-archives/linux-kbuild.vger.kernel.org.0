Return-Path: <linux-kbuild+bounces-10043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4ACB2F76
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 14:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6CBE301175D
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 13:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD55322DB7;
	Wed, 10 Dec 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iDerOiDm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XOZF7BXQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iDerOiDm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XOZF7BXQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B625F98B
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765371620; cv=none; b=Nj7UjVSZ1LcAbh68lG7fo3uGRD7bP3FxNG/2dx2WTCCvvF/9b25VD0BZeQh4zk42aRO84k7VkUTikiH1qIwHwp4EEw/kExUMG+LIQr/XjLwnFIee8/9p7Q5HRlerQzwGYCYHTQTK0O8Dzts40w+dqGNGUS7Kkhw5ktKxNqUv1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765371620; c=relaxed/simple;
	bh=BvG0f+3pb6UXk3oEc0t8bVct1Hm1/AfQHYk6hcWsJJA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1sAnuXE3YuYD2f7ZvRNcdcf54PUXDZoaKT7BnBc9wL9PXh7pv/kfsCXHcaCVhPxpltC3Kzj+oZpN/atqfxOiinzmZcn8m6EN1qV0IAtCnkdzDjFN5sY0mCbvQkXOuitYKasRp9rArz83i8ojBocBpBojarVzLcV1ypse4MssVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iDerOiDm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XOZF7BXQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iDerOiDm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XOZF7BXQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AC025BE1B;
	Wed, 10 Dec 2025 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765371616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEEwBH4w055u9qQZV6Fx9H1v+Ra+sFStO9RxZy3Ks5g=;
	b=iDerOiDmNjwgF8FF37NuxOoWEfAC1C0qxMprUofuTciQCdUOomWL1/icZ+HkiMEMPq8d9H
	hPysQD4Xnu7eemonkqfIh4YU1SGuJ5gCdWpBzd9+vxDSFO7xuH2YaLe9zhGjurYblPs0zC
	p8quvPvzhrFU56ShXMBUfR1TCgkaq0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765371616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEEwBH4w055u9qQZV6Fx9H1v+Ra+sFStO9RxZy3Ks5g=;
	b=XOZF7BXQz/60V7h1M5MdkJYvwXJI0eic328GiP+PfA3/YvoiFdYbNR4Zmy/BFmUdXvvDK+
	fc/wSWGOR5FHNWAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iDerOiDm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XOZF7BXQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765371616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEEwBH4w055u9qQZV6Fx9H1v+Ra+sFStO9RxZy3Ks5g=;
	b=iDerOiDmNjwgF8FF37NuxOoWEfAC1C0qxMprUofuTciQCdUOomWL1/icZ+HkiMEMPq8d9H
	hPysQD4Xnu7eemonkqfIh4YU1SGuJ5gCdWpBzd9+vxDSFO7xuH2YaLe9zhGjurYblPs0zC
	p8quvPvzhrFU56ShXMBUfR1TCgkaq0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765371616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEEwBH4w055u9qQZV6Fx9H1v+Ra+sFStO9RxZy3Ks5g=;
	b=XOZF7BXQz/60V7h1M5MdkJYvwXJI0eic328GiP+PfA3/YvoiFdYbNR4Zmy/BFmUdXvvDK+
	fc/wSWGOR5FHNWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B0533EA63;
	Wed, 10 Dec 2025 13:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lvSaHN5uOWnTFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Dec 2025 13:00:14 +0000
Date: Wed, 10 Dec 2025 14:00:13 +0100
Message-ID: <87345iebky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,	Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,	baojun.xu@ti.com,
	bo.liu@senarytech.com,	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,	kailang@realtek.com,
	linux-sound@vger.kernel.org,	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,	rf@opensource.cirrus.com,	Nicolas Schier
 <nsc@kernel.org>,	linux-kbuild@vger.kernel.org,	Masahiro Yamada
 <masahiroy@kernel.org>,	Nathan Chancellor <nathan@kernel.org>,
	miguel.ojeda.sandonis@gmail.com,	ojeda@kernel.org,	sam@gentoo.org,	Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,	Daniel Xu
 <dxu@dxuuu.xyz>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
In-Reply-To: <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
	<878qhckxc5.wl-tiwai@suse.de>
	<CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
	<875xcgkvnw.wl-tiwai@suse.de>
	<CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
	<CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
	<CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
	<87bjm78978.wl-tiwai@suse.de>
	<CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
	<871plbucj3.wl-tiwai@suse.de>
	<CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
	<875xagt7d1.wl-tiwai@suse.de>
	<87y0ncrons.wl-tiwai@suse.de>
	<CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 8AC025BE1B
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Wed, 10 Dec 2025 02:45:55 +0100,
Askar Safin wrote:
> 
> On Tue, Dec 9, 2025 at 12:27 PM Takashi Iwai <tiwai@suse.de> wrote:
> > The below one is a revised fix, just to be safer in case the legacy
> > driver is disabled, too.  Give it a try.
> 
> I just tested both patches (this and previous). Both work.
> 
> Also, please, add this for regzbot:
> > Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/controllers directory")

Actually this tag isn't really right.  This commit casually surfaced
the issue in your particular case, but the bug itself was introduced
from the very beginning, and it could hit earlier.


thanks,

Takashi

