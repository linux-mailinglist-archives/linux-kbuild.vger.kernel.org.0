Return-Path: <linux-kbuild+bounces-9293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D3C14843
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 13:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B781A266F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316113195F0;
	Tue, 28 Oct 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EGndNpF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K9i1TOKG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EGndNpF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K9i1TOKG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F26302178
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653130; cv=none; b=kaPlpGfeRfMoRl0wxI3++7Oz7Uh7hcU7pzZ5ftBcP6jmUbSP/ZRXTwwWnweBcEm8G/zTCh83YxJpnDw2JEbnecw/i3awYXjyTgZx8d8asNikft69dQMPY2OcJVmRWZ5M7HUMk/MXNgbQf6TUwv5xNn6vWNA/7+ZYwubMkuWPKeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653130; c=relaxed/simple;
	bh=lJDSPp4+E0iPsstdsnOP+L8N+oiz3Qh4wSlirOnczAw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZuxSvPnSoRcm/ry4kbBD68EywZ1V1bDETgmBP3qDdNWfw3tDvFcvRWiUnhAJVUMRYWhVeBw+pPFiOOfK2w4xp6PvQwasn/nDOzKQmLUS6RbpAKoghf+AF50JiWVqTubEhQrcWUUULN1wOnu8p+jdlo+V1u9t0LEGC+J9vCrTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EGndNpF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K9i1TOKG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EGndNpF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K9i1TOKG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A024B1F38A;
	Tue, 28 Oct 2025 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761653120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI2FW2EH0JQzcOm1YdnS6qv7tLtMp6rBzNYN5b9JFi4=;
	b=EGndNpF6Bn/IDtaEnuANntWPoRHgnUJ6fRPHpSNiV5In2/OHwwarluG5fVOSEEGw1ztGn/
	TlQEPu5x4gyXF9Qitt7Yy8KSIwEY00oEhhgUbvGSJGJSizcYi8ljXGXIONOOYCO7570TA4
	BzQSLG5EQd3yKU+pZIIIYrCnk/9DrPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761653120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI2FW2EH0JQzcOm1YdnS6qv7tLtMp6rBzNYN5b9JFi4=;
	b=K9i1TOKG4itpyVcbVwC2TREDXoSCPee7qUfpDmTmrRT79ghYuaKWxR/gJyqpo2dDocEjdL
	M3tQk5aIrWOImcBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761653120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI2FW2EH0JQzcOm1YdnS6qv7tLtMp6rBzNYN5b9JFi4=;
	b=EGndNpF6Bn/IDtaEnuANntWPoRHgnUJ6fRPHpSNiV5In2/OHwwarluG5fVOSEEGw1ztGn/
	TlQEPu5x4gyXF9Qitt7Yy8KSIwEY00oEhhgUbvGSJGJSizcYi8ljXGXIONOOYCO7570TA4
	BzQSLG5EQd3yKU+pZIIIYrCnk/9DrPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761653120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI2FW2EH0JQzcOm1YdnS6qv7tLtMp6rBzNYN5b9JFi4=;
	b=K9i1TOKG4itpyVcbVwC2TREDXoSCPee7qUfpDmTmrRT79ghYuaKWxR/gJyqpo2dDocEjdL
	M3tQk5aIrWOImcBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECF3413A7D;
	Tue, 28 Oct 2025 12:05:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J1kbOH+xAGkmCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Oct 2025 12:05:19 +0000
Date: Tue, 28 Oct 2025 13:05:19 +0100
Message-ID: <878qgvgrk0.wl-tiwai@suse.de>
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
In-Reply-To: <87bjm78978.wl-tiwai@suse.de>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
	<878qhckxc5.wl-tiwai@suse.de>
	<CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
	<875xcgkvnw.wl-tiwai@suse.de>
	<CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
	<CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
	<CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
	<87bjm78978.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[dell.com,linux.intel.com,ti.com,senarytech.com,intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com,lists.linux.dev,kernel.org,gmail.com,gentoo.org,linutronix.de,dxuuu.xyz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Thu, 16 Oct 2025 11:52:43 +0200,
Takashi Iwai wrote:
> 
> On Thu, 16 Oct 2025 08:03:08 +0200,
> Askar Safin wrote:
> > 
> > I did another experiment.
> > This time with v6.18-rc1.
> > And I collected more info.
> > - Here is Debian config for 6.17.2: [attachment config-6.17.2-amd64]
> > - I downloaded vanilla Linux v6.18-rc1 from kernel.org
> > - I copied that Debian config (see above) as .config to Linux sources
> > - I did "LOCALVERSION=-first make --silent -j32 < /dev/null" ("< /dev/null",
> > because I don't want to answer any questions)
> > - This is output: [attachment first-out]
> > - Then I booted into it
> > - Audio works
> > - Here is config of this kernel: [attachment config-6.18.0-rc1-first]
> > - Here is "find /lib/modules/6.18.0-rc1-first": [attachment
> > find-6.18.0-rc1-first]
> > - Here is alsa-info: [attachment alsa-info-first]
> > - Here is lsmod: [attachment first-lsmod]
> > - Then I "cd" into kernel source (note that ".config" remained since last time)
> > - I typed "make localmodconfig < /dev/null"
> > - Here is output: [attachment localmodconfig-out]
> > - I did "LOCALVERSION=-second make --silent -j32"
> > - This command didn't produce any output and didn't ask any questions
> > - Then I booted into new kernel
> > - Audio doesn't work
> > - Here is config of this kernel: [attachment config-6.18.0-rc1-second]
> > - Here is "find /lib/modules/6.18.0-rc1-second": [attachment
> > find-6.18.0-rc1-second]
> > - Here is alsa-info: [attachment alsa-info-second]
> > - Here is lsmod: [attachment second-lsmod]
> > 
> > (Please, say me, if there are any missing files.)
> > 
> > If you need more experiments, ask me.
> 
> Thanks for detailed logs!  Now the situation became clearer.
> 
> Could you try to just enable CONFIG_SND_SOC_SOF_ALDERLAKE=m on top of
> the broken config?  If my guess is right, this should make the audio
> working again.

Askar, have you tried the above?  I was off in the last week, so
wondering whether I missed your follow up.


thanks,

Takashi

> If yes, it's a problem of a kernel tristate config that doesn't have
> the own module but referred only for constructing a probe table in
> snd-intel-dspcfg.  This is not really a fault of localmodconfig, but a
> long-standing design problem.  (I'm not sure why this surfaced
> suddenly, though.)  There are a few options to address it, and we have
> to evaluate / decide what to do.
> 
> 
> Takashi

