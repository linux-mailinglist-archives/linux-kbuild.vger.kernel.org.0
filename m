Return-Path: <linux-kbuild+bounces-12879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DZNNp1p7mkxtgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12879-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 21:38:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9ED46AF59
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 21:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC6CD301C17C
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 19:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9564738F65D;
	Sun, 26 Apr 2026 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feUI5768"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7150538F658;
	Sun, 26 Apr 2026 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232180; cv=none; b=dhoy6SdFg/Iqw7LpkIpBaUqZ1q9hszv0N1CZVQgwJztyttVdxp2oV++w75PJznO7yzhanEUMEYGdZkLmRTBHRCWyjZflWN42yF/8O5UaCgXaDj6iskhL/Mhtho+5o9d2enqsmNv5Jia+BPXhwOLHknLQnSydktCUgmrREcKmFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232180; c=relaxed/simple;
	bh=UWXeBCcE5RTdlJB/N26K8aGuY1laR13azhBIYhU8kdE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C1AZX05P1n8/WqmNw1wZiM5x9uxaj2oTLm1Oh00iOpYZaxBNb/AAcmYfl9A00A6h0zXh2W5MU/4LtxslTMbbBSqzQAW59E8kEnqE+DhNvGhJuHCWF8h8vs6Pd+ZN1cK//BYaJr3CCy9Wg2SGzqrU7WBeljNwW7hvGw6rHtuyaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feUI5768; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08474C2BCB4;
	Sun, 26 Apr 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777232180;
	bh=UWXeBCcE5RTdlJB/N26K8aGuY1laR13azhBIYhU8kdE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=feUI5768nk+QyhWTpGvAIpwaqHCuPStvkRa5/N/RsP+4idR0Txz/KGXwwY5hPbgqB
	 qfrEe4BE8uFlVVyhHVtRgmGc42dkOzfptrWDS2uEmRfGM0jjgTo/2qFlWC4WM4iZ7m
	 vGxfcsb0Os7SsLKHTivi9qT5Lya6QK5PsQS27mby89oHGSUzsZXghLx2UdXXYQcLLS
	 D2wG3aM8b43eHcqcT3Cnuo8GH5uTDedOV+gR3QieGFBXtG/jgm/E7/2NtCjUdEMHHp
	 peBKGmkb0lgWQMORzRzyVrPVPd8S4xqTUiEDFc7EoNZ2/UGQa7upL8q5T86BFsLdPa
	 RD2zuYwS1yeBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FF038119E5;
	Sun, 26 Apr 2026 19:35:39 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.1 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260425192708.2283642-1-nsc@kernel.org>
References: <20260425192708.2283642-1-nsc@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260425192708.2283642-1-nsc@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-1
X-PR-Tracked-Commit-Id: 75f7c47ccd78c947cf1b6ddb18ea453ff0555716
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b935117fe6d1af576e39b1f18c9e875f44bd146f
Message-Id: <177723213845.2364874.16643684062002064591.pr-tracker-bot@kernel.org>
Date: Sun, 26 Apr 2026 19:35:38 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Mathias Krause <minipli@grsecurity.net>, Nathan Chancellor <nathan@kernel.org>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3A9ED46AF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12879-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The pull request you sent on Sat, 25 Apr 2026 21:27:02 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b935117fe6d1af576e39b1f18c9e875f44bd146f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

