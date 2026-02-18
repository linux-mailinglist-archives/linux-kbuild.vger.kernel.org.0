Return-Path: <linux-kbuild+bounces-11335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKw/BWAplmnUbgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11335-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 22:04:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D41159C2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 22:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1E20300381D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8096A3218D8;
	Wed, 18 Feb 2026 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OokdB++C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7533191D8;
	Wed, 18 Feb 2026 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448667; cv=none; b=fQ4/D3jzKu5pPksjUGGNGob+TdTwh0axN/WC+ioAA9zwtfley5Ax62k3XASdYMA1ehIF9WF9c7AEOkYhUJoNUuYnJETIBPBfJi9NA8/+jexhQDuAn1uhhmakf5xToU9SgBSXOVKDRI5VUFOEcBGErWc8hF00bTFavbtLKOh+v3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448667; c=relaxed/simple;
	bh=U+m7eXqN3GrcA4dG1sOA+GQr45WWyg1BY0wQX/U6TIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F12F2VEVI5XrwCODqMHQPxcDnETAvQHoW7NGyW9wlNOQWN1HCi06XJ9hoo+VoQPVQibY2uvEv2vqIiLpIfOyZH69jfD7dWmS8WbVc6hU/wlsw/y4e2b/kVquFIxgJ3c8o+U7onH6i/UrXauZ0/BrNQLdCpvMK0nxChzuBMFubnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OokdB++C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED493C116D0;
	Wed, 18 Feb 2026 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771448666;
	bh=U+m7eXqN3GrcA4dG1sOA+GQr45WWyg1BY0wQX/U6TIQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OokdB++C/aj1a4N4at/nDTLdHNu/QGoaJZXN88IO8J1sWtOhzhkuRHFZ7rAJX0g7r
	 jXl6NPkr/qP9EwbnfKQ5GpMRyD432Y6J+5tSTTurmSaFKiWXajlQLVHGuPfa/aYTEA
	 6Wio5JNb9CGys2nWmGzuY4cJDgHWnedi3uJx8hHHjyoIE9+zCGiPgkf30nDHB4XdZL
	 qJXr0TL+g6HrhaJv43ePM/Cl876Yp4H76GhTX8mMw0xckD0rWokAdBkt2IJewgmYQX
	 6Jptmwx90oIiaXzKaI1ZSnw9uPpeH5HmNrsRz91FuYgsyW2D7PDY5TNId5JQshFKfR
	 SyyyIKqUu6FvQ==
Date: Wed, 18 Feb 2026 14:04:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.0 #1
Message-ID: <20260218210423.GA3232039@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11335-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,find-debuginfo.sh:url]
X-Rspamd-Queue-Id: 38D41159C2C
X-Rspamd-Action: no action

Hi Linus,

Please pull this first round of Kbuild fixes for 7.0. The majority of
these changes are fixes for commit 62089b804895 ("kbuild: rpm-pkg:
Generate debuginfo package manually"), which came in at 6.19-rc8 (not
6.19-rc1 like the merge commit in this pull request says but I realized
too late and did not want to rebase). I thought that change was
sufficiently tested but I guess I only used the most recent version of
rpm.

Due to the backmerge of the 7.0 changes in v6.19 to pick up that
aforementioned rpm-pkg change, the 'git request-pull' diff stat was
quite large, so I manually generated the one below with

  $ git diff --stat df989b01b5f9..kbuild-fixes-7.0-1

which should be accurate with what is actually merged into your tree.
Please let me know if that is a problem.

Cheers,
Nathan

The following changes since commit 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b:

  Linux 6.19 (2026-02-08 13:03:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-1

for you to fetch changes up to f94711255a73d8938cf3bb405a0af3a4d2700ed1:

  kbuild: rpm-pkg: Disable automatic requires for manual debuginfo package (2026-02-16 16:32:46 -0700)

----------------------------------------------------------------
First round of Kbuild fixes for 7.0

- Ensure tools/objtool is cleaned by 'make clean' and 'make mrproper'

- Fix test program for CONFIG_CC_CAN_LINK to avoid a warning, which is
  made fatal by -Werror

- Drop explicit LZMA parallel compression in scripts/make_fit.py

- Several fixes for commit 62089b804895 ("kbuild: rpm-pkg: Generate
  debuginfo package manually")

----------------------------------------------------------------
Chen-Yu Tsai (1):
      scripts/make_fit.py: Drop explicit LZMA parallel compression

Josh Poimboeuf (1):
      kbuild: Add objtool to top-level clean target

Mickaël Salaün (1):
      kbuild: Fix CC_CAN_LINK detection

Nathan Chancellor (5):
      Merge 7.0 Kbuild changes into kbuild-fixes
      kbuild: rpm-pkg: Restrict manual debug package creation
      kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
      kbuild: rpm-pkg: Fix manual debuginfo generation when using .src.rpm
      kbuild: rpm-pkg: Disable automatic requires for manual debuginfo package

 Makefile                    | 11 +++++++-
 scripts/cc-can-link.sh      |  2 +-
 scripts/make_fit.py         |  2 +-
 scripts/package/kernel.spec | 64 ++++++++++++++++++++++++++++++++++++++-------
 scripts/package/mkspec      | 38 ++++++++++++++++++++++++---
 tools/objtool/Makefile      |  2 ++
 6 files changed, 104 insertions(+), 15 deletions(-)

