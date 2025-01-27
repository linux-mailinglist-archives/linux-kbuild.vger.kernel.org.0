Return-Path: <linux-kbuild+bounces-5562-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF05A20164
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2025 00:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347301885FC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 23:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFD11DB34C;
	Mon, 27 Jan 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="mHABvHp0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD01DCB0E;
	Mon, 27 Jan 2025 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738019327; cv=none; b=UYUhLoSiacB90Z8a5pYs5CBwVWjPMnQPHmBxg1h5Ntc8TtOha1FancBoNi9Ky8TrdG+8iwxzmxO5VrDVW8nnQ5mPuwTRfKok0h7Yl0Ya9YKNWsQhfYIHXpG39T7A88iy289j5RR1cw9Zms5H5pdWB211NEFf5mErHN4sN0Wn/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738019327; c=relaxed/simple;
	bh=4HaLsI8dZ+YsORTVjYIdUhSvR7AOEDwILESEvnTfh3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sasTztqgl/QAt8CJ4VM4IRLrmR71cHH1bTGVV8/A8b0Qpn+TvG/LpftBG5h2jv8M29VgHmzpm/UrVLe5FiX/RlWtREUR4eEGURjzViLK3bjbt5DtloDSmuxaMII8Wsda19NrwBV+wlfptn+48MD12pWKax8bsyk07wbj/WINF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=mHABvHp0; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1738019320; x=1738624120; i=quwenruo.btrfs@gmx.com;
	bh=c9sTKCd80xAwfgqnfaDIdl8rLTuHJwgOobd8L66Fk1o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mHABvHp0nHbALFLDnjhV0CuyXLsXBkmSc0IC+YgRjfQlNkwXmG7X6H/OXJo2OK6y
	 e7xPS3TYf310w7Hzap6QpNnGArblTcvNAnbNXKhd78T84IZDqngpsFJXTEidufWd6
	 Qp5xF/YM9QHSB1CF7VJHK3ICpdvPPOxO+COdxCUzi8ARyZmzDetIp0dPW9Lrf1obJ
	 58j+2dCSCpK0PzPOnEJPNRn84sfQIc3vq/LwDV5uqmCAeKLYNA6fgo1f00Vwq34j9
	 NX+8hGRHZ+hZSgXjBh73Em/YoNEMSUA3cSCLhNBHEmQHCrPRXcH8IlORoyVXRIEVx
	 Bt9yPL+Zh7y6xP4zzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N2E1G-1tTSLh2w8c-012qgn; Tue, 28
 Jan 2025 00:08:40 +0100
