Return-Path: <linux-kbuild+bounces-8151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF38B114C7
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1875A5B8F
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0101724501B;
	Thu, 24 Jul 2025 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z6AVl/AR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B6243364
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400310; cv=none; b=CjkLwTZE5G6fvVQrHy/JeCchXnv01SI6v6z7KmW7BIrusMDurPMDnM/+W0s5EcwHESTIuZlZe6B496tFv9i9fT6OBcqBXlvRnWET02GOtHL//Y1a//HT5Yr9m+aZeCPZMH/D5cqc0a7z6CUdldRh62HnSt9BPPoDNVhwzJVARB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400310; c=relaxed/simple;
	bh=6U9CDriPOyZt+5CDrYvvE4ecGhG3P1TQb1zMnvqMNKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIDyuxXKbqCDzvCGcJ1Mwgh9tUFXSy4W8XV3PRt4rDXN4kyiKNOj3AQYO4qNgGUPRB93sHDtn6hSO/VINusa2UC34eG4P4lG3vpEX8WkgS0mzSJGWacQKG8TcR+Ca7oSi//OmCwg93BQbO56ctfTCyb5pBV/KrpWHLGkix6VnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z6AVl/AR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235a3dd4f0dso9729105ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400308; x=1754005108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahgvr94dH2dhBsqXaRkVzEMYNkCZUV1gRwiq2yUA2cU=;
        b=Z6AVl/ARRdN+KfbA0pKtpPOBjOfjwx7O+18ARHxzb0d4ofPI9mbwn0y2+vjHYbLFah
         e/fIcOqh+SJgigPBk2O0UgT2EDX3chlerI8ZhS7NWFwCx1c8p7wGPuCeXpamA0X67sgr
         j1E2x21vTU5mXrsb8OmuroitTy8ZngHwxhBfWar8GQ/7hbHfse07lxd1fWU2xklc5hUK
         9taLWXUXVacEf6n4KcL2TCHuF7l0b2usciBPbrqQctoNNtBIyDZP/l0dAaU9hPvff26j
         wLC03q2DSGKJ8NopdqYR6OmXITQG2s5UW31eFMz0bvbJJd5TJkaMANIrPWys3sN+JGkx
         utbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400308; x=1754005108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ahgvr94dH2dhBsqXaRkVzEMYNkCZUV1gRwiq2yUA2cU=;
        b=MfOjQdilXTm3Jp4oJ89uI0IV2X6Kd3b+tYJqWqVcGYWLwBG6H38R7szLw46yETXoBm
         aWB9SChVh0pgJdWIF9eROLfjhDYX0if1VHTTqfbgRwImYUwFvwROuGEs+quPziFA/+cQ
         3vkaOGLohaDimKMqXrMNdVj6/qWXcLP1T7/BCorNUvWOPnOxu7B8EL16aQvtXL2T6SHe
         xhpXccmSMez0mzkxoDgp/venFYH/Wb0pqN/WAoq6a1T/8YU31sb9lQNffyl9ttGHr+xt
         +7fuUFEciTgzfeSo6OE8d0VCyxkpeA6qVOXGGr5bionFFUttpVhW86reWjGYI6ViNatQ
         l9hg==
X-Forwarded-Encrypted: i=1; AJvYcCVacvkT1/9wY4sw6qTMhd6oYIXBPXWQDAb7Q2uC09v3aFtuY30THnaP3lCOpwZQ1aqP5e5hH1F6dqSRfkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHHwGXea/gFA6Z2KdSG02hrZYbZhlUJEWoUYZw8ld+3WgwJ7Z
	D2Ib9sUbhWoV8WQLJZodKm9BEFMMzjYyOxSlTmA/NBeA8DRrySG1Q2Au4qr4KzG2s4Q=
