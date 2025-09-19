Return-Path: <linux-kbuild+bounces-8910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8121B87E9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 07:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96D2A1726AC
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 05:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD521FF7BC;
	Fri, 19 Sep 2025 05:21:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4C34BA4C;
	Fri, 19 Sep 2025 05:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758259309; cv=none; b=cvJsZKWAMBte6+YuU3ePFmxel1BoI6wU6glYVu8DfudzEUhCh71sRO8qFYrtyGiUfTsYgZxNBFvaPq/mP6jjOZaKVjcaj9kkWRF4cM4XObdoyFCGBTXBHBmgl3y/LcI8AK1KkwTASkCYY0yIFCA02RAft2ChVtBxk7b5bPh0Wks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758259309; c=relaxed/simple;
	bh=NIEFN5ti59NZXaWdxVHaNkvbX1qbjNiPcPMm0U9FATw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJ+SUuKx3e0XSXLDpiALikmaDT6QSpKZs8kEKewO2lH323NAxrCl3C84cEcDn9LyIUNUDwnuI7kX2kGKAZATAXJKi0sbu3ZOezFtz+vPdZjZrEVmvmoeyXxQ+G4t0pYSQmEV6lej+FhwHI3AlIx903CkR+zhbTKTroa6oiP9m3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.3.11] (unknown [124.16.136.212])
	by APP-03 (Coremail) with SMTP id rQCowABnuIIa6MxoI9OnAw--.50765S2;
	Fri, 19 Sep 2025 13:20:32 +0800 (CST)
Message-ID: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Date: Fri, 19 Sep 2025 13:20:25 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:rQCowABnuIIa6MxoI9OnAw--.50765S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW8GrW3Kry8Zr1ktr1kKrg_yoWrCw47pF
	Z7ua4kKa17Jr95Ar4UC348Xa1093Z8J3y3GFy8Gw15G3yqyryDuFZ2kr17W34Uur1qv3yY
	vr18u3Wq9FWUCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3byCDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 9/14/25 15:16, Asuna Yang wrote:
> [...]
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 51dcd8eaa24356d947ebe0f1c4a701a3cfc6b757..3e892864f930778218073e8ee5980eb8f4e1594a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -191,7 +191,7 @@ config RISCV
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
>  	select HAVE_SAMPLE_FTRACE_DIRECT
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
> @@ -629,6 +629,8 @@ config TOOLCHAIN_HAS_V
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>  	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
>  	depends on AS_HAS_OPTION_ARCH
> +	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500a0907805896ed27
> +	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
>  

I think instead of testing libclang version, it would make more sense to
feature test if bindgen the binary supports these flags, like what we
already do with $(cc-option,...).

Same for all the other version tests.

> [...]
>  
> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI

TOOLCHAIN_ACCEPTS_ZICSR_ZIFENCEI?

> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
> +	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_LIBCLANG_VERSION >= 170000
> +	help
> +	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
> +	  them to -march doesn't generate an error anymore, and passing them or not
> +	  doesn't have any real difference, it still follows ISA before version
> +	  20190608 - Zicsr/Zifencei are included in base ISA.
> +
> +	  The current latest version of LLVM/Clang still does not require explicit
> +	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
> +	  -march and then silently ignores them.
> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/init/Kconfig b/init/Kconfig
> index e3eb63eadc8757a10b091c74bbee8008278c0521..0859d308a48591df769c7dbaef6f035324892bd3 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,12 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +config RUST_BINDGEN_LIBCLANG_VERSION
> +	int
> +	default $(rustc-bindgen-libclang-version)
> +	help
> +	  This is the version of `libclang` used by the Rust bindings generator.
> +

This can go away if we don't test the version anymore.

>  config CC_CAN_LINK
>  	bool
>  	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
> diff --git a/rust/Makefile b/rust/Makefile
> index bfa915b0e58854045b367557342727fee4fe2808..8c6f84487c41880816d1e55ba4c0df0e5af4e8fd 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -290,20 +290,25 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-%
> +	--param=% --param asan-% -mno-riscv-attribute
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_riscv	:= riscv64-linux-gnu

Do you know if this works for riscv32? Makefile.clang uses "-m32" for
32BIT, AFAICT, but i don't know if this is a good idea.

Maybe riscv32 Rust for Linux is broken anyway...

>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> +ifeq ($(BINDGEN_TARGET),)
> +$(error add '--target=' option to rust/Makefile)
> +else

Is this necessary? Maybe this can go in a separate patch, or even
submitted separately entirely - it's unrelated to "RISC-V: re-enable gcc
+ rust builds" and would be weird to see in git blame.

Vivian "dramforever" Wang


