Return-Path: <linux-kbuild+bounces-13195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCA9M0qKCWpXewQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13195-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:28:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FE560401
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58E453006168
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58E831065B;
	Sun, 17 May 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5/c/Rl6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FB15CD7E;
	Sun, 17 May 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010117; cv=none; b=dG3VQwwjdw70wS4r7jGQX1OX5dtHo3/Op/J8unDQOZ70+XvjTvp++2M/8ZVqV3uAOi0GiejXklqfwV8HpgmcbeCN44bCfsrtETzo78D9epsdD7C+K1WatyQXKPMQjDJt9PTsnvFS0Vt+4fFbaMVPkE1/7R3HVI5m+ZlYtMKs6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010117; c=relaxed/simple;
	bh=wW7ntkqv6Vi3VTxD3hPsgImBbeurxj4k2AKdntRoFOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE8DZ39wKz+E9SWtwUoHx541ZGymkhP0LXvx81wclEsgqpXO+nNSe/L1aOM25RA4Gt80kAKXuhK4oirwopol/mscTb8+j8HheLL9vkd/i5C/l1qiagQ2j/ceFfbee+KfBZlDAkT4GIn+InNopILwXy/SSVzimj0S0py72YjCXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5/c/Rl6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67929C2BCB0;
	Sun, 17 May 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779010117;
	bh=wW7ntkqv6Vi3VTxD3hPsgImBbeurxj4k2AKdntRoFOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5/c/Rl6Tn/g2YFiHFe6SiYfJ5qPtoF2SUcR/hIRwqJGlQhQVSoRWMCx1pIYml2F/
	 pNBNLFo7d4ooDEPPeV6coiCAvMElR+AwS+VHJLw3tJjnYKTYrvVmHSiumN6EwczASE
	 Vk5W7UNj/eFCHs7jMN0Fq3zGlxle627xb//4h6a7as8aFH5niNhxxkkjmpQc5N35Xr
	 2Whp5mOVr6OKZ0h4V9ioHe1uorKF1cAYNjzHDjdUHHzK2fiiTM+4EW0/cmANob+lxd
	 fWBdEr2ueUoQW1sFfT4UtKj2Jb4JZ8BdXAiWH9KwzfT53c9FmNRwatRZ3KbjoQMvZj
	 JzklLm5YKFmnA==
Date: Sun, 17 May 2026 18:28:29 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org,
	jani.nikula@linux.intel.com, akpm@linux-foundation.org,
	gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
	corbet@lwn.net, qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net, demiobenour@gmail.com, ej@inai.de,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
Message-ID: <20260517092829.GB3773662@ax162>
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
X-Rspamd-Queue-Id: 386FE560401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13195-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:28:16AM +0200, Miguel Ojeda wrote:
> On Sat, May 16, 2026 at 11:54 PM Julian Braha <julianbraha@gmail.com> wrote:
> >
> > +CARGO          = cargo
> 
> Question to Kbuild: would it hurt to hardcore `--offline` here?
> 
> If someone within Make actually ever needs Cargo to fetch something,
> then they should be very explicit about it (in which case we could
> have another variable etc.).

No, I don't think so. I think there would need to be a very compelling
reason for connecting to the network during the build process. Although,
we would need to handle someone passing CARGO via the make command line
so that '--offline' does not get blown away.

> > -                 rust/libpin_init_internal.so rust/libpin_init_internal.dylib
> > +                 rust/libpin_init_internal.so rust/libpin_init_internal.dylib \
> 
> Spurious change?

Maybe 'scripts/kconfirm' used to be here?

Another thing I just realized: scripts/kconfirm is going to mess with
shell autocompletion for some people, as scripts/kc<tab> will currently
always complete to scripts/kconfig. Not sure if that will be that big of
a deal but I know Linus has complained about that in the past.

> > +$(TARGET):
> > +       $(CARGO) run --release --offline -p kconfirm-linux -- --linux-path $(srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)
> 
> This probably does not work in `O=` builds or in cases where the
> `srctree` is read-only (please see my other reply on the docs patch).

Yeah, it seems like this wants something like '--target-dir $(obj)' or
'--target-dir $(objtree)/scripts/kconfirm'? I don't find this to be
particularly readable either (I am more used to "build then run" as two
separate steps) but maybe that is because I am just not familiar with
Rust projects.

Cheers,
Nathan

