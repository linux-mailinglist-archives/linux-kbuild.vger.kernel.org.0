Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EFD759D0F
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jul 2023 20:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjGSSGW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Jul 2023 14:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGSSGV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jul 2023 14:06:21 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47131FC1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 11:06:20 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-635e6f8bf77so42916486d6.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689789980; x=1692381980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q8C9QUl9c024VdDM4U2qSt+ZkIzjIMLrLNe0pZ5n4E=;
        b=MsuBgeLACJ6N4ubJggHSBIiXd8DlImplahregFFg+jh127qgD0yy8SfKvOk1bUxxEj
         zcSL9hXvJi96OHneAydcCrrnR/KCI79XRl276s0e5ibNfu22dT4ZNEiNetgFXmVlQrsi
         rBhkDfObbVnCCIQfLZMiT/79TIzd+zcui4F1r0wmDsLdAVtUP3e4rSbbg1e9hWkK36oR
         YFuStHwRtybupndHDXS6I38G8Zj00A0+0Wpc/P2ery4DhX7ucNyoQ+IfMLyC2PkLsZf6
         dH/Rbqsn6nJGlyvl7LoQOHVN9rkOHeXMu6tDBElGRIu8AXDSH0a5R7pnrsLTQJwLPFDl
         rWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789980; x=1692381980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q8C9QUl9c024VdDM4U2qSt+ZkIzjIMLrLNe0pZ5n4E=;
        b=PjqhUksKepLU6Ro8CJoAp4ZummwEHtoTU94dzYK51dRv/FGILRsRdWJ+N9SM5tocX8
         GwMmlJB0Eba2QaLhw6w/8iGrhBzbliDJJFSAWnL02BNXQ+Zt4wnt5/uekM1o/9op4v6m
         Ib1Sfz7zfgXujnownjVs3+YoiH3zaG4ny9KtDETLxEinnwYenypbGnocrL/8i5r9uwK7
         EGR/yx3p2+ftezumPWT6UxHbVnZyxyYpAmQhwO01mHyGiV2QeChhTGc0lEBKRpxByrxm
         NM9oyT2CH76EzDcBMhpdCjQQmoUNgb4xYTd3/Zs8gs7in9WzggcG6mom9kupYwTclZgd
         hroQ==
X-Gm-Message-State: ABy/qLb0QEt2YbgHDZpEwno2M9p2Cdl8c9z3TWR45srTwFjlpni9XP3w
        YB7MQHXZmyyfb1XBnsWhyC5zGgEaYIVP+8TpmC78nA==
X-Google-Smtp-Source: APBJJlE7nViBT6f/zxrl/dr31wzjer7QTF6XLcz5nEXCf2nO6NMvpOyXtT1bDTC/ewipu9B3dteZLC0N2tvvBlNaK/Q=
X-Received: by 2002:a0c:e3d4:0:b0:631:fa2e:249f with SMTP id
 e20-20020a0ce3d4000000b00631fa2e249fmr16560164qvl.61.1689789979787; Wed, 19
 Jul 2023 11:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230719031912.224843-1-bgray@linux.ibm.com>
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 19 Jul 2023 11:06:09 -0700
Message-ID: <CAKwvOd=fjtmoonc8CoJwuvogYCCPHu9s_sMRB5P+B4whaCovEg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation database
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 18, 2023 at 8:19=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com>=
 wrote:
>
> Like C source files, tooling can find it useful to have the assembly
> source file compilation recorded.
>
> The .S extension appears to used across all architectures.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> ---
>
> For example, I'm prototyping adding ASM support to clangd. It can use
> this information to determine the architecture, macros definitions,
> include paths, etc. on a per-file basis. I can capture this during
> compilation with tools like bear, but given this script exists and the
> change is trivial it seems like a good idea to adjust this script too.

Sounds cool, thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Feel free to subscribe us to the clangd patches; we might have
bandwidth to help review, or can at least follow along on progress.

> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 15ba56527acd..a84cc5737c2c 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -19,7 +19,7 @@ _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
>  _FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.c) *(;|$)'
> +_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.[cS]) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> --
> 2.41.0
>
>


--=20
Thanks,
~Nick Desaulniers
