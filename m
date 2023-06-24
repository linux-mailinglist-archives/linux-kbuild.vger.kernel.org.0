Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3546573C9CF
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jun 2023 11:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbjFXJDS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Jun 2023 05:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbjFXJDS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2023 05:03:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A3818B
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 02:03:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B7AB60C3B
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 09:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D4FC433C8
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687597395;
        bh=0uIWPHBGx9IWfz8izPWgZv9cKbN+FpwxXMznQZitz2g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NXJH9Kp6NpUIPMQ8r3qSeMo8Irt8Fvg21Zrmek8MzGaNLpoA4voSBgJbm4ROY4ep9
         x9+ZjqBVfC63580SJWlqZwFLlQt7RM5vEI7o7bk2I8vjIDmB2GI22+HSpzI2dK3I54
         4U9nzDVCIhrYGYc9BalvirRuLeaZXwkE1VuUEASkGCx8M8bppitHHqbsLzA6iKzUGc
         ccxgXInJ2wTd/PzKW2IEE1wG0kreuNgvGyuIxmGgK+59plT9gt4ovj0uz7PYiyDivx
         uTmn/DJUfFhEt5GuzrxoRGN99pkSpQeF+el/Xj1b9+5nBlDH6tYAMYbwR6deVpxFV9
         HXMXDyK57o7gA==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39ed35dfa91so1068925b6e.3
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 02:03:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDzI1OY1qlhfjM9MDSP65FM0YilsICf3jNDyy3mmJ3n2J+fqyNFC
        fhRo3zy0toBAKNcRcq2O3DELXE2QSW0eQzdXusw=
X-Google-Smtp-Source: ACHHUZ4f9fNOeF4VT8zdFE3Gviv/kX3DqUaiuEgmJxp3pt2VKaO8YN5kpOMlfXTEi+IBPE0JIvkCoOdqMutGldGoZxo=
X-Received: by 2002:a05:6808:181c:b0:39e:dfd2:e128 with SMTP id
 bh28-20020a056808181c00b0039edfd2e128mr18858992oib.31.1687597395086; Sat, 24
 Jun 2023 02:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230623140825.ehqk5ndl7uftstwy@google.com> <CABCJKuceiLRs=LEKYM41q-V4SMwrhZw=wf0GS-x21TPaEUMaiw@mail.gmail.com>
In-Reply-To: <CABCJKuceiLRs=LEKYM41q-V4SMwrhZw=wf0GS-x21TPaEUMaiw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 24 Jun 2023 18:02:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-QN8gjy1wPkVHjD49sacv2czhbN=qM38KC7+jvPGpTw@mail.gmail.com>
Message-ID: <CAK7LNAR-QN8gjy1wPkVHjD49sacv2czhbN=qM38KC7+jvPGpTw@mail.gmail.com>
Subject: Re: [PATCH] scripts/mksysmap: Ignore prefixed KCFI symbols
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 24, 2023 at 5:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Pierre-Cl=C3=A9ment,
>
> On Fri, Jun 23, 2023 at 7:08=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@g=
oogle.com> wrote:
> >
> > The (relatively) new KCFI feature in LLVM/Clang encodes type informatio=
n
> > for C functions by generating symbols named __kcfi_typeid_<fname>, whic=
h
> > can then be referenced from assembly. However, some custom build rules
> > (e.g. EFI, nVHE, or early PIE on arm64) use objcopy to add a prefix to
> > all the symbols in their object files, making mksysmap's ignore filter
> > miss those KCFI symbols.
> >
> > Therefore, explicitly list those twice-prefixed KCFI symbols as ignored=
.
> >
> > Alternatively, this could also be achieved in a less verbose way by
> > ignoring any symbol containing the string "__kcfi_typeid_". However,
> > listing the combined prefixes explicitly saves us from running the smal=
l
> > risk of ignoring symbols that should be kept.
> >
> > Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> > ---
> >  scripts/mksysmap | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/mksysmap b/scripts/mksysmap
> > index 26f39772f7a5..17cf4292e26b 100755
> > --- a/scripts/mksysmap
> > +++ b/scripts/mksysmap
> > @@ -61,7 +61,10 @@ ${NM} -n ${1} | sed >${2} -e "
> >  / __microLA25Thunk_/d
> >
> >  # CFI type identifiers
> > +/ __efistub___kcfi_typeid_/d
>
> Does the existing __efistub_/d rule not catch this?


Agree with Sami.

This line looks redundant to me.




>
> >  / __kcfi_typeid_/d
> > +/ __kvm_nvhe___kcfi_typeid_/d
> > +/ __pi___kcfi_typeid_/d
>
> Either way, otherwise this looks reasonable to me. Thanks for the patch!
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
>
> Sami



--=20
Best Regards
Masahiro Yamada
