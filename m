Return-Path: <linux-kbuild+bounces-10116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D4CC3899
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 15:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8291430D3707
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA4A385CA5;
	Tue, 16 Dec 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cILiUjx8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CD385CA0;
	Tue, 16 Dec 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890797; cv=none; b=k30n3HYFgom9HJbNHpYY9PNyDDBlynKjprZujrx3Pg97BfNtk+O8D7kbNuRN36mY+mqfc90oKHe5Bh3CqH6KS3LnvElwYPuikkzdap1MWq791sHtoogvf/VnpB1KiTek6yI6QVrZuWdSaMMjQq5AEiFcF0qaf/ncRfV8+eRegsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890797; c=relaxed/simple;
	bh=Fsr0aA85pxF3BvpSCCTxAhPt6CV0gA/DnJhob5ZCpaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eh6atJNl4AK9sPkLy6xil9/62l18/614sRUhAzCV4ssQ+BcNb9fynDyGYX0+CgYQFqYncS/JII+gkJ51wIVqFZTe/0LAZ/GAGdSjPlYYVI1zMwi6GvOUL2X5BQd/aDIULs3A6AUIGQvKoJsWCrb1hc6bREjyA9yUOm4x/cMWDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cILiUjx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85339C4CEF5;
	Tue, 16 Dec 2025 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765890797;
	bh=Fsr0aA85pxF3BvpSCCTxAhPt6CV0gA/DnJhob5ZCpaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cILiUjx8BCqV8Mx5SNgCSEF3/Y9mDzgkPen0KvGpW4pxFywQJow/PSp8+Px1S3q9y
	 iDlSZg+rwMAcRf6TyD6EdJAWT0puN1vw9QhfRUq2TZLsixgre45OxDDFiBUlRsI9bM
	 ysUVhCZOBgE8TFjYaadMJycSWFL4Py4BnDUqNy1MYN2T+jbIUS5N7IPzlI2Zvr5cYY
	 XSVco3oIRghcuwKYPV/HucUF4TTmmBz6Rv6O33cjCkCVUuyYGu0foTYO4CaYxggRlr
	 MiQgh4ulJYjxKmNAaynHewEkjHwue/826yWQDqsPvngQOlzSH1NKQ6/3AEwEVuJVzL
	 kzHDvXcOGkAXQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Johan Hovold <johan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>
References: <20251020091613.22562-1-johan@kernel.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-Id: <176589079524.3551554.8965194250869606940.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:13:15 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Mon, 20 Oct 2025 11:16:13 +0200, Johan Hovold wrote:
> Several symbol patterns used to be whitelisted to allow drivers to refer
> to functions annotated with __devinit and __devexit, which have since
> been removed.
> 
> Commit e1dc1bfe5b27 ("modpost: remove more symbol patterns from the
> section check whitelist") removed most of these patterns but left
> '*_probe' after a reported warning in an irqchip driver.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] modpost: drop '*_probe' from section check whitelist
      https://git.kernel.org/kbuild/c/a4df2071f1a2b

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


