Return-Path: <linux-kbuild+bounces-5959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55648A4EC55
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 19:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E8A8A5815
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0FB28D052;
	Tue,  4 Mar 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7xI2Ihg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7528D040;
	Tue,  4 Mar 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110639; cv=none; b=mjJAhocWfOnWyRxIusp/8wtqIslpseu2EeFFSAmwe16+a+T5u+ak/0+1ZBqNYWsQMbLE0PeM+kh5g/aHXHvkgK1y18WP7cdvaFwLfgDaf14YZ29SOS7dOCsQUO8Ash6ElFb6AkH1cirir6GdC8514WT3FtwQh5ucT/iZrFPvZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110639; c=relaxed/simple;
	bh=J49GInt9PRQzsDU60XGsZ6Ald8i5bLmlLNl/G/QSJco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwMv2sxNiGH7dT2P/rGC+k3/qLRF0ptAXTbJyQdnOTXTPWk3eK30Kucio7MxxFYyTzvCb2MOAxjB+dtOWt4BvOkBZbKf1d35LSsppWAaHC/dYiYtCrJ7s4dNjmk5UjPclhzjQcMkvUHAosXg+MnirB9ysfA5zD/uCJvCwXKNoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7xI2Ihg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95CDC4CEE5;
	Tue,  4 Mar 2025 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741110638;
	bh=J49GInt9PRQzsDU60XGsZ6Ald8i5bLmlLNl/G/QSJco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7xI2IhgpFEhCE1hm3nLvx99yu5u8DJR/Hmd3mdAvS3B/NjXbdRr+AQmAtmq2Hxeb
	 5CafvZo61i2FIdseVWqQYICttPnv5hM5rgybRfVTO59ajNx/tGQv6iWp8lbvcp/g95
	 W/IKc3JITkm7Bn5b853oq0mGTqB0kc+PhlvH4UNDFvZXcDdI94egCYTQP8N840qHeK
	 hR3xFNlVGl6LK/NuWY5vmwFfztqkH9RzLgfk2zvmRBcW7tvJaCsWorRH/e09I7F3jQ
	 JptUqnvjlyR6KjMNgHkvczLNZAcJEiTzli6DUTiO78gGOC0MaGF3I1SsDkWN+sVAfE
	 6viYfbKlW6wvQ==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: clang: Support building UM with SUBARCH=i386
Date: Tue,  4 Mar 2025 09:50:34 -0800
Message-Id: <174111063359.3934820.5690548067195753148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304162124.it.785-kees@kernel.org>
References: <20250304162124.it.785-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 04 Mar 2025 08:21:29 -0800, Kees Cook wrote:
> The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
> support building i386 directly with Clang. To make SUBARCH work for
> i386 UM, we need to explicitly test for it.
> 
> This lets me run i386 KUnit tests with Clang:
> 
> $ ./tools/testing/kunit/kunit.py run \
> 	--make_options LLVM=1 \
> 	--make_options SUBARCH=i386
> ...
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kbuild: clang: Support building UM with SUBARCH=i386
      https://git.kernel.org/kees/c/a48d9ebdbb5a

Take care,

-- 
Kees Cook


