Return-Path: <linux-kbuild+bounces-9344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00567C277C3
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 05:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4D83A889C
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 04:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0123526F2AE;
	Sat,  1 Nov 2025 04:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlL5R+lj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB655257820;
	Sat,  1 Nov 2025 04:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761971848; cv=none; b=nJPHXY6Iq3r/hnqsS14NgZTVpKBH7mPI7Vv4ifbE0TsrhgL5OnJPvuM5IrezW1w668bz1+wTPcyrUnqsQxm9w2WrYIHPfTK7qgb9a+6ZaaJxp6jkU+++NjIGguZqZHPGlqkQ5Z8dllp0RacouKspAgVCwSYt91468Yvqwpoic30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761971848; c=relaxed/simple;
	bh=p6yQXpdLSJy53Brl9/Ptc7CoyMBdnRwKPTbii8DBsAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lk8lbOcKEsHexpAP6zai0Aw8RPiTFdSf3EJ8t4F9mLKtxW5clmHB+CkYxYWAWZElVxTxsbrYLNDgRVNokkWRsgWjoOSmwJ175ZqPMdy76wtjd3nMh53jc0bzGKN/9DEfpJP6M0ZbyOJVsvLwAfkp5C5c7g+uxTpFIRyi6uKSaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlL5R+lj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76EFC4CEF7;
	Sat,  1 Nov 2025 04:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761971848;
	bh=p6yQXpdLSJy53Brl9/Ptc7CoyMBdnRwKPTbii8DBsAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IlL5R+lj4cDp7cdlcyebKz2/KYnSQwapDnzjLeQnALEoIRamLIGWf46mHpzWrxPSZ
	 PuAxbPSG7Y427zu///7SOfrsvi+KcKt4mY65I9bvyW68BTPWS9HnTWFvo4R2kaGG+s
	 40aKwxw7fKy1sZ7eXNiseZOZKYsAMyltXdiTb2Xi0Z5AKJiit+FY+UY5SiEtP8YZFS
	 gOW/m65TtGM7ctPjQw21Be9piOJ653Hz1sJ3CzgHkBxIhXeJ7IJGfQ4r9ZBkhR/AlH
	 upFc3mTd+Ha7B70T52W55/oVeIaPbZmPhEmaZbBUTQktsMGTjdd505tGxclTGMlu+y
	 HzpZLDf2+lsxQ==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Jakub_Hork=C3=BD?= <jakub.git@horky.net>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20251014144405.3975275-2-jakub.git@horky.net>
References: <20251014144405.3975275-2-jakub.git@horky.net>
Subject: Re: [PATCH] kconfig/nconf: Initialize the default locale at
 startup
Message-Id: <176197184748.682017.1476965392341625574.b4-ty@kernel.org>
Date: Sat, 01 Nov 2025 00:37:27 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Tue, 14 Oct 2025 16:44:06 +0200, Jakub Horký wrote:
> Fix bug where make nconfig doesn't initialize the default locale, which
> causes ncurses menu borders to be displayed incorrectly (lqqqqk) in
> UTF-8 terminals that don't support VT100 ACS by default, such as PuTTY.
> 
> 

Applied, thanks!

[1/1] kconfig/nconf: Initialize the default locale at startup
      https://git.kernel.org/kbuild/c/43c2931a95e6b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


