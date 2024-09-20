Return-Path: <linux-kbuild+bounces-3656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A445D97D5EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 14:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9CF11C21042
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD5A16F27D;
	Fri, 20 Sep 2024 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJRN2V98"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064916F0E8;
	Fri, 20 Sep 2024 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726837166; cv=none; b=QDTwXqpq6nYslT/ne9bumTjmQipCZc6O+mdWN9DX4dOH01MVyd/ridUxdYOR6y/2F8jqgptuXP1F+vdGk+kpvy4nWiccj9Uu6+m35oZ2tODRm8H8rmRGvC8uUmzK+SVCs1AUnMyKeCjJCePcUx5k4QsQiQDrIgcuo2EVu7hrAWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726837166; c=relaxed/simple;
	bh=lls3LxqYGED1bVEP7KNHMcYz/Fj/2kdJdmfvhQuRYgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDBMrm6uwikuCN9Tuwre5CflQiheZK2qdCoYCHnY+Ffi1S8AU1khlTYdeybisUXs5HZaDwil0BVXAgfj+frFMl5LTnvCoUT9aaDmgp7ttoZU1QaDbO0njasrPJMDTvDoC/s6JjcsGmdJbJ5BqkBYkhO/zLm2MXnINyIFv1xSGNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJRN2V98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2ABDC4CECD;
	Fri, 20 Sep 2024 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726837165;
	bh=lls3LxqYGED1bVEP7KNHMcYz/Fj/2kdJdmfvhQuRYgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PJRN2V98QggHSM/PwPE50JuQTYw0H88Zy1cd0m6eGVc9AwUNIWkesUYpkK3VEK13z
	 539H6I/PAvExHlRAUjcAXRwbgGazTiqPWiCTmxC/HpInHdboQXohWKdxmt27ujB91u
	 HMifxcpElMgSQ+TGdFAr5vHEN99x7k0HbCgZsqLCFaPRtrQ7+fsz+F74armL/IG6KQ
	 /qIzwSr9KIeonNE5PphojiA/Agg3pI7u4totra3ioV/Bi2wHk9Watm7GWpcUs32HWV
	 ACtSXCP2VgCVM1s77BiTHwzZQsMN1+Y26tAgw4IZerKc5csriR34LuX5SO3HGoU/f0
	 V5rTzqCEWkHjA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53654e2ed93so2450300e87.0;
        Fri, 20 Sep 2024 05:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaAuhDeC01jQ7lndgsMPxqGab2L4nNFxakm3wuxNhGQ6AHk3Tmt9bpFbnMK/hTNpJ+C+O5cLx1P1T0oYdfo6A=@vger.kernel.org, AJvYcCXdruuSMFrGn2sSy/V9K4ujGavEYaFcyJoEdqvJN3jeT3FjTMBPT2QGkzliMsXsBTGACzcEv+shuoC2IXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5znnOX246buFnmenZnEyxwazsA01ptGIrBz8CPqMgVqvAIm81
	D5Klgzao0N1VNp1cwfXUH63mNAelTfKv+mZVrroJKUQX/m68pdYNcGcMFkCX4fl/6tsnc353vki
	wqBeqCWI23v1M+XnSqiXuBbsmnjs=
X-Google-Smtp-Source: AGHT+IEd+GMFo2Er0REvASH1RQ1qF9PMK8eVDI4I9hE/80oeEUEIKwLzPeFbbw6mbFh/W44I8ZAUGy9F1w5VuhgAT5g=
X-Received: by 2002:a05:6512:3408:b0:530:ae22:a6ea with SMTP id
 2adb3069b0e04-536ad3b7e1bmr1482227e87.40.1726837164265; Fri, 20 Sep 2024
 05:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <Zu1Q1yi4bs2plCxl@l-nschier-nb>
