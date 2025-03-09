Return-Path: <linux-kbuild+bounces-6023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F388A582CB
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 10:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EAB3ABB23
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 09:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0FE1ADC82;
	Sun,  9 Mar 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoG/eB3/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D371FB3;
	Sun,  9 Mar 2025 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741513717; cv=none; b=s/ZVjr0Sp+92XVPkXBWEXMxMPHCyLl18Yp3HP2egHW9Rup2QX8oxuFJis2R5ye+hmcvArB0ULKqU3XeWnQhBwQ9f5qnOE7DRW2yzFBGi5pqs7+hzsCd+WHzPXrzKOFkcho2Off10GKuRb1PUwSzpDHM+G2YMte5D1nq8rWtxWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741513717; c=relaxed/simple;
	bh=IlTX9kCJPuxZe+JTOdP3GseAAtQzgwIcutpUztNU7t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsS5BPQHWvVXYpPyTgjHb8J387JVlSnHmEfZiM9OwuZBNs0MX7cPPG8SxXsTJZ/IxfGgo3x/knSZiHf88LYkg69pjxVcKxVvXn0L8GI4TNvzXVVGV2FAsbstemV5zKgk+7TLZv7II2SxyulFarNuH9Di7MxkUfk+/9PbR/x1Zd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoG/eB3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E763C4CEEC;
	Sun,  9 Mar 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741513717;
	bh=IlTX9kCJPuxZe+JTOdP3GseAAtQzgwIcutpUztNU7t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoG/eB3/+ltN6Rd4CQnb1NxClMyElmVR3OgWN5mMJlIbX1Fa4lc5Fhvob1QtpQvp8
	 izxu4GwHBMxiIsHJrMIqw+9Wzk+wN0zxMdeUyWeNNhPzjjtfd0cCpe4yt+0TJ6o3zT
	 qkDia0My6WeCdThw47EZ5m7Pbh2/8wV7U6zb9KrqipIcmYklIPMWtefD/Up8N1jkOW
	 M1AZzV+tBAwSkqvhhD7D1rcBGU2yYlxEv0j/GzbEh2SDPryERU/sfNFJwkQK6lss3C
	 rZNzqX/lCEvMe8FeLg73CXMRQRFdPjqq/wzcAmoN+7zHxyPu1gXZ+dGyDEsSY18ENR
	 ZzAZJ3OZP7rHQ==
Date: Sun, 9 Mar 2025 10:48:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-kbuild@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
Message-ID: <Z81j8EguDyz_uesu@gmail.com>
References: <20250224132132.1765115-6-ardb+git@google.com>
 <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
 <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
 <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
 <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Sat, 8 Mar 2025 at 17:17, Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> ...
> > I do not think it is broken.
> > As I mentioned above, I regard vmlinux.relocs as a byproduct
> > of the atomic build rule of vmlinux. This works.

Except when it doesn't work, such as when an intermediate linking step 
fails, and intermediate build products are lost and cannot be recreated 
easily (or at all without modifying the source)?

And the thing is, there should be no such thing as an 'atomic build 
rule of vmlinux' if it means lost information when the build is broken 
at an intermediate step. What purpose does it have?

> There is no make rule for vmlinux.relocs, and so
> 
> - if it gets deleted, it cannot be rebuilt and even though the build
> does not break, the relocation data is missing from the compressed
> image, and this could potentially break the kaslr startup code,
> - it vmlinux.relocs is older than vmlinux for some reason, make will
> not notice and silently reuse the outdated version,
> - when creating vmlinux.relocs from vmlinux and an error occurs,
> vmlinux is deleted, making it difficult to diagnose the problem.
> 
> I think this is badly broken, but if you think this is all working as
> it should, I am not going to debate this further, and you can consider
> the patch series withdrawn.

That's very sad, as both the simplification is substantial:

  19 files changed, 52 insertions(+), 87 deletions(-)

and the increase in debuggability is substantial as well.

Thanks,

	Ingo

