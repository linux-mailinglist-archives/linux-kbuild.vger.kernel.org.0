Return-Path: <linux-kbuild+bounces-8815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D0B56039
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 12:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EF21C22A1E
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B530280338;
	Sat, 13 Sep 2025 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="UJ2adir4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC909221F06;
	Sat, 13 Sep 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757758881; cv=none; b=UtReFvMirF9318+1QCRDAj0Q+haYfiS88JqQl4YUyFcGF8lvtvbfKsGDAh9qW+ut4t0FSPkhNRnPTLhXkk6GIyOv8OKTNEj81jv4SOOeBNwQX1IAw7DMb/K5UUoSH05hq9bpWIsAX8HDSNPnQT970z3iy3K73p66t8k5lpR2VKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757758881; c=relaxed/simple;
	bh=sBk7lvYg6K58o/MJAWcaZB6LuTuDcDWqVZym/7pTPkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgzU/aLFHB0R+SMvf/79jesCidxM2lsrajx+JxACX7h962bZaZJuYNqR79UmN3DJgvGJ6XdGvztgNj/k55sz065Is2CV+DYkF/IgHDtAJuYLtOvZkSPavzf9JeOjFtFWQp4kjqQCczm+XuseUcNna08ktcrflFuipJ5wx0bPZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=UJ2adir4; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4ca4:0:640:f272:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id AFF71C0F22;
	Sat, 13 Sep 2025 13:21:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 4LKYdiVLuSw0-AfhiAxHE;
	Sat, 13 Sep 2025 13:21:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1757758868;
	bh=+0HwJ7olMB/EXgqWe8NsF2z4rdK5PM2P+U36sMmPliU=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=UJ2adir4OveRrPFpmWobHyoGzwW7R0G4N/bS4HabbuOIvIiaDM8LYkWoKLr3whG+E
	 AQUUH6HGiNEjkdTp8Nbo7bqsQBdtdfw1PTkpR2uuBWKEuJtMJeyQqtBeEJd1X64kHI
	 kf4TkE2LmIv0xNv5nH/r5E3Eieqf3Km+wvwf0sjc=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sat, 13 Sep 2025 13:21:04 +0300
