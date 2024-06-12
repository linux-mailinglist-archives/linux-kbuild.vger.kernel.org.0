Return-Path: <linux-kbuild+bounces-2104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C1905D9F
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 23:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92C5C1C20EA7
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 21:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6F185923;
	Wed, 12 Jun 2024 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKjM0Dm8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFD052F62;
	Wed, 12 Jun 2024 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718227737; cv=none; b=deewg77tZlTXpkzikE0BWiyGS/5JNofBJHArhdVvCTj6At5FrydT6akfDfi/K2kiikmgug4q8FvcijHXUc6THc3iA6/Sb6WAj/e7GdXWr3/RP4MAE/0fYnrsXJQNE1B+y1PflK0ki/uxY3OMog/N2PE/hNMDXQXOkRKEFL2qu9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718227737; c=relaxed/simple;
	bh=znNn8FFLkKjz4pF51useI6yJeK2t3fPxERcqxi3+5zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9i99gO1fcklPlNWOiHV92QsG3LOaSEc+3V7pMaYwFj2h0vQyQ+7/pLfOSilTGx4f2e6uALWSfl6FlqkaMnt5NpZOgzCpwcDQkt14/t5YSa/btrjuKGJf42XSCGbqW4WhW/L9mSoqhpaNM/SVtwiJWeQbub3OHUWxkX1hvXTtcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKjM0Dm8; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f9774a556cso199732a34.0;
        Wed, 12 Jun 2024 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718227734; x=1718832534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/LiUVrOSh1qk2OL4B+ympIMZiV3sPMaaoOJZVMjpss=;
        b=OKjM0Dm84UK5sobqKS+o/nIVNctysZfiM/MLN7f7OtymIPB1EoDBS7EHLPdbGoGyMz
         VU1QtUZuDrmgMhz496jySReAb52Bpyh4dtq3komiYJnrhlcOtfsr6Tz5v5/1gXNpUm2G
         NBz/SrA2tLyzCBJDU90DQgXh1ULsP3lEw2EOPCVsKnQHcn80pw9dJcBvWshvFTKxbT8v
         YFFTSV2edQxu6TBm2LFGcklEX5WLONdtvhqCpKwKzLqx0PBQ2mQr83Aa5IpYcj03bTD6
         qH28jSG+yof4+9HHS5mVyXClG8OxPu3j1WgfzVRDmKMsESc0wlUBDSTUUHf+r69UHwis
         sZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718227734; x=1718832534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/LiUVrOSh1qk2OL4B+ympIMZiV3sPMaaoOJZVMjpss=;
        b=fNBWeWB3haKJQffUN8158LvfEwYgLJxJGiJF9FFBq8/T2C+qtqrZJ57Ash9f4bF7cK
         ApSWRGt75urI7knE8yDq+JQSvT2bMo0AWaNhH6yHdUivUy1JM/lIXdn3T3z1ulO8DN8L
         E6YWv/LjtCCM7mh2KgcLsrnEO7HOlZiJsRdFmv+4S/uL2dvqUbQLIaN5hFwtVb/+9izs
         hHI2sRSEsUJtylg3/uyDpJ+Hj/qQCvY61bPrmDSA3MxtPLYsyACO4PzuSK8Jmo9i6dws
         nD5mouahr9xgsawOjbze7/d2DRITfvdJbcG8awCcbTIH7rlQDqHzcZt55gtiUtppNrBG
         uEsA==
X-Forwarded-Encrypted: i=1; AJvYcCXkLhdbyLYSJCMltXczVoOS67/bXFIUo9vDtimQ5AK/7fHzNkxAapMWZEcH+39u62/RYBqgmrYut87BZVMS4UqvQ1ykGYyQDCbunRkZ7bGJgyE1XOeZvZLM1+iyLI08BKT7OH7dBLrt5HEm7PpfMH0tnC04bwHMo3qfuN87SU96T/1NtpIxgJkezDc=
X-Gm-Message-State: AOJu0YyQftDgErhteo91/qygm3JCuEfWdxbPUvlx1Chyie6L/kpJlnwY
	gsXJvYLWekyLwSsTnNmWgE4a/IVG8gMwQ3XbcWUI9ZYnumrnHSU5
