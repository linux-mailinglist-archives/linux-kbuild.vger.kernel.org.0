Return-Path: <linux-kbuild+bounces-14019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bVkyKntSV2oTJQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-14019-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 11:27:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F422275C79D
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 11:27:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UGEcWL6t;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14019-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14019-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25378324D430
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 09:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B404156E6;
	Wed, 15 Jul 2026 09:13:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6D93ED5AE;
	Wed, 15 Jul 2026 09:13:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106786; cv=none; b=focswjSHKWpSA3v2IpHgCG4mknzxuiU/aV6SUk+xyI1K+70D8IxwjlGZRLu0bzxFAWakMnb4Bdlk5Mn0N+exGTaoHSz3Wu5cNNZVpDtyP1Ls6kIuBwuMxLaAjp0ZzZSqbYIpuzPZJXFDQV4/Yoa8o/q6GA453fp8loGsLGGSU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106786; c=relaxed/simple;
	bh=G/i/ewYZqYorVgWD72eYBIrVskApG5MGrO5mLrohA50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgFUJ4eyOigrRx8DFHo5Fhxe6tIBlZDFlkkndih9+wxZYwk2M2vTa4nWl5iMKnKdnvXEDjPSKEze7D3xjXj51exWBrHcwufxpU38qNMcBXgFVweWEElGGjkZp5QJfPagB5+sdy3T9mpGZM7R0ArBev/b3jqjo7H3fWfSICEs0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGEcWL6t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 744661F00A3A;
	Wed, 15 Jul 2026 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106778;
	bh=8A0GtFmCDKrgWuU+CKyCN6c2n4MA6f/QFaIEOOO5JiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UGEcWL6tGEBY0P9E1xk4C14Lr1AK2djarktMrhUrZPSLEnz6h5gZBpVs0VxFFp0gj
	 ZW0P86hKC6RThgOk/YIL88SfKllxXXHZAEhVyXlGJ76od7udnEF/QSJOl/3M7r5YfU
	 64NakHdiMBx4mDTKwpM6Z+KY/SqXdUw7mQ5NJSf8c9/LHXmlXIJ52WHqVPHbK/2Rpa
	 hlSL6BkyKFrYSmwiMgMZs7U0Nk3wFFUTWrB1iV4FG8z+cTREqsC+jScmQizu1gk6D3
	 Lba0anmkNuIRrzBDHKzYP2rZoH4RDc16v/IZ9eoN3dxpWgpcAJb3bIcnqQjVr1/Rb2
	 GT+Lh0CIpAAGg==
Date: Wed, 15 Jul 2026 11:07:30 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Sergei Litvin <litvindev@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, nathan@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] scripts/tags.sh: Prevent binary files appearing in
 cscope.files
Message-ID: <aldN0jGIFcavyh56@levanger>
Mail-Followup-To: Sergei Litvin <litvindev@gmail.com>,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	nathan@kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
 <20260714083331.69482-1-litvindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714083331.69482-1-litvindev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:litvindev@gmail.com,m:miguel.ojeda.sandonis@gmail.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:stable@vger.kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-14019-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,levanger:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F422275C79D

On Tue, Jul 14, 2026 at 10:33:31AM +0200, Sergei Litvin wrote:
> When executing the command `make COMPILED_SOURCE=1 cscope`, the resulting
> `cscope.files` file contains filenames with the extensions *.rlib, *.rmeta,
> and *.so.
> 

With removed Cc trailers and adjusted line break in the commit message, applied
to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] scripts/tags.sh: Prevent binary files appearing in cscope.files
      https://git.kernel.org/kbuild/c/1e5ebc3f

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas

