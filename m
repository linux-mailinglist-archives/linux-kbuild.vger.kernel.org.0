Return-Path: <linux-kbuild+bounces-9177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0CBDFDC3
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 19:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5711A229CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 17:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B5C33CEBF;
	Wed, 15 Oct 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI4v02vF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFDC33CEB9;
	Wed, 15 Oct 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549351; cv=none; b=cOVaqIlD0Joq75N4fwzoBxVk20W/HMrQW4rBqhjNESoVUBnWAmYZGADkwryCoWsf0U1uU0uV/RQkobh2bwZRAMuqFdbc2Jvys/4+2aCROfWnRjxrffshSfdK2kZCZnjy1bQghWICIkos/f9MgfspbWcozvnQ6jxKmJVjkLuw498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549351; c=relaxed/simple;
	bh=SpeBYhbxHCk163KaUkm/ZEz17U9C1brxzNHZXCH8osY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUXrDq5CXON1UTFX9xDdgzIazJ7vk00lI1gpX7HMpD78EuBZzn8X7JWRzP4cA185EgTascE/CslEvW7gJGwQuAh4Q1L0sC5FRiXhxUKSsxM3y6rNSfsVw8y2q94cReMiWrEGOR3dbxKejAP5ZprLn23UGL4+5izRGlSY3CDvGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI4v02vF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A98BC4CEF8;
	Wed, 15 Oct 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760549351;
	bh=SpeBYhbxHCk163KaUkm/ZEz17U9C1brxzNHZXCH8osY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jI4v02vFvJPi/v5kjOhzuQBLbsh4KfUZHKpZEI7YBssQyPQVsyGZ/spxjdEs/74QC
	 4fLCeOleRYhOrB4EqK9LYDrpf0lOjvMZsuipLGIL3Nu79DeUHY2Tut/zQrPc1UlCvS
	 ktj7vOvARIq0rBfyfHNUwBfJl6d9GwNEP4qr7Y5gXNn6q+cvxnRr7bx6gxPXOt3PnW
	 nPv6gRT97SIA+YNC3h6W3+wXPRM8ARhb48YPvlCKJ+XkkCBE2fLIusZIOW/GVg6kJ2
	 u8cnuJYhLFWPdB9vVAKG75/rIzmKpq7pul3NIOQW66wfAXMtdnTMxJN49HglBcAkYh
	 sXg/94uj1Pxxw==
Date: Wed, 15 Oct 2025 10:29:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, John Crispin <john@phrozen.org>,
	Alexey Gladkov <legion@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] kbuild: modules.builtin is empty on architectures without
 CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
Message-ID: <20251015172906.GA1630960@ax162>
References: <aO-kDdBybaHSn62G@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO-kDdBybaHSn62G@makrotopia.org>

Hi Daniel,

Thanks for the report!

On Wed, Oct 15, 2025 at 02:39:25PM +0100, Daniel Golle wrote:
> While build todays net-next tree on a Lantiq-based board I use for
> testing I run into a weird problem which gave me some headaches. It
> turns there is a regression introduced in commit 39cfd5b12160 ("kbuild:
> extract modules.builtin.modinfo from vmlinux.unstripped") which causes
> both modules.builtin and modules.builtin.modinfo to be empty files on
> certain architectures.
> 
> AFFECTED SCOPE:
> ===============
> This bug affects all architectures where:
>   1. CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is NOT set, AND
>   2. The architecture uses the standard ELF_DETAILS macro in its linker
>      script (which places .modinfo at address 0 as a non-allocatable
>      section)
> 
> This includes at least MIPS (32-bit and 64-bit) and likely several other
> architectures. The issue does NOT affect architectures with
> CONFIG_ARCH_VMLINUX_NEEDS_RELOCS=y (e.g., x86 with certain
> configurations, parisc, s390).
> 
> OBSERVED BEHAVIOR:
> ==================
> After a successful kernel build with the affected configuration:
>   - modules.builtin: 0 bytes (empty)
>   - modules.builtin.modinfo: 0 bytes (empty)
>   - vmlinux.o: contains .modinfo section (verified with readelf)
>   - vmlinux.unstripped: .modinfo section is MISSING (verified with
>     readelf)
...
> REPRODUCTION:
> =============
> 1. Configure a kernel for MIPS (or any other architecture without
>    CONFIG_ARCH_VMLINUX_NEEDS_RELOCS)
> 2. Ensure CONFIG_MODULES=y is set
> 3. Build the kernel: make
> 4. Observe: ls -lh modules.builtin modules.builtin.modinfo
>    Both files will be 0 bytes

I cannot reproduce this with a simple defconfig build for either mips or
arm64 using GCC 15.2.0 / binutils 2.45 from kernel.org [1]:

  $ git show -s --pretty=kernel
  5a6f65d15025 ("Merge tag 'bitmap-for-v6.18-rc2' of https://github.com/norov/linux")

  $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- clean defconfig all
  ...

  $ scripts/config -s MODULES -s ARCH_VMLINUX_NEEDS_RELOCS
  y
  undef

  $ ls -hl modules.builtin{,.modinfo}
  -rw-r--r-- 1 nathan nathan 8.7K Oct 15 10:19 modules.builtin
  -rwxr-xr-x 1 nathan nathan 146K Oct 15 10:19 modules.builtin.modinfo

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean virtconfig all

  $ scripts/config -s MODULES -s ARCH_VMLINUX_NEEDS_RELOCS
  y
  undef

  $ ls -hl modules.builtin{,.modinfo}
  -rw-r--r-- 1 nathan nathan  18K Oct 15 10:23 modules.builtin
  -rw-r--r-- 1 nathan nathan 284K Oct 15 10:23 modules.builtin.modinfo

What version of GCC and binutils are you using? Your configuration may
be helpful for reproducing as well.

[1]: https://kernel.org/pub/tools/crosstool/

Cheers,
Nathan

