Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05CB707153
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 20:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjEQSxX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 14:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjEQSxX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 14:53:23 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7C31BF4
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 11:53:19 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-62382464ca3so5164156d6.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684349599; x=1686941599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3FZjcTm9YJ0Rt6U1ujsbIqFLGl6rYRbCEHWOioCi+k=;
        b=MfHGIul8u+lAyDlJfFLq4N3FC9DiXsNYE0SCz7KaINYaDsb/LOo0g0sWHwqhdbmtzz
         4SzcdkP1Dkp+SvVNYPldij7X3WuQBtM7Y1mRApzZpnBH1Vft4oxUGQBBM1UY+qu3aMHu
         lRmbFbvvvZGgR+nlcXO3nDy6Dvrx6m0HGY/463SXAJSS+rfwZyA6+y5CTrUzdsAsUW36
         6N+Xneo4EF69tpSH1NCGKqvlq2aDCTHDyjWWPRctJlqChQCdVwFKwQCw3rOimgLz9Wuf
         EaftVPDc450O7DPFYLokzKF5ut4MJ6Jiz8bY1vhC/iLUktjscwVEr4uinDmy2cBD6lgn
         JhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684349599; x=1686941599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3FZjcTm9YJ0Rt6U1ujsbIqFLGl6rYRbCEHWOioCi+k=;
        b=iSIHaFeJ/F5yew0QoXXz5e9lYF6MHMth5KR6q2E/xq5fIwRr1GRsVS6Ygs2GbeHKf4
         pX8zI1mU4uc4FAhdkjiOtEU+KyHBU9GArJ4SlJ6SYOzT85D4YuA0WMn4n+9WSKdfiOk4
         GLLLiPLozTK/Hxbl6kOl8mSLftPqICTut0m7H0r93SZCVTttRT0BIAgYNW3QdnG0y7ds
         DaEEE/t41WvEPT6JG5Kf+xYDQqaf+ZIUFFHbENa/fd+T9WHZmSNoQ++EVEzvBjvAZne3
         6tT7jv0poIpskGQ31DkacvgYla9ULZ4bTL/xD6M5ylK0wOSIzjMvALbW5TR/HTnUOw22
         UeXw==
X-Gm-Message-State: AC+VfDxX1ZoMJ/QTZYynfxepukcEyAQ9JEzByNvByn2WaHiXvnf2JgJj
        3lJeRj3ifJBUwd5CvmFeRgEr5dypP7Z3qChGaWGQGw==
X-Google-Smtp-Source: ACHHUZ7LI1lgimLQUUHUI/jRBD5iBgsLoicYiJmUcsCQ228Z2dG1WqbNYlpU6s7SRA+C1yOq4Ai/Oe4b5Vx+9BAz+9o=
X-Received: by 2002:ad4:5be4:0:b0:623:5dc2:883b with SMTP id
 k4-20020ad45be4000000b006235dc2883bmr1075753qvc.24.1684349598850; Wed, 17 May
 2023 11:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-3-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 11:53:07 -0700
Message-ID: <CAKwvOd=2SJHNEQR1QHhLkA8V97o0BV90E346RT6-43SGnza9EQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/21] modpost: remove fromsym info in __ex_table
 section mismatch warning
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
        Nicolas Schier <nicolas@fjasle.eu>
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

On Sun, May 14, 2023 at 8:27=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> report_extable_warnings() prints "from" in a pretty form, but we know
> it is always located in the __ex_table section, i.e. a collection of
> struct exception_table_entry.

Would it still be helpful to have "from __ex_table" somewhere in the
error string that may be shown to developers?

>
> It is very likely to fail to get the symbol name and ends up with
> meaningless message:
>
>   ... in reference from the (unknown reference) (unknown) to ...
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index ba4577aa4f1d..bbe066f7adbc 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1297,23 +1297,16 @@ static void report_extable_warnings(const char* m=
odname, struct elf_info* elf,
>                                     Elf_Rela* r, Elf_Sym* sym,
>                                     const char* fromsec, const char* tose=
c)
>  {
> -       Elf_Sym* fromsym =3D find_elf_symbol2(elf, r->r_offset, fromsec);
> -       const char* fromsym_name =3D sym_name(elf, fromsym);
>         Elf_Sym* tosym =3D find_elf_symbol(elf, r->r_addend, sym);
>         const char* tosym_name =3D sym_name(elf, tosym);
> -       const char* from_pretty_name;
> -       const char* from_pretty_name_p;
>         const char* to_pretty_name;
>         const char* to_pretty_name_p;
>
> -       get_pretty_name(is_function(fromsym),
> -                       &from_pretty_name, &from_pretty_name_p);
>         get_pretty_name(is_function(tosym),
>                         &to_pretty_name, &to_pretty_name_p);
>
> -       warn("%s(%s+0x%lx): Section mismatch in reference from the %s %s%=
s to the %s %s:%s%s\n",
> -            modname, fromsec, (long)r->r_offset, from_pretty_name,
> -            fromsym_name, from_pretty_name_p,
> +       warn("%s(%s+0x%lx): Section mismatch in reference to the %s %s:%s=
%s\n",
> +            modname, fromsec, (long)r->r_offset,
>              to_pretty_name, tosec, tosym_name, to_pretty_name_p);
>
>         if (!match(tosec, mismatch->bad_tosec) &&
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
