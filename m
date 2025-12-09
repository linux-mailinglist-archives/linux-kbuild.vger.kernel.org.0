Return-Path: <linux-kbuild+bounces-10034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BCCAF71C
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 10:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62DDB3059AD6
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 09:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202032DA74D;
	Tue,  9 Dec 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xqc7svUB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lpm+0YKh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2LSQXNXG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gs7cwMOZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3F92DC793
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Dec 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272430; cv=none; b=fJf9c72vIxb47l+F9+EcDIghdIPdkOCbrAghRTnu5eSFpkhK6OqtWjoW4+kQfitN3a5+QJlu4ML7RLhSEz+3bqrbmmGZsiOBkWrEVYmqAoURYfJp2MPcDYpy8CP2dQo7E8GAQe7nvDo/yCc5jDgT2L9vDpkJRbtbj7fkfv5WWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272430; c=relaxed/simple;
	bh=ZcKZ481C2jLZ7ih4+ZUTT8eeFrSLUYcjyUPbydQ7LPE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=de/vc4PkYchEjvrhHb/+APOLbvS0xjlMHixHLXGO6TF8hJqOeKYEWpMMWZ5pAtnW3Mt/aJj30JL9rdJi1EgdFLh4E3yzjGU6Mc481SrMeapARRsdnYNooJUgTWrZXgprWEYttsR61wScjUz8KunfjrYRWpbCxuMvG7KzI/eAoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xqc7svUB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lpm+0YKh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2LSQXNXG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gs7cwMOZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF0B133734;
	Tue,  9 Dec 2025 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765272424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR5fSpLK5nNTF3pQQGGjJgsXD8rC/QnYDrR90jCyL+Q=;
	b=Xqc7svUBR1AJk/UN7X+MfgVxaTjswcCkeKCfdIIwMxlst6y9vz67qcnQnwwcG+1E8FNZIi
	hv8XeFUrfCVThZPoMiLLgfp2y4ONq2xAVt9JLAy8apVpaE+HgvnHYfnhSKOQF66oo3sYfT
	xjfjnfIZ9yXT2Lh0kQ0is4Mnwh6c65s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765272424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR5fSpLK5nNTF3pQQGGjJgsXD8rC/QnYDrR90jCyL+Q=;
	b=Lpm+0YKhPDaGZkgzeR4FlL82eQQ0ZlTXbRWvhcsy3E3qA81rRc5GjTwQnhmxULz7WYGlen
	snr8Z+JICfjF7ZCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2LSQXNXG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gs7cwMOZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765272423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR5fSpLK5nNTF3pQQGGjJgsXD8rC/QnYDrR90jCyL+Q=;
	b=2LSQXNXGlUWW5iBQpeO/S5XQSgJAz0VdDvE1JAFcGG+ik0nPS42u0w7/ia7FwfM/l5x5e+
	fIMoOUec6XJsdz+MDclq0QPNpvc4bP74TT3+DJ0zCMNeOaR9ZQLA5XUx7YIhEhJnYeZI3S
	hkp143y0PMAF9G9G/5NIije/udujwDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765272423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR5fSpLK5nNTF3pQQGGjJgsXD8rC/QnYDrR90jCyL+Q=;
	b=Gs7cwMOZ99ycrBGLtJ/y/mIkZ88YXtKBMmSW0H3IN9ngklEhpzk+1Hr3FaNG99VfJRYbp/
	CtT2FqJvn4pBn2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 621033EA63;
	Tue,  9 Dec 2025 09:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xWa9FmfrN2nnNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Dec 2025 09:27:03 +0000
Date: Tue, 09 Dec 2025 10:27:03 +0100
Message-ID: <87y0ncrons.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com,	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,	bo.liu@senarytech.com,	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,	kailang@realtek.com,
	linux-sound@vger.kernel.org,	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,	rf@opensource.cirrus.com,	Nicolas Schier
 <nsc@kernel.org>,	linux-kbuild@vger.kernel.org,	Masahiro Yamada
 <masahiroy@kernel.org>,	Nathan Chancellor <nathan@kernel.org>,
	miguel.ojeda.sandonis@gmail.com,	ojeda@kernel.org,	sam@gentoo.org,	Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,	Daniel Xu
 <dxu@dxuuu.xyz>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
In-Reply-To: <875xagt7d1.wl-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: DF0B133734
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 09 Dec 2025 08:57:46 +0100,
Takashi Iwai wrote:
> 
> On Sat, 06 Dec 2025 22:39:52 +0100,
> Askar Safin wrote:
> > 
> > On Wed, Dec 3, 2025 at 12:42 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > A rather hackish fix would be something like below.  Instead of
> > 
> > I tested. This patch works. Thank you!
> > Tested-by: Askar Safin <safinaskar@gmail.com>
> 
> Thanks for testing!
> 
> On the second thought, a better fix would be just to change the
> default fallback from ANY to LEGACY, so a oneliner change like below.
> Could you test it instead of the previous one?
> 
> It was set to ANY as we assumed that all drivers should cover the
> devices generally, but in the end, SOF or AVS need specific firmware
> files, hence it doesn't make sense to bind to them if specific kconfig
> is enabled.

The below one is a revised fix, just to be safer in case the legacy
driver is disabled, too.  Give it a try.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback

When config table entries don't match with the device to be probed,
currently we fall back to SND_INTEL_DSP_DRIVER_ANY, which means to
allow any drivers to bind with it.

This was set so with the assumption (or hope) that all controller
drivers should cover the devices generally, but in practice, this
caused a problem as reported recently.  Namely, when a specific
kconfig for SOF isn't set for the modern Intel chips like Alderlake,
a wrong driver (AVS) got probed and failed.  This is because we have
entries like:

/* Alder Lake / Raptor Lake */
	{
		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
	},
....

so this entry is effective only when CONFIG_SND_SOC_SOF_ALDERLAKE is
set.  If not set, there is no matching entry, hence it returns
SND_INTEL_DSP_DRIVER_ANY as fallback.  OTOH, if the kconfig is set, it
explicitly falls back to SND_INTEL_DSP_DRIVER_LEGACY when no DMIC or
SoundWire is found -- that was the working scenario.  That being said,
the current setup may be broken for modern Intel chips that are
supposed to work with either SOF or legacy driver when the
corresponding kconfig were missing.

For addressing the problem above, this patch changes the fallback
driver to the legacy driver as much as possible, i.e. return
SND_INTEL_DSP_DRIVER_LEGACY type.  When CONFIG_SND_HDA_INTEL is also
off, the fallback is set to SND_INTEL_DSP_DRIVER_ANY type, just to be
sure.

Link: https://lore.kernel.org/all/20251014034156.4480-1-safinaskar@gmail.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/intel-dsp-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index c401c0658421..0c25e87408de 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -718,7 +718,8 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	/* find the configuration for the specific device */
 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
 	if (!cfg)
-		return SND_INTEL_DSP_DRIVER_ANY;
+		return IS_ENABLED(CONFIG_SND_HDA_INTEL) ?
+			SND_INTEL_DSP_DRIVER_LEGACY : SND_INTEL_DSP_DRIVER_ANY;
 
 	if (cfg->flags & FLAG_SOF) {
 		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&
-- 
2.52.0


