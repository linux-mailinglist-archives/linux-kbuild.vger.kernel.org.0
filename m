Return-Path: <linux-kbuild+bounces-4704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A19D16B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 18:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6827B246EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 17:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5941BD4E2;
	Mon, 18 Nov 2024 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvPyIokS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9818B47E;
	Mon, 18 Nov 2024 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731949363; cv=none; b=XFaIeAvZzk+I3yCJJWyjsRPhBCwCBrP74wk2etOc907PjDdmYcPH5BCel5/sAR4a31mI6b0C+lXXKVDl3RryPrRwXTqtAY4Uq9I+4uQdfvJhQ7WNcLYmB3oc+hcQ4ntFq5OGYVr29XcKDeotryjqHMsgfmqJVZJtGzJfRmvbXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731949363; c=relaxed/simple;
	bh=6uU3qeWUrQgIC8hoTBHlwCN3jHJLvKONTL8T4W4b/rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3gBlN3QHaGwj0DtM5+sth3jsk/AHwGY4fSxJYU9naQU/qxGwaWp7exRcYtgAJU/2cKQcVbNEoLw23QlGjVhb2iMRx+5klBNrxOgJPSSDYIg1s5T1gV1iLQbJUjtrhrMQQlt2kRsn6nDL7GmDgL7eRSMnkSfcLCkD8th8d0Wf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvPyIokS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2212DC4CECC;
	Mon, 18 Nov 2024 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731949363;
	bh=6uU3qeWUrQgIC8hoTBHlwCN3jHJLvKONTL8T4W4b/rA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mvPyIokSH/sa4foQL8SXErsQHRcLYVF7FBe5LI5ZsHAG0WS1lBU2yQhlekIYuz0cd
	 VDBlQVqLuPrjXLmvTSvvGfXkirnnAlfAXoYGP+Lrp95wEIvmzGJ8ePZ/ZRJ57FlyT7
	 noE/LUqxGH8IB9rRFoiDdslwBXF4jd1ilqS+9OdyVVYtpVwbum3zDTTNlmuGyY9eug
	 TKFFCLK+CoJH5ZXXvuTdJ7RQRz0kl4m19ZxFLH86PF+/rETwz532dndYWi4hsY7zgn
	 kC30IwevFv5OOTE9Zjec+T9CT9+Cq3kX1JkvRKnifsN4YEuSsngp/4FhFNNzCQZsqR
	 vOt3Xh0VTRqPw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53da353eb2eso3206286e87.3;
        Mon, 18 Nov 2024 09:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhpa2pyr6pRihWMM6gagwGPktHyG3CEFspStVTpoWy7FLrfdaHNStMa4OhSUEQHSRfTseh1ZmtftHt/bQ=@vger.kernel.org, AJvYcCXSFzefS2wFuwuvm9SrVN62lZRXMVxc4Ok/xD4nnH8MOhNB47ZIjC8lp8h79t48RDwtCd0ynhOEq+0H7NixDFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcqLXgLo7zh+og6tysKj0BB0lc2QwPDKrowyLDmDPBlvQrziu
	1+Lv2W4dyLw5oLqljtGVwGh2BdI2SW1g6iMp47BRA9RgSSMw6j2w8ICJbb1bXZe/R7PGgIDMrvm
	rls1hgwssLjsE6S4cB7bxiaOE2bc=
X-Google-Smtp-Source: AGHT+IHBAPTsXiOHJ2mPXQyIzCUWtagYGH5APYGWenfco8rRysZHH+4SoZK4R1lUx6SQUfS/FnsDshIQKbUAhGvK7U4=
X-Received: by 2002:a05:6512:3c9c:b0:53d:a2da:d396 with SMTP id
 2adb3069b0e04-53dab2a6441mr7069883e87.23.1731949361488; Mon, 18 Nov 2024
 09:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <20241118-dazzling-gifted-bettong-133eb7@buildd>
