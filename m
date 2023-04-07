Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7D16DB3D9
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 21:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjDGTBq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 15:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjDGTBZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 15:01:25 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77129E063
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 12:00:01 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q191so7619198pgq.7
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680894000; x=1683486000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFcmXoEArKnIpZFjV1SO4puRP5dyRPfqwvPXhN+fW1M=;
        b=ZZVybAP1h6vwnqVEZrbCy23NZz0e3ioWNp+qXWTPru78WengYLey3CzRqZIG6u3Ef2
         +qyEjYU6yf939X74iLMTzErHSj7t5+K9aMl5Sb7T7NZ8Ovaa/9MgaER6vxQfaw1LWQnI
         E1jKabrApvsI1DauWXHm+C2iPX1IhGS2q8BGJQsZdXn2a0/nfyhNr2vFuLMrJJIMO2Kj
         C29tiJsULJdYG8VWPKntHy3wG8ENZW6zGI/oR/Dw/r/YzoyAaTf8DYzxanRXuHSwKY0v
         8PMnzcgPgi0QUiTzKfNT9rQueLPsbhSk9+qLUc+krmrTDs7VuXNIyVhjbvxqTx3SPkaW
         pkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680894000; x=1683486000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFcmXoEArKnIpZFjV1SO4puRP5dyRPfqwvPXhN+fW1M=;
        b=V3ut64RjNpqIOE2JTpoc8FIrNW6EKf4CCQnCDfMOUN4XtzrM3L/Jx1MOd2M2AkCu//
         y1wBje9OYB9tKoPLJ21LPpqpdlgN894s1tL8bJt0e3hclwrmS8v6jHfpYNNZZptVQvh0
         AL/+O3NtLEE0qpV3oIj9snmhVb46Z+pGiBP4CHwxLl2OOlPEXtzW3p+5Q7ge4baqK3Wp
         ubJ2lZFWNJq2Bb1vSMTnZEB02UJrE/qEgKuhEJIxCRABpia2XvwnqI4XTSrUd8e3kJDZ
         Z+6frsMcwmqHveyvOV9SRJl2Q4ZET98oP/85HWADhli/PkfBKi8jT/0D4Vd+yn8gkLLT
         mv1w==
X-Gm-Message-State: AAQBX9dCPdtLNOxU/t/g4Trh+Qstj32UEE1kqqB8nEx1DPJl9MLBIlPI
        LC1HITsGL82m/hrduMrKcTDtDRDvBtF7QmWidJVD29iBT1wKNaOF/Bo=
X-Google-Smtp-Source: AKy350bdNuzsEESRQVtSjaFJZH3mRqgHoWZsPT0wys9F5lnzPtphBGfJ/BSQRatmqVcz5KRTtIvT/d7BHIuZPxygnuo=
X-Received: by 2002:a65:5b43:0:b0:50f:5f89:2a9d with SMTP id
 y3-20020a655b43000000b0050f5f892a9dmr716831pgr.1.1680893999494; Fri, 07 Apr
 2023 11:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-3-masahiroy@kernel.org>
In-Reply-To: <20230308115243.82592-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 11:59:44 -0700
Message-ID: <CAKwvOdnmiL_wDgzepYb+ZGgWt2xnsp48-awn0Cd0c4RDR43t_Q@mail.gmail.com>
Subject: Re: [PATCH 3/8] scripts/mksysmap: use sed with in-line comments
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Move comments close to the code.

Consider adding to the commit message why you switch from grep to sed;
that's currently unclear.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Orthogonal to this patch, don't .L prefixed local symbols not have
entries in the symbol table? If they're not printed with nm, why
filter them out (since they're impossible).

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mksysmap | 61 +++++++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 697fc6653953..8ea1955e03c6 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -10,32 +10,45 @@
>  #####
>  # Generate System.map (actual filename passed as second argument)
>
> -# For System.map filter away:
> -#   a - local absolute symbols
> -#   U - undefined global symbols
> -#   N - debugging symbols
> -#   w - local weak symbols
> -
>  # readprofile starts reading symbols when _stext is found, and
>  # continue until it finds a symbol which is not either of 'T', 't',
>  # 'W' or 'w'.
>  #
> -# Ignored prefixes:
> -#  $                    - local symbols for ARM, MIPS, etc.
> -#  .L                   - local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LA=
SANPC, etc.
> -#  __crc_               - modversions
> -#  __kstrtab_           - EXPORT_SYMBOL (symbol name)
> -#  __kstrtabns_         - EXPORT_SYMBOL (namespace)
> +
> +${NM} -n ${1} | sed >${2} -e "
> +# ----------------------------------------------------------------------=
-----
> +# Ignored symbol types
>  #
> -# Ignored symbols:
> -#  L0                   - for LoongArch?
> -
> -$NM -n $1 | grep -v            \
> -       -e ' [aNUw] '           \
> -       -e ' \$'                \
> -       -e ' \.L'               \
> -       -e ' __crc_'            \
> -       -e ' __kstrtab_'        \
> -       -e ' __kstrtabns_'      \
> -       -e ' L0$'               \
> -> $2
> +
> +# a: local absolute symbols
> +# N: debugging symbols
> +# U: undefined global symbols
> +# w: local weak symbols
> +/ [aNUw] /d
> +
> +# ----------------------------------------------------------------------=
-----
> +# Ignored prefixes
> +#  (do not forget a space before each pattern)
> +
> +# local symbols for ARM, MIPS, etc.
> +/ \$/d
> +
> +# local labels, .LBB, .Ltmpxxx, .L__unnamed_xx, .LASANPC, etc.
> +/ \.L/d
> +
> +# CRC from modversions
> +/ __crc_/d
> +
> +# EXPORT_SYMBOL (symbol name)
> +/ __kstrtab_/d
> +
> +# EXPORT_SYMBOL (namespace)
> +/ __kstrtabns_/d
> +
> +# ----------------------------------------------------------------------=
-----
> +# Ignored symbols (exact match)
> +#  (do not forget a space before and '$' after each pattern)
> +
> +# for LoongArch?
> +/ L0$/d
> +"
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
