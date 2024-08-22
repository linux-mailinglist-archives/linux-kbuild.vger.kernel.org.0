Return-Path: <linux-kbuild+bounces-3150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D995B0A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 10:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9515F285E90
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C56A170853;
	Thu, 22 Aug 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDbC9aoF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dur9pQay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDbC9aoF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dur9pQay"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59815855A;
	Thu, 22 Aug 2024 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315768; cv=none; b=jlsk3odmJ2nxiK1yjK9Zx6wfH4sV3CMVnO0HaVFmWZCjErm3OoT2iGjCppyE09NJ9PGbDGNpaWJKdkDmsCRMRBSNEV/zWCgEuV1UdXbieE5SE2X/DeGM0vG7PZqi0X92HPPpYUsz79boUwcIsJU2z2W94t2cpFue8+z6SNMTaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315768; c=relaxed/simple;
	bh=5RU7sGVbTvLiUZrgJA6Z92tV6acH2mflWc1qxqN2Z/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/mIGvGyh3unh4ovYXr+tMLOJz0+cNY8mJxMLn8WWSDDlXm0y+jCovP3kPa2aLrv69WibXr6/4qm/ivmBalnzWpfbFoBRMSuzX3x7suePwU/2nSpzsY5z11DmxMhQWtAnWaJjBqghdsw0ACqdDLfj+l6prPLHOqi7iWWZlzzdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDbC9aoF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dur9pQay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDbC9aoF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dur9pQay; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E159821A8A;
	Thu, 22 Aug 2024 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724315762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZP7A0dyPUB7XvaMXoDLFQRCg1M4oGh7wMsUNHG3hDM=;
	b=fDbC9aoF0rRaYKTvHFZRUt8KBGtvE7GIcU+BuVACb+rNxAUYr/JDApHSrREUNpIN1W4hZ+
	vCv9MjjfG/KTW/fnsffHp+uLAdPnCmTSj8uuz0vBImEQuGqMxEwbXk0N4PZHwlAbuoU62J
	OaoMOUiylbcNEHAyPw5sX1BoZvpvRro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724315762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZP7A0dyPUB7XvaMXoDLFQRCg1M4oGh7wMsUNHG3hDM=;
	b=Dur9pQayu5gvzJdALUXWKbBHHZG+HNW4obVX6cQ7IO16GI3qKsC12D+vKkHnUaU2k0wzfT
	qwgNng3pLMZu5SDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724315762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZP7A0dyPUB7XvaMXoDLFQRCg1M4oGh7wMsUNHG3hDM=;
	b=fDbC9aoF0rRaYKTvHFZRUt8KBGtvE7GIcU+BuVACb+rNxAUYr/JDApHSrREUNpIN1W4hZ+
	vCv9MjjfG/KTW/fnsffHp+uLAdPnCmTSj8uuz0vBImEQuGqMxEwbXk0N4PZHwlAbuoU62J
	OaoMOUiylbcNEHAyPw5sX1BoZvpvRro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724315762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZP7A0dyPUB7XvaMXoDLFQRCg1M4oGh7wMsUNHG3hDM=;
	b=Dur9pQayu5gvzJdALUXWKbBHHZG+HNW4obVX6cQ7IO16GI3qKsC12D+vKkHnUaU2k0wzfT
	qwgNng3pLMZu5SDA==
Date: Thu, 22 Aug 2024 10:36:00 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kmod /usr support
Message-ID: <20240822083600.GF26466@kitsune.suse.cz>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de>
 <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
 <5gx6vt4tzgk4zvboxrrahexr4ja6zm6fisjshdvnlfihsysqzb@quhp42ydtvh2>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5gx6vt4tzgk4zvboxrrahexr4ja6zm6fisjshdvnlfihsysqzb@quhp42ydtvh2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,suse.com,gmail.com,inai.de,google.com,fjasle.eu];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

Hello,

