Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411AA73C114
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 22:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjFWUr2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 16:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjFWUrB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 16:47:01 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06903C27
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 13:45:41 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6348a8045a2so1203356d6.1
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687553139; x=1690145139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTsftC77Go6RQg1iZ1BO0M9bJV3/NgpX63n6lQyqbZU=;
        b=ktvoFVoFscws/MP1ehSSz3I8O76i0jcqzMbhOtkyNOR5UqeH7/9HHfjPW1r9TJN0uY
         6FLenMeKlr+Y+jVldxdciWnY7oB4V53ZGiw2tcya9wdj3EZb1AiNqwbFfyhIJGCG4gNN
         7C2QvTWbcLAEfJEg0fX5PqH+8rJ89XGMwnlecpHCJtooTyB6XXEBuYRLyOzlfGLNFb5g
         l8uO7k9t6GHGDuDR0dSWS34dkKl36Uid3uONofQxPU/Q0yppAr1f7VvzW7tZqW28xQgy
         QLervxcEuhqRGzm7DXiwxLGJid9+yLJn1Z5ay4TLjYQu6rKMLVh70k/t+bqEte6vBB9g
         n9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687553139; x=1690145139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTsftC77Go6RQg1iZ1BO0M9bJV3/NgpX63n6lQyqbZU=;
        b=gEGnjZTwNDxF7fbh9E0F7KuIiBqP/QYsSdDiotZB/DjWmH/jYGVqBnWGXtqUjYTVQa
         EFeX2IACas0n8FPumlTMpwXv3mX5X7dU6KkEZSyAQtzWS5WH4LALSbXLkyayPF4Xo/0C
         SNuWDyiwY+Z52WQQU6ooxWnboqLQ7YJ56bc99zroYMObHCzussErTA3P5iVDtAqZAS8E
         7tjB6Wa4S4vBDEhG9Nq0HO2wizp52QiRvqx5aDw2jLHL2/QqSTcYQtht37PHqpOt+WoY
         +dVetkN/vSJT3Ld2F3gyHbT+uADBzKp4tviXvLIuNK7MSJBUsjDXS0wqdmvKMTfManxr
         IvNQ==
X-Gm-Message-State: AC+VfDywNCFl+ayp+Dca8wtb8cxeKJbJY+pLDBSwTjVxDh11z71SQMJa
        NNYuNJg6TA8Ub4cR6Qv1fMC9pbYn/zKPUY45OW0ERg==
X-Google-Smtp-Source: ACHHUZ4f213hwMIkeFPbYh7UpokR1m+/xYbwvQWaaucr4dEyU/Olz3MiByO1eG6eLn3RLXXqOXzgdyPRe8T5UGzClgg=
X-Received: by 2002:a05:6214:40d:b0:626:2e65:cb2b with SMTP id
 z13-20020a056214040d00b006262e65cb2bmr13501263qvx.4.1687553138764; Fri, 23
 Jun 2023 13:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230623140825.ehqk5ndl7uftstwy@google.com>
In-Reply-To: <20230623140825.ehqk5ndl7uftstwy@google.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Fri, 23 Jun 2023 13:45:02 -0700
Message-ID: <CABCJKuceiLRs=LEKYM41q-V4SMwrhZw=wf0GS-x21TPaEUMaiw@mail.gmail.com>
Subject: Re: [PATCH] scripts/mksysmap: Ignore prefixed KCFI symbols
To:     =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Pierre-Cl=C3=A9ment,

On Fri, Jun 23, 2023 at 7:08=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@goo=
gle.com> wrote:
>
> The (relatively) new KCFI feature in LLVM/Clang encodes type information
> for C functions by generating symbols named __kcfi_typeid_<fname>, which
> can then be referenced from assembly. However, some custom build rules
> (e.g. EFI, nVHE, or early PIE on arm64) use objcopy to add a prefix to
> all the symbols in their object files, making mksysmap's ignore filter
> miss those KCFI symbols.
>
> Therefore, explicitly list those twice-prefixed KCFI symbols as ignored.
>
> Alternatively, this could also be achieved in a less verbose way by
> ignoring any symbol containing the string "__kcfi_typeid_". However,
> listing the combined prefixes explicitly saves us from running the small
> risk of ignoring symbols that should be kept.
>
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> ---
>  scripts/mksysmap | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 26f39772f7a5..17cf4292e26b 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -61,7 +61,10 @@ ${NM} -n ${1} | sed >${2} -e "
>  / __microLA25Thunk_/d
>
>  # CFI type identifiers
> +/ __efistub___kcfi_typeid_/d

Does the existing __efistub_/d rule not catch this?

>  / __kcfi_typeid_/d
> +/ __kvm_nvhe___kcfi_typeid_/d
> +/ __pi___kcfi_typeid_/d

Either way, otherwise this looks reasonable to me. Thanks for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
