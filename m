Return-Path: <linux-kbuild+bounces-12239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Pe1OrMjw2l6ogQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12239-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 00:52:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFBF31DD32
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 00:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DDF030A76F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 23:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCC32E8B98;
	Tue, 24 Mar 2026 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4oMVCWC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E029D28F;
	Tue, 24 Mar 2026 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774396336; cv=none; b=ER7DafHFLVboRA+0rtly7Ivww3lQ9CjJ9PidBPwkzd069BAGdv/2QF77vHcCWVGCmIsCpAi7TExijJIHVozkkET47cKeCBM4hbpPZMlb0de0BcIljsqsoRsqDBqMAPHVvOQ5FFkM1SVEdg98fUGvcmdB3bdPd1ybu6tqDToukWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774396336; c=relaxed/simple;
	bh=+8xIqskFvgFj2hgqipiB9Qoah9CgOn1YcnE7ILDKZ/w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DNVQEEVEs9SxqQO4004TlpP7Nzmw42nPemdMp59lIDKF+HFe/XGUkrQJZvcMO+jYA6gNyZ6yjp4vzyhvBqyJLzZfKX/Kq13okqoBrQ+9BDysj8rPUwR/Dh7XVyLEM0DtG1JC3QjVuuH1TzehhCAI7umMLn3dOX6Ig/aygM82Hvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4oMVCWC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D433C19424;
	Tue, 24 Mar 2026 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774396336;
	bh=+8xIqskFvgFj2hgqipiB9Qoah9CgOn1YcnE7ILDKZ/w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H4oMVCWCTX6YkAk4WVcA6v15QWTufz+tDpXfwh/FGdaDGH3mQye+FTLSLKIz82z92
	 DZuXNXAkNOLayrstbOotMxS7+Fe2S0U8/C22b+NkOSG9CdSDezPLgBKIyEVjoC7t96
	 tWiWEFJZVpcCExGgVfunpqpl+42GUZBXA0lwTxLX+fKJxQESN4r2kQTacJsPGS9cDx
	 WIZxAkmqaM8E1nHH1YyLPO5da0KZTdXgwQlDUVpDkElpNmYe5yFBxjbSeRlAeJ0Cjg
	 0fb2OTWEupAHTZLJt5A8dJfAU5f8lEv+rWpeFs3D3aErqKBBJ65w5oBIP1DcmYcqrp
	 EulSEYfW+i4uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F333808203;
	Tue, 24 Mar 2026 23:52:05 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.0 #3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260324211035.GA2629374@ax162>
References: <20260324211035.GA2629374@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260324211035.GA2629374@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-3
X-PR-Tracked-Commit-Id: 775af5cbb22c1de2ad0f486959739c35cfc55ac8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbeb83d3182abe0d245318e274e8531e5dd7a948
Message-Id: <177439632344.1352456.9992336465270335446.pr-tracker-bot@kernel.org>
Date: Tue, 24 Mar 2026 23:52:03 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12239-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FFBF31DD32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Tue, 24 Mar 2026 14:10:35 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbeb83d3182abe0d245318e274e8531e5dd7a948

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

