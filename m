Return-Path: <linux-kbuild+bounces-9915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0AC95118
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Nov 2025 16:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660E03A187B
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Nov 2025 15:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD81271468;
	Sun, 30 Nov 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F68PGShA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AB62222A1;
	Sun, 30 Nov 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764515581; cv=none; b=ZUsBvwVgnnFK+baCM0QkNyMpWnmixc2bxBjm4bg1Ygggm/LRst4WRmbpiL+1mmzTfgATpoee8rHKCihqGwUqMZbwUuj+bhkCj0GdROrOsvyznIGfdKCwK50NM/yyijo7NqLdP8fjF4lZuuy2O364Ih+MHNTgYaQGGJdIIWwqZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764515581; c=relaxed/simple;
	bh=O81qsnyJLdkpWz13uFmHHxjT4vW5WuMWQ2KUJjbJQFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVw7APo8D9oIFxWvmGSH+HmJ2gU0F+TBkBae0Q3tWXRCiPeZ0Uz3Qx0H/ruisFMCohUkp7pLz5fptth3TApEXtgjJrH7z7b6WHuF8urWmqkAiNUmZOh9hD+Tztoekzf7KkzCDuNGvLw+XjxmJNojwcX+7J/pIFmWGlT/k0x0aHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F68PGShA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B825EC4CEF8;
	Sun, 30 Nov 2025 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764515581;
	bh=O81qsnyJLdkpWz13uFmHHxjT4vW5WuMWQ2KUJjbJQFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F68PGShAQmGnZ2ictgHil4EtGnW1lkDN0j8BWePVoxUYzFydlNuh9mp298YM4Kvyv
	 iOLa0P8BEv9EuPNCxcJmW5X6imWJ7a+pBZ6bcdpxGCPGGajbR+Mjtr75or/WfvM46h
	 HMxO89OxJrpsrsKzw/qsOo1cmLI3Y+g5+cfmDRvO8TF2kvkt95SIhnaCWTv56+dupI
	 yuLJQS9G3AOjxtwvwcX2ObpdqOda4XbCT/t44CNIUJtcMjM1NOrq6qIEcQaYBnz+It
	 OfY3G1S6Q1VRhgEDzydAfDi44khgCuqD8kv/Ztus9gBTjEhnyD3zxsgvWByH9WtLme
	 QtRJJaLmhF6/A==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/2] kbuild: add target to build a cpio containing modules
Date: Fri, 28 Nov 2025 22:42:51 +0100
Message-ID: <176436602975.3497876.16152635634080456167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Nov 2025 14:18:18 +0100, Ahmad Fatoum wrote:
> 
> 

Applied, thanks!

[1/2] initramfs: add gen_init_cpio to hostprogs unconditionally
      https://git.kernel.org/kbuild/c/c83c9564
[2/2] kbuild: add target to build a cpio containing modules
      https://git.kernel.org/kbuild/c/2a9c8c0b

Best regards,
-- 
Nicolas