In-Reply-To: <Zu1Q1yi4bs2plCxl@l-nschier-nb>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Sep 2024 21:58:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7D_d+Kz5+rk3OuN0StY=d3iOOa4Un12HYyF4w89LbTQ@mail.gmail.com>
Message-ID: <CAK7LNAS7D_d+Kz5+rk3OuN0StY=d3iOOa4Un12HYyF4w89LbTQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: support building external modules in a
 separate build directory
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 7:39=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> On Tue, Sep 17, 2024 at 11:16:28PM +0900, Masahiro Yamada wrote:
> >
> > There has been a long-standing request to support building external
> > modules in a separate build directory.
>
> Thanks a lot, you are making several of my colleages very happy with
> your patch set!
>
> > The first half is cleanups of documents and Makefiles.
> >
> > The last part adds KBUILD_EXTMOD_OUTPUT (MO=3D).
> > This is too big changes, and too late for the current MW.
> > (I did not test kselftest at all.)
> > I hope people test this and may uncover some issues.
>
> I'm not through all the patches in detail yet, just one observation befor=
ehand:
>
>     $ make KBUILD_OUTPUT=3Dbuild allnoconfig
>     $ ./scripts/config --file build/.config --enable modules --enable acc=
essibility
>     $ make KBUILD_OUTPUT=3Dbuild olddefconfig
>     $ make KBUILD_OUTPUT=3Dbuild
>     $ make KBUILD_OUTPUT=3Dbuild CONFIG_SPEAKUP=3Dm MO=3D/tmp/build M=3D~=
+/drivers/accessibility/speakup modules
>     /home/nschier/src/kbuild-review/drivers/accessibility/speakup/genmap.=
c:23:10: fatal error: mapdata.h: No such file or directory
>        23 | #include "mapdata.h"
>           |          ^~~~~~~~~~~
>     compilation terminated.
>     make[3]: *** [/home/nschier/src/kbuild-review/scripts/Makefile.host:1=
33: genmap.o] Error 1
>     make[3]: *** Waiting for unfinished jobs....
>     make[2]: *** [/home/nschier/src/kbuild-review/Makefile:1971: .] Error=
 2
>     make[1]: *** [/home/nschier/src/kbuild-review/Makefile:251: __sub-mak=
e] Error 2
>     make: *** [Makefile:251: __sub-make] Error 2
>     [exit code 2]
>
> If I add "EXTRA_CFLAGS=3D-I${MO} and EXTRA_HOSTCFLAGS=3D-I${MO}" to the m=
odule
> build command, it works as expected.
>
> Patching this into kbuild works for me, too, but I haven't checked whethe=
r it
> breaks some other scenarios:
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index e01c13a588dd..056c7da2776f 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -97,10 +97,13 @@ hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-i=
nfo=3D$(depfile) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
>
>  # $(objtree)/$(obj) for including generated headers from checkin source =
files
> -ifeq ($(KBUILD_EXTMOD),)
>  ifdef building_out_of_srctree
> +ifeq ($(KBUILD_EXTMOD),)
>  hostc_flags   +=3D -I $(objtree)/$(obj)
>  hostcxx_flags +=3D -I $(objtree)/$(obj)
> +else
> +hostc_flags   +=3D -I $(CURDIR)
> +hostcxx_flags   +=3D -I $(CURDIR)
>  endif
>  endif
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1bdd77f42289..428a9eb74381 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -190,11 +190,15 @@ endif
>
>  # $(src) for including checkin headers from generated source files
>  # $(obj) for including generated headers from checkin source files
> -ifeq ($(KBUILD_EXTMOD),)
>  ifdef building_out_of_srctree
> +ifeq ($(KBUILD_EXTMOD),)
>  _c_flags   +=3D $(addprefix -I, $(src) $(obj))
>  _a_flags   +=3D $(addprefix -I, $(src) $(obj))
>  _cpp_flags +=3D $(addprefix -I, $(src) $(obj))
> +else
> +_c_flags   +=3D $(addprefix -I, $(src) $(obj) $(CURDIR))
> +_a_flags   +=3D $(addprefix -I, $(src) $(obj) $(CURDIR))
> +_cpp_flags +=3D $(addprefix -I, $(src) $(obj) $(CURDIR))
>  endif
>  endif
>
> Is '-I$(MO)' in CFLAGS/HOSTCFLAGS is something we should support by
> default, or should this be added to the external module's Makefile by
> the respective developers themselves?
>
> Kind regards,
> Nicolas



We can fix it more simply.




diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e01c13a588dd..c1dedf646a39 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -96,12 +96,10 @@ hostrust_flags =3D --out-dir $(dir $@)
--emit=3Ddep-info=3D$(depfile) \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))

-# $(objtree)/$(obj) for including generated headers from checkin source fi=
les
-ifeq ($(KBUILD_EXTMOD),)
+# $(obj) for including generated headers from checkin source files
 ifdef building_out_of_srctree
-hostc_flags   +=3D -I $(objtree)/$(obj)
-hostcxx_flags +=3D -I $(objtree)/$(obj)
-endif
+hostc_flags   +=3D -I $(obj)
+hostcxx_flags +=3D -I $(obj)
 endif

 #####
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1bdd77f42289..d8ce0f59fd17 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -190,13 +190,11 @@ endif

 # $(src) for including checkin headers from generated source files
 # $(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
 _c_flags   +=3D $(addprefix -I, $(src) $(obj))
 _a_flags   +=3D $(addprefix -I, $(src) $(obj))
 _cpp_flags +=3D $(addprefix -I, $(src) $(obj))
 endif
-endif

 # If $(is-kernel-object) is 'y', this object will be linked to
vmlinux or modules
 is-kernel-object =3D $(or $(part-of-builtin),$(part-of-module))





However, I'd rather fix each Makefile
to add necessary include paths explicitly.








--=20
Best Regards
Masahiro Yamada

