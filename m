Return-Path: <linux-kbuild+bounces-10286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E542FCD2117
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C89473038ADD
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77442D5A01;
	Fri, 19 Dec 2025 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZs3aqw7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817B29C321;
	Fri, 19 Dec 2025 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766181538; cv=none; b=af+Izyn7RUvCKLTiKsknN/EWw+ZoOPI7XkH6cHCV/aZDPAq0tE6QBJzgpfiqB2wjeHUgX32XY2ZbblX/EwJqY9StI6olkG92qGtzdmQ1ljzbp/RSg3Q1MaQrAzoUCDCrL4gfXIMWPlxxe1Js0G5f67HxO6todvrVs0rPGA4uqH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766181538; c=relaxed/simple;
	bh=XEBZd6fatc3k1WvnzfAjOyEtHEpXO6c8bs4j/HqNIrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mmU45ChYlVorPUG5VsW4HIjlvY75fM7FzBQEZh6N15FxkkWaVlKM0i6M2Z7iYgi1uSoY1/2ndekNOAvP9wMbGaoFjs83QKBgXuF7N8MsRn3coRPacx1g8/pRgSZv/P2XpeEt4p4UHcYvS7q+iZt9hm027ua9oj0afdEVLG6sQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZs3aqw7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AE8C4CEF1;
	Fri, 19 Dec 2025 21:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766181538;
	bh=XEBZd6fatc3k1WvnzfAjOyEtHEpXO6c8bs4j/HqNIrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aZs3aqw79PAwhqSnu9dpK8Tf3hAIVVwDDCjQWMnDg37/0Pr58/gyVYoXWm81hNkCG
	 95zt+g+C5QClzWdvepjJwqMjD16gF86tql1wWfVv1Ki/U4gCp/J5h6k5BaV0TdR4ZS
	 hzxVj026RQJ7qZnE2fqYDAWJG8yMrvK11ek5nWkHq6C5H/GWHMVxEJk6QTNtiAVPK1
	 97R5ublfM0XE3iCzcvY3QcBKeiUJo3jZd3a14SucD6hoHjPaPRifo0PWViNS7O508R
	 AVTWQ3ZVlxIIwjCDqHGYCp7ARyAlHoK3W693ojsgzGT2VYPIuuHOnHlpdnh0tlYEmV
	 rNfAoDikPrw3Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-v1-1-84c63a8fc8d4@kernel.org>
References: <20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-v1-1-84c63a8fc8d4@kernel.org>
Subject: Re: [PATCH] kbuild: Add top-level target for building
 gen_init_cpio
Message-Id: <176618153620.1413064.2360637802920518770.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:58:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 28 Nov 2025 21:01:55 +0100, Nicolas Schier wrote:
> Add a top-level target for building gen_init_cpio to prevent re-entering
> kbuild for 'modules-cpio-pkg'.
> 
> The recently introduced target 'modules-cpio-pkg' depends on
> gen_init_cpio but there is no simple way to add this dependency as a
> prerequisite that can be built in parallel to other recipes.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: Add top-level target for building gen_init_cpio
      https://git.kernel.org/kbuild/c/f8e05c10631e6

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


