Return-Path: <linux-kbuild+bounces-12139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jXk+MzmQwGkiIwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12139-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 01:58:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF62EB515
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 01:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740F430097E0
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 00:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397501A38F9;
	Mon, 23 Mar 2026 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+eHU+V1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1300F1A239A;
	Mon, 23 Mar 2026 00:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774227510; cv=none; b=dA18+3JenjGZKvaSEQenInAGZBE12/vhuBB22RR48FzRHHo11lllZkyDi06bsPYG+g41hZm8dt0jQY96NWwHHhlCT436Eqg/132yQbl/Jubu2zb48zDzvCA/mNfAa1trr6TH5zgfeoh+r4bCv+hDMdiNbmWu1U6Qc0o9pzjHXgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774227510; c=relaxed/simple;
	bh=pB6xwc0vPFu7TzWa7bjKTSBU4EEDHNG6Cj9oZuGerog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fjRpPXb8oafTxHKjcKgekrumRMMC76IoZtWas8sBy+5kG1j44xMdC9q1w8gGAnYL3/jNuVPF7KMxit2Kc3g+tARuTz04OnU5p/Kqs9xl+WJSg1rUTJ+NtmPhGPcCtQyThAeFClljIqOVgHDQq7GNpbUdos9j95owR2K2NLKkttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+eHU+V1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33558C19424;
	Mon, 23 Mar 2026 00:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774227509;
	bh=pB6xwc0vPFu7TzWa7bjKTSBU4EEDHNG6Cj9oZuGerog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B+eHU+V12o4BM+j1O+1XayzU3ZL9aW5ABHq8dAzH5hLoNhhs2q8yv2lnEVh/qUvxs
	 ahiy1iClvQmOKeU64t+6AaxFz+naMPyrxF6+4zAuWEde4KH87gfvBR6QfdkjA8tRfD
	 OrRGi7JQNYhtfPHxS31vjgojCIFAYGYjobpgZjvXMslXSmj+VDiYKciqhoYK2lSW3E
	 XzpuFjkjHYUwNrXzHq/+lFNmrRxS/qkutf43UmEGBO8NcM9zNS4KUthdP8r1vMpXSa
	 2jOYBNvwp1qTSN1VsDGJxLmZcWdG15kA3g0zg8FRB1pkBqYJR6rlvW+Zl850b2aZyv
	 wbGwgUyAXjlIA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, Daniel Gomez <da.gomez@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
References: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
Subject: Re: (subset) [PATCH 0/3] Fix merge_config.sh
Message-Id: <177422750791.3929241.15077805536979097524.b4-ty@b4>
Date: Sun, 22 Mar 2026 17:58:27 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12139-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26DF62EB515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 12:36:22 +0100, Daniel Gomez wrote:
> Restore empty base file support introduced by a26fe287eed1 ("kconfig:
> merge_config: use an empty file as initfile") broken by the awk
> refactoring in 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh:
> refactor from shell/sed/grep to awk"). Also fix POSIX compatibility for
> non-bash /bin/sh and clean up whitespace.
> 
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/3] scripts: kconfig: merge_config.sh: pass output file as awk variable
      (no commit info)
[2/3] scripts: kconfig: merge_config.sh: fix indentation
      (no commit info)

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


