Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B062974F32F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jul 2023 17:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjGKPSh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Jul 2023 11:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbjGKPSQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jul 2023 11:18:16 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCE110F1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2023 08:18:14 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99F033F84E
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2023 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689088689;
        bh=zBS1kUVYnl4zbNq8VpIr8q1zCpc4ruBaI0DcQqmBCzU=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=FTAwV1cvwS6sg0EXKFhDUBYS65rw+UH4Blhj9A0XgqmSms3YQ3Qolxs89At0eF7eJ
         uPnHNIj2kHA2Woi6ec9HWuMY+SUNUO9ZzwAUiMHdul7FAFXtYqn2kLuACpDnDFoSMM
         bf8qBHB1XyR4r0xkJzZmkg7zqijVnV164uMp8v0m4VBsepW7sHEWpfyvaYoCOv5HVz
         JOrJgVaajKqXAq2Jg0iwq/XebMLlmwTEW10MoAUZ3RjzAfingcJgyruhC5MAgl95Kl
         wDSZsDgfggM8LDBDbH7X+Ykz/MsgPU/QRaBBhQYrNkDPvAO/x+ds9FkI0pFTXL+ykh
         al7Ou1YjHzHRw==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-513f337d478so3446719a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2023 08:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689088688; x=1691680688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBS1kUVYnl4zbNq8VpIr8q1zCpc4ruBaI0DcQqmBCzU=;
        b=aRf6Z97Mmq6o2JKXsSVe8l5Mqa92L2HZjuqPKT7xeRPX7IiqpBEdkrLBJreSDhN9C+
         ZWHBbHA2671ab2kiCOTCX+Omw/lNaU+YSR6FcG5OPXPktbPLHwevnZcbVuNhvooJRu68
         srFJMHPSGOYgyaRoqMVdKgSCJYH/k5czSoc7/Z+jTqUcBixlmhtjGBWwSo9txztQkSne
         jj+1mmtvASmGDb/W/Wfmv6lFVzk/N74SZwNdkjSCUYQ97gmg+FBcotlOZqz6eyI9V9XX
         vN2Amnx+oJ1AmbK8veZ5YzlgsuQLjBNEEjXKq1f3x8Zzleh0lUMQ0p30PAqz+Jn2iMlh
         L0hg==
X-Gm-Message-State: ABy/qLbEGeTUl3xLSHt6vGcmCnLu8GZbxFHMHtS1ag5goH2CpFsOhN2y
        ifDGa6bMzRkXoqMHGckA9ybdV5/t+/d4oXiG75zYIKqxiWtjx3W/IfFMEtQh8v2iW1/rrzcZYD0
        9jrxdgGRkQDKikbY5ch2BiIEoZPlpIGZfvZf5/TFJpg==
X-Received: by 2002:a05:6402:6cf:b0:51d:d37f:ab49 with SMTP id n15-20020a05640206cf00b0051dd37fab49mr13026179edy.6.1689088688227;
        Tue, 11 Jul 2023 08:18:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFrzVDe3+LYEvMRbxBjBYXswRZCflXQSVNYVfPRk1Q58g/TNPggflnSjsvw6h4y21B4GQhANg==
X-Received: by 2002:a05:6402:6cf:b0:51d:d37f:ab49 with SMTP id n15-20020a05640206cf00b0051dd37fab49mr13026148edy.6.1689088687917;
        Tue, 11 Jul 2023 08:18:07 -0700 (PDT)
Received: from localhost (host-95-234-206-203.retail.telecomitalia.it. [95.234.206.203])
        by smtp.gmail.com with ESMTPSA id o4-20020a056402038400b0051dd1c10c13sm1400778edv.29.2023.07.11.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 08:18:07 -0700 (PDT)
Date:   Tue, 11 Jul 2023 17:18:06 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        bpf <bpf@vger.kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH] btf, scripts: rust: drop is_rust_module.sh
Message-ID: <ZK1yrqmOPjS8grso@righiandr-XPS-13-7390>
References: <20230704052136.155445-1-andrea.righi@canonical.com>
 <CANiq72k6um58AAydgkzhkmAdd8t1quzeGaPsR7-pS_ZXYf0-YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k6um58AAydgkzhkmAdd8t1quzeGaPsR7-pS_ZXYf0-YQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 11, 2023 at 04:39:27PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 4, 2023 at 7:21 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> > we are now able to use pahole directly to identify Rust compilation
> > units (CUs) and exclude them from generating BTF debugging information
> > (when DEBUG_INFO_BTF is enabled).
> >
> > And if pahole doesn't support the --lang-exclude flag, we can't enable
> > both RUST and DEBUG_INFO_BTF at the same time.
> >
> > So, in any case, the script is_rust_module.sh is just redundant and we
> > can drop it.
> >
> > NOTE: we may also be able to drop the "Rust loadable module" mark
> > inside Rust modules, but it seems safer to keep it for now to make sure
> > we are not breaking any external tool that may potentially rely on it.
> 
> Just to recall the history of these changes:
> 
>   - The script got added in order to skip the BTF generation in the
> `BTF [M]` step (under `DEBUG_INFO_BTF_MODULES`, which depends on
> `DEBUG_INFO_BTF`).
> 
>   - A few months later, it was noticed that C modules couldn't be
> loaded if Rust was enabled, due to the base BTF info in `vmlinux`.
> That triggered the eventual addition of `--lang_exclude=` to `pahole`,
> but meanwhile, we made `DEBUG_INFO_BTF` and `RUST` exclusive.
> 
>   - Now, this patch removes the script because having a newer `pahole`
> also correctly skips the Rust CUs in the `BTF [M]` steps (i.e. and not
> just the `vmlinux` one), since we pass `--lang_exclude=` to both cases
> (`link-vmlinux.sh` and `Makefile.modfinal`), if I understand correctly
> (the script could, in principle, have been removed even before
> `pahole` got the new feature, given the exclusivity of the options).

The history looks correct to me.

Also, note that, if pahole doesn't support the new `--lang-exclude=`, we
have `RUST` depending on `!DEBUG_INFO_BTF`, so we fallback the old
"exclusivity" mode between BTF and Rust and, again, the script is not
needed.

As you correctly say, in principle, we could have removed the script
even before the new `pahole`.

> 
> If this is all correct, then the patch looks good to me. I am Cc'ing
> Arnaldo, Martin and the BPF list.
> 
> If this goes through the Rust tree, I will also pick the older `Reviewed-by`s.
> 
> Thanks!
> 
> Cheers,
> Miguel

Thanks,
-Andrea
