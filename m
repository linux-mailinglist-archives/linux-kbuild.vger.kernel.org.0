Return-Path: <linux-kbuild+bounces-9196-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FFBE29E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 12:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62862488048
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 09:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7307931BCA4;
	Thu, 16 Oct 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G57aejyI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iu2M45I8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G57aejyI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iu2M45I8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9D3176EE
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Oct 2025 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608399; cv=none; b=Sj/Ke/FvhCSEC5dVZAmx2Xq0EMDzuT1SoFSu5G4My4AYXiUAtxDlay/vmdjp3PZxoQJfiELljs3GkgeB3o+rdHfjPFd4NCWON278uoHs9hKXU7iXN2qgo73NVqb4A8BznA9cSgMIuoGGtmNhEIeN3xTZ9kwdS4+0NNlwmi0RxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608399; c=relaxed/simple;
	bh=8aoKj6Lbokxs31NvMiHpkLe/VxKWfBvA/ZujrdNJfRQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsgAcWaXt6KyDzui2ZJiy/Qq89J0NFWzIXJR8CgH/GBR0ic/V/32XFGDio2VAkTQ9rxcpGU0OD7RFmouvwCT2J7wyx7X4EyPZq6tKQcJp5b0tTanngaQmmPaCDJxrV6RxT2fOBJVtL4uZKq15VsMfrS5wJOXXgGRYAk8SelRlCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G57aejyI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iu2M45I8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G57aejyI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iu2M45I8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 15D581F391;
	Thu, 16 Oct 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760608364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQU63hw0/2YfMyk+rvCvHy55oTz5JTJV+aKgdNzUG5k=;
	b=G57aejyIYeiRayn6PUSdF2pIEM+MZh6YmFxxh8IfLU+hqH5xcH/ZaVlhmynU5FUhqP+GPh
	t3Zt8F6YlWSFW2tS01qHDbbkj9RzECD9BM8uydU7nOAzKFMlmyboYbRqBP9EaZ3T+mz02C
	5PoCdVyzmDvLoMTOS2soi+sbOn8dRUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760608364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQU63hw0/2YfMyk+rvCvHy55oTz5JTJV+aKgdNzUG5k=;
	b=Iu2M45I8CMCk5MpjSYCCPcjTtz9p8eTSCb8bMwDSplmqO9LUVlxSL0Sp+l6Bupi4Dfe+nX
	e3/+kPDFa8cUo+DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G57aejyI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Iu2M45I8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760608364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQU63hw0/2YfMyk+rvCvHy55oTz5JTJV+aKgdNzUG5k=;
	b=G57aejyIYeiRayn6PUSdF2pIEM+MZh6YmFxxh8IfLU+hqH5xcH/ZaVlhmynU5FUhqP+GPh
	t3Zt8F6YlWSFW2tS01qHDbbkj9RzECD9BM8uydU7nOAzKFMlmyboYbRqBP9EaZ3T+mz02C
	5PoCdVyzmDvLoMTOS2soi+sbOn8dRUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760608364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQU63hw0/2YfMyk+rvCvHy55oTz5JTJV+aKgdNzUG5k=;
	b=Iu2M45I8CMCk5MpjSYCCPcjTtz9p8eTSCb8bMwDSplmqO9LUVlxSL0Sp+l6Bupi4Dfe+nX
	e3/+kPDFa8cUo+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 783DD1340C;
	Thu, 16 Oct 2025 09:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bZP5G2vA8GjvagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 09:52:43 +0000
Date: Thu, 16 Oct 2025 11:52:43 +0200
Message-ID: <87bjm78978.wl-tiwai@suse.de>
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
In-Reply-To: <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
	<878qhckxc5.wl-tiwai@suse.de>
	<CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
	<875xcgkvnw.wl-tiwai@suse.de>
	<CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
	<CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
	<CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 15D581F391
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 16 Oct 2025 08:03:08 +0200,
Askar Safin wrote:
> 
> I did another experiment.
> This time with v6.18-rc1.
> And I collected more info.
> - Here is Debian config for 6.17.2: [attachment config-6.17.2-amd64]
> - I downloaded vanilla Linux v6.18-rc1 from kernel.org
> - I copied that Debian config (see above) as .config to Linux sources
> - I did "LOCALVERSION=-first make --silent -j32 < /dev/null" ("< /dev/null",
> because I don't want to answer any questions)
> - This is output: [attachment first-out]
> - Then I booted into it
> - Audio works
> - Here is config of this kernel: [attachment config-6.18.0-rc1-first]
> - Here is "find /lib/modules/6.18.0-rc1-first": [attachment
> find-6.18.0-rc1-first]
> - Here is alsa-info: [attachment alsa-info-first]
> - Here is lsmod: [attachment first-lsmod]
> - Then I "cd" into kernel source (note that ".config" remained since last time)
> - I typed "make localmodconfig < /dev/null"
> - Here is output: [attachment localmodconfig-out]
> - I did "LOCALVERSION=-second make --silent -j32"
> - This command didn't produce any output and didn't ask any questions
> - Then I booted into new kernel
> - Audio doesn't work
> - Here is config of this kernel: [attachment config-6.18.0-rc1-second]
> - Here is "find /lib/modules/6.18.0-rc1-second": [attachment
> find-6.18.0-rc1-second]
> - Here is alsa-info: [attachment alsa-info-second]
> - Here is lsmod: [attachment second-lsmod]
> 
> (Please, say me, if there are any missing files.)
> 
> If you need more experiments, ask me.

Thanks for detailed logs!  Now the situation became clearer.

Could you try to just enable CONFIG_SND_SOC_SOF_ALDERLAKE=m on top of
the broken config?  If my guess is right, this should make the audio
working again.

If yes, it's a problem of a kernel tristate config that doesn't have
the own module but referred only for constructing a probe table in
snd-intel-dspcfg.  This is not really a fault of localmodconfig, but a
long-standing design problem.  (I'm not sure why this surfaced
suddenly, though.)  There are a few options to address it, and we have
to evaluate / decide what to do.


Takashi

