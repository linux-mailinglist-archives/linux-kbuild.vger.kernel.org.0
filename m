Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C7F7E6AC4
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Nov 2023 13:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjKIMpf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Nov 2023 07:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjKIMpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2023 07:45:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF29E8
        for <linux-kbuild@vger.kernel.org>; Thu,  9 Nov 2023 04:45:32 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15DFC433CA;
        Thu,  9 Nov 2023 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699533931;
        bh=mSGpk9MJPLfIpRmZFxJdVy+rBhIh+RbFW65Cr3iJGu0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mqZIiZ0nmvTR5j28zWmzjy4XMwXTYlwElo0b/S4pMmUNQXoFnVv9XInoRrgjfVMuF
         xXu60LEZYQ2cbtNnxoh8Hkzbpx2Ho5bIfmZuAmjWwY5n7q3nXhnkqzl6PyIz6A8KqJ
         S06oknLIjFFzj7xFEG2hXUth4ow9qcer0+UH+DPDXskMExmROLuKN4Ys7GPSkKcyjN
         CD6ZJWY58HNJOeBq9o+Q0qkPEeFP4cTWary9RS2Xm4drM3Xwrb0ujAE3lstXkBoA1B
         m6mm0XBdUAZeENhUBeMr+dlhnbouYT7ob/33nsnyGa8J/u+sI+/X29cBDe5lGLoB66
         cAGGbJrEep2kw==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e9a757e04eso990552fac.0;
        Thu, 09 Nov 2023 04:45:31 -0800 (PST)
X-Gm-Message-State: AOJu0YzcGIaaDL/mIiG9PoASIe+lko0rtMcfd/eGDG7SzAbupCudaXvv
        1Ft12ZGXyOrlwu6mqQ48oAew0UdzeuFpQoRh0e8=
X-Google-Smtp-Source: AGHT+IFjKG6dNzY33CdOXNjl86WKEWnDkv2RB2Rx8LfbqJZIj403LcldYwOYvaCNYMcGuJfDTZ9dhH9LdBxmUkrCGKM=
X-Received: by 2002:a05:6871:7287:b0:1e9:d5ac:dc9b with SMTP id
 mm7-20020a056871728700b001e9d5acdc9bmr3318986oac.25.1699533931179; Thu, 09
 Nov 2023 04:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20231108022651.645950-2-mmaurer@google.com>
In-Reply-To: <20231108022651.645950-2-mmaurer@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 9 Nov 2023 14:44:53 +0200
X-Gmail-Original-Message-ID: <CAK7LNATJK9nujKKb7rP87hMs65fN8p8v2fMhkNLPb+qU6MijEw@mail.gmail.com>
Message-ID: <CAK7LNATJK9nujKKb7rP87hMs65fN8p8v2fMhkNLPb+qU6MijEw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support MODVERSIONS by disabling Rust modules
To:     Matthew Maurer <mmaurer@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 8, 2023 at 4:27=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> The goal of this patch series is to allow MODVERSIONS to be turned on
> alongside RUST. Gary Guo previously proposed to adjust the API to
> support Rust symbols' greater length:
> https://lore.kernel.org/lkml/CANiq72n4MbR+AE7eHfVQZOu26FeSttQnEEMT3Jpft+C=
cGwk9jw@mail.gmail.com/T/
>
> This did not land, so I'm proposing an alternate solution - users who
> want to use Rust, but who do not need Rust modules, can disable Rust
> module support in order to retain modversions support. This has the
> added bonus of removing exported symbols from the kernel surface if we
> know they won't be used due to lack of Rust module support in the
> environment.


No. This is not a solution.

It does not change the fact that Rust modules and modversions
cannot coexist, and it is even worse than the previous one.




--=20
Best Regards
Masahiro Yamada
