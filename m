Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5991B75E21D
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jul 2023 15:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjGWNhT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Jul 2023 09:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGWNhS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jul 2023 09:37:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80C410DD
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Jul 2023 06:37:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5DD8360CA3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Jul 2023 13:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD80C433C8
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Jul 2023 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690119436;
        bh=hkegC/pm/U6y6rTQ6gC3ikzEDnFe+0wtwbqPQYCaapo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uNb7I8U45mg/t0l7lp8ajG0hb+/g87cq0T0RwMYZad6jnHEsL4a/BmPXyXRHHyPh+
         0b8rpDcvlUgnpJzXH2+jA07Jf2FeFvBRhsG5UzWTYFZ7T9uakQIDILvpfIEv26xQ4c
         QPw4iQBWPRgCdPIrY3TFMKcfvGaCj9LtMYS6VkaZy1Tfc8Iw9ii6wCBUS97jciJLVc
         iM/wSKZwfK0cYVsYmi3enufYolKHgLj3ggdaag+XTuOqZDRRsYUfFKY1zT5wn5ttoN
         cLeeqId2VKLf/FMhmfQ1IbD8oWUxze2OwaDPVzFAIhW3VE9Rq3u5wiuG2XldJuDIND
         4zEPRufmKvVmw==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56352146799so2546375eaf.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Jul 2023 06:37:16 -0700 (PDT)
X-Gm-Message-State: ABy/qLZQMV6Nzs+KF5oh1Eb/F6BRYmxWTvLOLhIVA4MBNbWK1ySxXg6b
        berjTAY651xBK3u+LBpedooBt0i7chUNhP/7zhU=
X-Google-Smtp-Source: APBJJlGHlBxYPeb2vHODzptW5nMX7jLJWm4zfnHjqDrUgNx+n3qL1XNVFkr2XjfFPATIgbrhPz+1eFGTpY9tUGVpneM=
X-Received: by 2002:a4a:8501:0:b0:569:e93d:1660 with SMTP id
 k1-20020a4a8501000000b00569e93d1660mr111532ooh.9.1690119436088; Sun, 23 Jul
 2023 06:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230719031912.224843-1-bgray@linux.ibm.com>
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 23 Jul 2023 22:36:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8+Mn1VQUCqkeh0=K2qgoYKstw20C0KWrd1yq_XoBpgg@mail.gmail.com>
Message-ID: <CAK7LNAS8+Mn1VQUCqkeh0=K2qgoYKstw20C0KWrd1yq_XoBpgg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation database
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 19, 2023 at 12:19=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com=
> wrote:
>
> Like C source files, tooling can find it useful to have the assembly
> source file compilation recorded.
>
> The .S extension appears to used across all architectures.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> ---

Applied to linux-kbuild.
Thanks.


>
> For example, I'm prototyping adding ASM support to clangd. It can use
> this information to determine the architecture, macros definitions,
> include paths, etc. on a per-file basis. I can capture this during
> compilation with tools like bear, but given this script exists and the
> change is trivial it seems like a good idea to adjust this script too.
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


--=20
Best Regards
Masahiro Yamada
