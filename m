Return-Path: <linux-kbuild+bounces-11521-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJTIIJnopWlLHwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11521-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 20:44:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 161701DEECE
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 20:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3E0304BCE9
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 19:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FD547DD63;
	Mon,  2 Mar 2026 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QbQ6ER0m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h1HL6xps";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QbQ6ER0m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h1HL6xps"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD64147DD45
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772480649; cv=none; b=dNr5eQrkR4zhyLgfXNWI/02QWtlhYKq3kgKFePhgFP8oEVDjpIHFYEIfYra/jdw4eGkt7+ITam4xx5bKHlOt6DZwPJPzWX5WRC+o4R0piuJQia/8vUxJeg5koVJ3EZSVz1/Q0CMSGjpJbP7QlnEfKMLDn7tzE5ov2tDfFSv30vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772480649; c=relaxed/simple;
	bh=fHGGZvnVoNDAh0GUgE9y3qLz9XfHnEuMiR1NWmo6/9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEeKiX3gxtrK37M7uoh+oB4Qjf3wgk0XAcvW8NIgB6CgUNCFJeN8jjPqUJK7W3Bzu9n3hXdRhGV2pOIiMR+8jtGsNS959xtNLS7VeerjTF3xoPAIzaGhrud1FkIl4tVdUrWJqkUaskYWGmAFM9tUiJpt+yprqSzT0vtvMOfs7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QbQ6ER0m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h1HL6xps; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QbQ6ER0m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h1HL6xps; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F76B5BD7E;
	Mon,  2 Mar 2026 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772480639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFKvUMV/pdTWAEgmZVY9iX/QrVjbj5WYVaguJK5UY1o=;
	b=QbQ6ER0mEWlmEosPzFk0ogS4jEiTC4QXLlmWS4vcxE3a1YsADDsnu8fFD9nWn0dCQ5Nca9
	cl0EySISRF0JIIQ8yXNJ4eCyCoa3imJeGBe4WZ0JSqfz7FTclXKrlj2sY/TBXcoTWcUJsq
	8uWVq74IsGV2jav7784KT5Jvcj/kn0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772480639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFKvUMV/pdTWAEgmZVY9iX/QrVjbj5WYVaguJK5UY1o=;
	b=h1HL6xpsUPEbjPW/acgOkSpfe2LIa5GP7QiRZI+cdSGBnTVfi1ljjEHuvsLFEB8HYxe/Fh
	Me7C7qg7vJJCj/Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772480639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFKvUMV/pdTWAEgmZVY9iX/QrVjbj5WYVaguJK5UY1o=;
	b=QbQ6ER0mEWlmEosPzFk0ogS4jEiTC4QXLlmWS4vcxE3a1YsADDsnu8fFD9nWn0dCQ5Nca9
	cl0EySISRF0JIIQ8yXNJ4eCyCoa3imJeGBe4WZ0JSqfz7FTclXKrlj2sY/TBXcoTWcUJsq
	8uWVq74IsGV2jav7784KT5Jvcj/kn0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772480639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFKvUMV/pdTWAEgmZVY9iX/QrVjbj5WYVaguJK5UY1o=;
	b=h1HL6xpsUPEbjPW/acgOkSpfe2LIa5GP7QiRZI+cdSGBnTVfi1ljjEHuvsLFEB8HYxe/Fh
	Me7C7qg7vJJCj/Aw==
Date: Mon, 2 Mar 2026 20:43:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Rainer Fiebig <jrf@mailbox.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: -next build error due to "kbuild: Leave objtool binary around
 with 'make clean'"
Message-ID: <aaXofbe_5QGYYuMB@kitsune.suse.cz>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
 <03045f41-fe4c-44ff-b01c-6e325d82255a@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03045f41-fe4c-44ff-b01c-6e325d82255a@leemhuis.info>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 161701DEECE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11521-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msuchanek@suse.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,copr.fedorainfracloud.org:url,suse.de:dkim,kitsune.suse.cz:mid]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:18:17PM +0100, Thorsten Leemhuis wrote:
> On 2/28/26 06:40, Nathan Chancellor wrote:
> > The difference between 'make clean' and 'make mrproper' is documented in
> > 'make help' as:
> > 
> >   clean     - Remove most generated files but keep the config and
> >               enough build support to build external modules
> >   mrproper  - Remove all generated files + config + various backup files
> > 
> > After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> > target"), running 'make clean' then attempting to build an external
> > module with the resulting build directory fails with
> > 
> >   $ make ARCH=x86_64 O=build clean
> > 
> >   $ make -C build M=... MO=...
> >   ...
> >   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> > 
> > as 'make clean' removes the objtool binary.
> > 
> > Split the objtool clean target into mrproper and clean like Kbuild does
> > and remove all generated artifacts with 'make clean' except for the
> > objtool binary, which is removed with 'make mrproper'.
> 
> Thx for fixing this regression, sadly this caused my daily -next rpm
> builds for Fedora to fail on x86_64 during a "make mrproper":
> 
> ""
> kernel.spec:2485: InitBuildVars: Copy files
> + /usr/bin/make -s 'HOSTCFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -mtls-dialect=gnu2   ' 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' -j32 mrproper
> find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.check.o.cmd’: No such file or directory
> find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.elf.o.cmd’: No such file or directory
> [and many more like these]
> ""
> For the full build log, see:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-42-x86_64/10183736-next-next-all/builder-live.log.gz
> 
> This is almost exactly the rpm spec file that is used in Fedora rawhide.
> The sections that causes this looks like this:
> 
> """
>     %{log_msg "InitBuildVars: Copy files"}
>     %{make} %{?_smp_mflags} mrproper

And how would find -delete fail?

Does that mean that the files in question are broken links?

Does that mean in the clean phase these erren't broken?

When did they break?

Or does the objtool_clean run multiple times in parallel, once through
the clean target, and once as dependency of the mrproper target?

Thanks

Michal

