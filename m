Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FECA7A523F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Sep 2023 20:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjIRSnY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Sep 2023 14:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjIRSnW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2023 14:43:22 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE35C10E
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Sep 2023 11:43:16 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-65649c60858so13007826d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Sep 2023 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695062596; x=1695667396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGggz20caFzafUF2A1Vven9jC5oystZUe3kde8zcZIk=;
        b=UJ/SEvC+s0+IOOpfEqqte5BgzI0WhzEiFo0xQfPJmft7acj9spen6qLOjiN1RLfqP/
         NbkifY6t6Kb79lJZSxqYLPb9s5W7/MHrdPm2ygkAB/IvHBe/JjTu/rJHAOAsfBqW4lD8
         dA3xRq1oQP9zMoQXf7PrUj30V6pI6p+Xean6RiFt7gYsa3F0R+ZaBj1t5WwwwdJE20Z5
         2wlhqwYSXQGne81UesPlktyMugoQwBpzwLXHGvIMyV3aEOQs/ZcDSqJViYtP+A5R63JP
         0xVDxWx5KFWxNAp6sf+LYAdNfseFdOEcZrqfkMgMyd+d7q/jPncEpIdF0sQUGGCIScqn
         Ln4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695062596; x=1695667396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGggz20caFzafUF2A1Vven9jC5oystZUe3kde8zcZIk=;
        b=jitdfWwRm2MiFDbxI38QirDJeE1sTkRhDQmYbok+ckClK4yxqrfdwRZ/IFBMaQuFMi
         eG6ZFy6rQ6BO2ynr8E2PTNN4zZa+GtXoA8YcAJTrWHqtsyN5dhIHG//5W6MqQgqtUYWE
         8fER/0EKlpFGzv8nRTtcnaKOkEEylCK5GqEzf1/t1fm3JAOs0CUVma5dAIAE1OQbyPgI
         8Fesr+9qPV5BM8yQzidddfJGx6cO+0QRY7KzpnC9gE2qcr49zvRnHKEnVH8E7CI38nXT
         SM4wzoFgC9XO+ayA4/W4mMN6UXuvTxF22PiBullaZylrP8PnrN9iEHOBaxWDCSRlXYkP
         BWrw==
X-Gm-Message-State: AOJu0YyUx0AXZsU7wUqeR1Tq1ar8ukpP8OSpi3VQ5kLcKAjpw25NCLlb
        2E4NSYg82PbwrIKtz2cQskgN7Qnh5MeAItTGQL+9WQ==
X-Google-Smtp-Source: AGHT+IHV+FMHOEi1fylsCDFa56Jd5WNqYXUftZ6W7AQ+3/RiLXdRp2eDi4GA/Tl08EGbjP+C7u7pahdCxIZtO1dcdog=
X-Received: by 2002:a0c:c985:0:b0:658:2f85:29ce with SMTP id
 b5-20020a0cc985000000b006582f8529cemr2054758qvk.58.1695062595805; Mon, 18 Sep
 2023 11:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230915172900.3784163-1-mmaurer@google.com> <9966E047-44E7-4665-9628-169F3EBE2F06@kloenk.dev>
 <SLZSYLg5E9OQKI546K87wxTYYLNlT1xM-LhC4W1JFhIate6PFsKq27RcBNhSjUkErYDlzsZB4F2Vc2KOP9tDThg58_tXycWn3K29mQXlFtU=@protonmail.com>
 <0561303E-2089-43FC-AA31-836C7BB844B7@kloenk.dev> <CAGSQo02p0LWZgV8oVidwvN6X__rv3-rj+ZVg9SaZ5Kx+zYahYQ@mail.gmail.com>
 <CAKwvOdnUdFjN+aCDrHKP6RzZCFB033ycN_KkB1WKucGd6VzUSg@mail.gmail.com> <CAGSQo00E1Wtg=f9SAcB2na69r4ASJ1L40ASPCyZV9FX+81uJCw@mail.gmail.com>
In-Reply-To: <CAGSQo00E1Wtg=f9SAcB2na69r4ASJ1L40ASPCyZV9FX+81uJCw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 18 Sep 2023 11:43:04 -0700
Message-ID: <CAKwvOdnbbStoEeykYnx0jbnR=TAmmcdnOXbbA4Fx0BneFW8Fsg@mail.gmail.com>
Subject: Re: [PATCH] rust: Respect HOSTCC when linking for host
To:     Matthew Maurer <mmaurer@google.com>
Cc:     Finn Behrens <me@kloenk.dev>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 18, 2023 at 9:38=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Mon, Sep 18, 2023 at 8:25=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > What happens if you invoke the linker directly?
> Rust unfortunately currently doesn't support invoking the linker
> directly: https://github.com/rust-lang/rust/issues/73632

Wait; does Rust have its own linker? It doesn't use the system linker?
 Perhaps that's necessary for the rust module format? If so, TIL.

> > Generally, the kernel either invokes the compiler or the linker
> > directly. (For assembler, it is typically preprocessed, as are linker
> > scripts!)  So invoking the linker directly is a common pattern in
> > kbuild.  It also makes me slightly sad if the rust compiler ends up
> > invoking a c compiler, even if it's simply to drive the linker.
> As mentioned earlier, we could pass $HOSTLD, but if the linker isn't
> named something accurate (e.g. if the linker is not named lld, but is
> lld), we need to know how to pass a flavor:
> https://doc.rust-lang.org/rustc/codegen-options/index.html#linker-flavor
> Would it be appropriate to just assume the linker is named correctly?

If it were not, what does failure look like?

command not found: asdfadfasdf

Seems fine to me. If the user mis-specifies HOSTLD=3D, then they will
get a similar error, which should be prescriptive enough for them to
figure out how exactly they're "holding it wrong."

> > For example, Android carries a downstream patch to set `-fuse-ld=3Dlld`
> > for $KBUILD_HOSTCFLAGS, because its build environment doesn't contain
> > GNU binutils ("guilty, officer").
> Oddly, the Android kernel environment (Kleaf) is the one that I needed
> this patch to build in, but it seemed to be working without a manual
> KBUILD_HOSTCFLAGS forwarding.

Surprising that worked.

> Overall, it sounds like you'd prefer if I set this to use
> `KBUILD_HOSTLD` and `KBUILD_HOSTLDFLAGS`, and leave the linker flavor
> to autodetect?

Yes for the first two.

Dunno, what precisely is a linker flavor?  Is that like a flavor of ice cre=
am?
Oh, right looking at your link:
https://doc.rust-lang.org/rustc/codegen-options/index.html#linker-flavor
Seems like if `LLVM=3D1` is set, or `LD=3Dld.lld`, or CONFIG_LD_IS_LLD, the=
n
the flavor should be set to ld.lld, else ld.  Then the
KBUILD_HOSTLDFLAGS need to be passed, probably.

But how are there "linker flavors" like ld or ld.lld if you just said
"Rust unfortunately currently doesn't support invoking the linker
directly: https://github.com/rust-lang/rust/issues/73632".  I'm having
trouble reconciling the two.

Can we do something more like the below?

ifdef CONFIG_LD_IS_LLD
hostrust_flags +=3D -C linker-flavor=3Dld.lld
else
hostrust_flags +=3D -C linker-flavor=3Dld
endif
hostrust_flags +=3D -C linker=3D$(HOSTLD) <todo: figure out how to pass
KBUILD_HOSTLDFLAGS>
--=20
Thanks,
~Nick Desaulniers
