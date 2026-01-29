Return-Path: <linux-kbuild+bounces-10926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKYfCGZme2l2EQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10926-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 14:53:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B3B09F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 14:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B67C306AD28
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 13:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB27A2D3ED2;
	Thu, 29 Jan 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="WA1B/8jP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE07346A14
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694602; cv=none; b=tJDPoihAqGB4oyRK/KYclB6wSs32kq3VkRpUleOHWfEKjiGEKraLt9a9SvqtRdRvo542bc0h3hDNHZkHU+4JVRjPhDO+z4Q9RoN7jzIBoI2bb+XHe9ZSR4/KVo1ahm6FCiaWf90ATQ8HTvpOtB2ZkcR9LEZaHpFK2Wi+/W1oQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694602; c=relaxed/simple;
	bh=3jnlf1IREiL+KygAIfwEEO6hHK7S1OFnKfdhlq2nLdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ld8X3VH3+0eA4eCJ2ZMluttbXPfEIaBzA2BurZBzuT87EfTNWeShDKNxnhpjNW+kLh4yH5xfmD1mswyyqCzimlZrarQeW5+kTU3mFUtMdl3SZ95Iy9HTDWD1mDUva4dXU3y3L/ykFIKFkwcMqjdiYZima6uUcdTjwHIjdvbuOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=WA1B/8jP; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9F1C4240028
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 14:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1769694598; bh=Xv30LavhO4rN6saEyHYn+XnCL4YQgEmDy4BNFRu1GBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=WA1B/8jPvPO21hUZpqbwfFJ7NnRvffNWbP9x9zaQddSSi60h2K/ecVv7WjxPW+zir
	 Wg8oo9v1DCR3QXzalDJ1Qf0JiqkUupaS5frrG2O2CtdSa0FChorOiZLFPq5H3HBjh6
	 Fx1fBMyWG95InE2OVZpxn7ciA1GQAtjaEIXZm3Vr55kiXyQ8P0WWQuaCweC+AeIxmS
	 OzD1te7a94sBE394P6Cl6YWFnB2UbsRnY/4iihZN2/SxH22Edm5cpMPw7Qq7td8Z0I
	 X1hHcJhI6bHPUI858EmXSaMfcsB5YFs+qNGmuRhhwQWohSIbgL4tAQCl95MbDBrCSI
	 4feOQ9b8XVWxQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f20rD1s7Kz9rxh;
	Thu, 29 Jan 2026 14:49:48 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier <nsc@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <lossin@kernel.org>,  Andreas Hindborg
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross
 <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,  Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Jonathan
 Corbet <corbet@lwn.net>,  Conor Dooley <conor@kernel.org>,  Mingcong Bai
 <jeffbai@aosc.io>,  Han Gao <rabenda.cn@gmail.com>,  Vivian Wang
 <wangruikang@iscas.ac.cn>,  Jason Montleon <jmontleo@redhat.com>,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  llvm@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
In-Reply-To: <20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
	<20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
Date: Thu, 29 Jan 2026 13:49:56 +0000
Message-ID: <87v7gk8r5x.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-10926-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charmitro@posteo.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC1B3B09F9
X-Rspamd-Action: no action

Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn> writes:

> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM. This commit enables GCC + Rust builds again.
>
> Add `bindgen-option` conditions for the availability of libclang to the
> RISC-V extension Kconfig symbols that depend on the `cc-option`
> function.
>
> For Zicsr/Zifencei special handling, since LLVM/Clang always enables
> these two extensions, either don't pass them to `-march`, or pass them
> explicitly and Rust bindgen libclang must recognize them.
>
> Clang does not support `-mno-riscv-attribute` flag, filter it out to
> resolve error: unknown argument: '-mno-riscv-attribute'.
>
> Define `BINDGEN_TARGET_riscv` to pass the target triplet to Rust bindgen
> libclang for RISC-V to resolve error: unsupported argument 'medany' to
> option '-mcmodel=' for target 'unknown'.
>
> Update the documentation, GCC + Rust builds for RISC-V are now
> maintained.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
> ---
>  Documentation/rust/arch-support.rst |  2 +-
>  arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
>  rust/Makefile                       |  3 ++-
>  scripts/Makefile.rust               |  1 +
>  4 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6e6a515d0899..5282e0e174e8 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
> +``riscv``      Maintained        ``riscv64`` only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
>  =============  ================  ==============================================
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b39f37f769a..c869ee07117e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -195,7 +195,7 @@ config RISCV
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
>  	select HAVE_SAMPLE_FTRACE_DIRECT
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
> @@ -619,6 +619,8 @@ config TOOLCHAIN_HAS_V
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>  	depends on LD_IS_LLD || LD_VERSION >= 23800
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64imv)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32imv)

