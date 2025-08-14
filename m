Return-Path: <linux-kbuild+bounces-8476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA31B26F8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 21:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE4E1CE0A30
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 19:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A1023D7D5;
	Thu, 14 Aug 2025 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3fx77iv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7223D7CD;
	Thu, 14 Aug 2025 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755198714; cv=none; b=X6Fch9U5zstAlNlV7mGzvJPbern5lobs/P3cy44kEtQkH4pTuywwjjtcUcjMjMi48GVs1MP4MPiqOuIsWCFs8aTUnkjc5ZWL4GIR9nVJaKnpMxPQZB5WvuXJafL+oR1RNY1GxQh9MWb8UmeHqJFbjdBret4wQXVW7grcS0bedM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755198714; c=relaxed/simple;
	bh=v2tfAJRb4sPlBjomD2flZSqHLvS/dm9xSYZ6udD1dII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dZxFqf+Z4sURP9LTUi+A8DZAAX8s0Dn1RTWsXgTSy2tgYXfNV6m3S8CMTT4zNUuQNTE1zfPOgBVPHeT36DrsVQiSa0sPDLuIQ7Y2I5MSvs5azJIokvEFQ+LAZJyPl7qtwlVqD1YjmiZF+WX7o2O4p0MqTNYEqsPtitasiQZq9gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3fx77iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17F0C4CEEF;
	Thu, 14 Aug 2025 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755198714;
	bh=v2tfAJRb4sPlBjomD2flZSqHLvS/dm9xSYZ6udD1dII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E3fx77ivJoIWOFimZxkhbmhuMIthBdF13aALpRGhP5eBCQWAR6Vv4b6RQ9+HKKHyN
	 T1ElbB5CL0sNpy0lb7WRy8Rq6Id5PTrfyGHbzWMlVkAez0DX87ZxAmmH0l6qE0wxxe
	 6udWazkJRDX6P5080q8freHB7NF2FvNeOd31E2ztOStiU30JYBJ/rMhyeCMYnhEdIQ
	 QQVNcXQ99aFhVfd1p1/+E/LeRzaSTmkRdDMA1KJ1RDY2OvxvbXUpdqAHeftrEgy/Xe
	 LK8ZTdTo2/1lxt3F9VhnyfqGMFvwsFj7dBKzImHTOwFipVysIqw5vsM8XwtH3Fsb8F
	 VeKjVaGmBwBPQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
Subject: Re: [PATCH v2 0/6] kbuild: enable CONFIG_WERROR for more build
 steps
Message-Id: <175519871165.2179051.3310100707089849495.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 12:11:51 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Thu, 14 Aug 2025 12:14:40 +0200, Thomas Weißschuh wrote:
> CONFIG_WERROR is useful for all build steps, not only compilation of C and
> Rust sources linked into the kernel.
> 
> Also enable it for assembler and linker invocations and userprogs.
> 
> In addition unify the implementations of CONFIG_WERROR and W=e.
> 
> [...]

Applied, thanks!

[1/6] kbuild: align W=e with CONFIG_WERROR
      https://git.kernel.org/kbuild/c/f852ce052a8b7
[2/6] kbuild: unify W=e and CONFIG_WERROR
      https://git.kernel.org/kbuild/c/e7a10929c574c
[3/6] kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`
      https://git.kernel.org/kbuild/c/592b571f20c5b
[4/6] kbuild: respect CONFIG_WERROR for linker and assembler
      https://git.kernel.org/kbuild/c/ec4a3992bc0b5
[5/6] kbuild: respect CONFIG_WERROR for userprogs
      https://git.kernel.org/kbuild/c/3f0ff4cc6ffb4
[6/6] kbuild: enable -Werror for hostprogs
      https://git.kernel.org/kbuild/c/a646e96080cd5

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


