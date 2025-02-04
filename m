Return-Path: <linux-kbuild+bounces-5626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DAA2763E
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 16:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A72162024
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FA62144CD;
	Tue,  4 Feb 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAeIHUcT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D214F2144A6;
	Tue,  4 Feb 2025 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683732; cv=none; b=T489SXt+z+6701oPFRlkZ4Erk86lS4MOK8MauctNenAmk/oZio6LCDB4due6hGRw2a+rKf3QGdWFjZQccJHzFvUjTNj/vzcavgue9+fY1n4Zu9AvkL0TEbyE9CxYjuSZvFpCKPdqVMu/h+gaHwg5CZsfUCAG6HR8zRuhFMsmEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683732; c=relaxed/simple;
	bh=iVHKGJNjRO35eXVIY4eSlGM1uP60Zox50GhMXKKfrLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNRgRIfi0lBMO9dN4lXAEhcLoY0uPN18Mxjzeje/ciHoO1wniKZ4dCZURx7kTjLyY7YowaTzR9AyYyxsQn2jjtU8lFtuEdbJmHZzRNd80Mj8JnBhrdeTeiFdGUtcjgC7GSnJ2ie7isvtHs7K8YuwLcJcvuCvWwRXYbhFsz17CZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAeIHUcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289FFC4CEDF;
	Tue,  4 Feb 2025 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738683729;
	bh=iVHKGJNjRO35eXVIY4eSlGM1uP60Zox50GhMXKKfrLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAeIHUcTO2HNivd8QQvzocLclEGernvBjSZTFdvZo98nGk4rl1TZr5TMjywkR/51T
	 EEuUuNLK8P5uK7qPLM248OwS8eTjUWKc1gtthuqo0BQYEjxeT4JX8fzqCEs0faqM5C
	 PPT/fCHQhAQtog3/x6Og9JDlE7/qbQc+Lq6N1XOxoJCyqFA9JmEI+I8WdnN5k0q5o/
	 sVH4HLRnnnzWD7fbPJICMINi8Yyw1wKN/S4raEGAIrH4cmwfdnKvZ8Ey9CsGvfCuUd
	 DwRefgl4aoJENujTh5T+kU0BJX5jDA349E1cyksh60u7YkSOxAwPzyrYcdiPbK0yEY
	 kMnBOx/mTYuvg==
Date: Tue, 4 Feb 2025 07:42:06 -0800
From: Kees Cook <kees@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/3] stackinit: Add union initialization to selftests
Message-ID: <202502040737.93314491DA@keescook>
References: <20250127190636.it.745-kees@kernel.org>
 <20250127191031.245214-2-kees@kernel.org>
 <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>

On Mon, Feb 03, 2025 at 03:44:38PM +0100, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Mon, 27 Jan 2025 at 20:11, Kees Cook <kees@kernel.org> wrote:
> > The stack initialization selftests were checking scalars, strings,
> > and structs, but not unions. Add union tests (which are mostly identical
> > setup to structs). This catches the recent union initialization behavioral
> > changes seen in GCC 15. Before GCC 15, this new test passes:
> >
> >     ok 18 test_small_start_old_zero
> >
> > With GCC 15, it fails:
> >
> >     not ok 18 test_small_start_old_zero
> >
> > Specifically, a union with a larger member where a smaller member is
> > initialized with the older "= { 0 }" syntax:
> >
> > union test_small_start {
> >      char one:1;
> >      char two;
> >      short three;
> >      unsigned long four;
> >      struct big_struct {
> >              unsigned long array[8];
> >      } big;
> > };
> >
> > This is a regression in compiler behavior that Linux has depended on.
> > GCC does not seem likely to fix it, instead suggesting that affected
> > projects start using -fzero-init-padding-bits=unions:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> I ran stackinit_kunit from v6.14-rc1 on m68k under ARAnyM.
> All small_start tests failed:
> 
> KTAP version 1
> 1..1
>     KTAP version 1
>     # Subtest: stackinit
>     # module: stackinit_kunit
>     1..108
>     ok 1 test_u8_zero
>     ok 2 test_u16_zero
>     ok 3 test_u32_zero
>     ok 4 test_u64_zero
>     ok 5 test_char_array_zero
>     ok 6 test_small_hole_zero
>     ok 7 test_big_hole_zero
>     ok 8 test_trailing_hole_zero
>     ok 9 test_packed_zero
>     ok 10 test_small_hole_old_zero
>     ok 11 test_big_hole_old_zero
>     ok 12 test_trailing_hole_old_zero
>     ok 13 test_packed_old_zero
>     ok 14 test_same_sizes_zero
>     # test_small_start_zero: ASSERTION FAILED at lib/stackinit_kunit.c:428
>     Expected stackinit_range_contains(fill_start, fill_size,
> target_start, target_size) to be true, but is false
> 
> stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
> [...]
> m68k-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42

Hm, I must have some kind of misunderstanding of m68k's stack layout
(but only exposed for unions O_o). I will try to get this running in an
emulator to investigate.

-Kees

-- 
Kees Cook

