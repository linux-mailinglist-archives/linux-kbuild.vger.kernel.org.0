Return-Path: <linux-kbuild+bounces-11459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIZCK0a3oGnClwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11459-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:12:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A701AF848
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 519F13036045
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54973939B3;
	Thu, 26 Feb 2026 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/OePFSz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957EC35A3B4;
	Thu, 26 Feb 2026 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140298; cv=none; b=oO5YCYuDX5TwyZyrOuHFjUtMvlrgq2WsBIFzvnGYAz9PEyJzieAXMsIRGvXlKC0qjQ6ySlqfiiXDSFj24QWxjc9nhypGoNIfwCC21wWbGTT1GLffYSqBFtD6P+43LzhN5xxq0NNnYlg7iagTzdzlVKovO1DL8boXraNpcbpFIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140298; c=relaxed/simple;
	bh=t78nYDNpbPrhvr8M0bwetsQVeWviwTUQh3AOS4tqkC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjF4btVYx7KQwGteS2AIgjYsNnRRl36mfwf8RyyaBgpQ7T0C4um2OWfkDUmyNfe8AuUR7CL2WqVqtFPDjRqXgssDi248NnP4myQZuqrdsfy0IcuHmHPIQDWk15VbnzP41F3c+D3phAFIL7G28iTCQXcKTxFMaRmJHYfj6s1Lp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/OePFSz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21118C116C6;
	Thu, 26 Feb 2026 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140298;
	bh=t78nYDNpbPrhvr8M0bwetsQVeWviwTUQh3AOS4tqkC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/OePFSz5kbL3gMV9aSG8FOzOpl8AAmvFCrWmmIZEkUZ2KNYjyHNFlkG+jbX+VUhH
	 FVythSbb/T/kQjzOGrQ+MLJxN16aL+pzLiMF/QFFZiFEQMRUX0lHEfjkwryDNTg57u
	 4oBZnGe2olbQibO9AxszHRQaQ0F5snB1Na3LLhL3sjiDwprz4b6f5SFROVyFEOGwRJ
	 LwwB7PBcQMLucHfc1VkunDA0+4rIqYUEmT4KIYhxEL9cDdoLExGr/+egevZX2QHqRf
	 qeswc8EI/WxW10/UUPbbbIj0duF2PCOtqAlSy62w/N1dMkC5xuzCvAR+tfJWBFlhLu
	 xAMhIz7m76NsQ==
Date: Thu, 26 Feb 2026 21:47:39 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Package resolve_btfids if
 necessary
Message-ID: <aaCxa33uB2JvS9qg@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
References: <20260226-kbuild-resolve_btfids-v1-1-2bf38b93dfe7@linutronix.de>
 <20260226203758.GC3196155@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226203758.GC3196155@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11459-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gen-btf.sh:url]
X-Rspamd-Queue-Id: 09A701AF848
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:37:58PM -0700, Nathan Chancellor wrote:
> On Thu, Feb 26, 2026 at 08:41:48AM +0100, Thomas Weiﬂschuh wrote:
> > When CONFIG_DEBUG_INFO_BTF_MODULES is enabled and vmlinux is available,
> > Makefilefile.modfinal and gen-btf.sh will try to use resolve_btfids
> > on the module .ko. install-extmod-build currently does not package
> > resolve_btfids, so that step fails.
> 
> Heh, ironic that I was just looking in that area yesterday and I had
> thought that this would be necessary if vmlinux is available but then
> never followed up... Thanks for this.
> 
> > Also package resolve_btfids if it may get used.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Nicolas, can I take this as a fix?

yes, please.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

