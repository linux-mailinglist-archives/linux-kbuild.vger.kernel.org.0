Return-Path: <linux-kbuild+bounces-8250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAFB156B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 02:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11FC547247
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 00:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A97726AFB;
	Wed, 30 Jul 2025 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V09TStsM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DD290F;
	Wed, 30 Jul 2025 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753836442; cv=none; b=dIJvl29izWi6mSydoZzg03m68Yxz4TsMB9/EB6VJ3yJ7VYhX0pZ0Z3wwHI2NvGJrM1mWccSjQ5xNk+9q8tL5I9MoCF0UHy8nRvCkRrah99t3cuVYDNGZnDNkeiG+6G6Dh3ZE+w4PatcV8l8Z6idKxawSRJ9LLLgJrGYcfsQjOck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753836442; c=relaxed/simple;
	bh=u67O+gLwEAa/gq2wCXXMjm9mL65NJXOFP1Zua84rpjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf1Ul/AMvRnlumskDvrMFOME8A6c+DaePpS6jb2gml+XVdquqGHY3L8oN10Zin1QhwYQ7Ddxu8yevx067xwbQSCrwj742SzpOrZKm/XyTcjhYDvhqepQwsJ1d4wR0x4YnVmGCL6nc7tAAPq/ZZNSWgow5KWE8iXAbFnTJvVoI7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V09TStsM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6984C4CEEF;
	Wed, 30 Jul 2025 00:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753836441;
	bh=u67O+gLwEAa/gq2wCXXMjm9mL65NJXOFP1Zua84rpjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V09TStsMMDLa5jAhxxeLT3ZKdaWehBrRFfiSOAVtWEKPXui6OtjjJJRqOHMPuV2gM
	 8G6ixJKohDk53Qb2cjMoEypV04EXGzbRk98MhSHJdlvQ8wQ/FL1GrHFhqaogJvQe8S
	 rqXj0DAPB7SyaZkO9ChUua9kQVPI7421aNBmyIREhMEOFX4wnNZMl7mc1ic94Eqhaz
	 LNUIOccM8TWjNzT/pXJrSAj678ZXb02pYjb4RzwmAk7Bpou8wKznkR1vxTuKLHQaaD
	 sU4ZFBKtl8B/OjFq60hBXJUnq4+Sgzi88rJOb//YRRgwvRcOcEFm+BIsugZ6sj0Kqs
	 MrdoaQKBDOlyQ==
Date: Tue, 29 Jul 2025 17:47:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
Message-ID: <20250730004717.GA2984390@ax162>
References: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>
 <20250724231025.GA3620641@ax162>
 <20250725122604-44874f95-859c-4c0a-b3b0-14b30e00b796@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725122604-44874f95-859c-4c0a-b3b0-14b30e00b796@linutronix.de>

On Fri, Jul 25, 2025 at 12:36:34PM +0200, Thomas Weißschuh wrote:
> FWIW some architectures use GNU ld implicitly with clang because they also link
> through $(CC) but do not use --ld-path. One example is UML, where the vDSO and
> vmlinux are linked this way. But linking vmlinux of UML with ld.lld will
> require changes to at least the linker script. Something for the ClangBuiltLinux
> TODO? There were more examples, but I don't remember them right now.

Yes, I believe this is the issue we had for tracking using ld.lld with
UML: https://github.com/ClangBuiltLinux/linux/issues/1715

I had not considered that it could be a linker script handling
difference. I will have to look into that soon.

> Longterm --ld-path should probably be added to the global KBUILD_CFLAGS, too.

'--ld-path' is only relevant when the linking phase is run by the
compiler, which is not really normal for the primary kernel build, as
calling the linker directly with $(LD) is preferred. Doing that would
break the build because of -Werror=unused-command-line-argument, which
is needed to make cc-option work correctly.

  $ echo 'int main(void) { return 0; }' | /usr/bin/clang --ld-path=/usr/bin/ld.lld -c -o /dev/null -x c -
  clang: warning: argument unused during compilation: '--ld-path=/usr/bin/ld.lld' [-Wunused-command-line-argument]

  $ echo 'int main(void) { return 0; }' | /usr/bin/clang --ld-path=/usr/bin/ld.lld -o /dev/null -x c -

> No, it isn't respected. On the other hand I didn't yet run into any issues.
> Do we want to fix it proactively?

No, I think it is fine to just leave it as is and fix it if it comes up
in the future, as I believe getting LLVM_IAS=1 working for sparc64 is
the next major focus of the whole LLVM sparc endeavour.

Cheers,
Nathan

