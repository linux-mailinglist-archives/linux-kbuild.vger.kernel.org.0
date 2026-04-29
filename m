Return-Path: <linux-kbuild+bounces-12936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKYiOJNP8mlHpgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12936-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 20:36:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE249931B
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 20:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DDD309997D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 18:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F22410D1F;
	Wed, 29 Apr 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYBOX2kv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E483CA4A0;
	Wed, 29 Apr 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487576; cv=none; b=XLKAIVWNHxIelDqEVow3spQQmVLE12CejmBps9Mm+yn+rgXZdc4CqRjV/kibC4o9MZTBdyj6Oi0MKktl95UISshBza6WK/UCAVJEHCVvg1jmdSSdhXMJSvSP7JfNow2NNjrM892A3pTd/Mtes0nn+PKfr1EbIgjif9shAdmVjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487576; c=relaxed/simple;
	bh=Mu/ta9+/O+KhioAAAqIHA/1BVu4TvKpX/Xnp3SgLJZ4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JZZlAp6p1Q4hPFgM0N8UEF0sI82OXB7KdutDLmQn9N2imwg1U0zIWwTS0t+/S1YvKZHSkrYE6LOEb/OW1a4Dl2FLjo1sWqxUccqiPAh1cxcz3M4SdnVAp0EDtO12I4jX9jrXdRgSUB2gXMXpUxBn50uKTkrkas3r1UdTHUpvKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYBOX2kv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E69C19425;
	Wed, 29 Apr 2026 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777487576;
	bh=Mu/ta9+/O+KhioAAAqIHA/1BVu4TvKpX/Xnp3SgLJZ4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=qYBOX2kvWsGSlaJ6aPcVenqF5jNX7w2ZbmNLSEWeoQk69N5Of2bJc7U/S0GRT5FfS
	 HiFyTMiF24C3DA26p0HM93FVW5Qag64Q3Yx/mU+e65VoMzDf4OW8VpG1BEZxVeHtdO
	 bYUbLUl1679zfXCSXEuMyHpxQwSCdYXkPP0QpE1vxB/UFi6S4uRaZuKlCi3efkEMRW
	 a5UuF5dP9ls21j5C7vMp0dwd1eEBuYADH3msx7vwkSQMS1BVZRnm+36J4gGtIQrx7h
	 TfKETLjFhZMxnVUQa3Fvv9y4tP0H7UrAFnzcMHhgDVQkQYbpoOkMNqXYwUy/dC58OB
	 nh1oEMtrRgXzg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] gen_compile_commands: Ignore libgcc.a
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
In-Reply-To: <20260427-kunit-or1k-v1-1-9d3109e991e8@weissschuh.net>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-1-9d3109e991e8@weissschuh.net>
Date: Wed, 29 Apr 2026 11:32:44 -0700
Message-Id: <177748756454.3546642.14418797696933108480.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=451; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Mu/ta9+/O+KhioAAAqIHA/1BVu4TvKpX/Xnp3SgLJZ4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmf/K5KsZ/y/l+T86knt9LAfeeua+2JnI5udxYyGC142
 bQqjuVrRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIFjeGf0aPX0+1dFk5s9H+
 kmy7zdZT6eWcfJ/Sp/3d2BkZ4B/VP5mR4WUHS0/ZGvsVm3ZkZXjEiO+bsvvA4lez5M9ydnWFTJr
 hwgUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 5DFE249931B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12936-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linux.dev,davidgow.net,vger.kernel.org,lists.linux.dev,googlegroups.com];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:email]

On Mon, 27 Apr 2026 18:04:56 +0200, Thomas Weißschuh <linux@weissschuh.net> wrote:
> Some architectures link libgcc.a from the toolchain into the kernel.
> gen_compile_commands trie to read the kbuild .cmd files of its
> constituent object files, which are not available.
> 
> Flat out ignore libgcc.a, as it is not built as part of the kernel
> anyways.
> 
> [...]

Acked-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


