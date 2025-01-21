Return-Path: <linux-kbuild+bounces-5530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08432A18853
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 00:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB2AB7A1009
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 23:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C291F8AC7;
	Tue, 21 Jan 2025 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktwMgYFm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE441F890C;
	Tue, 21 Jan 2025 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501717; cv=none; b=VPo84HQcdLYxcIE0TfgOEPBb3B0YOwqRf2oW5r1c0JQgiZ804J7wgr26oXrscweB0i6aqfocOQUBNbsb4WXsb4d1C4/A+6LMphRuGtBS+KtNgvVvKgv86tQqx6Y4qcw8gb0CIr+dsNys17pE18JfS9ghyN0ORm2eQ7+OM4zFtaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501717; c=relaxed/simple;
	bh=DN9fouYPy3Q7SS2bBlqzCX9gB0jvFxYRG93/8cGJeg0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dZtr60L6UMPB2nEsPDlsqSYKeurovEHqA82J9F8cWJNpMaRT1c4S6ggr3T20DRDKzkPJ+CHpkT3SBqub+XVqAn1wceZ+NUbf5dbDT3YiAlQtZKgL09wLJ94X3eSkMo/si+CR+hdMq73Lwr/nIKYtNHHk3lOiQEPYysebs009bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktwMgYFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AF6C4CEDF;
	Tue, 21 Jan 2025 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737501717;
	bh=DN9fouYPy3Q7SS2bBlqzCX9gB0jvFxYRG93/8cGJeg0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ktwMgYFmNjWhWjOEApVG31J7cXXr5FJb1OdnR4auHO2Olpde0ouiA39byTusGia4g
	 HgIZ42kY/HhoR+gSAxFCGehy7U9KvDJdeWl3sk6JFfrvpHgvdaKzfxxwZsY/3LF36X
	 faGz7ZLCYKGPbhgimpu7+2OlCnYgmT6Dey8+PGup7t6sl7Y0/ce5/6dvH2oMFBQ8Sb
	 gENPJn0WdC6dFwzhIbQLvuiz6xb+ro+IVfX44P8hiyI1q/EBqkOnYx+vrmC7Vr657+
	 v+fMd6CumHLn1qa+GxO+eSSEHeIK5dtSIV+taD9gArKPuO2GzG/+8sgUe2tyCRGpdT
	 wF5s7sSgqAnHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7EB380AA6B;
	Tue, 21 Jan 2025 23:22:22 +0000 (UTC)
Subject: Re: [GIT PULL] scripts/sorttable: Updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250121162119.2c3c0a4a@gandalf.local.home>
References: <20250121162119.2c3c0a4a@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250121162119.2c3c0a4a@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-sorttable-v6.14
X-PR-Tracked-Commit-Id: 1e5f6771c247b28135307058d2cfe3b0153733dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c0e75905caf368e19aab585d20151500e750de89
Message-Id: <173750174147.150771.1802008775156683884.pr-tracker-bot@kernel.org>
Date: Tue, 21 Jan 2025 23:22:21 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, Martin Kelly <martin.kelly@crowdstrike.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 Jan 2025 16:21:19 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-sorttable-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

