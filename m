Return-Path: <linux-kbuild+bounces-4801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B979D64F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 21:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB6F016188F
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 20:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A06A1865FD;
	Fri, 22 Nov 2024 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AzsDTPqT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XZz/Zwqu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AzsDTPqT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XZz/Zwqu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC317B428;
	Fri, 22 Nov 2024 20:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732308128; cv=none; b=gDxPfumSMyVPZGNmOi9wr0X++cmH7ykVh0/vqJMI1BgHWJhA+DgPlE4jqW2Axg9VJ7PK9T35LWrqb9J+DtInxjL4IslYT1vtSthBwCc56hiKuDUV8lHqr3cpjnhCU4DFv+4/DYLwMqtrWWjN7EHunsc6T9ot9I8dtI5YBuPv1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732308128; c=relaxed/simple;
	bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4D3t3vjwVbVEInf70YFvXMazW/Rv1cc88n0patbhFMu/VO1hVtbUdFDg/+81pGcfmkJfmVilRNakmXj+JDmggZNPjvS8XxEGBErl5lLAdVGsJy6wV1slgPLWie8uj3naFBkD1ZWL7pdaSS7XvgWyP81GB4Im0mNtPWjoWzKTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AzsDTPqT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XZz/Zwqu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AzsDTPqT; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XZz/Zwqu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4270221240;
	Fri, 22 Nov 2024 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732308124;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
	b=AzsDTPqT7eoeHiGQhWEj4WP5gEbXkxHzIEV42sxL+XYjq1GcEtMKEkF9eTpm++y1OcS53L
	NgTKC68IcUn8EdftJ9vPGZNPjgcZJpkQj4/fRow2065DaZqdJSyQsbPgzr1FRasW0UD7bf
	PWhkcX5WaZRySP5fqFm7kMsF3sCxbOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732308124;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
	b=XZz/Zwqu27QgWYeUGgkJu5PLIx9ocmWILGpX51ZwduaMkHZ29nBQOgyXf0XF+TvouhrXj/
	Q0c5l2DwC/5zDaDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AzsDTPqT;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="XZz/Zwqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732308124;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
	b=AzsDTPqT7eoeHiGQhWEj4WP5gEbXkxHzIEV42sxL+XYjq1GcEtMKEkF9eTpm++y1OcS53L
	NgTKC68IcUn8EdftJ9vPGZNPjgcZJpkQj4/fRow2065DaZqdJSyQsbPgzr1FRasW0UD7bf
	PWhkcX5WaZRySP5fqFm7kMsF3sCxbOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732308124;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
	b=XZz/Zwqu27QgWYeUGgkJu5PLIx9ocmWILGpX51ZwduaMkHZ29nBQOgyXf0XF+TvouhrXj/
	Q0c5l2DwC/5zDaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8A59138A7;
	Fri, 22 Nov 2024 20:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9uhuNpvsQGefVAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 22 Nov 2024 20:42:03 +0000
Date: Fri, 22 Nov 2024 21:41:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
Message-ID: <20241122204157.GA125569@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
 <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
X-Rspamd-Queue-Id: 4270221240
X-Spam-Level: 
X-Spamd-Result: default: False [-3.71 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linaro.org,linux-foundation.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
X-Spam-Flag: NO

> On Thu, Nov 21, 2024 at 10:49 AM Rob Clark <robdclark@gmail.com> wrote:

> > On Wed, Nov 20, 2024 at 5:17 PM Petr Vorel <pvorel@suse.cz> wrote:

> > > > On Thu, Nov 21, 2024 at 5:41 AM Petr Vorel <pvorel@suse.cz> wrote:

> > > > > It will be used in the next commit for DRM_MSM.

> > > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > > ---
> > > > > Changes v3->v4:
> > > > > * Move definition to the end of the file


> > > > I prefer to not check the tool.

> > > Ack.

> > > > Why don't you install python3?

> > > Everybody installs it when it's required, the question is how to inform about
> > > the dependency.

> > > There build environments are minimal environments:
> > > * chroot (e.g. cross compilation)
> > > * container

> > > These are used by both developers and distros.

> > I don't think py3 is an _onerous_ dependency, but it has come up as a
> > surprise in minimal distro build environments at least once.. so I'd
> > be a fan of surfacing this dependency in a predictable/understandable
> > way (ie. I'm in favor of this patchset)


> "once" is a keyword here.

> "/bin/sh: python3: not found" provides sufficient information
> about why the compilation failed, and you know what to do
> to fix the problem.
> This is good.

> If you hide CONFIG_DRM_MSM silently
> due to missing python3, you may scratch your head
> "why drm/msm was not compiled?".
It's not on the list, but still visible in help (via search).

> This is worse.

I'm ok with this being refused. Yes, it's a trivial thing to find that python3
is not installed. I wasn't sure myself if this is really better. Having
something like "requires $(PYTHON3)" would be best solution (e.g. not disable
the config, but exit before starting to build), but of course unless this
feature is needed for many modules it does not make sense to have it.
It's because kernel mostly contains everything (unless languages like python
or any other dependency starts to be added). For this reason I like that
mconf-cfg.sh warns when missing ncurses devel files (even suggesting package
names).

Just to explain what was my motivation. CONFIG_DRM_MSM in in arm64 defconfig,
thus it will affect anybody who uses the defconfig (any distro will need to add
it).

It's needed only for Qualcomm arm64 devices only. But only for these devices
which are mainlined enough to really use CONFIG_DRM_MSM (many of them aren't in
that state).

postmarketOS is the distribution which supports Qualcomm. It stores kernel
config for each device and devices often have individual maintainer. E.g. 175x
"once" :).

Kind regards,
Petr