X-Google-Smtp-Source: AGHT+IHgfy++8B1+QoKz5RUZk7S+hSnXgmAO0CmHWpGF56LEkgMgR0X3dl9BU04gXBdJPCiR2dF02A==
X-Received: by 2002:a05:6830:3446:b0:6f9:61a1:aa73 with SMTP id 46e09a7af769-6fa1bf59799mr2936246a34.9.1718227734100;
        Wed, 12 Jun 2024 14:28:54 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7955ff369dasm347650185a.34.2024.06.12.14.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:28:53 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 08C861200043;
	Wed, 12 Jun 2024 17:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 17:28:53 -0400
X-ME-Sender: <xms:FBNqZkhphvJzzZt-KjuHgCcQzPzeU8i1NuO0E6PAnxboHnzWnD5lNA>
    <xme:FBNqZtCfJ8yTUkAq1UGghkNzL57w7OrsP6t6g9uv0LszXA4O1spVSfQH4G5pJkosd
    jJrMbHiBYWoP-Gs8A>
X-ME-Received: <xmr:FBNqZsFDlDH7n8NFHaT89kLB-P7JWoaVNA3NwmLpJfDK5yk4KZS60CXDNrDvWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FBNqZlSrz2l5LFZhfM0_i1xFOxFXodwbOUfdd6JM_jDYpHX3ESAssw>
    <xmx:FBNqZhwvDaflNlsvQYNmOFXVoe_JqHeggj4wa2ocJRFnJxelY5RbMA>
    <xmx:FBNqZj7Tpi_6F4iUYyW7J9Hmzu3suAMS8_4egvWhFZGHy9kRGwIw3w>
    <xmx:FBNqZuw2lx9O1kin1_vKRQGhYHl5txGMtz7QWP8Vv5l6A0-M-jswWQ>
    <xmx:FRNqZlg3-6AqebltSlzGU8hMpKZK5Lx6MWcj4PQZyZxu17Y5bBoQjjet>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 17:28:52 -0400 (EDT)
Date: Wed, 12 Jun 2024 14:28:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
Message-ID: <ZmoS-cB20k1_u7Wv@boqun-archlinux>
References: <20240529202817.3641974-1-gary@garyguo.net>
 <20240529202817.3641974-3-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529202817.3641974-3-gary@garyguo.net>

On Wed, May 29, 2024 at 09:28:15PM +0100, Gary Guo wrote:
[...]
> +$(obj)/helpers.bc: $(obj)/helpers.c FORCE
> +	+$(call if_changed_dep,rust_helper)
> +
>  quiet_cmd_exports = EXPORTS $@
>        cmd_exports = \
>  	$(NM) -p --defined-only $< \
> @@ -396,11 +413,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
>  	OBJTREE=$(abspath $(objtree)) \
>  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>  		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
> -		--emit=dep-info=$(depfile) --emit=obj=$@ \
> +		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
>  		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
>  		--crate-type rlib -L$(objtree)/$(obj) \
>  		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>  		--sysroot=/dev/null \
> +	$(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \

I hit some errors when I tried to cross-compile arm64 on x86. Adding
$(CLANG_FLAGS) here resolves my issue, it's really because the target
selection for clang is done in $(CLANG_FLAGS) and carried into
$(KBUILD_CPPFLAGS), but seems you cannot use $(KBUILD_CPPFLAGS) here
because you only use clang as a linker. Without either, clang will just
use the target of host.

diff --git a/rust/Makefile b/rust/Makefile
index ad0797467102..84d698c09c65 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -419,7 +419,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
                --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
                --sysroot=/dev/null \
        $(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
-               $(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
+               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
        $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)

 rust-analyzer:

>  	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
>  
>  rust-analyzer:
> @@ -463,4 +482,11 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
>      $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>  	+$(call if_changed_dep,rustc_library)
>  
> +ifdef CONFIG_RUST_LTO_HELPERS
> +
> +$(obj)/kernel.o: private link_helper = 1
> +$(obj)/kernel.o: $(obj)/helpers.bc
> +
> +endif
> +
>  endif # CONFIG_RUST
[...]
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index efacca63c897..201e7dc5ae5d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -288,7 +288,10 @@ rust_common_cmd = \
>  # would not match each other.
>  
>  quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
> +      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_LTO_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
> +	$(if $(CONFIG_RUST_LTO_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@)
> +
>  

Ditto.

Regards,
Boqun

>  $(obj)/%.o: $(obj)/%.rs FORCE
>  	+$(call if_changed_dep,rustc_o_rs)
> -- 
> 2.42.0
> 

