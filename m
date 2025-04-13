Return-Path: <linux-kbuild+bounces-6592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E92A87068
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Apr 2025 04:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D57093A7DA6
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Apr 2025 02:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D934438B;
	Sun, 13 Apr 2025 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/qSt2ag"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CA2940D;
	Sun, 13 Apr 2025 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744510966; cv=none; b=EOCty5stxL9e+UPjOu01HvrlpyfFCNssE/hED3L28PhAeMsKKEQXRxkgV6zjqJ0lftqs/Sl/1zK6cOy3hecfGzP0/jge2vvT588e6bco4k8HEr92GmC3k6oPxVwUx15VnrXyrhNGb3PE4T9xrnwMWmUnn4fXa0als4RXnx8OQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744510966; c=relaxed/simple;
	bh=Wma0kI3kdG4PvAk2Ss9a2MpdgFrvt9b7BTYQ+m/eu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF0QFieslN0vlQkH31ntwfDnWAgm/xJkpuWY3bwYv9VHmHIy3IOrH3sftLupqF8feQh7loY8J7hl0evUZaB6cwZGq3T4xBXMcdSFZlXqwWxguxsPw6Zgn+9R1HhNQBfPgvjk7l9e0XjM7uewBl756aoYTG7XM15p+eJfHEQQ12Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/qSt2ag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C0DC4CEE3;
	Sun, 13 Apr 2025 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744510965;
	bh=Wma0kI3kdG4PvAk2Ss9a2MpdgFrvt9b7BTYQ+m/eu5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/qSt2agcE9mwh/5u30fw+wJvJPZQ9AJNsPvq001qb6ChoRQunQfwELhEqgjGB4OA
	 /spzXq5LHuLug4tlfA92LxBTGQyfmgtVKFoOdpMK/KjKB4MVQHUYOlmWHvzpAhkJfC
	 RLhMnx0PJqGHrl1jPyzRfkaWwoegBxQv0CgNioJMdHAN69EJEUXi92bX9xvHYSerXa
	 H1IIiNActO4ZQpOoaNyzqDMGY9MU8JTiQPvJZaeez+BK0GnLgh27f2hQzNjJFeGMgO
	 koCj5w9PwaH6JkeQXapK6x6+q0gCIvuQW735kfXsbCZxnO2AXYh0bPbmcLVQ3sS8dl
	 GKpFUchSuDI9A==
Date: Sat, 12 Apr 2025 21:22:40 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Rae Moar <rmoar@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>,
	David Gow <davidgow@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Mostafa Saleh <smostafa@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <20250413022240.GB3020916@ax162>
References: <20250328112156.2614513-1-arnd@kernel.org>
 <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
 <20250411065054.GM9833@noisy.programming.kicks-ass.net>
 <0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>
 <20250411105849.GA5600@noisy.programming.kicks-ass.net>
 <20250412102218.560196c0@batman.local.home>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412102218.560196c0@batman.local.home>

On Sat, Apr 12, 2025 at 10:22:18AM -0400, Steven Rostedt wrote:
> Even after removing that test, my allyesconfig still fails to build with:
> 
> ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
> ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
> ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
> 
> I guess I'll just have to remove allyesconfig from my test suite. I
> still do allmodconfig which appears to still work. At least that will
> shorten my test suite time as allyesconfig takes around a half hour to
> complete.

I noticed this from our CI too (I don't see the actual error there as
the build just times out before it can get there but I can see it
locally with all the same tools) and it seems like it is caused by
Linus's commit 6f110a5e4f99 ("Disable SLUB_TINY for build testing"),
which causes CONFIG_KASAN to be enabled for all{mod,yes}config again,
which contributes to blowing out the kernel size. I see this with both
GCC and Clang so I guess we will pursue the same solution and just stop
testing allyesconfig (unless we wanted to stop turning on KASAN for
all*config).

Cheers,
Nathan

