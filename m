Return-Path: <linux-kbuild+bounces-10983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FtQTC8J/gWkUGwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10983-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 05:55:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75FD4810
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 05:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2329C301CCF9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 04:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BF221D3D2;
	Tue,  3 Feb 2026 04:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmYkz1tI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A383EBF23;
	Tue,  3 Feb 2026 04:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770094526; cv=none; b=S1pv2UeofRKZEp1BPTif3oKa5NuNEveKNDB8HVxh5ZxlycqkpVJGVvV2ODkZ1eNVYnxDoXqpahFRTW4ngLjs7t1KJvOlZot1kW1EnidR3dktitTnp3ze4rhan9NLcP4pD3TDHaSFPqpvbB0eU5cKeyHDJLJ6WZzYS+DRz4LzCH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770094526; c=relaxed/simple;
	bh=Y3eM7cMhS3+zXCHZho/4C/qIe/elRW5Y1TP5TzamTlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pvLtiah+9k6v9Flj7hXjY1KT4OGenFDLyV0ZCv/qnY+DGKJsVpMXiAovSm6lWcZJN8R6yAvOlC1L/5aApGzQiB/daVbN/RJOOYT0wkBEIOFrVfkvEiEDdbqHl9IfHI74hL7qqiH4Y22C5BNjNfjgz4cjm/Tuho2W18k6282rQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmYkz1tI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D07C116D0;
	Tue,  3 Feb 2026 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770094526;
	bh=Y3eM7cMhS3+zXCHZho/4C/qIe/elRW5Y1TP5TzamTlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bmYkz1tIXYdUZZzWHFmGvG9AhDR9J8tyVA+85aKSRSp3gaKXPc414bnaVwrz1Dpy+
	 jmVgNQOW3mdRYhumZzVB4/kYqX8tTG8XqBd8f2urwC0ueLws/AVgMZ6OralM/gXWf+
	 RsGlubgdy0llZAexg1zvIEu9VdJgVYGB5EZHioLm18BP7nTfA97Y7QU2gMXCKfX3FB
	 kw6rbXpK+D3E1AjrzoKvc65K3u6s/ju6hjk6heUxxoh7E1MKuDTsNTML+uafagaVxE
	 oH91wLddK4LIcF7V4i4bKWbSU3hTa29PtMHgTzosqBPv4dLMVTbO2p6n/AgOWpmExX
	 OQr7yjQEQ6mCw==
From: Nathan Chancellor <nathan@kernel.org>
To: nathan@kernel.org, Diego Viola <diego.viola@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260202054541.17399-1-diego.viola@gmail.com>
References: <20260202054541.17399-1-diego.viola@gmail.com>
Subject: Re: [PATCH] streamline_config.pl: remove superfluous exclamation
 mark
Message-Id: <177009452526.3190166.2162163285999095717.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 21:55:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-10983-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7E75FD4810
X-Rspamd-Action: no action

On Mon, 02 Feb 2026 02:45:41 -0300, Diego Viola wrote:
> In order to make the output cleaner and more consistent with other
> scripts.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] streamline_config.pl: remove superfluous exclamation mark
      https://git.kernel.org/kbuild/c/72043cf7f100c

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


