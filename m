Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976AF7A3259
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Sep 2023 21:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjIPTzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Sep 2023 15:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239445AbjIPTyp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Sep 2023 15:54:45 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4223FCF2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Sep 2023 12:54:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso29465e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Sep 2023 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694894077; x=1695498877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwF0z0sGJK73NGlJoe3kcNluf3kBAAGGr/xGcr61rDM=;
        b=TW/pV6JSebWuk0msCi2aQYsepwj06mMKV7RC+P6R0qkPs2Jvy/bernRcTB+ywp2eQa
         8wykJwnkG6X+Y35+5/yR+dvKGOJLtl3WsdydgVveR6kFR/n5XOF6E1TmWVTRkg4UhiQR
         1UfkxaF39FYb3QhOTu3gSwqbB+UL8mgQzxkuK4KeFKqs7xOA1Q9S81Y1+b4MB9A5ZejJ
         5mA2hH2be45lKDqKbVTqjAW9JHvRwT9pnj1knJtNBs+ct3UmAhLdjXjdP37uQVkqWnsV
         wddym3KTKcsL/aVqs/igPwUeLhIobm0ic67OAK9WawK3uMxh9jK94E3WAnAYxJboFa/q
         I5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694894077; x=1695498877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwF0z0sGJK73NGlJoe3kcNluf3kBAAGGr/xGcr61rDM=;
        b=j2ilpOasfPGSZGxzeWs1/lQ71+EERt27jfYunMjGpaj8jibEAgVhtLG/sHre5Bx6Oc
         TNqEjL3Afcey9qA3CF/h004GbFwtSqa4DovrOt1F8FzxqPI6xbTd0HY7DhyODaQ2OoUo
         iv1tDzBfUAutgGCpCroTsAC/qfCQkL/0kghSG3V47VXb8yBjOWHa5FyH+nukGCXlUCTZ
         uLLHLdVuu590g5fl9rxlPCfX1DBBjiagz3HhRrm+T1Hz9tTjPpHTnHmtrtpzmu0v7kAa
         luo5E5ngELoWw6x0gIQqYaTVNxioCUzTFIsUhrSp9fFk6cepTnbWtHONUgsVEwpwUmTr
         aD4w==
X-Gm-Message-State: AOJu0YxdK6N7h15dMtyqdKEqTycX4Ccek5jhn/Ha2Go/Dbrr5BrUCG+Z
        itVhHmZPnvHIxXT++HYeilSE6v6Qfj0md+kj+zKiag==
X-Google-Smtp-Source: AGHT+IE57iUYyLI8EsAEvL5c06XkIT9no1byOp/4uunfZ1BNV7y45bpVQNNuvDkjY09IoK9+ZrJWRXPMllv5rGosaMY=
X-Received: by 2002:a05:600c:1c29:b0:404:74f8:f47c with SMTP id
 j41-20020a05600c1c2900b0040474f8f47cmr64907wms.5.1694894076554; Sat, 16 Sep
 2023 12:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230915172900.3784163-1-mmaurer@google.com> <9966E047-44E7-4665-9628-169F3EBE2F06@kloenk.dev>
 <SLZSYLg5E9OQKI546K87wxTYYLNlT1xM-LhC4W1JFhIate6PFsKq27RcBNhSjUkErYDlzsZB4F2Vc2KOP9tDThg58_tXycWn3K29mQXlFtU=@protonmail.com>
 <0561303E-2089-43FC-AA31-836C7BB844B7@kloenk.dev>
In-Reply-To: <0561303E-2089-43FC-AA31-836C7BB844B7@kloenk.dev>
From:   Matthew Maurer <mmaurer@google.com>
Date:   Sat, 16 Sep 2023 12:54:20 -0700
Message-ID: <CAGSQo02p0LWZgV8oVidwvN6X__rv3-rj+ZVg9SaZ5Kx+zYahYQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Respect HOSTCC when linking for host
To:     Finn Behrens <me@kloenk.dev>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 16, 2023 at 11:07=E2=80=AFAM Finn Behrens <me@kloenk.dev> wrote=
:
>
>
>
> On 16 Sep 2023, at 19:53, Bj=C3=B6rn Roy Baron wrote:
>
> > On Saturday, September 16th, 2023 at 18:52, Finn Behrens <me@kloenk.dev=
> wrote:
> >
> >>
> >> On 15 Sep 2023, at 19:28, Matthew Maurer wrote:
> >>
> >>> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defin=
ed,
> >>> resulting in build failures in hermetic environments where `cc` does =
not
> >>> exist. This includes both hostprogs and proc-macros.
> >>>
> >>> Since we are setting the linker to `HOSTCC`, we set the linker flavor=
 to
> >>> `gcc` explicitly.
> >> But as `HOSTCC` could also be clang, the linker flavor would then be w=
rong, would that create a problem?
> >
> > Rustc uses the gcc linker flavor for clang too. There has been a propos=
al to split it up, but I'm not sure of the status of that. In any case clan=
g's cli is similar enough to gcc that it works fine to use the gcc linker f=
lavor.
> >
> In that case this looks very reasonable.
>
> Second thing I noticed is that `HOSTCC` could be the wrong variable, and =
`HOSTLD` would make more sense as we look for the linker and not the genera=
l C compiler.
>
Yes, thanks Bjorn - "gcc" is the linker flavor used for "Use the C
compiler as a linker".

With regards to HOSTLD, I was trying to make the minimum possible
change. Currently, it is using the command `cc` as a linker, so this
would preserve existing behavior when HOSTCC is unset.

If we would prefer `HOSTLD` instead we can do that, but we would need
to additionally inspect `LLVM` to set the linker flavor accordingly
(e.g. set ld vs ld.lld).

Do folks have strong opinions between these? My primary concern is to
avoid calling programs by foo when their HOSTFOO variable is set.

See https://doc.rust-lang.org/rustc/codegen-options/index.html#linker-flavo=
r
for details on linker flavor settings.
> >>>
> >>> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> >>> ---
> >>>  rust/Makefile         | 1 +
> >>>  scripts/Makefile.host | 1 +
> >>>  2 files changed, 2 insertions(+)
> >>>
> >>> diff --git a/rust/Makefile b/rust/Makefile
> >>> index 87958e864be0..2a2352638f11 100644
> >>> --- a/rust/Makefile
> >>> +++ b/rust/Makefile
> >>> @@ -383,6 +383,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.=
o FORCE
> >>>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
> >>>        cmd_rustc_procmacro =3D \
> >>>     $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> >>> +           -C linker-flavor=3Dgcc -C linker=3D$(HOSTCC) \
> >>>             --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --exter=
n proc_macro \
> >>>             --crate-type proc-macro \
> >>>             --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> >>> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> >>> index 8f7f842b54f9..0aa95a3af1c4 100644
> >>> --- a/scripts/Makefile.host
> >>> +++ b/scripts/Makefile.host
> >>> @@ -91,6 +91,7 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
> >>>  # current working directory, which may be not accessible in the out-=
of-tree
> >>>  # modules case.
> >>>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile=
) \
> >>> +            -C linker-flavor=3Dgcc -C linker=3D$(HOSTCC) \
> >>>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> >>>                   $(HOSTRUSTFLAGS_$(target-stem))
> >>>
> >>> --
> >>> 2.42.0.459.ge4e396fd5e-goog
