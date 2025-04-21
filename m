Return-Path: <linux-kbuild+bounces-6716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACCA957F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 23:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCC5817486D
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 21:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966F31F0994;
	Mon, 21 Apr 2025 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovisxryp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6141EA7C8;
	Mon, 21 Apr 2025 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271050; cv=none; b=MumAtGrvH34OlyngyTvfMF6BAtgKj8LFXRSD7786qpci04HWzGVNW20XC8N1eK4vw6wlloUdGkl8kLwYFygf4ApvHbKx2YhcBEldhgMa9+bbsyUFAcsHU04fqSYh/MVVohyzUrroIr/PUUhqypjPPIpkbqAF/pxI9mA7FOO0BCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271050; c=relaxed/simple;
	bh=6T/GDJH5/bTv1NCnAu3j4ghfQs2StTuGKdbf8ISr+oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mz9UkymmFhmZJIlSPvr9j1IVB6tfj0seTGHlpdlh9caXyIKrxtFYBNo/qHN2jUzPq3K0MyUWqvPz8dcg8ptGj/BRkt2pjBHpzvRRXezB6LdagLWSWkSrexev43spOdYTgxNbdozzKy+OQf2cBzVwD0IFekZ0XOOrfeJVDn7kmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovisxryp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85EFC4CEE4;
	Mon, 21 Apr 2025 21:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271049;
	bh=6T/GDJH5/bTv1NCnAu3j4ghfQs2StTuGKdbf8ISr+oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovisxryprkhugTTXuEtolnUSpQ9pH46a1Gk/2mdmbcLHjgw8Z+4JkD+CMMjl+0CA1
	 dtLTYJKgwoczoBPVNKYf3l/VCZzPt1kf9lHT7Y4S0tcJY2NkMJkb5Ps0+XnbOpNXeI
	 FbzDDb2IzTd++0z2gMJbOKT5KcT4wAZQ0l41WuTyKHayxmWjaLDqsZjzWVTxM78rUs
	 UVP0hCxK+8BELCSr9RsynvfNCrM98t7kqFAuCn1Ok3uVeZjAnkFcjNxu6f8VirjuNu
	 e3ceCXvIbWH3YFEDlUuOdFeHKtyKVJVYEyPbMG9FvOlEeHXwCcPDXRDpRMyeLtzRp0
	 dTPbbi8mZZ7jg==
From: Kees Cook <kees@kernel.org>
To: Christoph Hellwig <hch@lst.de>,
	Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Switch from -Wvla to -Wvla-larger-than=0
Date: Mon, 21 Apr 2025 14:30:41 -0700
Message-Id: <174527103909.545282.5440977919378383304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418213235.work.532-kees@kernel.org>
References: <20250418213235.work.532-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Apr 2025 14:32:39 -0700, Kees Cook wrote:
> Variable Length Arrays (VLAs) on the stack must not be used in the kernel.
> Function parameter VLAs[1] should be usable, but -Wvla will warn for
> those. For example, this will produce a warning but it is not using a
> stack VLA:
> 
>     int something(size_t n, int array[n]) { ...
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kbuild: Switch from -Wvla to -Wvla-larger-than=0
      https://git.kernel.org/kees/c/9c2cfa10444c

Take care,

-- 
Kees Cook


