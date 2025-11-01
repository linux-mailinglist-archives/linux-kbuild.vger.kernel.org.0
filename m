Return-Path: <linux-kbuild+bounces-9343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEAC277C0
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 05:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB2933A6985
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 04:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057111C84A6;
	Sat,  1 Nov 2025 04:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JftPg4Ew"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6CF176ADE;
	Sat,  1 Nov 2025 04:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761971847; cv=none; b=VVcUyYFWnZly85wvLyA77qxapLEBfM4AE/0nvFo/XQeMW70rSRoOfnJnJ/KRxkrbnE6qbO7QDccjwapHrRZYIAshyvmvgdiZv55bR3/SrxXLvn6cGBS9G6mKPH08eILnyrIcd4ZPrTzZSf829JSZcEwBk5pwjAJbzbtnJrtyC+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761971847; c=relaxed/simple;
	bh=dQhbjR/JetT2TngI4/G+ds/GUXhV2XTtyLMOdSrZ5Vo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uZswJWWpfdRs1yIjx71VCvnKLTJpO/lq204cvyPbP4z9coIqJPS3lDgnIRvwBWEGrLwbcCsiTQTG+KxKeu2nPnmrAVE53cRKpvrBPSuOGy+BfNRzNz8ZuZlEZOzADHl2liN4we8htsgyrgzDIJsEER1enyYVkyST69xwqCmY/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JftPg4Ew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D087C4CEF1;
	Sat,  1 Nov 2025 04:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761971847;
	bh=dQhbjR/JetT2TngI4/G+ds/GUXhV2XTtyLMOdSrZ5Vo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JftPg4EwuvzlcBbkd7l5vlMN5WBQ+vj/PEiiWGkfrR8TaRV7W+8wlUDjDo2phEPIo
	 LGkeeUfqcr4NvFTW6OsMm8mEmBlPD4fyYUYTs71aP3k/hGXJ7VCCeEaxpWxyGrOgiK
	 6jDT+6X7naFyaGmG5SLb/YE8ZfgIm+M+p8oTD7ZqcqoY8Z3j7OACxT2d88M+yKnxLV
	 ZCvMMskQgpRRlWmPaAoJTpq/FFGaSkvOpVU2ucfxQW+UsvH1NtBWyEF8UWZ5PEYGUP
	 On0AOexrjoAf3799McdvK+2V9Gqz2aNaE3/GBLeilRx93q5xBGxWr+u9YWcxO0Gl48
	 za67Lp8ax0BtA==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Jakub_Hork=C3=BD?= <jakub.git@horky.net>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20251014154933.3990990-1-jakub.git@horky.net>
References: <20251014154933.3990990-1-jakub.git@horky.net>
Subject: Re: [PATCH] kconfig/mconf: Initialize the default locale at
 startup
Message-Id: <176197184636.682017.1549900338236343756.b4-ty@kernel.org>
Date: Sat, 01 Nov 2025 00:37:26 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Tue, 14 Oct 2025 17:49:32 +0200, Jakub Horký wrote:
> Fix bug where make menuconfig doesn't initialize the default locale, which
> causes ncurses menu borders to be displayed incorrectly (lqqqqk) in
> UTF-8 terminals that don't support VT100 ACS by default, such as PuTTY.
> 
> 

Applied, thanks!

[1/1] kconfig/mconf: Initialize the default locale at startup
      https://git.kernel.org/kbuild/c/3927c4a1084c4

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


