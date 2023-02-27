Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780D06A4261
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Feb 2023 14:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjB0NPd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Feb 2023 08:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjB0NPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Feb 2023 08:15:32 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA9DFF22
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 05:15:22 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o15so23111252edr.13
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 05:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NLfg3slGYetUnZNwFE0KVvrcLp3byIgQkx8HPtOniwk=;
        b=iMQNw+JEZaNx0S4Fy1ik2UI9b/AUDcHI5d0btzcJo7CnjWUsuvBc75cc6zYpTUpdjC
         kEvCOOgLckJVWNCpRgBaJFkUuZ9JIbAGJ0byjOHXwKdjBynLzwbDssi5vXYU2coP5Z3+
         J/TpdJ3lVGMUWpe3fjS5U6JbCdOxOXuhYP5Ey7g6nu/I/SPSKjBgKtTyaIGlPmrgctP9
         xTFKfvtDr1z+wTmS7d+vprlvx/u1Kg9BJZFho7XsAFuTGOIyQEG3/GDRYwnlZzGOsce2
         dGaVMT4eYv0f0N4ersyJ11a32NitpofrzkerZxeQtD4iU1LHPjbK+nz9D+L2pyPQh2LW
         TCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLfg3slGYetUnZNwFE0KVvrcLp3byIgQkx8HPtOniwk=;
        b=n7J/vcl7IgTLq5t7R3iSOfpA/2G5yzyh2fkcZl2bHwRdspkYMwx+/xZdGYZf8eHyRZ
         k5pKnNRbC323mPKIMnamVGpulmg+XkWhndYsgz4dOSju4NyD1Jf1u+2Rh+Hgn6v2tGpK
         nEuHsaCKK2MIfxMguBB9NdCzPVFYEC3ZH1eEf7rC7eZHM81z/Ly+/ScQ+0uTeAeBjgVx
         D/f6+YfFSZ671hVb7hRs1+4ohDO//x2En7uAU9et3AJKfwSv2zc4w+W2sHkVzAnVdsMr
         F6zTvZ48cc2qjHf/nTUrtGKQigaajPEztG8H9qBRdb29EulgNeQg4joR24xeaWiqTmrv
         SU5w==
X-Gm-Message-State: AO0yUKUHr1JXMQXwEY7i07k9IepV+iPgViarYJt3ue6rEOSUsvyfsPF/
        qpN0BAZQ2J3rOLmiy58uAn1FGg==
X-Google-Smtp-Source: AK7set+C5GBZkxh9cQ81KCkP9JYoxHpIYbP0Hhu7L+GDszmWgF9kUxmPh/hzISjMRllVNmtL7L9FRw==
X-Received: by 2002:a17:907:94c1:b0:8f4:86a9:748d with SMTP id dn1-20020a17090794c100b008f486a9748dmr9706231ejc.12.1677503720810;
        Mon, 27 Feb 2023 05:15:20 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id lt20-20020a170906fa9400b008e97fdd6c7csm3183244ejb.129.2023.02.27.05.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:15:20 -0800 (PST)
References: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] rust: Enable the new_uninit feature for kernel and
 driver crates
Date:   Mon, 27 Feb 2023 14:09:37 +0100
In-reply-to: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
Message-ID: <87pm9v9rmg.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Asahi Lina <lina@asahilina.net> writes:

> The unstable new_uninit feature enables various library APIs to create
> uninitialized containers, such as `Box::assume_init()`. This is
> necessary to build abstractions that directly initialize memory at the
> target location, instead of doing copies through the stack.
>
> Will be used by the DRM scheduler abstraction in the kernel crate, and
> by field-wise initialization (e.g. using `place!()` or a future
> replacement macro which may itself live in `kernel`) in driver crates.
>
> See [1] [2] [3] for background information.
>
> [1] https://github.com/Rust-for-Linux/linux/issues/879
> [2] https://github.com/Rust-for-Linux/linux/issues/2
> [3] https://github.com/rust-lang/rust/issues/63291
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/lib.rs     | 1 +
>  scripts/Makefile.build | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 223564f9f0cc..1118cd3e0b5f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -17,6 +17,7 @@
>  #![feature(core_ffi_c)]
>  #![feature(dispatch_from_dyn)]
>  #![feature(generic_associated_types)]
> +#![feature(new_uninit)]
>  #![feature(receiver_trait)]
>  #![feature(unsize)]
>  
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a0d5c6cca76d..0f637e1ca8dc 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ---------------------------------------------------------------------------
>  
> -rust_allowed_features := core_ffi_c
> +rust_allowed_features := core_ffi_c,new_uninit

What is the purpose of adding the feature here? The kernel crate seems
to compile fine without this.

BR Andreas