In-Reply-To: <20241118-dazzling-gifted-bettong-133eb7@buildd>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 19 Nov 2024 02:02:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATomVVvxHgy=e7rwq7EPgP7Z2UUERkyDJGQe63n6BuW3Q@mail.gmail.com>
Message-ID: <CAK7LNATomVVvxHgy=e7rwq7EPgP7Z2UUERkyDJGQe63n6BuW3Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 11:47=E2=80=AFPM Nicolas Schier <n.schier@avm.de> w=
rote:
>
> On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
> > Currently, Kbuild always operates in the output directory of the kernel=
,
> > even when building external modules. This increases the risk of externa=
l
> > module Makefiles attempting to write to the kernel directory.
> >
> > This commit switches the working directory to the external module
> > directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> > some build artifacts.
> >
> > The command for building external modules maintains backward
> > compatibility, but Makefiles that rely on working in the kernel
> > directory may break. In such cases, $(objtree) and $(srctree) should
> > be used to refer to the output and source directories of the kernel.
> >
> > The appearance of the build log will change as follows:
> >
> > [Before]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >     CC [M]  /path/to/my/externel/module/helloworld.o
> >     MODPOST /path/to/my/externel/module/Module.symvers
> >     CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >     CC [M]  /path/to/my/externel/module/.module-common.o
> >     LD [M]  /path/to/my/externel/module/helloworld.ko
> >   make: Leaving directory '/path/to/my/linux'
> >
> > [After]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >   make[1]: Entering directory '/path/to/my/externel/module'
> >     CC [M]  helloworld.o
> >     MODPOST Module.symvers
> >     CC [M]  helloworld.mod.o
> >     CC [M]  .module-common.o
> >     LD [M]  helloworld.ko
> >   make[1]: Leaving directory '/path/to/my/externel/module'
> >   make: Leaving directory '/path/to/my/linux'
> >
> > Printing "Entering directory" twice is cumbersome. This will be
> > addressed later.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >  - Introduce a new 'srcroot' variable and clean-up code
> >  - Reword Documentation/dev-tools/coccinelle.rst
> >
> >  Documentation/dev-tools/coccinelle.rst | 20 ++-----
> >  Documentation/kbuild/makefiles.rst     | 14 +++++
> >  Makefile                               | 80 +++++++++++++++-----------
> >  rust/Makefile                          |  4 +-
> >  scripts/Makefile.build                 |  2 +-
> >  scripts/Makefile.clean                 |  2 +-
> >  scripts/Makefile.compiler              |  2 +-
> >  scripts/Makefile.modpost               |  6 +-
> >  scripts/coccicheck                     |  6 +-
> >  scripts/nsdeps                         |  8 +--
> >  scripts/package/install-extmod-build   |  7 +++
> >  11 files changed, 85 insertions(+), 66 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev=
-tools/coccinelle.rst
> > index 535ce126fb4f..6e70a1e9a3c0 100644
> > --- a/Documentation/dev-tools/coccinelle.rst
> > +++ b/Documentation/dev-tools/coccinelle.rst
> > @@ -250,25 +250,17 @@ variables for .cocciconfig is as follows:
> >  - Your directory from which spatch is called is processed next
> >  - The directory provided with the ``--dir`` option is processed last, =
if used
> >
> > -Since coccicheck runs through make, it naturally runs from the kernel
> > -proper dir; as such the second rule above would be implied for picking=
 up a
> > -.cocciconfig when using ``make coccicheck``.
> > -
> >  ``make coccicheck`` also supports using M=3D targets. If you do not su=
pply
> >  any M=3D target, it is assumed you want to target the entire kernel.
> >  The kernel coccicheck script has::
> >
> > -    if [ "$KBUILD_EXTMOD" =3D "" ] ; then
> > -        OPTIONS=3D"--dir $srctree $COCCIINCLUDE"
> > -    else
> > -        OPTIONS=3D"--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> > -    fi
> > +    OPTIONS=3D"--dir $srcroot $COCCIINCLUDE"
> >
> > -KBUILD_EXTMOD is set when an explicit target with M=3D is used. For bo=
th cases
> > -the spatch ``--dir`` argument is used, as such third rule applies when=
 whether
> > -M=3D is used or not, and when M=3D is used the target directory can ha=
ve its own
> > -.cocciconfig file. When M=3D is not passed as an argument to coccichec=
k the
> > -target directory is the same as the directory from where spatch was ca=
lled.
> > +Here, $srcroot refers to the source directory of the target: it points=
 to the
> > +external module's source directory when M=3D used, and otherwise, to t=
he kernel
> > +source directory. The third rule ensures the spatch reads the .coccico=
nfig from
> > +the target directory, allowing external modules to have their own .coc=
ciconfig
> > +file.
> >
> >  If not using the kernel's coccicheck target, keep the above precedence
> >  order logic of .cocciconfig reading. If using the kernel's coccicheck =
target,
> > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/=
makefiles.rst
> > index 7964e0c245ae..d36519f194dc 100644
> > --- a/Documentation/kbuild/makefiles.rst
> > +++ b/Documentation/kbuild/makefiles.rst
> > @@ -449,6 +449,20 @@ $(obj)
> >    to prerequisites are referenced with $(src) (because they are not
> >    generated files).
> >
> > +$(srcroot)
> > +  $(srcroot) refers to the root of the source you are building, which =
can be
> > +  either the kernel source or the external modules source, depending o=
n whether
> > +  KBUILD_EXTMOD is set. This can be either a relative or an absolute p=
ath, but
> > +  if KBUILD_ABS_SRCTREE=3D1 is set, it is always an absolute path.
> > +
> > +$(srctree)
> > +  $(srctree) refers to the root of the kernel source tree. When buildi=
ng the
> > +  kernel, this is the same as $(srcroot).
> > +
> > +$(objtree)
> > +  $(objtree) refers to the root of the kernel object tree. It is ``.``=
 when
