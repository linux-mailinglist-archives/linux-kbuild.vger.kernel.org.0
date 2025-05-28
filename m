Return-Path: <linux-kbuild+bounces-7305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C1AC6F89
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 May 2025 19:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72E1718817ED
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 May 2025 17:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D9228E573;
	Wed, 28 May 2025 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyDBcMSY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D428E56C;
	Wed, 28 May 2025 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454096; cv=none; b=j6l7IOIi0LgEArUY0w6cZfOE2yNHHlSxoZkLYeAoJ5MRMURuSq6VEJAPtipVua7OQnqX8fJb+fWixoOetbaKTW/SMVQ1uCj7kMqJvzNrk2AjBk3r1IyGh5YXuFoUe0VOfLf2kx/SQq1tbUe0ct+OUYXYRlYQNlB4zUfQgcSCV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454096; c=relaxed/simple;
	bh=wKtF2TTBr95PsHmFi5eC75IGaydJ9FAvyCT1U7OGi2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCYyH6gy9NihcR8NW6ebWHA0nbIluSgh27L1kCCACBKPfkMGCZWUv8sCu7Ntqe9nyaIEz90vZ5zyH1HyrgSMy0Q9yvD2H+Vqhi/pb+QObf6oEdRoNjCc1cPM71GCScgRqZxQjS2ir4wUSQX8QPqIp5CW2Gxm7yUR4UZPiNfucww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyDBcMSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1279C4CEED;
	Wed, 28 May 2025 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748454095;
	bh=wKtF2TTBr95PsHmFi5eC75IGaydJ9FAvyCT1U7OGi2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyDBcMSYJjRDXdJy03WeDhWnlWXnaVGjLHm7CF/wOV9cyCp0wLkY8Gu+dXFOLhpUm
	 8ZWDDIutYeuQoLisXfnZaETOqR73mi8Yk/6NvuG5gzCmU865gKBHzqz8aJsGW8LkZ8
	 /D/eOieVlO0JXUCWSfuwW6fq7gWY5IVUAD4B7hJkEd6A1n6q1904ylhlThRJx6C2Nl
	 Xi7+DW6tu0/fuTO1QssdqXPLtAaXty+SSOSEsTrMVNy926zTXoNa74KCQnB0OTOfC5
	 2jQHewgBoz0EpiAN5HsM+utAswYG7hsCd5OnrgIo4fVSAQxzAfSfmITXzouH7C5IZf
	 5xT3DeFEuuWHw==
Date: Wed, 28 May 2025 10:41:32 -0700
From: Kees Cook <kees@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [linus:master] [crypto] 40b9969796:
 UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
Message-ID: <202505281040.C8E022E@keescook>
References: <202505281024.f42beaa7-lkp@intel.com>
 <20250528061427.GA42911@sol>
 <202505280937.6802F0F210@keescook>
 <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>

On Wed, May 28, 2025 at 07:15:18PM +0200, Jann Horn wrote:
> On Wed, May 28, 2025 at 6:46 PM Kees Cook <kees@kernel.org> wrote:
> > On Tue, May 27, 2025 at 11:14:27PM -0700, Eric Biggers wrote:
> > > If this new sanitizer is going to move forward, is there any sort of plan or
> > > guide for how to update code to be compatible with it?  Specifically considering
> > > common situations where unsigned wraparound (which is defined behavior in C) can
> > > be intentionally relied on, like calculating the distance from the next N-byte
> > > boundary.  What are the best practices now?
> >
> > Hi, yes, this is still under development. I tried to make it hard to
> > enable accidentally (not via COMPILE_TEST, not UBSAN-default, etc), but
> > we (still) don't have a way to disable configs for randconfigs. :(
> >
> > We're hoping to see Clang 21 with the more versatile Overflow Behavior Types:
> > https://discourse.llvm.org/t/rfc-v2-clang-introduce-overflowbehaviortypes-for-wrapping-and-non-wrapping-arithmetic/86507
> >
> > and our current testing is showing many fewer false positives. (Having
> > run syzkaller for weeks now.)
> >
> > > Documentation/dev-tools/ubsan.rst says nothing about this and only mentions
> > > "undefined behavior", which this is not.
> >
> > Right -- this will get extensive documentation before we move it out of
> > its development phase.
> >
> > I'm not sure how to enforce "don't enable this unless you're developing
> > the Overflow Behavior Types" with current Kconfig, given the randconfig
> > gap... I have some memory of Arnd doing something special with his
> > randconfigs to avoid these kinds of things, but I can't find it now.
> 
> You could depend on CONFIG_BROKEN, the canonical "if you enable this
> and stuff breaks, it's your fault" flag?

Yeah. Talking with Justin out of band, he suggested the same. It's
easier to carry a 1 line patch downstream while we're testing to enable
this feature, so I'll send a patch to add CONFIG_BROKEN for now.

-Kees

-- 
Kees Cook

