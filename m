Return-Path: <linux-kbuild+bounces-11433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gy6Nbtdn2lRagQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11433-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:38:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418919D544
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 167303069DE4
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 20:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB381314A82;
	Wed, 25 Feb 2026 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjJU1pbu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C87239099;
	Wed, 25 Feb 2026 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051881; cv=none; b=dJNFzlheShn1bH5uzwlm5VAROXPyqh0ONBGYsvRNFVLiNCxrMpaR2UtI9qXeZMRmH9+FcYK4Cj6XaXQtLWGxaVDc0jRsxE/nfVPxS6FRCBPrKkxPfUHk14KZy+ekCnTcW9+CvYjtFgyRYuEtrxIsL2bipuDPc8tKWvo1m8goGuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051881; c=relaxed/simple;
	bh=GMAVY17gpCGCjr2Ustwinu20tNmIi5ncKwoHEAgOmls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nodPGag8EJwPmA/NbVWmN+irwpi1JgsnwMyu9iCtB6sQxt//TQUUjjfLbB9HW4Eh6cipj65YSEli5SFYsLSncDeu8qy8QMN1G+dzOMF/aNi1tRl5I026qANApJFm1bLcrnqt8fh8c/93NXY30QoIPmH80he1ETuHezQt0fnfh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjJU1pbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A24AC116D0;
	Wed, 25 Feb 2026 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772051881;
	bh=GMAVY17gpCGCjr2Ustwinu20tNmIi5ncKwoHEAgOmls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjJU1pbu2Vj8C4WZLRZWTi1QmRCqQmxUm+2cydL6pC7otezDt/qScfxOq0pfCUGHW
	 KPu6jPkHe/fbgL1Tfnm1gFVyjtvDeslz+9vmGGPbYStCX9MB9wqrRycmwmKKe+bDI8
	 0G1L/eU0ABEtxcKrP0YZWQMEcwKKNWNVVsPWn786gmv2V0cZwC0fGDTlg/ltuUy4R1
	 HRAM1by+LEa7luOPIlxnJXiIE4QFbC2NVZ3yGVz7FyH4opVLV/JmQwc4LLHE861Nk8
	 cZF7CRimp7i+7v+oXqIR8YgmUA3FhOd1TsyCtAFvYOxbTduT1cE55qDr5Y1r4ujDGQ
	 WGzB0/vljNX5w==
Date: Wed, 25 Feb 2026 12:37:58 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Tamir Duberstein <tamird@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <vvccmql35pwtm7lga43lvrlumklddxxahb3c2hfwt4qyqsilhz@g3t7ce3gyyg2>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
 <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11433-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 5418919D544
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:23:09PM +0100, Michal Suchánek wrote:
> On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> > On Wed, Feb 25, 2026 at 12:26:29PM +0100, Michal Suchanek wrote:
> > > For packaging purposes I want to be able to grab the tool binaries
> > > without the .o files
> > > 
> > > Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > 
> > Wouldn't resolve_btfids need the same treatment?
> 
> No, make clean runs the clean target for resolve_btfids but the tool
> remains.
> 
> > Why is objtool special here?
> 
> That's what I would like to know as well.
> 
> > Also, what's the use case? Running 'make clean' then copying what
> > is left?
> 
> Yes, that's what my build script has been doing for at least a decade,
> possibly mutiple decades when it was somebody else's build script.

Why is the build script doing that?

-- 
Josh

