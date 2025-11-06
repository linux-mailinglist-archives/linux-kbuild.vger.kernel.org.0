Return-Path: <linux-kbuild+bounces-9428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC2C38A9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 02:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3933B38A4
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 01:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8591D618A;
	Thu,  6 Nov 2025 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RznJW4KQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F0E1891AB;
	Thu,  6 Nov 2025 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391306; cv=none; b=QlyRQFd4FFJchyFC42a3GJY5GCZH7szbb9BdPEC1NRgT9xhXVRIy2t7fsx0dtfDQ9rzM5QDXEAUwB6KlwOb96ysF3bYCq+4n/NESZB1SMFKQf/YuIRle0MjzUfHfw0GhJRhAjJUiAWNYk0o7FdCpY/N9ApxsqoGPhDSWwaJqMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391306; c=relaxed/simple;
	bh=C1CMXKhozu8LYFPbX6ylpFCy9Bm+8ecgB1ZjwnG2s6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0PJBF928F/r3CGL9uWVK7a/5WT3kLzwrKylDdLjG2PqDWyZhtwN4RjcKFw1zOoxuoLJc1+iavR++RleKO7DAFhDJkQOs2ax3ARkhNq0h8FIyFGUWn35Y+RwH+Vqysb6x3OQ6Y6VRH9euL9ofbqdNS6ObEAZgyPhtKXUayeruA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RznJW4KQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C62DC4CEF5;
	Thu,  6 Nov 2025 01:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762391305;
	bh=C1CMXKhozu8LYFPbX6ylpFCy9Bm+8ecgB1ZjwnG2s6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RznJW4KQCN5afy0v0SrJz6ewkOwCFcTW5mT6gKEDRbByUJ/aXvmZOKgHub0HfGd8F
	 C62tJ3ju+U+txK4vrh5547VZXBHPVZ6z1b9FWZlV02UTTcV4YzzmkRxBn8D96VkDv3
	 i5DocrXEANqZcwu3Ue356M+VYoVdTckBOc6aIs0ShO3a3dzIVMXgXBOgbu53tyx4dJ
	 49NwlzJdN7yZvJCUhFduK41LNPzVqrvC8dHhK0pyklkvM0fV+GM+TzNWz57AuMdUG5
	 4Q6TgklWVOkAEMA4uUYP7eOqjiTioLhq6rtY/ec36qG0EkQSxMzx2xmXs5KxYvxu0P
	 3y492NtCsA4vg==
Date: Wed, 5 Nov 2025 18:08:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	linux-kbuild@vger.kernel.org, Samir M <samir@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <20251106010820.GA3031707@ax162>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
 <aQvHSVXbOdiN_J5D@telecaster>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQvHSVXbOdiN_J5D@telecaster>

On Wed, Nov 05, 2025 at 01:53:13PM -0800, Omar Sandoval wrote:
> Here's a script that reproduces it:
> 
> ```
> #!/bin/sh
> 
> set -e
> 
> host_arch=x86_64
> compiler_version="12.4.0"
> 
> compiler_dir="/tmp/arm64-gcc-$compiler_version"
> if [ ! -e "$compiler_dir" ]; then
> 	rm -rf "$compiler_dir.tmp"
> 	mkdir "$compiler_dir.tmp"
> 	curl -L "https://mirrors.kernel.org/pub/tools/crosstool/files/bin/$host_arch/$compiler_version/$host_arch-gcc-$compiler_version-nolibc-aarch64-linux.tar.xz" | tar -C "$compiler_dir.tmp" -Jx
> 	mv "$compiler_dir.tmp" "$compiler_dir"
> fi
> 
> export PATH="$compiler_dir/gcc-$compiler_version-nolibc/aarch64-linux/bin:$PATH"
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux- tinyconfig
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux- -j$(nproc) vmlinux
> readelf -W -l vmlinux | awk '$1 == "LOAD" && $6 ~ /0x0+\>/'
> ```
> 
> It prints something like:
> 
>   LOAD           0x1ef008 0x0000000000000000 0xffff800080220000 0x000000 0x000000 R   0x10000
> 
> I.e., a segment with FileSiz and MemSiz 0.

