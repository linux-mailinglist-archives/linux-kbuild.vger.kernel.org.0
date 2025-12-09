Return-Path: <linux-kbuild+bounces-10033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB5CAF3A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 08:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477DB300DC8E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF2C2C2349;
	Tue,  9 Dec 2025 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HsPDtfrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TYOIuoFd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HsPDtfrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TYOIuoFd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA32C17A0
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Dec 2025 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267070; cv=none; b=DpxU61lwcUXvNqAJGTzb+b3Ml0GJpZwHRYArYvIfHtJ4jv85Rp/rhdJ/iPOPrXOAxMPGG3K7HzMhgUpNhYHLi75j3gvlPTHShSr9NnmsarsZcaF6N4EWq+h8T9Nujl463XHZSLOG5eOeequaW6GRXT30BQNEb6HoDtS3SJNY/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267070; c=relaxed/simple;
	bh=nz87QrQLYiSwa0c/YpdP/GTj8UJPE4nba5/2QW7IP4g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnQzwTlsVnJEsjB2bd7q27XgjwBH+4FdjuXBM/+fmxqGdZRvBxYShq80l1BLD1bTT+V2m1f6Pdcuim5ikrPvzNTW/9vTwOUTRHlGq13HNUVW8Aq+EHUGHS2TmxnrJde/9HJ5hR7+GYbYkJMmHRk/GyOiSu1aRi9y/n5aKkYG+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HsPDtfrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TYOIuoFd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HsPDtfrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TYOIuoFd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F2D0337A2;
	Tue,  9 Dec 2025 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765267067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO3VcMy+bgqoVvLQfOtoJbYm6o/l+2PFoYM8zvqmlfc=;
	b=HsPDtfrG0BiNJkejAKo9Qdrl25YPIeSiLhFAFE0NLNGSX5NDSIq4AfnQ7kdaFm59QA+mim
	CL0pwE0yuTIpYYXmyWLDHFuYav3eEdK3el1QjtvS/N2Z5jTDviWwanGcj8IhghNfsz8RwI
	NFcumvQYkN2OUXbZ6OAzb94NwsoIUrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765267067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO3VcMy+bgqoVvLQfOtoJbYm6o/l+2PFoYM8zvqmlfc=;
	b=TYOIuoFdOg859/7mJSrj5aS+f4V8M2rBUBLv8iOd04TDKIRzy0DAKn1j2J1qYDHH4Z+DZv
	fG58+fCBpob08cDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765267067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO3VcMy+bgqoVvLQfOtoJbYm6o/l+2PFoYM8zvqmlfc=;
	b=HsPDtfrG0BiNJkejAKo9Qdrl25YPIeSiLhFAFE0NLNGSX5NDSIq4AfnQ7kdaFm59QA+mim
	CL0pwE0yuTIpYYXmyWLDHFuYav3eEdK3el1QjtvS/N2Z5jTDviWwanGcj8IhghNfsz8RwI
	NFcumvQYkN2OUXbZ6OAzb94NwsoIUrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765267067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO3VcMy+bgqoVvLQfOtoJbYm6o/l+2PFoYM8zvqmlfc=;
	b=TYOIuoFdOg859/7mJSrj5aS+f4V8M2rBUBLv8iOd04TDKIRzy0DAKn1j2J1qYDHH4Z+DZv
	fG58+fCBpob08cDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91FB73EA63;
	Tue,  9 Dec 2025 07:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7+T2IXrWN2nYZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Dec 2025 07:57:46 +0000
Date: Tue, 09 Dec 2025 08:57:46 +0100
Message-ID: <875xagt7d1.wl-tiwai@suse.de>
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
In-Reply-To: <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Sat, 06 Dec 2025 22:39:52 +0100,
Askar Safin wrote:
> 
> On Wed, Dec 3, 2025 at 12:42 PM Takashi Iwai <tiwai@suse.de> wrote:
> > A rather hackish fix would be something like below.  Instead of
> 
> I tested. This patch works. Thank you!
> Tested-by: Askar Safin <safinaskar@gmail.com>

Thanks for testing!

On the second thought, a better fix would be just to change the
default fallback from ANY to LEGACY, so a oneliner change like below.
Could you test it instead of the previous one?

It was set to ANY as we assumed that all drivers should cover the
devices generally, but in the end, SOF or AVS need specific firmware
files, hence it doesn't make sense to bind to them if specific kconfig
is enabled.


Takashi

-- 8< --
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -718,7 +718,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	/* find the configuration for the specific device */
 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
 	if (!cfg)
-		return SND_INTEL_DSP_DRIVER_ANY;
+		return SND_INTEL_DSP_DRIVER_LEGACY;
 
 	if (cfg->flags & FLAG_SOF) {
 		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&

