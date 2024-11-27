Return-Path: <linux-kbuild+bounces-4902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6C9DAFC7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 00:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEBE21644B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D38192D76;
	Wed, 27 Nov 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMedw67I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA51433C8;
	Wed, 27 Nov 2024 23:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749365; cv=none; b=g29YWz1lIYoy/38t4li7/I1oAH9EJwfkx5bLQjWEqz7ihANtuyKHSOaeXhQRr2jiHZi0rIP339aRAuVlIKfj/a7uL4tnXzuZkOcxuWi2wJ4pDZJlvpmdyUNFnQj82EcKBf/22ZW0JXO6I36qOSGu7VritdaIUxmd5C20hQtMkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749365; c=relaxed/simple;
	bh=6Qu8uz2fjJ8iZDLh3BxDKj48BBZNQb8qilSVdb8Tki8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8572oB+FGOcNK6r2JBJ5HM8tcxWlk6un79/VMMRv+ikXONJJvq3fEO0bvttK6n27MBEN5gpyg1sUEe37BKeflgHDphj6r6um4VUR1GJCw8CVlZKIEFve6H+bIk1Qagxd7PziirpDgymK2xqRivJhG2S6EzYDa87fydmoV1kolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMedw67I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98496C4CECC;
	Wed, 27 Nov 2024 23:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732749364;
	bh=6Qu8uz2fjJ8iZDLh3BxDKj48BBZNQb8qilSVdb8Tki8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MMedw67Is8BjeF2fb0WoMSDFzZCeWmp6Vbpkb7p2BGIOVy6rMvlZNKKYTLPU/LGRs
	 55pdufL8AJR8lza9cmnNMbGR1JNtl2x0/eZRh94bC5Jn6hmlNzsYBqpveJ/53u/N14
	 +JTJR0+sI9vcUG81a18A2+0RVeeCC6UR8BGHpdcdZDEo42EMQImEdvJVgGG0oMnTP9
	 PLw7A+lvA5lTZ8U1SUTS5zxp1iObfK6u46wDH8BT+nVwegDCHK3/GuJJtFnpnks/Vh
	 ZD+JEeUtTX6cp/AfdkG60JhkeXkiWMmQVjW09d6zvBK56sxOiyXu/yjBf1Z6fV2MKv
	 vIDVmX2AmiKCw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so233226e87.1;
        Wed, 27 Nov 2024 15:16:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTpzctG2cVhtuilrWt5utOtkbvCsMlICtjo1Bm8xCNd3gV0Ns2iF4ADVuFggoZ18JoEk7UyftEj+QqK10wKNQ=@vger.kernel.org, AJvYcCUZfXtNXybSaT7VvQLmrFBXl/wijsXSwxboCgocP6i59La3uCw3Nr3MJvU5Tm4Md2UW6RLdyl5ogSKy+EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXS3amPoHw2IQN5D4G2wqF2wk6Sd3JPuHPnlDU0988Mnmvm1PP
	by1NEUkfSmVBzNErzNQx3l4NIjYUNsx10kl23pv4A31RE5zLvtD/GemEICAez+ijDDGCrU1xn6S
	n/p9f/bfzVGXBjHCe72mAG57Ka/k=
X-Google-Smtp-Source: AGHT+IEyHrrQl9hSawuoz0PS/8OAj87EVIxpEAzyG91hApou/NM0qZq5mVbPvsbR4lHlrb58foootrE9HBCMQu5cAyE=
X-Received: by 2002:a05:6512:400f:b0:53d:a93c:649e with SMTP id
 2adb3069b0e04-53df0109024mr3254947e87.35.1732749363227; Wed, 27 Nov 2024
 15:16:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <20241118-dazzling-gifted-bettong-133eb7@buildd> <CAK7LNATomVVvxHgy=e7rwq7EPgP7Z2UUERkyDJGQe63n6BuW3Q@mail.gmail.com>
 <20241127-maize-hippo-of-innovation-ad1c54@buildd>
