Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838B72591E5
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgIAOzV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 10:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgIALbA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 07:31:00 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504A6C061247;
        Tue,  1 Sep 2020 04:29:57 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id d27so550478qtg.4;
        Tue, 01 Sep 2020 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bmg6XgtUWDx4HuERt6+WNca9MkrxDIzUrFEsZ8s0eNY=;
        b=IERvtpprRpsI2hed0dHnnYBJc2bTsfXDoVwNNjG0Ec1Sz8CRuOUarz+Porf5yRfHFu
         30cRoDkuZP41QRrigZa6y9lS/Q9+jFle0rPTgtwQN4bp84V8ocprAVuzMQ9FqTehBEzY
         4MDJIPAYpDQqg5MZ+6ZUTXTmOnuGZXEK8IgCV4orCkGUrRtsYcj/Ywc1ICPwnctC/GyI
         dJzhbEYwl61cZTl24h34xARkW2Zaqa/kOmK3OayGekDtkeFds1gFNQRmSyQ/QvyDfdw+
         OEnwNuiuobwmd/AEPMOV6cmL4S085Ju8J83/4o3yZA4u2o3mkHjbyG61560pFu+G2c5p
         TvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bmg6XgtUWDx4HuERt6+WNca9MkrxDIzUrFEsZ8s0eNY=;
        b=G71dvjwIu488zUUjmMoWDTLeZ/wY1GVSDhux2sTucSujqYmKot2Nq0A7QY/g/nSguk
         /2MnBBotSaK6dVANc/725/FqCJ76wRfpBHGaoIQpdxZboGa8QSBikS/eS7DotIMV2Lpx
         pEokqnWf1EyBjlovce/6LFBQ3llUYbjDuc5giQkAmfxyAggVnhdEsMWUvidyqlE3Fd3y
         UDfTeqfiWixrCUALqrS1wMQOuD08ftGEfcq+JpnG/SM6w/3+Oj7sYZNQ6HLBn6eheGwt
         AYPQFxmmu6mwzEpbar+V42Lj/Trs6OQ6qurh7R/AmS/xm1yJIBrnGIKCFrSGA6j5jkSv
         RqYw==
X-Gm-Message-State: AOAM533xxmhHTiJ3mQLWUvys/hzohLIhit6UpntJGSYOiftYuztVxs46
        oApsWFtjQW14glwe6JoEiU9T3HzlHpIhxU9GPEArsfF1lf43xA==
X-Google-Smtp-Source: ABdhPJwVT407rq1wSU6XLfBx35x7TqzLfOV0jdufGiWqhxHXDja0Uvn0+tpPRWaGd0lmv1UnRMyszboqVwIOVOloAYU=
X-Received: by 2002:ac8:7741:: with SMTP id g1mr1183471qtu.28.1598959796622;
 Tue, 01 Sep 2020 04:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200831182239.480317-1-masahiroy@kernel.org>
In-Reply-To: <20200831182239.480317-1-masahiroy@kernel.org>
From:   Greentime Hu <green.hu@gmail.com>
Date:   Tue, 1 Sep 2020 19:29:19 +0800
Message-ID: <CAEbi=3cqogHs=p_y=_jfcC+D5a9e5=Nic=ECr_YvJ9p-DZEAJQ@mail.gmail.com>
Subject: Re: [PATCH] arch: vdso: add vdso linker script to 'targets' instead
 of extra-y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nick Hu <nickhu@andestech.com>,
        Paul Mackerras <paulus@samba.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> =E6=96=BC 2020=E5=B9=B49=E6=9C=881=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:23=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The vdso linker script is preprocessed on demand.
> Adding it to 'targets' is enough to include the .cmd file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm64/kernel/vdso/Makefile     | 2 +-
>  arch/arm64/kernel/vdso32/Makefile   | 2 +-
>  arch/nds32/kernel/vdso/Makefile     | 2 +-
>  arch/powerpc/kernel/vdso32/Makefile | 2 +-
>  arch/powerpc/kernel/vdso64/Makefile | 2 +-
>  arch/s390/kernel/vdso64/Makefile    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Mak=
efile
> index 45d5cfe46429..7cd8aafbe96e 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -54,7 +54,7 @@ endif
>  GCOV_PROFILE :=3D n
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index d6adb4677c25..572475b7b7ed 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -155,7 +155,7 @@ asm-obj-vdso :=3D $(addprefix $(obj)/, $(asm-obj-vdso=
))
>  obj-vdso :=3D $(c-obj-vdso) $(c-obj-vdso-gettimeofday) $(asm-obj-vdso)
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (vdso.s includes vdso.so through incbin)
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Mak=
efile
> index 7c3c1ccb196e..55df25ef0057 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -20,7 +20,7 @@ GCOV_PROFILE :=3D n
>
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vd=
so32/Makefile
> index 87ab1152d5ce..fd5072a4c73c 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -29,7 +29,7 @@ ccflags-y :=3D -shared -fno-common -fno-builtin -nostdl=
ib \
>  asflags-y :=3D -D__VDSO32__ -s
>
>  obj-y +=3D vdso32_wrapper.o
> -extra-y +=3D vdso32.lds
> +targets +=3D vdso32.lds
>  CPPFLAGS_vdso32.lds +=3D -P -C -Upowerpc
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vd=
so64/Makefile
> index 38c317f25141..c737b3ea3207 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -17,7 +17,7 @@ ccflags-y :=3D -shared -fno-common -fno-builtin -nostdl=
ib \
>  asflags-y :=3D -D__VDSO64__ -s
>
>  obj-y +=3D vdso64_wrapper.o
> -extra-y +=3D vdso64.lds
> +targets +=3D vdso64.lds
>  CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/M=
akefile
> index 4a66a1cb919b..d0d406cfffa9 100644
> --- a/arch/s390/kernel/vdso64/Makefile
> +++ b/arch/s390/kernel/vdso64/Makefile
> @@ -25,7 +25,7 @@ $(targets:%=3D$(obj)/%.dbg): KBUILD_CFLAGS =3D $(KBUILD=
_CFLAGS_64)
>  $(targets:%=3D$(obj)/%.dbg): KBUILD_AFLAGS =3D $(KBUILD_AFLAGS_64)
>
>  obj-y +=3D vdso64_wrapper.o
> -extra-y +=3D vdso64.lds
> +targets +=3D vdso64.lds
>  CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
>
>  # Disable gcov profiling, ubsan and kasan for VDSO code

For nds32:

Acked-by: Greentime Hu <green.hu@gmail.com>
