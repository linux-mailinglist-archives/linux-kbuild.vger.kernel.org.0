Return-Path: <linux-kbuild+bounces-9097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464FBCFD72
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Oct 2025 01:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378C73BD6E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Oct 2025 23:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03627238C1B;
	Sat, 11 Oct 2025 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaYveqMQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E14A32;
	Sat, 11 Oct 2025 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760224246; cv=none; b=UupO7petfclduG+YXGt1jiLkLCOVR6ABQLuD39skDTl53a6ah0TauyX1rEz6Crtj0II0c99wDvchVVVlqYRNVb8wwK9wj+ZSDvk/YJVp39XeJrfNJD3MBddTXJTPoIv8Xe+Sef5W7bt0zfR59289HY54nPrfIU/bKZbwyotkLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760224246; c=relaxed/simple;
	bh=4c+UeOcVpF1rrcR6a082TMGt4ZmCz7nACYwI2Fzt5Rc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kduihO71Cp9AER5h78dKAumVcP0B5VHRGEPbGHmQcbd9lObYpE+vlVS7hqF/ICQzn46L15sScsUPSIDfw2ALfiFc+zR31JO/ODao9k1H+CA5sq7jFwHdqmTXoAZ4f6QdRT2EZgeZ/iqS1dXfW3eW+hRsdf27jEB7F2V/rCNxXAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaYveqMQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C9EC4CEF4;
	Sat, 11 Oct 2025 23:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760224246;
	bh=4c+UeOcVpF1rrcR6a082TMGt4ZmCz7nACYwI2Fzt5Rc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MaYveqMQpKUuoXXAc8bUxV6jaF3F+6ZSbs/zOYIYbkQUOGdMkfMxWLlBfNJGaDCvC
	 yOjiSBltuLg8SwB/SeTxpuneHLP0v0/oTdyMYzNs+jmECzS97GDZe1iSHHljAOfEvf
	 0CW6WRiiPrtWU/PZ+uf5m5Yjixu15Y62IdhcyAEGENRfDxeiJNdqb3aFR7YFSE1xzQ
	 ZhAlD4+NXnMFd2oF1P7A1R39UcFXCPzNIfQNsPa3fx6GkhQ63Bnp9sM/8nOUybtdcV
	 e2sQQIKghVqQDPBoOJP5LzsRkiDhKjsvZ8VB/zDyxqIBluqH+lBoSTKEfbcXwBIAQq
	 ppHufiwp1UixQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0493809A18;
	Sat, 11 Oct 2025 23:10:34 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 6.18 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251011194325.GA1123518@ax162>
References: <20251011194325.GA1123518@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251011194325.GA1123518@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-1
X-PR-Tracked-Commit-Id: b0f2942a16017f88395d768afedd7373860968ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c04022dccb2f9cf2b1cfe65807149500d1fc080a
Message-Id: <176022423332.1477897.9232413880238519025.pr-tracker-bot@kernel.org>
Date: Sat, 11 Oct 2025 23:10:33 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 11 Oct 2025 12:43:25 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c04022dccb2f9cf2b1cfe65807149500d1fc080a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

