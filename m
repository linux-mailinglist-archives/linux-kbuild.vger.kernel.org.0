Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60B07CD34F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Oct 2023 07:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjJRFBY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Oct 2023 01:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjJRFBX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2023 01:01:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C0FB0;
        Tue, 17 Oct 2023 22:01:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD36C433C9;
        Wed, 18 Oct 2023 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697605280;
        bh=Ckyy2X8tBufClleOPA0RjLMRbz7/6JEOlB60UkusMtY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g/4pWe2nCuSagq3vXanNy/QZAviLnpWaj01hJmNoNlji0LWf96xAd0ijVUsBVgm7G
         yTy/wdw81JDFErcKM+jKdZT1YMzL3FME33hgxLDzlpVDhK1BXcOKqYeTj58nLXQ1AE
         XNx9VE7gRsArPBWRHb86u/h8VDXXXfDWtiDQKlBBPO538DzHdDqEWuBUCIS7cmPb0T
         WQodJtEFeQFYMYJpMJP9M2/cOjmcPHUKPEcFwrzHWapGSEKxaX76XX2hlVGAKQvGoP
         gKm9ZKxHHpHETDYGWWKogoDUopeJNFvX907SqpIGimdfFSFNql7Lt1BzmTQQJmMxKB
         JFbijesgJtq3A==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1ea82246069so968682fac.3;
        Tue, 17 Oct 2023 22:01:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YzafLWQfQkiGKqmJOo/5k7ARk6QZykTOf3jzdAfwYBkDZQKDuCQ
        DgGzWKgP+JwYXaRDJBCAEcksN//2l468SI3egy8=
X-Google-Smtp-Source: AGHT+IFyVXqhy3zZGFpv0KwU4r/CxpTUcS7f8/y14F1jIHbLXBrfYYsOpPdeuVsZhlhMWIenth9iy5zkdYwEmovBbTU=
X-Received: by 2002:a05:6870:15d5:b0:1e9:87ce:133e with SMTP id
 k21-20020a05687015d500b001e987ce133emr5184202oad.8.1697605279568; Tue, 17 Oct
 2023 22:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231017103742.130927-1-masahiroy@kernel.org> <20231017103742.130927-2-masahiroy@kernel.org>
 <CAEf4Bzaxb1npVtH_CnFNrOJQxQF5t82_nZxqbaFLiE-rpk_jBg@mail.gmail.com>
In-Reply-To: <CAEf4Bzaxb1npVtH_CnFNrOJQxQF5t82_nZxqbaFLiE-rpk_jBg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Oct 2023 14:00:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRtCQOoWT0q5EjJhoMrfAVbCg_fREeA+NpUHBRbB5oww@mail.gmail.com>
Message-ID: <CAK7LNARRtCQOoWT0q5EjJhoMrfAVbCg_fREeA+NpUHBRbB5oww@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: avoid too many execution of scripts/pahole-flags.sh
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Benno Lossin <benno.lossin@proton.me>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Gary Guo <gary@garyguo.net>, Hao Luo <haoluo@google.com>,
        Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Song Liu <song@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
        rust-for-linux@vger.kernel.org
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

On Wed, Oct 18, 2023 at 4:57=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Oct 17, 2023 at 3:38=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > scripts/pahole-flags.sh is executed so many times.
> >
> > You can check how many times it is invoked during the build, as follows=
:
> >
> >   $ cat <<EOF >> scripts/pahole-flags.sh
> >   > echo "scripts/pahole-flags.sh was executed" >&2
> >   > EOF
> >
> >   $ make -s
> >   scripts/pahole-flags.sh was executed
> >   scripts/pahole-flags.sh was executed
> >   scripts/pahole-flags.sh was executed
> >   scripts/pahole-flags.sh was executed
> >   scripts/pahole-flags.sh was executed
> >     [ lots of repeated lines suppressed... ]
> >
> > This scripts is exectuted more than 20 times during the kernel build
> > because PAHOLE_FLAGS is a recursively expanded variable and exported
> > to sub-processes.
> >
> > With the GNU Make >=3D 4.4, it is executed more than 60 times because
> > exported variables are also passed to other $(shell ) invocations.
> > Without careful coding, it is known to cause an exponential fork
> > explosion. [1]
> >
> > The use of $(shell ) in an exported recursive variable is likely wrong
> > because $(shell ) is always evaluated due to the 'export' keyword, and
> > the evaluation can occur multiple times by the nature of recursive
> > variables.
> >
> > Convert the shell script to a Makefile, which is included only when
> > CONFIG_DEBUG_INFO_BTF=3Dy.
> >
> > [1]: https://savannah.gnu.org/bugs/index.php?64746
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile                |  4 +---
> >  scripts/Makefile.btf    | 19 +++++++++++++++++++
> >  scripts/pahole-flags.sh | 30 ------------------------------
> >  3 files changed, 20 insertions(+), 33 deletions(-)
> >  create mode 100644 scripts/Makefile.btf
> >  delete mode 100755 scripts/pahole-flags.sh
> >
> > diff --git a/Makefile b/Makefile
> > index fed9a6cc3665..eaddec67e5e1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -513,8 +513,6 @@ LZ4         =3D lz4c
> >  XZ             =3D xz
> >  ZSTD           =3D zstd
> >
> > -PAHOLE_FLAGS   =3D $(shell PAHOLE=3D$(PAHOLE) $(srctree)/scripts/pahol=
e-flags.sh)
>
> What if we just used :=3D here? Wouldn't it avoid unnecessary multiple ex=
ecutions?


Yeah, :=3D is less silly than =3D.


But, I do not like to run the script for non-build targets
such as 'make clean', 'make help', etc.

Also, when building with CONFIG_DEBUG_INFO_BTF=3Dn,
the shell is forked to compute PAHOLE_FLAGS,
which we know are unnecessary.





--
Best Regards

Masahiro Yamada
