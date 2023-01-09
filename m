Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF3A6631FD
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 21:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbjAIU4t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 15:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237644AbjAIUz7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 15:55:59 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0209487F04
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 12:54:36 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id b12so6753795pgj.6
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 12:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCpbMmW0eLev9FdtuyFUocFIcOdmXfyBWebTqFK5CIA=;
        b=h4agD+4jNY3gjy2SULguao1y1SDRTBALR9O8Bjx0eLoYRsDA2ETD9q9AMY5zysnq+q
         6GujFw61YQklfxifLoM25/Qx27WxO+muJS7gQ2/y584ocSmZlbkb+YerHNikmmopMt8Q
         8rlV/PMlrHVvPBQwSUX45mQgkl/lnEsPItg7VmFwxpKVkQ0wxzMolPIiKpSrMm9vWf91
         BdnidegVeoi+AAnpJEtgYYuR8Hj6cvvQ4gLOYJJiMwV7jAU647pgrMmjixSWC4tlr/XH
         6G2iG/BNRvOLrlnG/a3jkymflXl2P3YV8Dio+cecoWhApoEiT0ZHCb/LmhkfF6l0Q1eF
         Zn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCpbMmW0eLev9FdtuyFUocFIcOdmXfyBWebTqFK5CIA=;
        b=7xRI41udZSg9nS6Aw4mCUcsNNZ7xIJ293lz2+A6OUOV6EsA+JEAuDxb03RAQFrMeqP
         iFb/gL/OrvmyqkOkXTvLAtb3jNNnfwlsB07O6EJ1SwveKHXKl3JcpNYMN90+HoIofgRZ
         QjImmz7NMVpibSs2Qbrk+HF4bxDKUW0tD6IxPBIhrKStStrFtBLrorHIvdjUYJzOXWoi
         GKtDkVfQcJ18L4OJS0VoHoqaUmlvamk7TParXvHVnCUPBW1DLa675CTkgVnwMHwNCymY
         lCBK8AxX5pN9UaPLSZL9GRCSKJNiBQoHmhQiUMKv916Mrue8A0rqwSb7SIE+Wn+/0Ja2
         9fsA==
X-Gm-Message-State: AFqh2kq2fa4McTMF8i+V77XoLGxIHi86Km0KvZ0wXwovaBoML5ChPjwe
        1g/Pg/6lj3bYqhV9cl19hj7PmgiogZqCSprgIxBS3xPx8h155A==
X-Google-Smtp-Source: AMrXdXtJwhfbhqPtlK+wteYA6wJbhqZXNYUZFPHzEbZJNaISXYOe+1yfLa+PUkvrtxjs8n0M+KBV1ndODf+qq8fq670=
X-Received: by 2002:aa7:914e:0:b0:578:202d:a33a with SMTP id
 14-20020aa7914e000000b00578202da33amr3345635pfi.23.1673297676007; Mon, 09 Jan
 2023 12:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20230109204520.539080-1-ojeda@kernel.org>
In-Reply-To: <20230109204520.539080-1-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 12:54:24 -0800
Message-ID: <CAKwvOdkr6mAdNOkZqGdkosAN6JABHRU3bHg=K8ujjbw2GxEsKQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] docs: rust: add paragraph about finding a suitable `libclang`
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 9, 2023 at 12:45 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Sometimes users need to tweak the finding process of `libclang`
> for `bindgen` via the `clang-sys`-provided environment variables.
>
> Thus add a paragraph to the setting up guide, including a reference
> to `clang-sys`'s relevant documentation.
>
> Link: https://lore.kernel.org/rust-for-linux/CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This is super helpful for me, since I build clang from source and
would like to use my libclang.so! Thanks for this documentation
Miguel!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Documentation/rust/quick-start.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index 13b7744b1e27..cae21ea7de41 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -100,6 +100,23 @@ Install it via (note that this will download and build the tool from source)::
>
>         cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
>
> +``bindgen`` needs to find a suitable ``libclang`` in order to work. If it is
> +not found (or a different ``libclang`` than the one found should be used),
> +the process can be tweaked using the environment variables understood by
> +``clang-sys`` (the Rust bindings crate that ``bindgen`` uses to access
> +``libclang``):
> +
> +* ``LLVM_CONFIG_PATH`` can be pointed to an ``llvm-config`` executable.
> +
> +* Or ``LIBCLANG_PATH`` can be pointed to a ``libclang`` shared library
> +  or to the directoy containing it.
> +
> +* Or ``CLANG_PATH`` can be pointed to a ``clang`` executable.
> +
> +For details, please see ``clang-sys``'s documentation at:
> +
> +       https://github.com/KyleMayes/clang-sys#environment-variables
> +
>
>  Requirements: Developing
>  ------------------------
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