Thank you, that was incredibly helpful.

> Using a newer crosstool version fixes it, so maybe this was a GCC or
> binutils bug.

Good observation, as this was reproducible with GCC 12.4.0 from
kernel.org but not GCC 12.5.0, which I noticed has a newer binutils
version. I was able to reproduce it with a self compiled copy of
binutils 2.42 but not with binutils 2.44 so I reverse bisected the fix
to [1], which certainly makes sense :)

The diff of 'readelf -lW' before that change:

diff --git a/tmp/.psub.9QY0ZO b/tmp/.psub.6lHG9T
index 7f7f4de7be8..ea3a9b4ffb0 100644
--- a/tmp/.psub.9QY0ZO
+++ b/tmp/.psub.6lHG9T
@@ -7,14 +7,14 @@ Program Headers:
   Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
   LOAD           0x010000 0xffff800080000000 0xffff800080000000 0x14f000 0x14f000 R E 0x10000
   LOAD           0x160000 0xffff800080150000 0xffff800080150000 0x08f008 0x0c4c40 RWE 0x10000
-  LOAD           0x1f0000 0xffff800080220000 0xffff800080220000 0x000d08 0x000d08 R   0x10000
+  LOAD           0x1ef008 0x0000000000000000 0xffff800080220000 0x000000 0x000000 R   0x10000
   NOTE           0x1860f8 0xffff8000801760f8 0xffff8000801760f8 0x000054 0x000054 R   0x4
-  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10
+  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x8
 
  Section to Segment mapping:
   Segment Sections...
    00     .head.text .text 
    01     .rodata __param __ex_table .notes .rodata.text .init.text .exit.text .altinstructions .init.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .data..percpu .data .mmuoff.data.write .mmuoff.data.read .bss 
-   02     .modinfo 
+   02     
    03     .notes 
    04     

After:

diff --git a/tmp/.psub.x5uqM8 b/tmp/.psub.LHoP7d
index 7f7f4de7be8..27bda6ea7cc 100644
--- a/tmp/.psub.x5uqM8
+++ b/tmp/.psub.LHoP7d
@@ -1,20 +1,18 @@
 
 Elf file type is EXEC (Executable file)
 Entry point 0xffff800080000000
-There are 5 program headers, starting at offset 64
+There are 4 program headers, starting at offset 64
 
 Program Headers:
   Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
   LOAD           0x010000 0xffff800080000000 0xffff800080000000 0x14f000 0x14f000 R E 0x10000
   LOAD           0x160000 0xffff800080150000 0xffff800080150000 0x08f008 0x0c4c40 RWE 0x10000
-  LOAD           0x1f0000 0xffff800080220000 0xffff800080220000 0x000d08 0x000d08 R   0x10000
   NOTE           0x1860f8 0xffff8000801760f8 0xffff8000801760f8 0x000054 0x000054 R   0x4
-  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10
+  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x8
 
  Section to Segment mapping:
   Segment Sections...
    00     .head.text .text 
    01     .rodata __param __ex_table .notes .rodata.text .init.text .exit.text .altinstructions .init.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .data..percpu .data .mmuoff.data.write .mmuoff.data.read .bss 
-   02     .modinfo 
-   03     .notes 
-   04     
+   02     .notes 
+   03     

I am not really sure how to workaround this in a concise way... at least
for arm64 since it does not seem to use PHDRS to describe ELF segments,
it just relies on the default linker heuristics? It also seems seems
like this is a generic problem not specific to .modinfo, we just so
happen to see it with this section since it is in its own segment and we
are removing it.

[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=7f26d260ef76a4cb2873a7815bef187005528c19

Cheers,
Nathan

