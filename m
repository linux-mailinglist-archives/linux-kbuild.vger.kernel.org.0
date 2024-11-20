Return-Path: <linux-kbuild+bounces-4753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8659D42DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B0B1F23881
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BDB1BDA84;
	Wed, 20 Nov 2024 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oc74y9BN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="THwxHPph";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oc74y9BN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="THwxHPph"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2741C1F0A;
	Wed, 20 Nov 2024 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732133317; cv=none; b=HCYliOPeTe1ZuRxVjLt68RzXsXX4QrYsrCk4LBHEtanCL434RSDihluuynrwI4v6ubDlhotSIf6mdoPRSz+/YgO5XyPC3/x+Jk5TflCwDRuZvEdmPFnUpalGIPt3PotSrTDOXwXBnHozEVI/22wPq8LrZ54rgjnag3iKeJOcn90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732133317; c=relaxed/simple;
	bh=tRXKe+a+dwaOZ6N2Id7do1HLgihmaBGKIMofXGjn96A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvGylt0jt5+bwr2JGjvY/TS+nPEOVk+EvPcEZcVkt9oshTYKTUch5IRhD+f0K9QG7QEul/Lt3ZcfqbcJ/6dRDRu8LtYeO6q1hy+vCqyvzq+2KNy5CS1JeeLV0FD+qhtZVxdi3nGfNZ8IRBKD8pF9DL+YDjwNUp5mVWNbA0s2uSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oc74y9BN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=THwxHPph; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oc74y9BN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=THwxHPph; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F345B1F79B;
	Wed, 20 Nov 2024 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732133313;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NKWEBGgG7I2PjnhstdebYJIFhgT24xBC5DxPEneKhk=;
	b=oc74y9BNrmkb0YWoATxzDK8XzDAvJBF+Koy06j2q2ruW0I8TkLGqu4ZD89tkywXpum1pxP
	O0em3hLnaLKfJDVaL2N91BgbRdQr94aqmPielpYP7TVoCcRdG9CK5ifiBcew11Hqkf8Lnh
	+maqGCzqGqnCSsEMRi4QVEQbC4ZRJ0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732133313;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NKWEBGgG7I2PjnhstdebYJIFhgT24xBC5DxPEneKhk=;
	b=THwxHPphKJoME05ys+JrwJhwzkOr/xujjmrtOsT5CyeN9z6jGFRA6fMajLsnGzAzPOB7eO
	XldqUGHcwZoatxCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=oc74y9BN;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=THwxHPph
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732133313;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NKWEBGgG7I2PjnhstdebYJIFhgT24xBC5DxPEneKhk=;
	b=oc74y9BNrmkb0YWoATxzDK8XzDAvJBF+Koy06j2q2ruW0I8TkLGqu4ZD89tkywXpum1pxP
	O0em3hLnaLKfJDVaL2N91BgbRdQr94aqmPielpYP7TVoCcRdG9CK5ifiBcew11Hqkf8Lnh
	+maqGCzqGqnCSsEMRi4QVEQbC4ZRJ0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732133313;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NKWEBGgG7I2PjnhstdebYJIFhgT24xBC5DxPEneKhk=;
	b=THwxHPphKJoME05ys+JrwJhwzkOr/xujjmrtOsT5CyeN9z6jGFRA6fMajLsnGzAzPOB7eO
	XldqUGHcwZoatxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47EBB137CF;
	Wed, 20 Nov 2024 20:08:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DqQKEMBBPmeEEwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:08:32 +0000
Date: Wed, 20 Nov 2024 21:08:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [RFC][PATCH 1/1] drm/msm: require python3 and xml.parsers.expat
 module
Message-ID: <20241120200826.GA46775@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20241120154919.814593-1-pvorel@suse.cz>
 <CAF6AEGshZMEHYT6X3fG0vYPpfa4i_o8gxOareHNggYWtkn=2Yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGshZMEHYT6X3fG0vYPpfa4i_o8gxOareHNggYWtkn=2Yg@mail.gmail.com>
X-Rspamd-Queue-Id: F345B1F79B
X-Spam-Score: -3.71
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:replyto,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

> On Wed, Nov 20, 2024 at 7:49 AM Petr Vorel <pvorel@suse.cz> wrote:

> > 0fddd045f88e introduced python3 dependency, require it to quick early.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > RFC because I'm not sure if previous failed build wasn't better:

> >         GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
> >         /bin/sh: python3: not found

> > This way it's documented, but CONFIG_DRM_MSM just silently disappears
> > from .config. Also because depends on $(success ..) is not evaluated
> > (understand, some expressions can be really long) one see only:
> > Depends on: n [=n].

> > I was thinking about testing via $(PYTHON3) -m "xml.parsers.expat",
> > but because expat parser (and other modules) should be part the official
> > python3 and are installed even on minimal python3 installations (e.g.
> > python3-minimal on Debian). Therefore depending on "$(PYTHON3) -V"
> > should be enough.


> Would it be more clear to do something like:

> config HAS_PYTHON3
>       dev_bool $(success ...)

> (in init/Kconfig or somewhere central) and then use 'depends on
> HAS_PYTHON3'?  That might make the dependency easier to see in
> menuconfig/etc

Thanks a lot, good idea, there are already few config HAVE_* in it. I'll send
v2. Before I already noticed various variables in the top level Makefile (PERL,
BASH, RUSTC, ...), but didn't find any check. Just now I noticed HAVE_RUST in
arch/Kconfig. I suppose HAVE_PYTHON3 should be in init/Kconfig.

Kind regards,
Petr

> BR,
> -R

> > Kind regards,
> > Petr

> >  drivers/gpu/drm/msm/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)

> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 90c68106b63b..2cf4573a2ff1 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -11,6 +11,7 @@ config DRM_MSM
> >         depends on QCOM_LLCC || QCOM_LLCC=n
> >         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> >         depends on PM
> > +       depends on $(success,$(PYTHON3) -V)
> >         select IOMMU_IO_PGTABLE
> >         select QCOM_MDT_LOADER if ARCH_QCOM
> >         select REGULATOR
> > @@ -36,7 +37,7 @@ config DRM_MSM
> >         select PM_GENERIC_DOMAINS
> >         select TRACE_GPU_MEM
> >         help
> > -         DRM/KMS driver for MSM/snapdragon.
> > +         DRM/KMS driver for MSM/snapdragon.  Requires python3.

> >  config DRM_MSM_GPU_STATE
> >         bool
> > --
> > 2.47.0