> > +  building the kernel, but it is different when building external modu=
les.
> > +
>
> Thanks, I think it's nice that there is now such a clear definition.
> $(srcroot) sounds fine to me.
>
> >  $(kecho)
> >    echoing information to user in a rule is often a good practice
> >    but when execution ``make -s`` one does not expect to see any output
> > diff --git a/Makefile b/Makefile
> > index cf1d55560ae2..e5f7ac7647a7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -180,7 +180,24 @@ ifeq ("$(origin O)", "command line")
> >    KBUILD_OUTPUT :=3D $(O)
> >  endif
> >
> > -output :=3D $(KBUILD_OUTPUT)
> > +ifdef KBUILD_EXTMOD
> > +    ifdef KBUILD_OUTPUT
> > +        objtree :=3D $(realpath $(KBUILD_OUTPUT))
> > +        $(if $(objtree),,$(error specified kernel directory "$(KBUILD_=
OUTPUT)" does not exist))
> > +    else
> > +        objtree :=3D $(CURDIR)
> > +    endif
> > +    output :=3D $(KBUILD_EXTMOD)
> > +    # KBUILD_EXTMOD might be a relative path. Remember its absolute pa=
th before
> > +    # Make changes the working directory.
> > +    srcroot :=3D $(realpath $(KBUILD_EXTMOD))
> > +    $(if $(srcroot),,$(error specified external module directory "$(KB=
UILD_EXTMOD)" does not exist))
> > +else
> > +    objtree :=3D .
> > +    output :=3D $(KBUILD_OUTPUT)
> > +endif
> > +
> > +export objtree srcroot
> >
> >  # Do we want to change the working directory?
> >  ifneq ($(output),)
> > @@ -230,35 +247,33 @@ else # need-sub-make
> >
> >  # We process the rest of the Makefile if this is the final invocation =
of make
> >
> > -ifeq ($(abs_srctree),$(CURDIR))
> > -        # building in the source tree
> > -        srctree :=3D .
> > -     building_out_of_srctree :=3D
> > +ifndef KBUILD_EXTMOD
> > +srcroot :=3D $(abs_srctree)
> > +endif
> > +
> > +ifeq ($(srcroot),$(CURDIR))
> > +building_out_of_srctree :=3D
> >  else
> > -        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
> > -                # building in a subdirectory of the source tree
> > -                srctree :=3D ..
> > -        else
> > -                srctree :=3D $(abs_srctree)
> > -        endif
> > -     building_out_of_srctree :=3D 1
> > +export building_out_of_srctree :=3D1
> >  endif
> >
> > -ifneq ($(KBUILD_ABS_SRCTREE),)
> > -srctree :=3D $(abs_srctree)
> > +ifdef KBUILD_ABS_SRCTREE
> > +    # Do not nothing. Use the absolute path.
> > +else ifeq ($(srcroot),$(CURDIR))
> > +    # Building in the source.
> > +    srcroot :=3D .
> > +else ifeq ($(srcroot)/,$(dir $(CURDIR)))
> > +    # Building in a subdirectory of the source.
> > +    srcroot :=3D ..
> >  endif
> >
> > -objtree              :=3D .
> > +export srctree :=3D $(if $(KBUILD_EXTMOD),$(abs_srctree),$(srcroot))
>
> With this patch applied, the following breaks for me:
>
>     $ make O=3Dbuild M=3Dfs/btrfs CONFIG_BTRFS_FS=3Dm
>     make[1]: Entering directory '/data/linux/kbuild-review/fs/btrfs'
>       CC [M]  super.o
>     In file included from <command-line>:
>     /data/linux/kbuild-review/include/linux/compiler_types.h:89:10: fatal=
 error: linux/compiler_attributes.h: No such file or directory
>        89 | #include <linux/compiler_attributes.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     compilation terminated.
>
> Adding 'ccflags-y +=3D -I$(srctree)/include' to fs/btrfs/Makefile breaks
> the build loudly.  I could make it build again with
>
> diff --git a/Makefile b/Makefile
> index e5f7ac7647a7b..3d95911f1a68f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -555,7 +555,7 @@ USERINCLUDE    :=3D \
>  LINUXINCLUDE    :=3D \
>                 -I$(srctree)/arch/$(SRCARCH)/include \
>                 -I$(objtree)/arch/$(SRCARCH)/include/generated \
> -               $(if $(building_out_of_srctree),-I$(srctree)/include) \
> +               $(if $(or $(building_out_of_srctree),$(filter $(srctree)/=
%, $(CURDIR))),-I$(srctree)/include) \
>                 -I$(objtree)/include \
>                 $(USERINCLUDE)
>
> but this does not feel good.  It building in-tree modules in this way a
> valid thing to do?

Yes, it is a valid way.

This got broken with this commit, and fixed by the later commit,
"kbuild: support building external modules in a separate build directory".

I will move the change for LINUXINCLUDE to this commit.

Thanks for comprehensive testing!

--=20
Best Regards
Masahiro Yamada

