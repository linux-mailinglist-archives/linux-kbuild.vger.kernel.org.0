Return-Path: <linux-kbuild+bounces-13448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEwVLybcHWpsfQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13448-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 21:23:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB162492B
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 21:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FFB4300C7FA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 19:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E293357D02;
	Mon,  1 Jun 2026 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0JT1OeA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755B1EF36E;
	Mon,  1 Jun 2026 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341792; cv=none; b=IuRs2/gmSVv9tq7BJkDfjJUeetLteYN5H2kC4D94F8bCvBVDTS//qgXhkLll9rKE3s2YbmlJHcL09rnHXZPkgTERrrVs/yTjkIEEaABYI1c1ThAHWSpZljyzoRnW/CaXYrcYfpJgcRydY5ciSEU4i0UFu74A76UGuQLhuUpgUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341792; c=relaxed/simple;
	bh=L+qi8U6BysyE2QrJRAz3j6VjAbdVw32YE+KiOOyZZCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p48hqtnVRGpR+d3m5deibWnC/tAbq/iiH+4IHNEEIXwc6kGvOHEthGFIJfBSxmiJMqhj9DSnOg7DcJLNLHMC+9QDwibIdgp0zVkeLkzesRzwOdFcjl9yGpwol0jPf+itER4pBf0Rfyw+op9duHDtdrZ1AjHs+SOVKZmoITQz6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0JT1OeA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432C91F00893;
	Mon,  1 Jun 2026 19:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780341791;
	bh=zWHoYkFjoO+SpkDWFgUxKEadkInn2HtlA6Y22Vycj3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D0JT1OeAu0wQ50i2gLZtvrmqWh1bjqeALWFTNOC41g1I4GQLIGrml4gGj5R2KIzqR
	 krYFMdQx4RWowCWCPdkVD1eXrX+WKYG+cppmqgfuOjoJ01dccoQ8zhA1MZtjtR8hoa
	 v52cdK3WlblrW3hcf5aPCpsJgR9glW6h3U2CeKUOASr5cNAbPWDyqYcKIK3OgzeE6y
	 DTj8JuElerTwBZQ3SXJ9dGgz36urCFX34/rtXwb4uD8nYJc6M80TAnz87C7TBvMAUr
	 1zmpyfwJJN2jXYpilUj4O+MR8cdJrX6c2SeTj85c+xatTOcILAl4v9YIq7Bqe/4Jv7
	 avyj8V3T4F/Pw==
Date: Mon, 1 Jun 2026 12:23:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Joel Kamminga <contact@jkam.dev>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	lossin@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for
 cleanup
Message-ID: <20260601192305.GA965997@ax162>
References: <20260530184944.10459-1-contact@jkam.dev>
 <20260601165042.8450-1-contact@jkam.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601165042.8450-1-contact@jkam.dev>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13448-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,garyguo.net,vger.kernel.org,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AFEB162492B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 10:50:42AM -0600, Joel Kamminga wrote:
> On 2026-05-30 12:49, Joel Kamminga wrote:
> > This cleans up files generated by rustc compiler in the case of an
> > error containing an excessively long type name that doesn't fit in
> > a single line. Such types appear relatively frequently so the risk
> > of generating these files certainly exists. These files are purely
> > compiler artifacts and are not created intentionally by the build
> > system. They should be added to the `clean` target to stop from
> > cluttering up the source tree.
> > 
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1236
> > Signed-off-by: Joel Kamminga <contact@jkam.dev>
> > ---
> 
> CHANGELOG:
> 
> Changes since v2 (https://lore.kernel.org/linux-kbuild/20260529205529.75586-1-contact@jkam.dev/):
> - Change commit title to be more imperative and more heavily scoped
>     'kbuild: clean `*.long-type-*.txt` files' -> 'kbuild: rust: make
>     `*.long-type-*.txt` a target for cleanup'

Not that I think it is worth resending over but I personally find the
"clean '...' files" title easier to understand than the "make '...' a
target for cleanup".

If Miguel wants to take this via the Rust tree:

Acked-by: Nathan Chancellor <nathan@kernel.org>

Otherwise, I can take it for Kbuild. I don't have a preference and I
doubt there will be a conflict in this area in the next couple of weeks.

> Changes since v1 (https://lore.kernel.org/linux-kbuild/20260529203426.65189-1-contact@jkam.dev/):
> - Replace `Reported-by` tag with a `Suggested-by` and `Link` tag to reference back to the
>   related GitHub issue

-- 
Cheers,
Nathan

