Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08B87342E2
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jun 2023 20:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjFQSKh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Jun 2023 14:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFQSKg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Jun 2023 14:10:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B8E1736;
        Sat, 17 Jun 2023 11:10:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6C3861073;
        Sat, 17 Jun 2023 18:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02590C433CA;
        Sat, 17 Jun 2023 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687025434;
        bh=eof2FgZldARdsiZEY2z8m74c3IR00ghzc6pmuXKR6YY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sY/zfembmYj5yKffF8vyiJhVIrX89T2IKUANayVvsCLyM0YJ7spah4zAUVtdFj5Gu
         dpsm2IKWcpLKo/u9O9YyQ7TBIS6PKrH3DCCWOE7dTbSqi3mtNLQ5ZZMcovA8SoRs52
         N9HbZ8hSwfDeVXSwiqFVIw/JLXfhj1xUn8r8sxzoKEk5MaZnDYWUC9oEQjyoWk37P3
         mTd8Ha3ZyM/sg/Vo9302kSX36um33fd+zKVTI7TClqZInHb+pbTA14kgR+/vAcFiDD
         6YJDApPuwY4dTgJy7vCsCNg+cqnOnKJlaTSbLlm6W7E0mOHpjql2tOs11jfISiZx0L
         8otZHzdhMhL+Q==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-55b85b94bb0so965026eaf.0;
        Sat, 17 Jun 2023 11:10:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDyHp4ai1D8FqeVV+lIJRuuQJ3OsX2j/UyM0fY9HpUzkGemZ68YD
        VQjkduEI9UM4+kZpLYOyamyYH0MricibQLmiBSQ=
X-Google-Smtp-Source: ACHHUZ5zJG9Bwf55HhZr0sT2E/h2kZ3KHa7GJXKJPg+oxLYYQyI7XbP+MkflztjQgQVH8gbXLkZHLosjI2llVS4kGOk=
X-Received: by 2002:a4a:b60d:0:b0:552:4bca:a9df with SMTP id
 z13-20020a4ab60d000000b005524bcaa9dfmr1466835oon.3.1687025433211; Sat, 17 Jun
 2023 11:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200625170434.635114-1-masahiroy@kernel.org> <20200625170434.635114-2-masahiroy@kernel.org>
 <20230616194505.GA27753@lxhi-065>
In-Reply-To: <20230616194505.GA27753@lxhi-065>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Jun 2023 03:09:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8G1PxsdUi6dnbrDcbCKixkARgbHm94xskgNgWJ7aMTQ@mail.gmail.com>
Message-ID: <CAK7LNAR8G1PxsdUi6dnbrDcbCKixkARgbHm94xskgNgWJ7aMTQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make dt_binding_check'
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-kbuild@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Matthias.Thomae@de.bosch.com, yyankovskyi@de.adit-jv.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
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

On Sat, Jun 17, 2023 at 4:45=E2=80=AFAM Eugeniu Rosca <erosca@de.adit-jv.co=
m> wrote:
>
> Dear Yamada-san,
> Dear Kbuild experts,
>
> On Fri, Jun 26, 2020 at 02:04:31AM +0900, Masahiro Yamada wrote:
> > We are having more and more schema files.
> >
> > Commit 8b6b80218b01 ("dt-bindings: Fix command line length limit
> > calling dt-mk-schema") fixed the 'Argument list too long' error of
> > the schema checks, but the same error happens while cleaning too.
> >
> > 'make clean' after 'make dt_binding_check' fails as follows:
> >
> >   $ make dt_binding_check
> >     [ snip ]
> >   $ make clean
> >   make[2]: execvp: /bin/sh: Argument list too long
> >   make[2]: *** [scripts/Makefile.clean:52: __clean] Error 127
> >   make[1]: *** [scripts/Makefile.clean:66: Documentation/devicetree/bin=
dings] Error 2
> >   make: *** [Makefile:1763: _clean_Documentation] Error 2
> >
> > 'make dt_binding_check' generates so many .example.dts, .dt.yaml files,
> > which are passed to the 'rm' command when you run 'make clean'.
> >
> > I added a small hack to use the 'find' command to clean up most of the
> > build artifacts before they are processed by scripts/Makefile.clean
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/devicetree/bindings/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation=
/devicetree/bindings/Makefile
> > index a63898954068..f20d234aec46 100644
> > --- a/Documentation/devicetree/bindings/Makefile
> > +++ b/Documentation/devicetree/bindings/Makefile
> > @@ -53,3 +53,8 @@ $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) chec=
k_dtschema_version FORCE
> >       $(call if_changed,mk_schema)
> >
> >  extra-y +=3D processed-schema.yaml
> > +
> > +# Hack: avoid 'Argument list too long' error for 'make clean'. Remove =
most of
> > +# build artifacts here before they are processed by scripts/Makefile.c=
lean
> > +clean-files =3D $(shell find $(obj) \( -name '*.example.dts' -o \
> > +                     -name '*.example.dt.yaml' \) -delete 2>/dev/null)
>
> JFYI, we are running into the "Argument list too long" simply by trying t=
o
> clean an out-of-tree module (with lots of artifacts though), as below.
> Seems to be happening on vanilla (v6.4-rc6-199-gb73056e9f82ebd) too.
> Just in case there are any known hacks (or similar reports), please let u=
s know.
>
> $ make -C /data/linux-src M=3Dmy_module clean
>
> make: Entering directory '/data/linux-src'
> make -f ./scripts/Makefile.clean obj=3Dmy_module
> set -e;  echo '  CLEAN   my_module';  rm -rf [~1k filenames / 200k char]
> make[1]: /bin/sh: Argument list too long
> make[1]: *** [scripts/Makefile.clean:45: __clean] Error 127


I sumitted a patch
https://patchwork.kernel.org/project/linux-kbuild/patch/20230617153025.1653=
851-1-masahiroy@kernel.org/

I do not know whether it will solve your problem or not.

Your module Makefile has ~1k files to remove.

It may still exceed ARG_MAX limit.




> --
> Best regards,
> Eugeniu Rosca



--=20
Best Regards
Masahiro Yamada