X-Gm-Gg: ASbGncur2bpeSr92LZnhpSzePK1t8wWKJNOZmQtHK0kT53Gm3CIBPUFZmVFZ+E8DWrx
	jnH5mVpRRAaOtU7luuZJIpTIerjuCYm8Ntv2Sl7xkZy+r5uR5gVGJCV+S3s5Ds9h/1Cc4KVvyUu
	p7ObygsZi/InvzBbM8Jz4DkVuassASdqYg4UuNlRYzkwUZMvtA9oMBV6EafVmOXI/L3tO1KBcMZ
	Mm0BGKqndycwGm4ToF72nC6w4BVfI1zw+riL1CkRfJRLpnKSXQRYJAt5epX2Uxtm//fpljmQeDr
	Hunlka+j4DF0CktarDldjoQslGYPU6ooAMe9h+h5sQxdFJd1zR+UFkJ4sctehEsIDPC0x+W6tP4
	m32guG7YbdFpF0pGR4M4P94FEvJqN/tHt
X-Google-Smtp-Source: AGHT+IHh57JQMjYQf6z5v8YtVS4etBElbIsePwBBM2zn5y0zWRQdQdP1YcFar+ZP2TEVlhG5eL2aKg==
X-Received: by 2002:a17:903:8c8:b0:23f:6fa4:1567 with SMTP id d9443c01a7336-23f98146861mr104261895ad.8.1753400308145;
        Thu, 24 Jul 2025 16:38:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dc9a2sm23532065ad.126.2025.07.24.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:38:27 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:38:24 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, heinrich.schuchardt@canonical.com,
	andrew@sifive.com, ved@rivosinc.com
Subject: Re: [PATCH 00/11] riscv: fine grained hardware assisted kernel
 control-flow integrity
Message-ID: <aILD8LeUypdAKc8a@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>

Well I forgot to apply "RFC" prefix in subject. Sorry about that.

-Deepak

