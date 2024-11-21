Return-Path: <linux-kbuild+bounces-4762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549A9D453B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 02:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA08E2812D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 01:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDF7AD31;
	Thu, 21 Nov 2024 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WTfy/D8l";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sHoe/EPT";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WTfy/D8l";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sHoe/EPT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136729B0;
	Thu, 21 Nov 2024 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732151847; cv=none; b=Ks3yRs5rj6c1aXp/Mg8NtGIJHfD8REf1BIcD6P0KAJ6iUbLVIdlzVft9jXj4fRBgSHVIXIj8TCAyLY8lJsG2rEV/tAUHwCKrbNwNLXRFJb7WFy2GysSJ30hqHvKaz4gb+7d5tus5iEnUeoOOiO1rRJ0mJ/Iu2xVVX3OQDncP/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732151847; c=relaxed/simple;
	bh=vyXbvtxhyPtbV5ayWzvanIDpgaq/AHNMfKErujSAQMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMZ14QZhB8FN2/5krSssT3jSBx9NwNqxF6mUb4mkf4NxLuyOB57/z8P08xo1YL5MDIGpjQEsx9qzkiEQ65htgBqsb9DUv+UfGrTmTaSuath9tSMHlHkXC6MOW3p9Rd1h45WEfOmhhAQh146gmZseSSImrvLa7ZlA3q3qdr7WUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WTfy/D8l; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sHoe/EPT; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WTfy/D8l; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sHoe/EPT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 33ACB218E8;
	Thu, 21 Nov 2024 01:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732151843;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
	b=WTfy/D8lXXnS1RCYj/kN8ybXIRGdK9y77RgIIzyC2F+xZxevqn2DN5XCMEVnC/Do6cMl0H
	M2AJae9CvW7tMxtUVDf0Ipiqi8tjNeii2nWDh9zG2MCCsJ8B8NebR1eH2oOVVAu9q8jRFX
	271J45VO7uiuqFTr+2DFW7/HtOhaQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732151843;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
	b=sHoe/EPT2FszmRf+WJP9eUtps0tEwuPNJ1TVh409aaJnFORCnA18Tw2+KbajPc5Kla0CRO
	QcJELP0LMHFpTNDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732151843;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
	b=WTfy/D8lXXnS1RCYj/kN8ybXIRGdK9y77RgIIzyC2F+xZxevqn2DN5XCMEVnC/Do6cMl0H
	M2AJae9CvW7tMxtUVDf0Ipiqi8tjNeii2nWDh9zG2MCCsJ8B8NebR1eH2oOVVAu9q8jRFX
	271J45VO7uiuqFTr+2DFW7/HtOhaQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732151843;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
	b=sHoe/EPT2FszmRf+WJP9eUtps0tEwuPNJ1TVh409aaJnFORCnA18Tw2+KbajPc5Kla0CRO
	QcJELP0LMHFpTNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93B9A1376E;
	Thu, 21 Nov 2024 01:17:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cNZzHyKKPme0XgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Thu, 21 Nov 2024 01:17:22 +0000
Date: Thu, 21 Nov 2024 02:17:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
Message-ID: <20241121011720.GA69389@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,linux-foundation.org,lists.freedesktop.org,gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

> On Thu, Nov 21, 2024 at 5:41 AM Petr Vorel <pvorel@suse.cz> wrote:

> > It will be used in the next commit for DRM_MSM.

> > Suggested-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Changes v3->v4:
> > * Move definition to the end of the file


> I prefer to not check the tool.

Ack.

> Why don't you install python3?

Everybody installs it when it's required, the question is how to inform about
the dependency.

There build environments are minimal environments:
* chroot (e.g. cross compilation)
* container

These are used by both developers and distros.

Kind regards,
Petr

> >  init/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/init/Kconfig b/init/Kconfig
> > index fbd0cb06a50a..c77e45484e81 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> >  # <asm/syscall_wrapper.h>.
> >  config ARCH_HAS_SYSCALL_WRAPPER
> >         def_bool n
> > +
> > +config HAVE_PYTHON3
> > +       def_bool $(success,$(PYTHON3) -V)
> > --
> > 2.45.2

