Return-Path: <linux-kbuild+bounces-1442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15D893AB5
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 13:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 094D41C20D72
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 11:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F1210EE;
	Mon,  1 Apr 2024 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BiUDXxaY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pj08psOe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A591CAA3;
	Mon,  1 Apr 2024 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711972062; cv=none; b=YOccW4mT1ev8jelLxNx6k4tSXfRo+CguXuR4lzf8hTZdQYgTSHi4ZQPd1wopviuTDJXQlh7SUXTiUegBFB5Hi0TdNKfX0xOxaw4DhnpBq8VLxBc+sMr6pSCXps9fepOuYI+/ppa5lJChC2eRVU7NOqJ7Pq3DHYXqaV/EOtsuM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711972062; c=relaxed/simple;
	bh=7IV2knxGQfNUpdNuZwZ08rjAGtpMP5xr8K29ecJ0rS8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4Na8q/vSmTZrdl63B3pAaSF0o1ZhSsP2vGIGGt625Kn9wcbM4OgO9vtjYv2hfu4C0DUU63bihVWChVqF6YBRn1ATd2x6lYhyluQwGr8d5UDeHjVW+bnyNtNnfQUeG8bVv5h+WmLr6YhFGvxtj1TW16fJ+//vGDmYOZan9dMed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BiUDXxaY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pj08psOe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9139201B9;
	Mon,  1 Apr 2024 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711972058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eNOhj5DPUaY8XXAp3FrbW8Ni7SsR7Ff8ci5lixkFT8=;
	b=BiUDXxaYlIecIbYejxYsLWQaMF6db8yo25uPTEqOyoniKmMyQu8ij+QkGT2q2yTKQGWD8f
	AjiVZbtANzs+98XPm/4LMatjSlwUU5ZnRqXH7lPH5CjMGTldS59jBxYgLKLpju00x4fXKl
	KvZf9LRANnxsxrszum31HLA8nhXSaho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711972058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eNOhj5DPUaY8XXAp3FrbW8Ni7SsR7Ff8ci5lixkFT8=;
	b=Pj08psOeuDjJzNU1iWxKadIolyUOWmTsJu+ATq44tXhNtmp7Ygbk+v7CskeFtV5n456LDW
	M8fQzEeZMTGJZFAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 85153139BE;
	Mon,  1 Apr 2024 11:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id WbEeH9qeCmaNEAAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 11:47:38 +0000
Date: Mon, 01 Apr 2024 13:47:42 +0200
Message-ID: <87r0fpe23l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] OSS: dmasound/paula: Mark driver struct with __refdata to prevent section mismatch
In-Reply-To: <c216a129aa88f3af5c56fe6612a472f7a882f048.1711748999.git.u.kleine-koenig@pengutronix.de>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
	<c216a129aa88f3af5c56fe6612a472f7a882f048.1711748999.git.u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.89
X-Spam-Flag: NO
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.996];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[45.58%]
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B9139201B9

On Fri, 29 Mar 2024 22:54:42 +0100,
Uwe Kleine-König wrote:
> 
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
> 
> 	WARNING: modpost: sound/oss/dmasound/dmasound_paula: section mismatch in reference: amiga_audio_driver+0x8 (section: .data) -> amiga_audio_remove (section: .exit.text)
> 
> that triggers on an allmodconfig W=1 build.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, applied.


Takashi

