Return-Path: <linux-kbuild+bounces-9968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6DCA1BB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 22:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E31A13003841
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 21:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C68F30E82E;
	Wed,  3 Dec 2025 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fx5a8HDj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E0930C343;
	Wed,  3 Dec 2025 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798778; cv=none; b=jbLeXG97MzXPlCWaAc6PUG6DMQKnnE59P6mQ2CfIt67NtxbHRu0conzA3F4eUK7MyC52BorRi+f2W/L7mmA9Z54zO9hHn3AXWqVuIUNA8PU5aew5IMyVecDailU7S1GCwudE0+2IX4MlQ/wUEoq9Al4v6O/v0vyXCz0k2+Q6qxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798778; c=relaxed/simple;
	bh=UFjiXoKcfZ3okOf0qYA53wES/ej5Oqteqrh/IurkTDc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=V6/dxA5KVSzZhHbpCnHRAsGMPMPWl+zF8rxJ5eM4CoYdRCga/na+xzgMUNtIs62lz03ymsl5hOIPkGtIlco5q+SWSjECQJkMCGWuPIjmEggdDFhQmUVUNEYbX64o/974oXOZTpuKimA8xNXyEGSv2pF7KyuzbXnFsRd1XR/V7sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fx5a8HDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA269C4CEF5;
	Wed,  3 Dec 2025 21:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764798778;
	bh=UFjiXoKcfZ3okOf0qYA53wES/ej5Oqteqrh/IurkTDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fx5a8HDj3RVmF1lcInfg6NmCJ1dJp7P5O2ptvNfcZCehkq3Hvql75gsI/ZhomQMe7
	 B6oJw6OUvbrggFK0DbNKLqpYGOizuHaXHYGDnK9OI5tX0v1Yv5jQ/q/VdQdqOQAYMK
	 YjWwrsqDbXlZFUGLDInf/xQJaTwojeXAf9RLVwBRzF4P6c+xpNh3FxcM0HYBPNf5cV
	 vjhpzLgvAO5K6NiacG6dgotw/2b50Ssx7/mzZTtuf/KMvLlvjRXx0FwHPpbnVjJ/q6
	 8LEn+J7EkKrobCaoDNjLhCow7kQcLktz5EuAOWc4S4N3pPD/hCsZwhDNjxPID2aBxL
	 oWizc0i3znWZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B598B3AA9A81;
	Wed,  3 Dec 2025 21:49:58 +0000 (UTC)
Subject: Re: [GIT PULL] slab updates for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <1444c957-08c6-46f1-bcf7-da5211bfff1a@suse.cz>
References: <1444c957-08c6-46f1-bcf7-da5211bfff1a@suse.cz>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <1444c957-08c6-46f1-bcf7-da5211bfff1a@suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.19
X-PR-Tracked-Commit-Id: a8ec08bf32595ea4b109e3c7f679d4457d1c58c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b687034b1a4d85333ced0fe07f67b17276cccdc8
Message-Id: <176479859732.93177.16237702615670932988.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 21:49:57 +0000
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@gentwo.org>, Roman Gushchin <roman.gushchin@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Nov 2025 22:20:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b687034b1a4d85333ced0fe07f67b17276cccdc8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