Message-ID: <fa460e59-65b0-438c-bfa7-70cec50ef747@gmx.com>
Date: Tue, 28 Jan 2025 09:38:36 +1030
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 cocci@inria.fr
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20241110013649.34903-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EnyAVBIrVMjZeyH5g/05RdUCLARXBRWOzPAlkCe9TaIWRb6bxwc
 bsbkqSaPxzsw/MM+Iokvi/mEm+3mE5YQotGqRmznk7Vw0gIVkWfAxJ+frWXuaJ6VWAbCe52
 PMvND452g+MnzNg4sNfvUf/k8IaD6msEZ2dbVIwqweMAdKH/loutZ8JfwRujJEQFIZ7LI0q
 ksWKf7Ej2Yau0j1o7F1kg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GGKxUgYyV48=;ChJldn66fGvESpwLkoFZizaAe8n
 YFltkp/WntjN33fvw2V5DhCUXwn2eZ3KTTa44OqFnqohNYU9IX+o021iADbfiwDOUAv0l9Dbv
 cnXQDMInqnb3QlIt4vSG9L6HIrPmlZIeX1RPYCAwZXjlIm8Rn6PSHZrZQux+iNbPmMdwDd9bx
 91txNrbRMlx3D4YMYRnfH3Pf4qgf9Re0Qzmf4wkUku/iJs4EyYntzrqxWEr71begpzCYd9lbP
 bNIRQnNaJ+Ipab9EkBnE39tgUjsHdHufGba3gTBX0+FkocQskEdMEQTyUcCpWLOrcaPgHHdDX
 PEJVFFPSiUxSLWevvq/VcOo59ehNyGHJNkpajXIqiUn8WStPRkkeyk6Lsm2Nnv6ZfP2BJxB7D
 ycwAWpkbFPqao3wH1qGYOVBqCOtYoWRvIsI3ACd8TLGMo/qflA71HWNw6EzYKVrATXiVaWKyn
 ga9WrDQvrJeXnftGm7PQ2LGwEh1T3OjJuav5suejZEpPa0feuoivci0ywFxaa+fjoh5v8Yre3
 QhyxG/uLrffA0hkUFZjXGC/bSBudzuvXSinmyH7pDQQ0IeOiJqU9rfgHyO4GB2/KhyH6zEJPa
 q91g3GMmqYKadwazAGWDDZhXPVqoK1axvEJxR3dhUtqOKK+50oEBsIUkpzEsPPqwenVGYh/0u
 53Vr7RNhAwgasndghOI6MNlIWO22wEgGEt7kYLqqRdfN1/n1qrP2ml3nzun36v2zFiffhGhIL
 3Mj+8aBvM0Mz1AveS81luGaeHuqEUQ6NTfcQ1CTTrwfOJ5uFZwRdA2DcwA9WMYdKgj8IEqxIX
 VgK0Q8NjqzRU9bzam/zbyEz1nfygl1Z7YZ2MQQ0EiOogMN0svVKnabn6FUbpUJfhwJzHetTEF
 U35Qv0eocTps74cTWN9QmSuvNJZlv/s+01PiuXGl+oWjiUs09odMimBqrIqOWVTAIc+Pu4+1n
 Hp1ZZCYsTV+6wmNq08tBzcF2tAQthSG8RPI5dAbscMZMVh12tX8o/1iRFE1oatwKZPmTvI/Is
 fGHHl/BHTiv3Zk1VuEL461dwz9vWANqD4uXouOiUWAOfwA2Be7T/Mz5WW2ikiTLAT74KoZyBw
 rS81/8bfIDZiNH7/pkADJs3YHvQkcz0f05W8JeQLU6LPIWiyA/s3mq2CjILgtuKbLNvune6CQ
 bXKyTnmTW4c7ZqZCgx1SjLdnd5MCUBqDJXSev27PfRQ==

Hi Masahiro-san,

Thanks for your contribution, but it looks like this is breaking quite
some vim/nvim quick fixes.

If there is some compiling errors/warnings, the path will be the one
inside the module directory, no matter if it's out-of-tree or upstreamed.

Is there anyway to get back the full filename so that vim/nvim quick fix
can work again?

Thanks,
Qu

