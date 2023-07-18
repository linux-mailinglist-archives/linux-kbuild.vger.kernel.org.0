Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D43758252
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jul 2023 18:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjGRQnJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Jul 2023 12:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjGRQnI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jul 2023 12:43:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5398610C;
        Tue, 18 Jul 2023 09:43:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5DB16167A;
        Tue, 18 Jul 2023 16:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D878C433C8;
        Tue, 18 Jul 2023 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689698586;
        bh=6GmurqX2i9JM34BQa9X30FmQHtnrur89oQ3WxbydzJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PM2FYJSNOlfl7ajifO/Zb7gliIo6DLh1mRbpPrgh3TRoUhoZ6rlj70Lej34Ftn+AG
         NytoIB0ziTr1RxHoweF9CvObomaiakj6hnRjYm3NUbcmMWRfNJ7HtyDClA2v5P8XZm
         X4xajyR8KQeor6hPjr+IlvLImDEm6Hm3N4frcSeBH5QhHXH95p6YgWrjfyUqkej+RE
         21SNU0aMQWNo+K01+12GvN0Up50PZYIR9v23LinCvoOrGh8w916WIZ3kQjRQbix0Ou
         ld8g8iYvORM3N/IGSc0R/KuItkXyIpRuoiEhI1S6Q8VaNrBIBdYw2tqjia3OBybawT
         R4nsCEcyw1haA==
Date:   Tue, 18 Jul 2023 09:43:03 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Raphael Nestler <raphael.nestler@gmail.com>,
        Andrea Righi <andrea.righi@canonical.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: rust: avoid creating temporary files
Message-ID: <20230718164303.GB1279879@dev-arch.thelio-3990X>
References: <20230718055235.1050223-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718055235.1050223-1-ojeda@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 18, 2023 at 07:52:35AM +0200, Miguel Ojeda wrote:
> `rustc` outputs by default the temporary files (i.e. the ones saved
> by `-Csave-temps`, such as `*.rcgu*` files) in the current working
> directory when `-o` and `--out-dir` are not given (even if
> `--emit=x=path` is given, i.e. it does not use those for temporaries).
> 
> Since out-of-tree modules are compiled from the `linux` tree,
> `rustc` then tries to create them there, which may not be accessible.
> 
> Thus pass `--out-dir` explicitly, even if it is just for the temporary
> files.
> 
> Reported-by: Raphael Nestler <raphael.nestler@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1015
> Reported-by: Andrea Righi <andrea.righi@canonical.com>
> Tested-by: Raphael Nestler <raphael.nestler@gmail.com>
> Tested-by: Andrea Righi <andrea.righi@canonical.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 6413342a03f4..82e3fb19fdaf 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -264,6 +264,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  
>  rust_allowed_features := new_uninit
>  
> +# `--out-dir` is required to avoid temporaries being created by `rustc` in the
> +# current working directory, which may be not accessible in the out-of-tree
> +# modules case.
>  rust_common_cmd = \
>  	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
>  	-Zallow-features=$(rust_allowed_features) \
> @@ -272,7 +275,7 @@ rust_common_cmd = \
>  	--extern alloc --extern kernel \
>  	--crate-type rlib -L $(objtree)/rust/ \
>  	--crate-name $(basename $(notdir $@)) \
> -	--emit=dep-info=$(depfile)
> +	--out-dir $(dir $@) --emit=dep-info=$(depfile)
>  
>  # `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
>  # will be used. We explicitly request `-Ccodegen-units=1` in any case, and
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> -- 
> 2.41.0
> 
