Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90D1A73BC96
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 18:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjFWQcE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 12:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjFWQcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 12:32:02 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED3A271E
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:32:00 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-630066deb1dso7340026d6.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687537920; x=1690129920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjZj3NJ6tNL43fD8olUI2ckbffSX6NxYGeL5Kbsd15w=;
        b=R1isnHBBwVrgX9qa7AlsKhyGqLKNWhaxQDytnzIrvagW7RrRJJd/7E4Jv7J5xW37fN
         ZJiwLTMzva5iBTSQRN1jHnvm4kJDixA4gECanSgwBdUDVFzAZjwVMSUrMribVOeO1dbj
         TOYp58RsjRx4zs5ztbwLxPDHKfGhf0vTGXUAWId9gmOVFHxaMvnIPglVs+EVJ/o8OQoT
         Q/H747d/lPF0u1HAY7OhMjerSUExP5JUZAm/zKMTRZqruSemOEYyLG3YUxumw03PcXVp
         bsn/lCwZMelCPLy8OoCoeyE14XDebACrCq2aNBWvsLUxah47fqSMBXe7gKKlKjwTvjtv
         EUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687537920; x=1690129920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjZj3NJ6tNL43fD8olUI2ckbffSX6NxYGeL5Kbsd15w=;
        b=HfqczRdYOtKvSOYap9wi1rnQn0QSfUUfL8SERIuvWr8NzZg4Ws55TbZ8F1jRA23hsh
         scqua61PVp91cgycQVAJjDMtemXT8LXO3LQQPaJwdZdZstz0z9ewuyGvTi4UrUTQ2bV8
         5Jip8dkNvvZABSIT7BySPVU/rc/A7Jz0NxZ7GjNUp9JnHO2jZ+EOkI7bmZLKVZj38Yy5
         xWWjg0+KkL994b0tUjGiXrn/J69i15wyeTVefL4FwtNdCw3mgQQ/qH0GiEDr5TZGdBoL
         q+kttFuV/QoZMt+aCGzpk/cHZagMU5JwEijHK1X+eN3p6h9H4G6aJwZziOEoYtz4Quzz
         uMMg==
X-Gm-Message-State: AC+VfDxYU8AGSPQluQzqU1czRAxQKW0Af5qCizGXsQPJR+vpamj4+0O8
        4W70szUlk1NNzTOXqG9HG0iAE0wKT23Qu7vU4XCL0A==
X-Google-Smtp-Source: ACHHUZ44biYyPh1FafPEljQhdi4AermpdroWBXD6UfAZJZCAYGcnGRDXk1RfO12+Wn89bZ+YwJ3JJ2rnwlhgyM4rHQA=
X-Received: by 2002:a05:6214:2a8e:b0:626:3dee:6091 with SMTP id
 jr14-20020a0562142a8e00b006263dee6091mr26135505qvb.49.1687537919844; Fri, 23
 Jun 2023 09:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230623134351.1898379-1-kernel@xen0n.name> <20230623134351.1898379-9-kernel@xen0n.name>
In-Reply-To: <20230623134351.1898379-9-kernel@xen0n.name>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 23 Jun 2023 09:31:49 -0700
Message-ID: <CAKwvOdnimxv8oJ4mVY74zqtt1x7KTMrWvn2_T9x22SFDbU6rHQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] Makefile: Add loongarch target flag for Clang compilation
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Rui <wangrui@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
        loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        WANG Xuerui <git@xen0n.name>
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

On Fri, Jun 23, 2023 at 6:44=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> The LoongArch kernel is 64-bit and built with the soft-float ABI,
> hence the loongarch64-linux-gnusf target. (The "libc" part doesn't
> matter.)

Technically, IIRC llvm may make different decisions on libcall
optimizations based on the libc part of the target triple.  For
instance, is bcmp defined in that libc or not?  That's why we specify
-gnu or -musl (I forgot we did that for hexagon) explicitly rather
than leave that part of the triple blank.  Minutia that doesn't need
to be in this commit message, but now it's explicitly documented on
LKML and linkable-to.

>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 058a4c0f864e..6c23c6af797f 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -4,6 +4,7 @@
>  CLANG_TARGET_FLAGS_arm         :=3D arm-linux-gnueabi
>  CLANG_TARGET_FLAGS_arm64       :=3D aarch64-linux-gnu
>  CLANG_TARGET_FLAGS_hexagon     :=3D hexagon-linux-musl
> +CLANG_TARGET_FLAGS_loongarch   :=3D loongarch64-linux-gnusf
>  CLANG_TARGET_FLAGS_m68k                :=3D m68k-linux-gnu
>  CLANG_TARGET_FLAGS_mips                :=3D mipsel-linux-gnu
>  CLANG_TARGET_FLAGS_powerpc     :=3D powerpc64le-linux-gnu
> --
> 2.40.0
>
>


--=20
Thanks,
~Nick Desaulniers