In-Reply-To: <20241127-maize-hippo-of-innovation-ad1c54@buildd>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 08:15:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5zkcFwLpbLxKa2C_RFCOHmTZsRi-DPEmR7Rc2uXCPCg@mail.gmail.com>
Message-ID: <CAK7LNAQ5zkcFwLpbLxKa2C_RFCOHmTZsRi-DPEmR7Rc2uXCPCg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 12:29=E2=80=AFAM Nicolas Schier <n.schier@avm.de> w=
rote:
>
> On Tue, Nov 19, 2024 at 02:02:05AM +0900, Masahiro Yamada wrote:
> > On Mon, Nov 18, 2024 at 11:47=E2=80=AFPM Nicolas Schier <n.schier@avm.d=
e> wrote:
> > >
> > > On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
> > > > Currently, Kbuild always operates in the output directory of the ke=
rnel,
> > > > even when building external modules. This increases the risk of ext=
ernal
> > > > module Makefiles attempting to write to the kernel directory.
> > > >
> > > > This commit switches the working directory to the external module
> > > > directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix fro=
m
> > > > some build artifacts.
> > > >
> > > > The command for building external modules maintains backward
> > > > compatibility, but Makefiles that rely on working in the kernel
> > > > directory may break. In such cases, $(objtree) and $(srctree) shoul=
d
> > > > be used to refer to the output and source directories of the kernel=
.
> > > >
> > > > The appearance of the build log will change as follows:
> > > >
> > > > [Before]
> > > >
> > > >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> > > >   make: Entering directory '/path/to/my/linux'
> > > >     CC [M]  /path/to/my/externel/module/helloworld.o
> > > >     MODPOST /path/to/my/externel/module/Module.symvers
> > > >     CC [M]  /path/to/my/externel/module/helloworld.mod.o
> > > >     CC [M]  /path/to/my/externel/module/.module-common.o
> > > >     LD [M]  /path/to/my/externel/module/helloworld.ko
> > > >   make: Leaving directory '/path/to/my/linux'
> > > >
> > > > [After]
> > > >
> > > >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> > > >   make: Entering directory '/path/to/my/linux'
> > > >   make[1]: Entering directory '/path/to/my/externel/module'
> > > >     CC [M]  helloworld.o
> > > >     MODPOST Module.symvers
> > > >     CC [M]  helloworld.mod.o
> > > >     CC [M]  .module-common.o
> > > >     LD [M]  helloworld.ko
> > > >   make[1]: Leaving directory '/path/to/my/externel/module'
> > > >   make: Leaving directory '/path/to/my/linux'
> > > >
> > > > Printing "Entering directory" twice is cumbersome. This will be
> > > > addressed later.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > >  - Introduce a new 'srcroot' variable and clean-up code
> > > >  - Reword Documentation/dev-tools/coccinelle.rst
> > > >
> > > >  Documentation/dev-tools/coccinelle.rst | 20 ++-----
> > > >  Documentation/kbuild/makefiles.rst     | 14 +++++
> > > >  Makefile                               | 80 +++++++++++++++-------=
----
> > > >  rust/Makefile                          |  4 +-
> > > >  scripts/Makefile.build                 |  2 +-
> > > >  scripts/Makefile.clean                 |  2 +-
> > > >  scripts/Makefile.compiler              |  2 +-
> > > >  scripts/Makefile.modpost               |  6 +-
> > > >  scripts/coccicheck                     |  6 +-
> > > >  scripts/nsdeps                         |  8 +--
> > > >  scripts/package/install-extmod-build   |  7 +++
> > > >  11 files changed, 85 insertions(+), 66 deletions(-)
> > > >
> > > > diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation=
/dev-tools/coccinelle.rst
> > > > index 535ce126fb4f..6e70a1e9a3c0 100644
> > > > --- a/Documentation/dev-tools/coccinelle.rst
> > > > +++ b/Documentation/dev-tools/coccinelle.rst
> > > > @@ -250,25 +250,17 @@ variables for .cocciconfig is as follows:
> > > >  - Your directory from which spatch is called is processed next
> > > >  - The directory provided with the ``--dir`` option is processed la=
st, if used
> > > >
> > > > -Since coccicheck runs through make, it naturally runs from the ker=
nel
> > > > -proper dir; as such the second rule above would be implied for pic=
king up a
> > > > -.cocciconfig when using ``make coccicheck``.
> > > > -
> > > >  ``make coccicheck`` also supports using M=3D targets. If you do no=
t supply
> > > >  any M=3D target, it is assumed you want to target the entire kerne=
l.
> > > >  The kernel coccicheck script has::
> > > >
> > > > -    if [ "$KBUILD_EXTMOD" =3D "" ] ; then
> > > > -        OPTIONS=3D"--dir $srctree $COCCIINCLUDE"
> > > > -    else
> > > > -        OPTIONS=3D"--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> > > > -    fi
> > > > +    OPTIONS=3D"--dir $srcroot $COCCIINCLUDE"
> > > >
> > > > -KBUILD_EXTMOD is set when an explicit target with M=3D is used. Fo=
r both cases
> > > > -the spatch ``--dir`` argument is used, as such third rule applies =
when whether
> > > > -M=3D is used or not, and when M=3D is used the target directory ca=
n have its own
> > > > -.cocciconfig file. When M=3D is not passed as an argument to cocci=
check the
> > > > -target directory is the same as the directory from where spatch wa=
s called.
> > > > +Here, $srcroot refers to the source directory of the target: it po=
ints to the
> > > > +external module's source directory when M=3D used, and otherwise, =
to the kernel
> > > > +source directory. The third rule ensures the spatch reads the .coc=
ciconfig from
> > > > +the target directory, allowing external modules to have their own =
.cocciconfig
> > > > +file.
> > > >
> > > >  If not using the kernel's coccicheck target, keep the above preced=
ence
> > > >  order logic of .cocciconfig reading. If using the kernel's coccich=
eck target,
> > > > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbu=
ild/makefiles.rst
> > > > index 7964e0c245ae..d36519f194dc 100644
> > > > --- a/Documentation/kbuild/makefiles.rst
> > > > +++ b/Documentation/kbuild/makefiles.rst
> > > > @@ -449,6 +449,20 @@ $(obj)
> > > >    to prerequisites are referenced with $(src) (because they are no=
t
> > > >    generated files).
> > > >
> > > > +$(srcroot)
> > > > +  $(srcroot) refers to the root of the source you are building, wh=
ich can be
> > > > +  either the kernel source or the external modules source, dependi=
ng on whether
> > > > +  KBUILD_EXTMOD is set. This can be either a relative or an absolu=
te path, but
> > > > +  if KBUILD_ABS_SRCTREE=3D1 is set, it is always an absolute path.
> > > > +
> > > > +$(srctree)
> > > > +  $(srctree) refers to the root of the kernel source tree. When bu=
ilding the
> > > > +  kernel, this is the same as $(srcroot).
> > > > +
> > > > +$(objtree)
> > > > +  $(objtree) refers to the root of the kernel object tree. It is `=
`.`` when
> > > > +  building the kernel, but it is different when building external =
modules.
> > > > +
> > >
> > > Thanks, I think it's nice that there is now such a clear definition.
> > > $(srcroot) sounds fine to me.
> > >
> > > >  $(kecho)
> > > >    echoing information to user in a rule is often a good practice
> > > >    but when execution ``make -s`` one does not expect to see any ou=
tput
> > > > diff --git a/Makefile b/Makefile
> > > > index cf1d55560ae2..e5f7ac7647a7 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -180,7 +180,24 @@ ifeq ("$(origin O)", "command line")
> > > >    KBUILD_OUTPUT :=3D $(O)
> > > >  endif
> > > >
> > > > -output :=3D $(KBUILD_OUTPUT)
> > > > +ifdef KBUILD_EXTMOD
> > > > +    ifdef KBUILD_OUTPUT
> > > > +        objtree :=3D $(realpath $(KBUILD_OUTPUT))
> > > > +        $(if $(objtree),,$(error specified kernel directory "$(KBU=
ILD_OUTPUT)" does not exist))
> > > > +    else
> > > > +        objtree :=3D $(CURDIR)
> > > > +    endif
> > > > +    output :=3D $(KBUILD_EXTMOD)
> > > > +    # KBUILD_EXTMOD might be a relative path. Remember its absolut=
e path before
> > > > +    # Make changes the working directory.
> > > > +    srcroot :=3D $(realpath $(KBUILD_EXTMOD))
> > > > +    $(if $(srcroot),,$(error specified external module directory "=
$(KBUILD_EXTMOD)" does not exist))
> > > > +else
> > > > +    objtree :=3D .
> > > > +    output :=3D $(KBUILD_OUTPUT)
> > > > +endif
> > > > +
> > > > +export objtree srcroot
> > > >
> > > >  # Do we want to change the working directory?
> > > >  ifneq ($(output),)
> > > > @@ -230,35 +247,33 @@ else # need-sub-make
> > > >
> > > >  # We process the rest of the Makefile if this is the final invocat=
ion of make
> > > >
> > > > -ifeq ($(abs_srctree),$(CURDIR))
> > > > -        # building in the source tree
> > > > -        srctree :=3D .
> > > > -     building_out_of_srctree :=3D
> > > > +ifndef KBUILD_EXTMOD
> > > > +srcroot :=3D $(abs_srctree)
> > > > +endif
> > > > +
> > > > +ifeq ($(srcroot),$(CURDIR))
> > > > +building_out_of_srctree :=3D
> > > >  else
> > > > -        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
> > > > -                # building in a subdirectory of the source tree
> > > > -                srctree :=3D ..
> > > > -        else
> > > > -                srctree :=3D $(abs_srctree)
> > > > -        endif
> > > > -     building_out_of_srctree :=3D 1
> > > > +export building_out_of_srctree :=3D1
>
> Nit: Adding a space between ':=3D1' for consistency?
>
> > > >  endif
> > > >
> > > > -ifneq ($(KBUILD_ABS_SRCTREE),)
> > > > -srctree :=3D $(abs_srctree)
> > > > +ifdef KBUILD_ABS_SRCTREE
> > > > +    # Do not nothing. Use the absolute path.
>
> Is this a superfluous "not"?
>
> "Do nothing. Use the absolute path."?


Thanks. I folded both.



>
>
> Thanks, again!
>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>

Thanks for the review!


--=20
Best Regards
Masahiro Yamada