From: Onur <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
Message-ID: <20250913132104.715c5092@nimda.home>
In-Reply-To: <20250913100847.9234-1-work@onurozkan.dev>
References: <20250913100847.9234-1-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Sep 2025 13:08:47 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Adds a new `rustcheck` make target to run a check-only build
> similar to `cargo check`. This allows us to verify that the Rust
> sources can build without building/linking final artifacts,
> which speeds up the iteration (a lot) during development.
>=20
> The target supports the same flags as other Rust build rules, so
> it can also be used with `CLIPPY=3D1` (e.g., `make LLVM=3D1 rustcheck
> CLIPPY=3D1) to run Clippy in a faster way.
>=20
> Also, unlike `make LLVM=3D1`, it doesn't compile large amounts of C
> code (on a fresh checkout) when the goal is only to check that
> Rust builds are not broken after some changes.
>=20
> Suggested-by: Benno Losin <lossin@kernel.org>
> Link:
> https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/=
539103602
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev> ---
>  Makefile      |  7 +++++
>  rust/Makefile | 73
> +++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed,
> 80 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index cf37b9407821..7812cdc72938 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1716,6 +1716,8 @@ help:
>  	@echo  '		    is formatted, printing a diff
> otherwise.' @echo  '  rustdoc	  - Generate Rust documentation'
>  	@echo  '		    (requires kernel .config)'
> +	@echo  '  rustcheck       - Check that the Rust code builds'
> +	@echo  '                    (requires kernel .config)'
>  	@echo  '  rusttest        - Runs the Rust tests'
>  	@echo  '                    (requires kernel .config;
> downloads external repos)' @echo  '  rust-analyzer	  -
> Generate rust-project.json rust-analyzer support file' @@ -1821,6
> +1823,11 @@ PHONY +=3D rustdoc rustdoc: prepare
>  	$(Q)$(MAKE) $(build)=3Drust $@
> =20
> +# Checking Rust sources.
> +PHONY +=3D rustcheck
> +rustcheck: prepare0
> +	$(Q)$(MAKE) $(build)=3Drust $@
> +
>  # Testing target
>  PHONY +=3D rusttest
>  rusttest: prepare
> diff --git a/rust/Makefile b/rust/Makefile
> index bfa915b0e588..c148ef4a8c08 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -265,6 +265,79 @@ rusttest-kernel: $(src)/kernel/lib.rs
> rusttestlib-ffi rusttestlib-kernel \ rusttestlib-uapi
> rusttestlib-pin_init FORCE +$(call if_changed,rustc_test)
> =20
> +## Check-only compilation (similar to `cargo check`)
> +quiet_cmd_rustc_check_library =3D $(RUSTC_OR_CLIPPY_QUIET) CHECK $<
> +      cmd_rustc_check_library =3D \
> +        OBJTREE=3D$(abspath $(objtree)) \
> +        $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> +                @$(objtree)/include/generated/rustc_cfg
> $(rustc_target_flags) \
> +                --crate-type $(if
> $(rustc_check_library_proc),proc-macro,rlib) \
> +                $(if $(rustc_check_library_proc),,--emit=3Dmetadata) \
> +                --out-dir $(objtree)/$(obj)/check
> -L$(objtree)/$(obj)/check \
> +                --crate-name $(if
> $(rustc_check_crate_name),$(rustc_check_crate_name), \
> +				$(subst rustcheck-,,$(subst
> rustchecklib-,,$@))) $< +
> +rustcheck: rustchecklib-build_error rustchecklib-ffi
> rustchecklib-macros \
> +	rustchecklib-compiler_builtins
> rustchecklib-pin_init_internal \
> +	rustchecklib-pin_init rustchecklib-bindings
> rustchecklib-uapi \
> +	rustchecklib-kernel
> +
> +rustchecklib-build_error: $(src)/build_error.rs FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-ffi: $(src)/ffi.rs FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-macros: private rustc_target_flags =3D --extern proc_macro
> +rustchecklib-macros: private rustc_check_library_proc =3D yes
> +rustchecklib-macros: $(src)/macros/lib.rs FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-compiler_builtins: private rustc_check_crate_name =3D
> compiler_builtins_kernel +rustchecklib-compiler_builtins:
> $(src)/compiler_builtins.rs FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-pin_init_internal: private rustc_target_flags =3D --cfg
> kernel \
> +	--extern proc_macro
> +rustchecklib-pin_init_internal: private rustc_check_library_proc =3D
> yes +rustchecklib-pin_init_internal:
> $(src)/pin-init/internal/src/lib.rs FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-pin_init: private rustc_target_flags =3D --extern
> pin_init_internal \
> +	--extern macros --cfg kernel
> +rustchecklib-pin_init: $(src)/pin-init/src/lib.rs
> rustchecklib-macros \
> +	rustchecklib-pin_init_internal FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-bindings: private rustc_target_flags =3D --extern ffi
> +rustchecklib-bindings: $(src)/bindings/lib.rs \
> +    $(obj)/bindings/bindings_generated.rs \
> +    $(obj)/bindings/bindings_helpers_generated.rs \
> +    rustchecklib-ffi FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +rustchecklib-uapi: private rustc_target_flags =3D --extern ffi
> +rustchecklib-uapi: $(src)/uapi/lib.rs $(obj)/uapi/uapi_generated.rs \
> +    rustchecklib-ffi FORCE
> +	+$(call if_changed,rustc_check_library)
> +
> +ifdef CONFIG_JUMP_LABEL
> +rustchecklib-kernel:
> $(obj)/kernel/generated_arch_static_branch_asm.rs FORCE +endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +rustchecklib-kernel: $(obj)/kernel/generated_arch_warn_asm.rs \
> +	$(obj)/kernel/generated_arch_reachable_asm.rs FORCE
> +endif
> +endif
> +
> +rustchecklib-kernel: private rustc_target_flags =3D --extern ffi
> --extern pin_init \
> +	--extern build_error --extern macros --extern bindings
> --extern uapi +rustchecklib-kernel: $(src)/kernel/lib.rs
> rustchecklib-ffi rustchecklib-pin_init \
> +	rustchecklib-build_error rustchecklib-macros
> rustchecklib-bindings \
> +	rustchecklib-uapi FORCE
> +	+$(call if_changed,rustc_check_library)
> +
>  ifdef CONFIG_CC_IS_CLANG
>  bindgen_c_flags =3D $(c_flags)
>  else

Seems like I got some indentation issues, will handle in in the next
version after some feedbacks.

-Onur

