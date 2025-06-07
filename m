Return-Path: <linux-kbuild+bounces-7392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BCAD0EF9
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 21:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61643A3E64
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 19:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE8D217F33;
	Sat,  7 Jun 2025 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="freZi6eH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477091FF1D1;
	Sat,  7 Jun 2025 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323209; cv=none; b=RPuVhAKF9iJ4P6RIXUoX/YEkWUhc39U/2EmVu4+bVHL25pA9Go5r8kzB75FRlqQt2nFF6biTRilZkhkvlGaIER7jG+CYWQa5VJnf4M1COY7xV8UPDZz73918kzxPCIte2lTDuDj+IFSL/kjDNEjjl4rd+Zhc055ER5KgVYNlyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323209; c=relaxed/simple;
	bh=nSRqcFqOHlvP1tYvNAWX84xol0W+4lUh9kVCRnkLdEQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VDwDk2+HejuXMvcLjBwkX0UpgkVZQc38+dZkNsDd3iqF+NOu0yfl3qyE/TErASFw5KDciWs9iydbWwjA2x/Ct0DP5O0G9u26ELENNHQmaOeF+n/RZ7DlpX5laihe8/TqnQ0F9Hp5xFHSC2ATefG5RTiATv+rvrGEq7M28KEYhBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=freZi6eH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A638C4CEE4;
	Sat,  7 Jun 2025 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323209;
	bh=nSRqcFqOHlvP1tYvNAWX84xol0W+4lUh9kVCRnkLdEQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=freZi6eHR6540tejlwpuBwlIlGEHkskTp4QMl8jSBtmhpgbsdhqRFlZZUfMZ2U6xN
	 +RzXA42lYh3rc3AYrcmMkWTZCbTXCGsOFZUQrJlU6S1H83DRC5pemg6koiGOiLfSXC
	 gJoi/0ii6wf+48GgH+KRtHRQA/33SH/guB6UgJjxWbGn3ptSRqW2c1kHSDUvQjmpPy
	 rkzSyKiMg8ocW3jIwVrOsCXlgMQzg51akPlvPslo8DbqxYaBi/PWIReLDfhBQBbAhU
	 38wecJwf19Jfsjtg8jFekGBYa02RPFgI+TaCWU94IOb0JDDEDsi4QAYdjJUL8YnTpI
	 GACWa6+H4Uc5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDC3806649;
	Sat,  7 Jun 2025 19:07:21 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.16
X-PR-Tracked-Commit-Id: c50a04f8f45c7f13972f9097622d1d929033ea8c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8630c59e99363c4b655788fd01134aef9bcd9264
Message-Id: <174932324029.115837.17716299217862228487.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 19:07:20 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 8 Jun 2025 01:41:18 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8630c59e99363c4b655788fd01134aef9bcd9264

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

