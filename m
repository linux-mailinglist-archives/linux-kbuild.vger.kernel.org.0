Return-Path: <linux-kbuild+bounces-10979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DPyDiJEgWnNFAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10979-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:41:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A705FD3170
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8E61300E3D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 00:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FA11DA60F;
	Tue,  3 Feb 2026 00:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCS9vnWY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098877F39;
	Tue,  3 Feb 2026 00:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079236; cv=none; b=aybPxzW1cZ4MrKyfit7Kl131nG2SLJ06BnXwNcBmr0RVRZlMEqvLVnmnyCY+crvZ/oY/88+HeiBa+KoNQXrzqrbj9eTeldNOs/xH6Anqj/DnCekWpeUn2bfE2VW7kGjFDE3bTw/F2lUdLGfCWohn2gVIzz8U5LvY5pO6iHlKlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079236; c=relaxed/simple;
	bh=r07P9KyyXMWvtCnmo/ELc9mFvwuiiBSsYPtw1lMOTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErwX1Zp4/im9GtcPVp3gS4flo3W47u2sQiwasIPDHkB/LTcxtk/wB2m6sO0Z+MClfcHziaklhMcuPo3KRl8f2oGb2IDTHejvsZ2pLqEwUTCqqcSNmEWIEEf7yJnVC3Q4Kr8J+0LLc4G6w7F7zuiBbfzcnAamiaUQrDJxp19kQ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCS9vnWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B47C116C6;
	Tue,  3 Feb 2026 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770079236;
	bh=r07P9KyyXMWvtCnmo/ELc9mFvwuiiBSsYPtw1lMOTic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCS9vnWYs2VJ0tS1tZryolzMh2XzSjDx+gVankLB/BrNjDRBzmAnEDMRk0fPznXo4
	 lJdIZIh93M2QrgYTjwMZsvG7vuFN4NbqVI2p2Nd7kgou3pPNlBhsiLxONNiP5SHwlY
	 P9w2wK1ZPz3q+NqO6Vz+r7NsKXw8ACT9kWyG1vmIW2rJEFaKA8nLFg5UuZjemApTAI
	 u3Cu9EHYHivDsR/Rv5cDO7o3sI3rsxTuRB8IivPix05Z55j0qcPWMGOkVu4RuNGJ5G
	 KIxHUHhWG87LVYA4lqacFNm9ksTSpN6UiGyrLANsCCCv70ej8C6r1KwwkAUXZ0Saml
	 CZs5RDfT5Tk2g==
Date: Mon, 2 Feb 2026 17:40:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <20260203004032.GA52989@ax162>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
 <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
 <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
 <20260127231037.GA3378797@ax162>
 <6ed0fe99-3724-40c2-8d98-3309a3cf0104@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ed0fe99-3724-40c2-8d98-3309a3cf0104@tngtech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10979-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,linux-foundation.org,tngtech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A705FD3170
X-Rspamd-Action: no action

Hi Luis,

On Mon, Feb 02, 2026 at 05:28:39PM +0100, Luis Augenstein wrote:
> > I wonder if it would be better for this to live within scripts/ instead
> > of tools/, as that should allow it to be integrated into the build
> > process a little bit more naturally, such as using $(Q) instead of @,
> > $(PYTHON3) instead of the bare python3, being able to access
> > CONFIG_MODULES directly, and cleaning up the actual implementation of
> > the sbom target in Makefile.
> 
> Thanks, I wasn’t aware that targets under scripts/ have access to more
> Make variables by default. During development, we didn’t have strong

I think this is a byproduct of being fully within Kbuild at that point,
rather than in the tools/ build system.

> reasons for choosing either tools/ or scripts/. I’m happy to move it to
> scripts/ if that is the preferred location.

Yes please. If this tool is designed to run within and parse Kbuild, it
should live fully within Kbuild, as the "tools build system" comment in
Makefile added by Masahiro in commit 6e6ef2da3a28 ("Makefile: add
comment to discourage tools/* addition for kernel builds") notes (even
though this is not a C program so the hostprogs comment is irrelevant
here). scripts/sbom seems entirely reasonable to me.

> Regarding $(Q) and $(PYTHON3), I noticed that these variables are
> actually available within the tools/ directory as well, so we could
> switch to using them even if we stay under tools/.

Ah, good to know. I do not delve into the tools build system all too
much.

> CONFIG_MODULES and src_tree, on the other hand, need to be passed
> explicitly when staying in tools/, whereas they would be available by
> default under scripts/ in which case we could simply invoke the script via:
> ```Makefile
> PHONY += sbom
> sbom: all
> 	$(Q)$(MAKE) $(build)=scripts/sbom
> ```
> 
> So yes, I think it makes sense to move it to scripts then.

Yeah, that looks much cleaner to me. I suspect scripts/sbom/Makefile
could be cleaned up a little bit as a result of that move as well.

Also, two other comments I forgot to bring up:

1. With the movement out of tools/, I think the README should become a
   proper Documentation file so that its contents is more discoverable.
   That should probably be separate from the change that adds the
   initial SBOM scaffolding in Kbuild to help with review.

2. This depends on having a clean initial build tree (either empty
   directory or 'clean' as a make target) due to needing to parse the
   .cmd files, which could be stale if someone builds a kernel, changes
   their config, and rebuilds, right? This should be documented since I
   do not think it is possible to do something like what Masahiro did in
   commit 3d32285fa995 ("kbuild: wire up the build rule of
   compile_commands.json to Makefile") because of the drawback that it
   misses too many things.

Cheers,
Nathan

