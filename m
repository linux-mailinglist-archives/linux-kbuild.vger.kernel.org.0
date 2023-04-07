Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2736DB328
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 20:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjDGSrn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 14:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjDGSrW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 14:47:22 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5335CA19
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 11:46:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-23f8be2d34eso222546a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680893216; x=1683485216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLTo2/pbqaGdaUlRr1PWbdRNZcxUWCLaiksPX42/Bv4=;
        b=OB+ByxAw4BkURK4R+G8bm8Rs6drt6DfimRLhJzLOJYEnl87KmHZQnbq/QqEVhTs2e+
         RAX0flUogBejdNbx1QrzTHFePAbd6fGLBT9ZpAQjIOtc65per7KsF3c3JY6CLOokJQnI
         rEl3ZllHlvQIu3vsnDGw0pxDFl11NJuw8E25F8XuVgHoLZpeK72KXQpbFntowhLYOf4H
         KVD44/LoempTYGAHa3PEFDO9qDQhdS2CCxe4k/In4afRHbWWotoYXj5yaIxHZsL/hdkC
         iNqrcPYDAgo3JOwZ77yh/C5fOZVlFGTX09kzPc66et4S5IHNlMTxHZmNfGgg2ww1iOgc
         iQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893216; x=1683485216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLTo2/pbqaGdaUlRr1PWbdRNZcxUWCLaiksPX42/Bv4=;
        b=smoCfTyeduJC7KG1nrc42jNU+3Nu9hpULa2PM26tBp4PglVFRghEiH79yzkPxPTrFm
         JjatCZztIdMQvrEA+PUikK1UHZZJ8U8NbhIypxiAxAYhZ9/rY9wBNjKpWRnUNB3GfLGN
         LzaAldDXbEBOT514EbyEAl/jYxpvzRv6QwVDyx4w8Rzf2kp9pazbBSaflFAtpPMnCTgE
         SXe2z7u27gBInFfSxtkd3ZkNzuvL5qwE5JCJR70oZwE16Ma1wYm2jsK8k9Js22Mh4NM/
         Tpcrp05l1ZlK67VOuWG2OxaRKbDwXi6Qh7a4KLTATQGV8g/aS5qjyewX/dUX6ryzqnY5
         B9iw==
X-Gm-Message-State: AAQBX9enj1bhE9H8kiuYS2KajF4Yknqf1Vq55tcyuorGxY++iDlXFJLC
        nbI1nyZQdB28f5oNyEOcKmYIcrhrT/ldDSljDYV0TaF4RiSuJNpQcus=
X-Google-Smtp-Source: AKy350as1CQpweA9VqnR4D8sSPwD3L9mpCdajcNXDnqTT3PiapjkTkWgQH+wLiakf2X4XKTFibbgixAcMIBA+nxofrs=
X-Received: by 2002:a05:6a00:2e23:b0:62a:d87a:a375 with SMTP id
 fc35-20020a056a002e2300b0062ad87aa375mr1682910pfb.4.1680893215506; Fri, 07
 Apr 2023 11:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-2-masahiroy@kernel.org>
In-Reply-To: <20230308115243.82592-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 11:46:44 -0700
Message-ID: <CAKwvOdk+7ODHh=fC+=1bky+XEZH=idAsCkymn8Ex0TN8sC7SVQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] scripts/mksysmap: remove comments described in nm(1)
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

On Wed, Mar 8, 2023 at 3:52=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> I do not think we need to repeat what is written in 'man nm'.

I agree, but the paragraphs following the one you removed refer to a,
U, N, w, T, t, and W now with no context that those are the nm
formats.

I'm ok with this patch, but please consider adding a sentence along
the lines of:

The following refers to the symbol type as per nm(1).

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mksysmap | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 16a08b8ef2f8..697fc6653953 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -10,25 +10,6 @@
>  #####
>  # Generate System.map (actual filename passed as second argument)
>
> -# $NM produces the following output:
> -# f0081e80 T alloc_vfsmnt
> -
> -#   The second row specify the type of the symbol:
> -#   A =3D Absolute
> -#   B =3D Uninitialised data (.bss)
> -#   C =3D Common symbol
> -#   D =3D Initialised data
> -#   G =3D Initialised data for small objects
> -#   I =3D Indirect reference to another symbol
> -#   N =3D Debugging symbol
> -#   R =3D Read only
> -#   S =3D Uninitialised data for small objects
> -#   T =3D Text code symbol
> -#   U =3D Undefined symbol
> -#   V =3D Weak symbol
> -#   W =3D Weak symbol
> -#   Corresponding small letters are local symbols
> -
>  # For System.map filter away:
>  #   a - local absolute symbols
>  #   U - undefined global symbols
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
