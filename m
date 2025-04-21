Return-Path: <linux-kbuild+bounces-6712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CE9A954D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 18:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D6B174358
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 16:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D0A1E5B68;
	Mon, 21 Apr 2025 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecXGgq2l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7A1E3769;
	Mon, 21 Apr 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253790; cv=none; b=HDMHdTsQa1NgSaJbFJtepCCGM5VYbzMsjFYWiSktEgw2juXbUPPF64FlRV+k5m6dWS2SvVLDG8s9wlTv1XSMV5PZpynaRyvufnwzHd3XHd7LbnRsJhs5ZBbdgfloq6UWuegOiKP8JQ8JigXvd9KZRSGcg1LL4OiEy6DNf1Ke8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253790; c=relaxed/simple;
	bh=nU2NB+tnAZnt1MsC8/QTTW/qtrU+1eXEvM7zijUvmBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0G3SuZO0JeVZumqw5/R0qgK3icZuuK804Awk/TaLKhpSuuthDTEGQfOn4pwCFtiw5cnnNwPhBFuguMeJ2XHH3Uuzqag43GnnYingZjZtm1bcjikfi2Rbwlbd0rWKuCp7Jm8OIpjxlMxUK+8VBqPhHGmUS7VK69XeDQUpxy8tpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecXGgq2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3E2C4CEE4;
	Mon, 21 Apr 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253789;
	bh=nU2NB+tnAZnt1MsC8/QTTW/qtrU+1eXEvM7zijUvmBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecXGgq2lx4aAuRbCi5U79Qj0tVT7lYsxum+Siq7PjrHVJOkbtHk9fb3/TfTGfjHdd
	 3KHPMLY2eZtQHzRJEAvetJIwJOKLQyffRLKZQfFzJKfOelyje1/JPDYHlqTwh9nsZq
	 k5InamI1EivEJyXYRQTy0IwezLCbwd7w2igBDjBrICBsfkZWRqd/0mpldv/Kusglzo
	 qRApxCnUSZdvtLlfCvvAPLIEGYbwRwMJQGh5yOgy3tc82QhgGeIOoRZxbbmjSNv9LC
	 aeF1NNYpNTFhSXxxK1uBbcZ9OHL/bdZ1utxz5f+dtjPUmTLzKwyWd4FSLk31pF+/as
	 /5OOVmtLL9DGQ==
Date: Mon, 21 Apr 2025 09:43:06 -0700
From: Kees Cook <kees@kernel.org>
To: Christoph Hellwig <hch@lst.de>
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
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH] kbuild: Switch from -Wvla to -Wvla-larger-than=0
Message-ID: <202504210940.8B3E06C4F7@keescook>
References: <20250418213235.work.532-kees@kernel.org>
 <20250421091233.GA21118@lst.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421091233.GA21118@lst.de>

On Mon, Apr 21, 2025 at 11:12:33AM +0200, Christoph Hellwig wrote:
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Note that sparse currently also can't cope with VLAs including the
> prototype syntax, which also needs addressing.

Hm, it looks like it's been over a year since a commit to the sparse
git.

Luc, are function prototypes with VLAs likely to be supported by sparse
soon?

-- 
Kees Cook

