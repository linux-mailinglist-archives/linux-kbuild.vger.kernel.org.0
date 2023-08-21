Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D425D78308C
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Aug 2023 21:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjHUTJt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Aug 2023 15:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjHUTJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Aug 2023 15:09:48 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693A5A1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 12:09:47 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4108ec645a1so13795361cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692644986; x=1693249786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6WN3DCNO0zBtBrLem2uFNaX453NTVZRXkQjbDwp+UE=;
        b=J35flMR91EaUP3bKz/19Qtuoc1tHsb/6LRGo8zoFHwl1gEZuJAbHTNwf87CHLKOkbh
         GMNRo6lVZWRqLHwuzPx5MwcgSAuA+2asre3VH9KMKMsbi6PgH/1ItTFDTpxE4Pl9nXRu
         MhMLjqYcZLoq6NZdNWs/laO3Fzja3pcBXnIHUOLl/tE8TPZMaeMPsjiHbVrc2HzPeRzy
         1kaGADO1cHK5RGznQojM3boQuiRe1vWOG2y7DwTkFL3we8JItm9Yqt3UFTUdLgw15wns
         IP2aoMTNitVV6lmuuRMMRYbxr9ssFkpUva2ZnVF06k3F0ncf7C9fU5560vKc/ZLgVR2l
         ddXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692644986; x=1693249786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6WN3DCNO0zBtBrLem2uFNaX453NTVZRXkQjbDwp+UE=;
        b=c2BfUGhRzOXHzkSmceeRoXqOq/Nf3uVeiMuPHra4DdtkY5re3AzT86pOjG/1hCgwWq
         O9HXMYfQM8C9YloYWc4UKMXo7woKKVx5TLioVdSjp5hER5g+tJbejTLVOcFj4v3Qr54O
         64+wDug0aZCWa7C6kfdbZM3DMTsFMf5JMbY/cksIgz8yGbqoSni7FIUq5dmApxlf4XAI
         qfZGKHqWsBzbcL48hriQ2V8Wl0Ir5oF7cyiNRLP5EjYbaSvvRacyYUd9LnCSAnB+YZsQ
         G88k0SSqixAeHPgj9chTcmBzTVeeFlsLrpjGs8bGt1OqxU1J25TyrMuhUUKrDkkLfVxd
         cRGA==
X-Gm-Message-State: AOJu0YxWXbmb/ghfxslueOUlSuR9yIuivUHBGvvGd8p8ShMnZVloQCIO
        8nhRFVifsgE7mjFG8stda3AH17xhAOBsDDEqD6O8e1Hoiirzreguqns=
X-Google-Smtp-Source: AGHT+IGJYSZf1l0UJ0KSgxHAtOtmYq2E8CygBXeo6QYQKiG+p9L5bzR88fmYhCm7vChNHQ9vokZaZVqsyBeX/0JBpw8=
X-Received: by 2002:a05:6870:d113:b0:1bf:df47:7b5d with SMTP id
 e19-20020a056870d11300b001bfdf477b5dmr7201694oac.24.1692643242106; Mon, 21
 Aug 2023 11:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230819114301.3505878-1-masahiroy@kernel.org>
In-Reply-To: <20230819114301.3505878-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 21 Aug 2023 11:40:31 -0700
Message-ID: <CAKwvOd=bRs-YGfOcgzJ8WUPdP6hRr5ENX0seg0SSmdCktxAKJw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove include/ksym from CLEAN_FILES
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
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

On Sat, Aug 19, 2023 at 4:43=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This is a remnant of commit 5e9e95cc9148 ("kbuild: implement
> CONFIG_TRIM_UNUSED_KSYMS without recursion").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch! I didn't see any more references to include/ksym
after this commit.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 4425d87dd2fa..f451241d0feb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1596,7 +1596,7 @@ endif
>  # make distclean Remove editor backup files, patch leftover files and th=
e like
>
>  # Directories & files removed with 'make clean'
> -CLEAN_FILES +=3D include/ksym vmlinux.symvers modules-only.symvers \
> +CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
>                modules.builtin modules.builtin.modinfo modules.nsdeps \
>                compile_commands.json .thinlto-cache rust/test rust/doc \
>                rust-project.json .vmlinux.objs .vmlinux.export.c
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
