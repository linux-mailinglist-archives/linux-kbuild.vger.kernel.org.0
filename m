Return-Path: <linux-kbuild+bounces-5955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F07A4E1E7
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D84817A8F83
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABBC265CBA;
	Tue,  4 Mar 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="M1SKXOHD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C920A5EB;
	Tue,  4 Mar 2025 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099885; cv=none; b=Dk03XqbeYB4woZy9M9PfnnwnX4JIW7xL6bv0DQ1CpHfU/zd8QrFfvy+rv/24Y2hs5omxN9VTWx2LDHZeaJ7Vx7yySkQ1WG/WDUXs3JULYXBIUzWs3ONXMVYQMV0IoU9Q9NJSk7fyBbDghcqQ0xYfJ/VUcxzNyGeq37zjonxdPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099885; c=relaxed/simple;
	bh=tXTdXRn7ghG5zVsDSwWDun4bx1MHi7MVxfjidCyX9Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZAwHSfsi3VaF4VyLMYk1si+6eNg9gRj4LmG2jg28asmWcz4PJ+zjXfN0XEiQJxzRV7vNJjQZuGbf0TWIYox+ejJjk5Emo4fjSDl9cM5SerxiOFURg1x5rNc011H+oIJPhl3kVDD6bzkoDALseboacnqgYavhJe02L54xfgwdjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=M1SKXOHD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741099880;
	bh=tXTdXRn7ghG5zVsDSwWDun4bx1MHi7MVxfjidCyX9Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1SKXOHDTkwjPcy8GfnDAQyQhohNdVNcEZ9DBtCotWWkXdXMoHUYR6NfZu8K8PUMs
	 GaSnx2p5moxNLsup++713v8M735cBfb53S3PMNLhru8nqT34Blr6ZiTBJk4x7g33ai
	 0ixPxORspwjZNUg3h719R2CmiAOYIW9F9An7txNo=
Date: Tue, 4 Mar 2025 15:51:19 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <e1a1531d-6968-4ae8-a3b5-5ea0547ec4b3@t-8ch.de>
References: <20250303215240.work.379-kees@kernel.org>
 <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>
 <20250304102536.GB2529736@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304102536.GB2529736@ax162>

On 2025-03-04 11:25:36+0100, Nathan Chancellor wrote:
> On Mon, Mar 03, 2025 at 11:29:58PM +0100, Thomas Weißschuh wrote:
> > On 2025-03-03 13:52:41-0800, Kees Cook wrote:

<snip>

> > This is also what exists in tools/testing/selftests/lib.mk.
> > Minus the missing CONFIG_FORTIFY_SOURCE on clang x86_32
> > and a failure of overflow.DEFINE_FLEX_test (clang 19.1.7).
> 
> Does Kees's other patch resolve the second issue? It'll obviously fix
> the first :P
> 
> https://lore.kernel.org/20250303214929.work.499-kees@kernel.org/

No, it doesn't.

Running tests with:
$ .kunit/linux kunit.filter_glob=overflow.DEFINE_FLEX_test kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[15:48:30] =================== overflow (1 subtest) ===================
[15:48:30] # DEFINE_FLEX_test: EXPECTATION FAILED at lib/overflow_kunit.c:1200
[15:48:30] Expected __builtin_dynamic_object_size(two_but_zero, 0) == expected_raw_size, but
[15:48:30]     __builtin_dynamic_object_size(two_but_zero, 0) == 12 (0xc)
[15:48:30]     expected_raw_size == 8 (0x8)
[15:48:30] [FAILED] DEFINE_FLEX_test
[15:48:30] # module: overflow_kunit
[15:48:30] ==================== [FAILED] overflow =====================
[15:48:30] ============================================================
[15:48:30] Testing complete. Ran 1 tests: failed: 1
[15:48:31] Elapsed time: 43.985s total, 0.001s configuring, 43.818s building, 0.133s running

If I force CONFIG_CC_HAS_COUNTED_BY=n then the test succeeds.
Clang 19.1.7 from the Arch Linux repos.

<snip>

