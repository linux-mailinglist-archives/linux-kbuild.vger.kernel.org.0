Return-Path: <linux-kbuild+bounces-12622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AOFHzfRzmmUqQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12622-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:27:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6D38DF69
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05D1D3072386
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 20:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEE438B15D;
	Thu,  2 Apr 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZqSpFHU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4663932C7;
	Thu,  2 Apr 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775161343; cv=none; b=U19XOkezedef/uADIuAvMjHjdoclOR2EU8kHIWf5G3Tbzn3dK0DhtDOxzikZiRqAkCEEZmeJal0kTaUPPkxAlm/amrsIJ600PSSSxukCxHDuw9bOP/63khc/Cuy2K8hp7tCtpAnRVh4F39zj/KWvxCHbbcqG0Obysi8tfDG+1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775161343; c=relaxed/simple;
	bh=PvGfzDU9brZIxEePmUKd7BH0lcdr2fRG+34wk/bFDhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fAn8PJHQ97Kk0m6NkW5dD00jU8XvLc5OiwtcJ+WYgkW0mRk1FBdvoQwH3aAHK/wyOk4l0TQKj4XA9ePZ4ybFeDqkNsFTOGmZjfpshKCj5JAl/19anrACt3XrkWveF2vXXpdCw/vinWgdtmKltjiRqkkkIWmABfhS/5iQX4PtXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZqSpFHU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3B4C19424;
	Thu,  2 Apr 2026 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775161343;
	bh=PvGfzDU9brZIxEePmUKd7BH0lcdr2fRG+34wk/bFDhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LZqSpFHUWk1DpcG/gHCCrnoM1QJ3scn1g64w7GyFQ7lhGjizBjyc6uJI3TMgixj7o
	 AC3N/TbwVwVR8JemZv+PeTfCEN/iVhWlsVMP+sZdODtbA92GjZTtDUPRW1SUiqo35e
	 D1WQNVkuRqfcvgZ0jNXhEgegfr54Yxf375PfvAjjBHbqJMtz+CuOyNHd7/JWZ6EDOg
	 qk3lXrZrTpXKkTxEdbaA5mZReTlWdX4UXL6bZpuX2CEJKEKkLhGYipFqxidiI4rruR
	 ea6i7ajbprzGmowDaI591o3ATthXraYpNivISVwEbOkWikgJ+jULsaYYXzBmcPoejx
	 987KCsWdjVB2Q==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
References: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
Subject: Re: [PATCH v2 0/4] kbuild: vdso_install: drop build ID
 architecture allow-list
Message-Id: <177516129010.3536083.15683376506942567231.b4-ty@b4>
Date: Thu, 02 Apr 2026 22:21:30 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=PvGfzDU9brZIxEePmUKd7BH0lcdr2fRG+34wk/bFDhE=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpzs/M1k5R7nfF/qQNoAtDM50u47VPxY85lh6VF
 RjASuwxfeqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCac7PzAAKCRAHUgpwFiYS
 aeRPEADnJIny8M6cz59KCG/eZxuz4y74zqd/cA77m4d1rfQ0VLEvLY9QwOk40NCUSafeea323fU
 mwWeq1gYRpi3YT/3j5lz18pNUq0SAeKLv2BSjw+Qek9eG20VQ/W/TOZ4QzI3NyZ6wetY2viqPs0
 PTMP5iyfH57rMFpOmcLHdC/ArTkDwM/7Z+8uBF8lj7vyJ3f5dSseCMPA6E45S5zY7X7aezdzQKq
 kVqgfHQ+Ne8pFfXqpauZQL1tMKXJgiyxM36GbqCKyyH54nOw/VuuHxHfHpJIiA2nciE5nRwSiAI
 lc0O/LaJiaMIjQKY41WuxNqGsbyKxlb+Gk9xj5/pCXde7D8tzeykl8pFqvVSGAqNxP7CfIiuOcp
 bwRNqZjtO7nX2BHcIE1ECd89qpemHqgi+J8fc2BovMZc0/W3yYz3CYu7E0Tlnr9xDnecoXsITeJ
 +ZRFz2O0uSVdSy757HCzhJ4G1Ye+QFsQrgypw5PSloCndTwm6LpY9PIHXNEZrFEX/IXHXj2AUEY
 VDv/Ka+rXOa7LfZgx2v03rvUyJFpsAqcUwBoifzFlekKIneLTNa4C+0qJV//X/mUmdZCsNTIaMN
 Fi65z0y796sER3HojFQkZS/uxhmOURRunjVX7rBNZYcXsDPd78JBpVdk9WXA9Tmp2jfGcFlGh3C
 cIWRZQF9vS+ag3A==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12622-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDF6D38DF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 19:50:18 +0200, Thomas Weißschuh wrote:
> kbuild: vdso_install: drop build ID architecture allow-list
> 
> This list is incomplete. Instead of maintaining it manually,
> detect a vDSO with build ID automatically and handle it.

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/4] kbuild: vdso_install: split out the readelf invocation
      https://git.kernel.org/kbuild/c/65407e38
[2/4] kbuild: vdso_install: hide readelf warnings
      https://git.kernel.org/kbuild/c/5625a6d9
[3/4] kbuild: vdso_install: gracefully handle images without build ID
      https://git.kernel.org/kbuild/c/4aed1277
[4/4] kbuild: vdso_install: drop build ID architecture allow-list
      https://git.kernel.org/kbuild/c/6606da9f

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



