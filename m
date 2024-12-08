Return-Path: <linux-kbuild+bounces-5039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB459E879C
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 21:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF5C16372C
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 20:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A537160;
	Sun,  8 Dec 2024 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkutMc3A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D8346B8;
	Sun,  8 Dec 2024 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733688336; cv=none; b=hu+Fvprfs4N4AZkJijetcnu0l3JFQybGFZaYfjS+V7gkMc/RliHQ3fURHJ/ikKItat2HL4RFfgkzEaSlbTjGE0ftEOq7I/T65nPR74dKjaE/HgUhWkIi+JfNhYd4n/kK6ptzLaic78mlr80TAvsGqm4o0+4U4G6l0WgSjYgMvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733688336; c=relaxed/simple;
	bh=5ipgaiC0tCoWFSS7vjJ6y9TVRV30o0y4bcKh33OydCM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=emDua4dJMDr4kTRHUNkvQ9W/PjY72er2x35sEtvamp+I/dHNzJZ+LmPcd+wlaubQpNX94Ba0BC3iWzXkV6aywq1x7AlBEIfE+fKxFfFFNLpFnXrrffIgl0mBDYekCV7g7b1W+GHfuHLWwtIEH0TWbWJsqDvY2fHJX7f7axfExX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkutMc3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B9BC4CED2;
	Sun,  8 Dec 2024 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733688334;
	bh=5ipgaiC0tCoWFSS7vjJ6y9TVRV30o0y4bcKh33OydCM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UkutMc3AXCU3SZPmQpcu75uI00Qzr1QHlIKEQdUcyFeBDOO9iEdds9qN9TDBgwF1e
	 bcKe6WAI04BBMWoL9YpSuIsTb0gWS17cCjtXUFiutBHGe5zsiysojeMxQ/iXsTs+S1
	 0Us4Xzn2lapFDWFYZm7MrS+Zbo68Mty2p39v4x3cXjWxp5VARxzuXi8RghLK+4fq9D
	 1uH4rlibppZCfuVqtohCZA0byVM+c1oEBYM8PQhxPMMgcpAtxzaru/7hV1Ax34aY1J
	 2x6HAGNx7ooemOZlS+q3ZfLgxm4Lj2LwvYsEsKqQcvBP5QMHnVmUYU9fA/KesOPrf8
	 rXpjkxdMVvgXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3424E380A95D;
	Sun,  8 Dec 2024 20:05:51 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQmNNCfOeqybJD-=TpA1nVE923pLc7Xvpa+k55rkR7hRg@mail.gmail.com>
References: <CAK7LNAQmNNCfOeqybJD-=TpA1nVE923pLc7Xvpa+k55rkR7hRg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQmNNCfOeqybJD-=TpA1nVE923pLc7Xvpa+k55rkR7hRg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13
X-PR-Tracked-Commit-Id: d8d326d64f6702caab01ea0cd48f6c0054f3d1b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0b6809a75ac026d4b569815744ad095b5d5955e1
Message-Id: <173368834984.3331892.3940260948816758847.pr-tracker-bot@kernel.org>
Date: Sun, 08 Dec 2024 20:05:49 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 8 Dec 2024 22:17:00 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0b6809a75ac026d4b569815744ad095b5d5955e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