=E5=9C=A8 2024/11/10 12:04, Masahiro Yamada =E5=86=99=E9=81=93:
> Currently, Kbuild always operates in the output directory of the kernel,
> even when building external modules. This increases the risk of external
> module Makefiles attempting to write to the kernel directory.
>
> This commit switches the working directory to the external module
> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> some build artifacts.
>
> The command for building external modules maintains backward
> compatibility, but Makefiles that rely on working in the kernel
> directory may break. In such cases, $(objtree) and $(srctree) should
> be used to refer to the output and source directories of the kernel.
>
> The appearance of the build log will change as follows:
>
> [Before]
>
>    $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>    make: Entering directory '/path/to/my/linux'
>      CC [M]  /path/to/my/externel/module/helloworld.o
>      MODPOST /path/to/my/externel/module/Module.symvers
>      CC [M]  /path/to/my/externel/module/helloworld.mod.o
>      CC [M]  /path/to/my/externel/module/.module-common.o
>      LD [M]  /path/to/my/externel/module/helloworld.ko
>    make: Leaving directory '/path/to/my/linux'
>
> [After]
>
>    $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
>    make: Entering directory '/path/to/my/linux'
>    make[1]: Entering directory '/path/to/my/externel/module'
>      CC [M]  helloworld.o
>      MODPOST Module.symvers
>      CC [M]  helloworld.mod.o
>      CC [M]  .module-common.o
>      LD [M]  helloworld.ko
>    make[1]: Leaving directory '/path/to/my/externel/module'
>    make: Leaving directory '/path/to/my/linux'
>
> Printing "Entering directory" twice is cumbersome. This will be
> addressed later.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Introduce a new 'srcroot' variable and clean-up code
>   - Reword Documentation/dev-tools/coccinelle.rst
>
>   Documentation/dev-tools/coccinelle.rst | 20 ++-----
>   Documentation/kbuild/makefiles.rst     | 14 +++++
>   Makefile                               | 80 +++++++++++++++-----------
>   rust/Makefile                          |  4 +-
>   scripts/Makefile.build                 |  2 +-
>   scripts/Makefile.clean                 |  2 +-
>   scripts/Makefile.compiler              |  2 +-
>   scripts/Makefile.modpost               |  6 +-
>   scripts/coccicheck                     |  6 +-
>   scripts/nsdeps                         |  8 +--
>   scripts/package/install-extmod-build   |  7 +++
>   11 files changed, 85 insertions(+), 66 deletions(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-=
tools/coccinelle.rst
> index 535ce126fb4f..6e70a1e9a3c0 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -250,25 +250,17 @@ variables for .cocciconfig is as follows:
>   - Your directory from which spatch is called is processed next
>   - The directory provided with the ``--dir`` option is processed last, =
if used
>
> -Since coccicheck runs through make, it naturally runs from the kernel
> -proper dir; as such the second rule above would be implied for picking =
up a
> -.cocciconfig when using ``make coccicheck``.
> -
>   ``make coccicheck`` also supports using M=3D targets. If you do not su=
pply
>   any M=3D target, it is assumed you want to target the entire kernel.
>   The kernel coccicheck script has::
>
> -    if [ "$KBUILD_EXTMOD" =3D "" ] ; then
> -        OPTIONS=3D"--dir $srctree $COCCIINCLUDE"
> -    else
> -        OPTIONS=3D"--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> -    fi
> +    OPTIONS=3D"--dir $srcroot $COCCIINCLUDE"
>
> -KBUILD_EXTMOD is set when an explicit target with M=3D is used. For bot=
h cases
> -the spatch ``--dir`` argument is used, as such third rule applies when =
whether
> -M=3D is used or not, and when M=3D is used the target directory can hav=
e its own
> -.cocciconfig file. When M=3D is not passed as an argument to coccicheck=
 the
> -target directory is the same as the directory from where spatch was cal=
led.
> +Here, $srcroot refers to the source directory of the target: it points =
to the
> +external module's source directory when M=3D used, and otherwise, to th=
e kernel
> +source directory. The third rule ensures the spatch reads the .coccicon=
fig from
> +the target directory, allowing external modules to have their own .cocc=
iconfig
> +file.
>
>   If not using the kernel's coccicheck target, keep the above precedence
>   order logic of .cocciconfig reading. If using the kernel's coccicheck =
target,
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/m=
akefiles.rst
> index 7964e0c245ae..d36519f194dc 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -449,6 +449,20 @@ $(obj)
>     to prerequisites are referenced with $(src) (because they are not
>     generated files).
>
> +$(srcroot)
> +  $(srcroot) refers to the root of the source you are building, which c=
an be
> +  either the kernel source or the external modules source, depending on=
 whether
> +  KBUILD_EXTMOD is set. This can be either a relative or an absolute pa=
th, but
> +  if KBUILD_ABS_SRCTREE=3D1 is set, it is always an absolute path.
> +
> +$(srctree)
> +  $(srctree) refers to the root of the kernel source tree. When buildin=
g the
> +  kernel, this is the same as $(srcroot).
> +
> +$(objtree)
> +  $(objtree) refers to the root of the kernel object tree. It is ``.`` =
when
> +  building the kernel, but it is different when building external modul=
es.
> +
>   $(kecho)
>     echoing information to user in a rule is often a good practice
>     but when execution ``make -s`` one does not expect to see any output
> diff --git a/Makefile b/Makefile
> index cf1d55560ae2..e5f7ac7647a7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -180,7 +180,24 @@ ifeq ("$(origin O)", "command line")
>     KBUILD_OUTPUT :=3D $(O)
>   endif
>
> -output :=3D $(KBUILD_OUTPUT)
> +ifdef KBUILD_EXTMOD
> +    ifdef KBUILD_OUTPUT
> +        objtree :=3D $(realpath $(KBUILD_OUTPUT))
> +        $(if $(objtree),,$(error specified kernel directory "$(KBUILD_O=
UTPUT)" does not exist))
> +    else
> +        objtree :=3D $(CURDIR)
> +    endif
> +    output :=3D $(KBUILD_EXTMOD)
> +    # KBUILD_EXTMOD might be a relative path. Remember its absolute pat=
h before
> +    # Make changes the working directory.
> +    srcroot :=3D $(realpath $(KBUILD_EXTMOD))
> +    $(if $(srcroot),,$(error specified external module directory "$(KBU=
ILD_EXTMOD)" does not exist))
> +else
> +    objtree :=3D .
> +    output :=3D $(KBUILD_OUTPUT)
> +endif
> +
> +export objtree srcroot
>
>   # Do we want to change the working directory?
>   ifneq ($(output),)
> @@ -230,35 +247,33 @@ else # need-sub-make
>
>   # We process the rest of the Makefile if this is the final invocation =
of make
>
> -ifeq ($(abs_srctree),$(CURDIR))
> -        # building in the source tree
> -        srctree :=3D .
> -	building_out_of_srctree :=3D
> +ifndef KBUILD_EXTMOD
> +srcroot :=3D $(abs_srctree)
> +endif
> +
> +ifeq ($(srcroot),$(CURDIR))
> +building_out_of_srctree :=3D
>   else
> -        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
> -                # building in a subdirectory of the source tree
> -                srctree :=3D ..
> -        else
> -                srctree :=3D $(abs_srctree)
> -        endif
> -	building_out_of_srctree :=3D 1
> +export building_out_of_srctree :=3D1
>   endif
>
> -ifneq ($(KBUILD_ABS_SRCTREE),)
> -srctree :=3D $(abs_srctree)
> +ifdef KBUILD_ABS_SRCTREE
> +    # Do not nothing. Use the absolute path.
> +else ifeq ($(srcroot),$(CURDIR))
> +    # Building in the source.
> +    srcroot :=3D .
> +else ifeq ($(srcroot)/,$(dir $(CURDIR)))
> +    # Building in a subdirectory of the source.
> +    srcroot :=3D ..
>   endif
>
> -objtree		:=3D .
> +export srctree :=3D $(if $(KBUILD_EXTMOD),$(abs_srctree),$(srcroot))
>
> -VPATH		:=3D
> -
> -ifeq ($(KBUILD_EXTMOD),)
>   ifdef building_out_of_srctree
> -VPATH		:=3D $(srctree)
> +export VPATH :=3D $(srcroot)
> +else
> +VPATH :=3D
>   endif
> -endif
> -
> -export building_out_of_srctree srctree objtree VPATH
>
>   # To make sure we do not include .config for any of the *config target=
s
>   # catch them early, and hand them over to scripts/kconfig/Makefile
> @@ -711,7 +726,7 @@ endif
>   # in addition to whatever we do anyway.
>   # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all modules nsdeps %compile_commands.json clang-%,$(MAK=
ECMDGOALS)),)
> +ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKE=
CMDGOALS)),)
>     KBUILD_MODULES :=3D 1
>   endif
>
> @@ -1107,7 +1122,7 @@ export MODLIB
>
>   PHONY +=3D prepare0
>
> -export extmod_prefix =3D $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> +export extmod_prefix =3D
>   export MODORDER :=3D $(extmod_prefix)modules.order
>   export MODULES_NSDEPS :=3D $(extmod_prefix)modules.nsdeps
>
> @@ -1799,14 +1814,10 @@ filechk_kernel.release =3D echo $(KERNELRELEASE)
>   KBUILD_BUILTIN :=3D
>   KBUILD_MODULES :=3D 1
>
> -build-dir :=3D $(KBUILD_EXTMOD)
> +build-dir :=3D .
>
> -compile_commands.json: $(extmod_prefix)compile_commands.json
> -PHONY +=3D compile_commands.json
> -
> -clean-dirs :=3D $(KBUILD_EXTMOD)
> -clean: private rm-files :=3D $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_E=
XTMOD)/modules.nsdeps \
> -	$(KBUILD_EXTMOD)/compile_commands.json
> +clean-dirs :=3D .
> +clean: private rm-files :=3D Module.symvers modules.nsdeps compile_comm=
ands.json
>
>   PHONY +=3D prepare
>   # now expand this into a simple variable to reduce the cost of shell e=
valuations
> @@ -1948,7 +1959,7 @@ $(clean-dirs):
>
>   clean: $(clean-dirs)
>   	$(call cmd,rmfiles)
> -	@find $(or $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
> +	@find . $(RCS_FIND_IGNORE) \
>   		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cm=
d' \
>   		-o -name '*.ko.*' \
>   		-o -name '*.dtb' -o -name '*.dtbo' \
> @@ -1981,7 +1992,12 @@ tags TAGS cscope gtags: FORCE
>   PHONY +=3D rust-analyzer
>   rust-analyzer:
>   	+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
> +ifdef KBUILD_EXTMOD
> +# FIXME: external modules must not descend into a sub-directory of the =
kernel
> +	$(Q)$(MAKE) $(build)=3D$(objtree)/rust src=3D$(srctree)/rust $@
> +else
>   	$(Q)$(MAKE) $(build)=3Drust $@
> +endif
>
>   # Script to generate missing namespace dependencies
>   # --------------------------------------------------------------------=
-------
> diff --git a/rust/Makefile b/rust/Makefile
> index b5e0a73b78f3..742740816c4b 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -362,8 +362,8 @@ rust-analyzer:
>   	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
>   		--cfgs=3D'core=3D$(core-cfgs)' --cfgs=3D'alloc=3D$(alloc-cfgs)' \
>   		$(realpath $(srctree)) $(realpath $(objtree)) \
> -		$(rustc_sysroot) $(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
> -		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
> +		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
> +		> rust-project.json
>
>   redirect-intrinsics =3D \
>   	__addsf3 __eqsf2 __extendsfdf2 __gesf2 __lesf2 __ltsf2 __mulsf3 __nes=
f2 __truncdfsf2 __unordsf2 \
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 64cd046f8fd8..1aa928a6fb4f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -3,7 +3,7 @@
>   # Building
>   # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> -src :=3D $(if $(VPATH),$(VPATH)/)$(obj)
> +src :=3D $(srcroot)/$(obj)
>
>   PHONY :=3D $(obj)/
>   $(obj)/:
> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> index 4fcfab40ed61..6ead00ec7313 100644
> --- a/scripts/Makefile.clean
> +++ b/scripts/Makefile.clean
> @@ -3,7 +3,7 @@
>   # Cleaning up
>   # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> -src :=3D $(if $(VPATH),$(VPATH)/)$(obj)
> +src :=3D $(srcroot)/$(obj)
>
>   PHONY :=3D __clean
>   __clean:
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index e0842496d26e..8c1029687e2e 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -13,7 +13,7 @@ cc-cross-prefix =3D $(firstword $(foreach c, $(1), \
>   			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
>
>   # output directory for tests below
> -TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$=
$$
> +TMPOUT =3D .tmp_$$$$
>
>   # try-run
>   # Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,other=
wise)
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 12e7c15d099c..78d2ca4f25f5 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -111,13 +111,13 @@ endif
>   else
>
>   # set src + obj - they may be used in the modules's Makefile
> -obj :=3D $(KBUILD_EXTMOD)
> -src :=3D $(if $(VPATH),$(VPATH)/)$(obj)
> +obj :=3D .
> +src :=3D $(srcroot)
>
>   # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>   include $(kbuild-file)
>
> -output-symdump :=3D $(KBUILD_EXTMOD)/Module.symvers
> +output-symdump :=3D Module.symvers
>
>   ifeq ($(wildcard $(objtree)/Module.symvers),)
>   missing-input :=3D $(objtree)/Module.symvers
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index e52cb43fede6..0e6bc5a10320 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -80,11 +80,7 @@ command results in a shift count error.'
>       NPROC=3D1
>   else
>       ONLINE=3D0
> -    if [ "$KBUILD_EXTMOD" =3D "" ] ; then
> -        OPTIONS=3D"--dir $srctree $COCCIINCLUDE"
> -    else
> -        OPTIONS=3D"--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> -    fi
> +    OPTIONS=3D"--dir $srcroot $COCCIINCLUDE"
>
>       # Use only one thread per core by default if hyperthreading is ena=
bled
>       THREADS_PER_CORE=3D$(LANG=3DC lscpu | grep "Thread(s) per core: " =
| tr -cd "[:digit:]")
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> index f1718cc0d700..8ca12e2b5c03 100644
> --- a/scripts/nsdeps
> +++ b/scripts/nsdeps
> @@ -19,12 +19,6 @@ if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERS=
ION"; } | sort -CV ; then
>   	exit 1
>   fi
>
> -if [ "$KBUILD_EXTMOD" ]; then
> -	src_prefix=3D
> -else
> -	src_prefix=3D$srctree/
> -fi
> -
>   generate_deps_for_ns() {
>   	$SPATCH --very-quiet --in-place --sp-file \
>   		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=
=3D$1 $2
> @@ -34,7 +28,7 @@ generate_deps() {
>   	local mod=3D${1%.ko:}
>   	shift
>   	local namespaces=3D"$*"
> -	local mod_source_files=3D$(sed "s|^\(.*\)\.o$|${src_prefix}\1.c|" $mod=
.mod)
> +	local mod_source_files=3D$(sed "s|^\(.*\)\.o$|${srcroot}/\1.c|" $mod.m=
od)
>
>   	for ns in $namespaces; do
>   		echo "Adding namespace $ns to module $mod.ko."
> diff --git a/scripts/package/install-extmod-build b/scripts/package/inst=
all-extmod-build
> index 7ec1f061a519..64d958ee45f3 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -51,6 +51,13 @@ mkdir -p "${destdir}"
>   if [ "${CC}" !=3D "${HOSTCC}" ]; then
>   	echo "Rebuilding host programs with ${CC}..."
>
> +	# This leverages external module building.
> +	# - Clear sub_make_done to allow the top-level Makefile to redo sub-ma=
ke.
> +	# - Filter out --no-print-directory to print "Entering directory" logs
> +	#   when Make changes the working directory.
> +	unset sub_make_done
> +	MAKEFLAGS=3D$(echo "${MAKEFLAGS}" | sed s/--no-print-directory//)
> +
>   	cat <<-'EOF' >  "${destdir}/Kbuild"
>   	subdir-y :=3D scripts
>   	EOF