Hi Asuna!

I'm under the impression that the `!RUST ||` guard here doesn't
actually prevent the `$(bindgen-backend-option,...)` call from being
executed. `$(...)` shell expansions should happen during the textual
substitution phase, before symbol dependency evaluation occurs, check
documentation at kconfig-macro-language.rst lines 228-229.

I did this test:
  $ cat /tmp/fake_bindgen
    #!/bin/bash
    echo "[BINDGEN INVOKED] $(date '+%H:%M:%S') args: $@" >> /tmp/bindgen_calls.log
    # Call real bindgen
    exec /home/charmitro/.cargo/bin/bindgen "$@"

  $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- BINDGEN=/tmp/fake_bindgen defconfig
    HOSTCC  scripts/basic/fixdep
    ...
  *** Default configuration is based on 'defconfig'
  #
  # configuration written to .config
  #

  $ linux git:(master) rg CONFIG_RUST .config
  ...
  283:# CONFIG_RUST is not set
  ...

  $ cat /tmp/bindgen_calls.log
  [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
  [BINDGEN INVOKED] 15:44:44 args: ./scripts/rust_is_available_bindgen_libclang.h
  [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
  [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64imv
  [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32imv
  [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zabha
  [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zabha
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zacas
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zacas
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbb
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbb
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zba
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zba
  [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbc
  [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbc
  [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbkb
  [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbkb
  [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zicsr_zifencei
  [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zicsr_zifencei

So, CONFIG_RUST not set, yet bindgen was invoked. Not sure if that is
intentional though.


Cheers,
C. Mitrodimas

>  
>  config RISCV_ISA_V
>  	bool "Vector extension support"
> @@ -683,6 +685,8 @@ config TOOLCHAIN_HAS_ZABHA
>  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zabha)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zabha)
>  
>  config RISCV_ISA_ZABHA
>  	bool "Zabha extension support for atomic byte/halfword operations"
> @@ -701,6 +705,8 @@ config TOOLCHAIN_HAS_ZACAS
>  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zacas)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zacas)
>  
>  config RISCV_ISA_ZACAS
>  	bool "Zacas extension support for atomic CAS"
> @@ -719,6 +725,8 @@ config TOOLCHAIN_HAS_ZBB
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
>  	depends on LD_IS_LLD || LD_VERSION >= 23900
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbb)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbb)
>  
>  # This symbol indicates that the toolchain supports all v1.0 vector crypto
>  # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
> @@ -734,6 +742,8 @@ config TOOLCHAIN_HAS_ZBA
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
>  	depends on LD_IS_LLD || LD_VERSION >= 23900
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zba)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zba)
>  
>  config RISCV_ISA_ZBA
>  	bool "Zba extension support for bit manipulation instructions"
> @@ -769,6 +779,8 @@ config TOOLCHAIN_HAS_ZBC
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
>  	depends on LD_IS_LLD || LD_VERSION >= 23900
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbc)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbc)
>  
>  config RISCV_ISA_ZBC
>  	bool "Zbc extension support for carry-less multiplication instructions"
> @@ -792,6 +804,8 @@ config TOOLCHAIN_HAS_ZBKB
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
>  	depends on LD_IS_LLD || LD_VERSION >= 23900
>  	depends on AS_HAS_OPTION_ARCH
> +	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbkb)
> +	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbkb)
>  
>  config RISCV_ISA_ZBKB
>  	bool "Zbkb extension support for bit manipulation instructions"
> @@ -893,6 +907,25 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>  	  versions of clang and GCC to be passed to GAS, which has the same result
>  	  as passing zicsr and zifencei to -march.
>  
> +config RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
> +	def_bool y
> +	depends on !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
> +	depends on !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
> +
> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
> +	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
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
> diff --git a/rust/Makefile b/rust/Makefile
> index 37b4205afb70..d8b6a570cb84 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,7 +383,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-mno-riscv-attribute
>  
>  # Because scripts/Makefile.rust is included regardless of whether Rust is enabled,
>  # we perform this check here to avoid breaking targets that do not yet support Rust builds.
> diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
> index 5c12b4b8c8b6..bfdad4a0a3ce 100644
> --- a/scripts/Makefile.rust
> +++ b/scripts/Makefile.rust
> @@ -3,6 +3,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))

