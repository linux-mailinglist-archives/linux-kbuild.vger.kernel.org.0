Return-Path: <linux-kbuild+bounces-9280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D03C0A005
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Oct 2025 23:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D22C4E1391
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Oct 2025 21:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8460526462E;
	Sat, 25 Oct 2025 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTb2ve94"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600B822D4C3
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Oct 2025 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761426144; cv=none; b=EZ6nXODfWwaQTY+3R8mVhQBerhBWRZiOhBZTNH67csgswfTiUqN9hM89Cz3cw90KoPYsSQbIXzm9odR49OFXpMsC3WR8KncenPspxGeWvV0wCSnqpgqaQUvy440miWa9hWIiKR3kdydztkxV8S2zwlLUUT32E3/nQaEFDmJqjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761426144; c=relaxed/simple;
	bh=guZMcuCqSX55LNXT0roM4NlgZiVvOYWoI90jmR/3xN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WrcTpUhJUXGYsOiOMuGrj48SX09HssTLGyYNGa9Qg9+AeWTCk5jvoCln3EhWvmkH6jpb4DD1v/G1VF+DBs3qWCfOOiZbjMVdrJ8YD/xv5l+Gx8TBCwkUVP79BBPPyl6fvuuNPj/q1K4SE3N64NB09O5KiMNiihi+pHFL4M5m+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTb2ve94; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D226C4CEF5;
	Sat, 25 Oct 2025 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761426143;
	bh=guZMcuCqSX55LNXT0roM4NlgZiVvOYWoI90jmR/3xN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QTb2ve94cNvR5yZ+cZC7LghxVrrjwcg+ybwYNMnOf1DZdO0FSswRwh3kkcMoMwvrS
	 Sy8Nk0UFjIAaJVT5em67dbajTeMETSrwZuoqJke5HaZqsdT37awsoiTImCuYAph4kb
	 5crNj3YAJImpIYmzvea0W+LcqUBZ8LQU4+o90qBHw9QoVNGiM15Vbyqu7az4jjNGJA
	 v7z9q7DJ4qMXd/W3Bxe75yhkTd0Ge2e71bE11KqAhTKy1SYL6rmlmemTUbmVrkdZfr
	 8gQAj9Jk5Mc+PDm1mai9ZCPfm41LX2ZfInMdgn+LsjtiK2jhEleokjezDIFnzJtOeL
	 2LxJGtIonp9IQ==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, James Le Cuirot <chewi@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Masahiro Yamada <masahiroy@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
In-Reply-To: <20251016091417.9985-1-chewi@gentoo.org>
References: <20251016091417.9985-1-chewi@gentoo.org>
Subject: Re: [PATCH] kbuild: install-extmod-build: Fix when given dir
 outside the build dir
Message-Id: <176142614201.3308937.437493128275817403.b4-ty@kernel.org>
Date: Sat, 25 Oct 2025 22:02:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 16 Oct 2025 10:14:17 +0100, James Le Cuirot wrote:
> Commit b5e395653546 ("kbuild: install-extmod-build: Fix build when
> specifying KBUILD_OUTPUT") tried to address the "build" variable
> expecting a relative path by using `realpath --relative-base=.`, but
> this only works when the given directory is below the current directory.
> `realpath --relative-to=.` will return a relative path in all cases.
> 
> 
> [...]

Applied, thanks!

[1/1] kbuild: install-extmod-build: Fix when given dir outside the build dir
      https://git.kernel.org/kbuild/c/5ff90d427ef84

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


