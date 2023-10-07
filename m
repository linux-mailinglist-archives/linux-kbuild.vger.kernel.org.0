Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C807BC8AC
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Oct 2023 17:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbjJGPiY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Oct 2023 11:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbjJGPiX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Oct 2023 11:38:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2100B9;
        Sat,  7 Oct 2023 08:38:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AD3C433CD;
        Sat,  7 Oct 2023 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696693102;
        bh=9RxkWlQoVdIXC1kqthSAlbAWe5HDp6fdl+KbwgqaPQA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JmTczBYxUclmMypR5UJkRc2/LgJ6+KWaUof6cuKd+k6x7+b2EUZ8gPxeh75v3U41L
         qkqPe+YsDwPJXOldm/WFJg4UTwwlJdmAYFKGYAM9UOOXkSFIkQKgE/6Fi2WyeGD4Wc
         yr2Y2Ga+8qbdrmGKZQNNKbS2yONQt1nt8RNHnur9YhniSJCYcvVbJuUw0HikESU8ZJ
         +iPD3inze4KRTPDlpVgxhkc+xsaen8rSVSwVUjFkYvW0rLXnW/hVMxPfP+HkU405Rn
         kX8VpcrgVPLXgsMJ2ZsgAWJG0/N1C8ohcl6b2HRewTrgRB9Bj2E795vzvp3Q34S1tK
         CjUAU9sugmu4Q==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so2014675fac.3;
        Sat, 07 Oct 2023 08:38:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YwgB1foSHvgr7ELzbHzA8jJUyvfv7mwEh+RJSSFothqB6kLx5tm
        iBK0IA8uL9T/q9ZPClLSTc8HJ0MjiHJpAt5xDME=
X-Google-Smtp-Source: AGHT+IFjx6hBQQR76o5ah5rxZqz3wBxxDJuAHX1t4tCqPwUAXWHZTp/T+cfuRstjJssObOSnrdbHZUeMNYmK0l07/Ow=
X-Received: by 2002:a05:6870:4710:b0:1d5:cba4:a6f6 with SMTP id
 b16-20020a056870471000b001d5cba4a6f6mr13705200oaq.6.1696693101851; Sat, 07
 Oct 2023 08:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 8 Oct 2023 00:37:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBBk-a0EJcxpWGJ9n+9BHQUw3a4s41LTtC-R8fYrVMpw@mail.gmail.com>
Message-ID: <CAK7LNATBBk-a0EJcxpWGJ9n+9BHQUw3a4s41LTtC-R8fYrVMpw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
To:     Matthew Maurer <mmaurer@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 6, 2023 at 6:41=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
>
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>
> Edited to use escsq in both Makefiles, as per Masahiro Yamada's
> suggestion.



Acked-by: Masahiro Yamada <masahiroy@kernel.org>

if Miguel picked this up.


Please let me know if I should pick this up.





--=20
Best Regards
Masahiro Yamada
