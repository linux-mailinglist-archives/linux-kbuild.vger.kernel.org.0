Return-Path: <linux-kbuild+bounces-10909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SElUAfVFeWlCwQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10909-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:10:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2F9B534
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 126533013A73
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25FA2C15BA;
	Tue, 27 Jan 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pADrJFE8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40222256F;
	Tue, 27 Jan 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769555441; cv=none; b=dhVpSMBtOV1w19jX5jg4+zFX/3RfrEXxLjttEWny/JbfUcy84SgA/4JBBaDLxWQfto0wBdp7Z+PkpemoEX4OKEUGdQG/FG8fSQ0+DZBvU9VrMKiv+DWiS/cC8EkSQ8wkjCui1s/deFXyfXas5iB9j0HA2EuUNB7oYF4uZXvI5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769555441; c=relaxed/simple;
	bh=+f1iiYEBZrHprIjQkNbewGC6qO2n1Aive/bK7g9r/7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcaYbhQLk2zfDLy8fIv7O8ICFmKqYpohlgkggfocCxDdY/aE9ejN03rMqXbIbbKuZhXJThI+FoVXTPOaJCyfpit9z6cLjNDyd7YPVnrGI7nhqnzxacKnOaRVIl0aAq4gsSv/XuFkfmlmXU5DNCXY1D7VmbIPetkU2oLLQgrOYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pADrJFE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4C8C116C6;
	Tue, 27 Jan 2026 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769555441;
	bh=+f1iiYEBZrHprIjQkNbewGC6qO2n1Aive/bK7g9r/7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pADrJFE8zgDxj+QEvfU6taS+/tp8Fog5PBtkur20PM6ruYhQYrVIOmJO4b3cAZSR6
	 nIc/p2kVDKO/KbuxSAKx0LssKFBhOMB/VtDSmgNRpzP3Ljj2PK3nsejo34vev6mXr9
	 K+f85+z0JM6zhH8m/d0OWTDiB5uGRRbyoGvRFoLf7wXuccLbrRgs/KT2fmlhJKoiP7
	 MzRHiiYPJIaAFw1R1uv5jkkOGOi2vv+LWyQ+hZIIqedxZTjBUyFhfQdiybv5WwqkNB
	 qg4acARS7EAFtTBxCTtMAlP8Rx80PqDLCzyIsbDTjeHo7C5CqKsOxFCfjy+oYiIVDR
	 1TyAEhzv9zaRA==
Date: Tue, 27 Jan 2026 16:10:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <20260127231037.GA3378797@ax162>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
 <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
 <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10909-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[tngtech.com,gmail.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58E2F9B534
X-Rspamd-Action: no action

Hi Luis, Greg, and Miguel,

Sorry for not having any input up until this point, as I felt this was
not going to be ready for 6.20/7.0 and I wanted to focus on getting
things ready for that release (on top of other work). Some high level
comments based on what has been discussed so far to follow, it was going
to be hard to reply inline to everything. I will try to take a closer
look at v3 in the next couple of weeks but I might not get to it until
after the merge window closes.

I agree with Miguel that if there is any information that we can add to
the .cmd files or another file generated by Kbuild to avoid hard coding
things while preprocessing, it should be pursued, as we should be making
the build system work for us. We have already some prior art with post
processing Kbuild files like scripts/clang-tools/gen_compile_commands.py
so I am not too worried about that. At the same time, I do like how self
contained the implementation currently is, as it is just there available
for people to use if they want it but it impacts nothing if it is not
being used. It also makes it an easier maintenance burden in the
immediate term, as I would like this to be shown as useful to various
entities before it starts to entangle itself into the build system.

I think getting rid of CONFIG_SBOM in favor of just an sbom make target
is a good direction. If we really wanted some sort of configuration
option, I think it should only mean "generate an SBOM by default" and
nothing more but I worry about this getting turned on via compile
testing and causing issues. At that point, it feels like whatever entity
wants this information can just add 'make sbom' to their build system
since they may have to control the outputs beyond the simple "all" make
target.

I wonder if it would be better for this to live within scripts/ instead
of tools/, as that should allow it to be integrated into the build
process a little bit more naturally, such as using $(Q) instead of @,
$(PYTHON3) instead of the bare python3, being able to access
CONFIG_MODULES directly, and cleaning up the actual implementation of
the sbom target in Makefile.

Cheers,
Nathan

