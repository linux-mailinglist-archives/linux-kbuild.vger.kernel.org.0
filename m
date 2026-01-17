Return-Path: <linux-kbuild+bounces-10621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E04D3906C
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 20:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26D53017658
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 19:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11B32745C;
	Sat, 17 Jan 2026 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5VEoSZ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34A500941;
	Sat, 17 Jan 2026 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768676543; cv=none; b=D6gqq/EctMnCsmG8duD0XZfVP+UNVEIckZN6hyH3UVovvLu2SU/6/xFhCgtv8pkvUOFi9uU4w3+wusrBNDzhXj1HwCUasD/sDPS56zfl4LZ43f+dqRG75Rvsl+p8J8dDU4tm1qGT+S6fFWwT2QEh+8wBWh1v5Zu99JldFanaUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768676543; c=relaxed/simple;
	bh=lXRlHG0I/urvEOJ/ZPod4ZwF9nmubADIdX1NlkM0amQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMIhMRPYyd2eyyqdPp041MfmkQHN+xbFHovXGXzJccDmv072GDoqD5OB3FCzL+wD4Sbh+BiLqCIYmz7mciovSjD/4tMjfLVSCrKuLZsVxS3/TMQeKitSFUL6WpqMfiyxj+/fD1KIjYVWNY+3uUz/q3KuncVJ/awOI6cOgHBAnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5VEoSZ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A9CC4CEF7;
	Sat, 17 Jan 2026 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768676543;
	bh=lXRlHG0I/urvEOJ/ZPod4ZwF9nmubADIdX1NlkM0amQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5VEoSZ/dCskniOvTB/BR6Gpis5HfpUFUDue9ftQzgDGXdnMQTHnoQrm6oP5abjrd
	 mLVIAzVtJu4LZRzHBJWKJ1vT06MO4x2D1vvRk9x8fklfDr6aMouNX2t/yjBP8W951l
	 ++2INDVc2NXuXf5f3LQUZ2jAJbDkhbjdQi6GaQEB93bM/m+xpWYZrAZZ+hdQmImrXh
	 A5yLInDiPSBTaIpq8Utvx3fZfP6E2Szg6lFrAGH9/m0N5RCWE9S/gA1A/+28wfgMfR
	 8ZAyFKeozKEmbPmjCORtwrnlhyjk9LO7yAs1Xj3fzGdw0Bp3ljZpn065twJA+mDpfa
	 5fzf40hNQGndg==
From: Kees Cook <kees@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Marc Herbert <Marc.Herbert@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Nicolas Schier <nsc@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
Date: Sat, 17 Jan 2026 11:01:58 -0800
Message-Id: <176867651549.3159467.11181679674842979666.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116005838.2419118-1-morbo@google.com>
References: <20260116005838.2419118-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 16 Jan 2026 00:57:57 +0000, Bill Wendling wrote:
> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members.
> 
> struct foo {
> 	int a, b, c;
> 	char *buffer __counted_by_ptr(bytes);
> 	short nr_bars;
> 	struct bar *bars __counted_by_ptr(nr_bars);
> 	size_t bytes;
> };
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] Compiler Attributes: Add __counted_by_ptr macro
      https://git.kernel.org/kees/c/150a04d817d8

Take care,

-- 
Kees Cook