On Thu, Aug 22, 2024 at 01:05:11AM -0500, Lucas De Marchi wrote:
> On Tue, Dec 19, 2023 at 05:37:31PM GMT, Masahiro Yamada wrote:
> > On Thu, Dec 7, 2023 at 3:37 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > 
> > > On Fri, Nov 10, 2023 at 01:13:53PM +0100, Michal Suchanek wrote:
> > > >Hello,
> > > >
> > > >This is resend of the last patch in the series that adds prefix support
> > > >to kernel module location together with additional patch for validating
> > > >the user supplied input to options that are interpreted as directories.
> > > >
> > > >Thanks
> > > 
> > > applied, thanks
> > > 
> > > Lucas De Marchi
> > 
> > 
> > 
> > If I understood this correctly, MODULE_DIRECTORY is determined
> > by "configure --with-module-directory=...", and there is no
> > way to change it after that.
> > 
> > 
> > If so, how to work with cross-building?
> > 
> > Cross-building is typical when building embedded Linux systems.
> 
> I was thinking the `pkg-config --variable=module_directory`
> from the target would be sufficient, but...
> 
> > 
> > 
> > Consider this scenario:
> > 
> > - Your build machine adopts
> >    MODULE_DIRECTORY=/usr/lib/modules
> > - The target embedded system adopts
> >    MODULE_DIRECTORY=/lib/modules
> > 
> > (or vice a versa)
> > depmod is used also for cross-building because
> > it is executed as a part of "make module_install".
> > 
> > 
> > The counterpart patch set for Kbuild provides
> > KERNEL_MODULE_DIRECTORY, which only changes
> > the destination directory to which *.ko are copied.
> > 
> > You cannot change the directory where the
> > depmod searches for modules, as it is fixed
> > at the compile-time of kmod.
> > 
> > 
> > 
> > 
> > In this case, what we can do is to build another
> > instance of kmod configured for the target system,
> 
> the target system may not even have depmod actually, so using just the
> host one seems more appropriate. But target should have the kmod.pc for
> the pkg-config call to work.
> 
> > and use it for modules_install:
> > 
> > 1. In the kmod source directory
> >    ./configure --with=module-directory=/lib/modules
> >    make
> > 
> > 2. make modules_install INSTALL_MOD_PATH=<staging-dir>
> >     KERNEL_MODULE_DIRECTORY=/lib/modules
> >     DEPMOD=<new-depmod-you-has-just-built>
> > 
> > 
> > 
> > If you use OpenEmbedded etc., this is what you do
> > because host tools are built from sources.
> > 
> > But, should it be required all the time?
> > Even when the target embedded system uses
> > busybox-based modprobe instead of kmod?
> 
> no, I don't think we can rely on depmod from the target.
> 
> > 
> > 
> > 
> > depmod provides --basedir option, which changes
> > the prefix part, but there is no way to override
> > the stem part, MODULE_DIRECTRY.
> > 
> > In the review of the counter patch set,
> > I am suggesting an option to override MODULE_DIRECTRY
> > (let's say --moduledir) at least for depmod.
> 
> ok
> 
> > 
> > (Perhaps modinfo too, as it also supports --basedir)
> > 
> > 
> > 
> > Then, we can change scripts/depmod.sh so that
> > Kbuild can propagate KERNEL_MODULE_DIRECTORY
> > to depmod.
> > 
> > 
> > if  <depmod supports --moduledir>; then
> >    set -- "$@"  --moduledir "${KERNEL_MODULE_DIRECTORY}"
> > fi
> > 
> > 
> > 
> > Does it make sense?

It does not make sense for the common case: building kernel for the host
system.

Then overriding the directory is wrong, and using what kmod was compiled
with is needed to get correct module directory layout.

Or it would make sense if both was done:

Default KERNEL_MODULE_DIRECTORY to what kmod was compiled with, and
then pass the actual value to depmod so that depmod uses the compiled-in
value by default, and the user-provided value when
KERNEL_MODULE_DIRECTORY was overridden by the user.

Thanks

Michal