On Thu, Jul 24, 2025 at 04:36:53PM -0700, Deepak Gupta wrote:
>This patch series enables fine grained control-flow integrity for kernel
>on riscv platform. I did send out a RFC patchset [1] more than an year ago.
>Since it's been a while, I am resetting the versioning and calling it a RFC
>due to following reasons
>
>- This is first (in a while)  and I may have missed things.
>- Earlier patchset were not fine-grained kcfi. This one is.
>- Toolchain used to compile kernel is still in development.
>- On asm indirect callsites, setting up label need toolchain support.
>
>It is based on 6.16-rc1 with user cfi enabling patchset(v18)[2] applied on it.
>Hardware guarantee on kernel's control flow integrity is enforced via zicfilp
>and zicfiss riscv cpu extensions. Please take a look at user cfi enabling
>patchset for more details and references on these cpu extensions.
>
>Toolchain
>----------
>As mentioned earlier toolchain used to develop this patchset are still in
>development. But you can grab them here [3]. This is how I configure and
>compile toolchain.
>
>$ ./riscv-gnu-toolchain/configure \
>--prefix=/scratch/debug/open_src/sifive_cfi_toolchain/INSTALL_funcsig \
>--with-arch=rv64gc_zicfilp_zicfiss_zicsr_zifencei_zimop_zcmop \
>--enable-debug-info --enable-linux --disable-gdb  --with-abi=lp64d \
>--with-label-scheme=func-sig \
>--with-linux-headers-src=/scratch/debug/linux/kbuild/usr/include
>
>$ make -j$(nproc)
>
>If `-fcf-protection=full` is selected, toolchain is enabled to generate
>labeled landing pad instruction at the start of the function. And
>shadow stack push to save return address and sspopchk instruction in
>the return path.
>
>riscv kernel control-flow integrity
>------------------------------------
>
>As with normal user software, enabling kernel control flow integrity also
>require forward control flow integrity and backward control flow integrity.
>This patchset introduces CONFIG_RISCV_KERNEL_CFI config, hw assisted riscv
>kernel cfi is enabled only when `CONFIG_RISCV_KERNEL_CFI=y`. Selecting
>CONFIG_RISCV_KERNEL_CFI is dependent on CONFIG_RISCV_USER_CFI.
>
>To compile kernel, please clone the toolchain (link provided above), build
>it and use that toolchain bits to compile the kernel. When you do `menuconfig`
>select `Kernel features` --> `riscv userspace control flow integrity`.
>When you select `riscv userspace control flow integrity`, then `hw assisted
>riscv kernel control flow integrity (kcfi)` will show up. Select both and
>build.
>
>I have tested kcfi enabled kernel with full userspace exercising (unlabeled
>landing pads) cfi starting with init process. In my limited testing, this
>boots. There are some wrinkles around what labeling scheme should be used
>for vDSO object. This patchset is using labeled landing pads for vDSO.
>We may end up using unlabeled landing pad for vDSO for maximum compatibility.
>But that's a future discussion.
>
>Qemu command line to launch:
>/scratch/debug/open_src/qemu/build_zicfilp/qemu-system-riscv64 \
>  -nographic \
>  -monitor telnet:127.0.0.1:55555,server,nowait \
>  -machine virt \
>  -cpu rv64,zicond=true,zicfilp=true,zicfiss=true,zimop=true,zcmop=true,v=true,vlen=256,vext_spec=v1.0,zbb=true,zcb=true,zbkb=true,zacas=true \
>  -smp 2 \
>  -m 8G \
>  -object rng-random,filename=/dev/urandom,id=rng0 \
>  -device virtio-rng-device,rng=rng0 \
>  -drive file=/scratch/debug/open_src/zisslpcfi-toolchain/buildroot/output/images/rootfs.ext2,format=raw,id=hd0 \
>  -append "root=/dev/vda rw, no_hash_pointers, loglevel=8, crashkernel=256M, console=ttyS0, riscv_nousercfi=all" \
>  -serial mon:stdio \
>  -kernel /scratch/debug/linux/kbuild/arch/riscv/boot/Image \
>  -device e1000,netdev=net0 \
>  -netdev user,id=net0,hostfwd=tcp::10022-:22 \
>  -virtfs local,path=/scratch/debug/sources/spectacles,mount_tag=host0,security_model=passthrough,id=host0\
>  -bios /scratch/debug/open_src/opensbi/build/platform/generic/firmware/fw_jump.bin
>
>Backward kernel control flow integrity
>---------------------------------------
>This patchset leverages on existing infrastructure of software based shadow
>call stack support in kernel. Differences between software based shadow call
>stack and riscv hardware shadow stack are:
>
>- software shadow call stack is writeable while riscv hardware shadow stack
>  is writeable only via specific shadow stack instructions.
>
>- software shadow call stack grows from low memory to high memory while riscv
>  hardware shadow stack grows from high memory to low memory (like a normal
>  stack).
>
>- software shadow call stack on riscv uses `gp` register to hold shadow stack
>  pointer while riscv hardware shadow stack has dedicated `CSR_SSP` register.
>
>Thus its ideal use existing shadow call stack plumbing and create hooks into
>it to apply riscv hardware shadow stack mechanisms on it.
>
>This patchset introduces `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` along the lines
>of `CONFIG_ARCH_HAS_USER_SHADOW_STACK`.
>
>Forward kernel control-flow integrity
>--------------------------------------
>Enabling forward kernel control-flow integrity is mostly toolchain work where
>it emits a landing pad instruction at the start of address-taken function.
>zicfilp allows landing pads to be labeled with a 20-bit immediate value.
>Compiler used here is following the scheme of normalizing function prototype
>to a string using C++ itanium rules (with some modifications). See more details
>here [4]. Compiler generates a 128bit md5 hash over this string and uses
>first non-zero (scanning from MSB) 20bit segment from the 128-bit hash as label
>value.
>
>This is still a work in progress and feedback/comments are welcome.
>
>I would like to thank Monk Chiang and Kito Cheng for helping and continue to
>support from the toolchain side.
>
>[1] - https://lore.kernel.org/lkml/CABCJKuf5Jg5g3FVpU22vNUo4UituPEM7QwvcVP8YWrvSPK+onA@mail.gmail.com/T/#m7d342d8728f9a23daed5319dac66201cc680b640
>[2] - https://lore.kernel.org/all/20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com/
>[3] - https://github.com/sifive/riscv-gnu-toolchain/tree/cfi-dev
>[4] - https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/434
>
>To: Paul Walmsley <paul.walmsley@sifive.com>
>To: Palmer Dabbelt <palmer@dabbelt.com>
>To: Albert Ou <aou@eecs.berkeley.edu>
>To: Alexandre Ghiti <alex@ghiti.fr>
>To: Masahiro Yamada <masahiroy@kernel.org>
>To: Nathan Chancellor <nathan@kernel.org>
>To: Nicolas Schier <nicolas.schier@linux.dev>
>To: Andrew Morton <akpm@linux-foundation.org>
>To: David Hildenbrand <david@redhat.com>
>To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>To: Liam R. Howlett <Liam.Howlett@oracle.com>
>To: Vlastimil Babka <vbabka@suse.cz>
>To: Mike Rapoport <rppt@kernel.org>
>To: Suren Baghdasaryan <surenb@google.com>
>To: Michal Hocko <mhocko@suse.com>
>To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
>To: Bill Wendling <morbo@google.com>
>To: Monk Chiang <monk.chiang@sifive.com>
>To: Kito Cheng <kito.cheng@sifive.com>
>To: Justin Stitt <justinstitt@google.com>
>Cc: linux-riscv@lists.infradead.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-kbuild@vger.kernel.org
>Cc: linux-mm@kvack.org
>Cc: llvm@lists.linux.dev
>Cc: rick.p.edgecombe@intel.com
>Cc: broonie@kernel.org
>Cc: cleger@rivosinc.com
>Cc: samitolvanen@google.com
>Cc: apatel@ventanamicro.com
>Cc: ajones@ventanamicro.com
>Cc: conor.dooley@microchip.com
>Cc: charlie@rivosinc.com
>Cc: samuel.holland@sifive.com
>Cc: bjorn@rivosinc.com
>Cc: fweimer@redhat.com
>Cc: jeffreyalaw@gmail.com
>Cc: heinrich.schuchardt@canonical.com
>Cc: monk.chiang@sifive.com
>Cc: andrew@sifive.com
>Cc: ved@rivosinc.com
>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>---
>Deepak Gupta (11):
>      riscv: add landing pad for asm routines.
>      riscv: update asm call site in `call_on_irq_stack` to setup correct label
>      riscv: indirect jmp in asm that's static in nature to use sw guarded jump
>      riscv: exception handlers can be software guarded transfers
>      riscv: enable landing pad enforcement
>      mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
>      scs: place init shadow stack in .shadowstack section
>      riscv/mm: prepare shadow stack for init task
>      riscv: scs: add hardware shadow stack support to scs
>      scs: generic scs code updated to leverage hw assisted shadow stack
>      riscv: Kconfig & Makefile for riscv kernel control flow integrity
>
> Makefile                               |  2 +-
> arch/riscv/Kconfig                     | 37 +++++++++++++++++++++++++-
> arch/riscv/Makefile                    |  8 ++++++
> arch/riscv/include/asm/asm.h           |  2 +-
> arch/riscv/include/asm/linkage.h       | 42 +++++++++++++++++++++++++++++
> arch/riscv/include/asm/pgtable.h       |  4 +++
> arch/riscv/include/asm/scs.h           | 48 +++++++++++++++++++++++++++-------
> arch/riscv/include/asm/sections.h      | 22 ++++++++++++++++
> arch/riscv/include/asm/thread_info.h   | 10 +++++--
> arch/riscv/kernel/asm-offsets.c        |  1 +
> arch/riscv/kernel/compat_vdso/Makefile |  2 +-
> arch/riscv/kernel/entry.S              | 21 ++++++++-------
> arch/riscv/kernel/head.S               | 23 ++++++++++++++--
> arch/riscv/kernel/vdso/Makefile        |  2 +-
> arch/riscv/kernel/vmlinux.lds.S        | 12 +++++++++
> arch/riscv/lib/memset.S                |  6 ++---
> arch/riscv/mm/init.c                   | 29 +++++++++++++++-----
> include/linux/init_task.h              |  5 ++++
> include/linux/scs.h                    | 26 +++++++++++++++++-
> init/init_task.c                       | 12 +++++++--
> kernel/scs.c                           | 38 ++++++++++++++++++++++++---
> mm/Kconfig                             |  6 +++++
> 22 files changed, 314 insertions(+), 44 deletions(-)
>---
>base-commit: cc0fb5eb25ea00aefd49002b1dac796ea13fd2a0
>change-id: 20250616-riscv_kcfi-f851fb2128bf
>--
>- debug
>

