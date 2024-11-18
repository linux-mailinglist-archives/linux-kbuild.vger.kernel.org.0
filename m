Return-Path: <linux-kbuild+bounces-4703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E459D13CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 15:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D9D5B2C726
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 14:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D976B1ABEBA;
	Mon, 18 Nov 2024 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="AoLdfwvD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B31A9B4E;
	Mon, 18 Nov 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941708; cv=none; b=u2OKttOGnEqPQhDlURBeHX3XRea5rAv9Vxrve4/2+sd45OPdI3zidxyk/2lTATkxsAMgFisoV7D0X+r4/wIqD19XofxsB0d8yDmi04r6iqG8zb2GttsbC7j8I9OWZmZoSeSYPluY4U0cAopF0YnPiebRYS6p6s47Ld2jntJ3EFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941708; c=relaxed/simple;
	bh=O1VcKtHxNtdxKa3gZCjgb7ogeAv4PN4jwrhly4wJ1VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpUCERJjOchfsUlRoXi1qiwYzIPznc4w72yWjMfzs01noz8a8xx4KGOg+tzGz2dxz80FUix7QL/Nx7tsnMjQCX240A4J6ICi0s/b0MF2JFPAIIccaNVvbw7gTHtUddYR8jdmuk2+a6nw8LEPtAD1AnP13Soyed1u9VK25cp0MPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=AoLdfwvD; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1731941263; bh=O1VcKtHxNtdxKa3gZCjgb7ogeAv4PN4jwrhly4wJ1VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AoLdfwvDPdlTSCjS5oNEKbT/id9cOOyqz7d1+Psq1s+kfoDomUe+f9SeUBXBQqMjC
	 ap+GpDIznwJr1tj8UHlgXB22n+sUJ4HS4NW5UU7GJG4e4ymk/nNOnbl6Jrcj3lBEmJ
	 uE94HZ9HosCH6FTClcggAtG75RDec+tv9MlAgFOM=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 18 Nov 2024 15:47:43 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id D3F5D80905;
	Mon, 18 Nov 2024 15:47:43 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id C790718CA1A; Mon, 18 Nov 2024 15:47:43 +0100 (CET)
Date: Mon, 18 Nov 2024 15:47:43 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, cocci@inria.fr,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
Message-ID: <20241118-dazzling-gifted-bettong-133eb7@buildd>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241110013649.34903-6-masahiroy@kernel.org>
X-purgate-ID: 149429::1731941263-6E2E1E9C-5DA14DCE/0/0
X-purgate-type: clean
X-purgate-size: 9472
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
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
>   $ make -C /path/to/my/linux M=/path/to/my/externel/module
>   make: Entering directory '/path/to/my/linux'
>     CC [M]  /path/to/my/externel/module/helloworld.o
>     MODPOST /path/to/my/externel/module/Module.symvers
>     CC [M]  /path/to/my/externel/module/helloworld.mod.o
>     CC [M]  /path/to/my/externel/module/.module-common.o
>     LD [M]  /path/to/my/externel/module/helloworld.ko
>   make: Leaving directory '/path/to/my/linux'
> 
> [After]
> 
>   $ make -C /path/to/my/linux M=/path/to/my/externel/module
>   make: Entering directory '/path/to/my/linux'
>   make[1]: Entering directory '/path/to/my/externel/module'
>     CC [M]  helloworld.o
>     MODPOST Module.symvers
>     CC [M]  helloworld.mod.o
>     CC [M]  .module-common.o
>     LD [M]  helloworld.ko
>   make[1]: Leaving directory '/path/to/my/externel/module'
>   make: Leaving directory '/path/to/my/linux'
> 
> Printing "Entering directory" twice is cumbersome. This will be
> addressed later.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>  - Introduce a new 'srcroot' variable and clean-up code
>  - Reword Documentation/dev-tools/coccinelle.rst
> 
>  Documentation/dev-tools/coccinelle.rst | 20 ++-----
>  Documentation/kbuild/makefiles.rst     | 14 +++++
>  Makefile                               | 80 +++++++++++++++-----------
>  rust/Makefile                          |  4 +-
>  scripts/Makefile.build                 |  2 +-
>  scripts/Makefile.clean                 |  2 +-
>  scripts/Makefile.compiler              |  2 +-
>  scripts/Makefile.modpost               |  6 +-
>  scripts/coccicheck                     |  6 +-
>  scripts/nsdeps                         |  8 +--
>  scripts/package/install-extmod-build   |  7 +++
>  11 files changed, 85 insertions(+), 66 deletions(-)
> 
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 535ce126fb4f..6e70a1e9a3c0 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -250,25 +250,17 @@ variables for .cocciconfig is as follows:
>  - Your directory from which spatch is called is processed next
>  - The directory provided with the ``--dir`` option is processed last, if used
>  
> -Since coccicheck runs through make, it naturally runs from the kernel
> -proper dir; as such the second rule above would be implied for picking up a
> -.cocciconfig when using ``make coccicheck``.
> -
>  ``make coccicheck`` also supports using M= targets. If you do not supply
>  any M= target, it is assumed you want to target the entire kernel.
>  The kernel coccicheck script has::
>  
> -    if [ "$KBUILD_EXTMOD" = "" ] ; then
> -        OPTIONS="--dir $srctree $COCCIINCLUDE"
> -    else
> -        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> -    fi
> +    OPTIONS="--dir $srcroot $COCCIINCLUDE"
>  
> -KBUILD_EXTMOD is set when an explicit target with M= is used. For both cases
> -the spatch ``--dir`` argument is used, as such third rule applies when whether
> -M= is used or not, and when M= is used the target directory can have its own
> -.cocciconfig file. When M= is not passed as an argument to coccicheck the
> -target directory is the same as the directory from where spatch was called.
> +Here, $srcroot refers to the source directory of the target: it points to the
> +external module's source directory when M= used, and otherwise, to the kernel
> +source directory. The third rule ensures the spatch reads the .cocciconfig from
> +the target directory, allowing external modules to have their own .cocciconfig
> +file.
>  
>  If not using the kernel's coccicheck target, keep the above precedence
>  order logic of .cocciconfig reading. If using the kernel's coccicheck target,
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 7964e0c245ae..d36519f194dc 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -449,6 +449,20 @@ $(obj)
>    to prerequisites are referenced with $(src) (because they are not
>    generated files).
>  
> +$(srcroot)
> +  $(srcroot) refers to the root of the source you are building, which can be
> +  either the kernel source or the external modules source, depending on whether
> +  KBUILD_EXTMOD is set. This can be either a relative or an absolute path, but
> +  if KBUILD_ABS_SRCTREE=1 is set, it is always an absolute path.
> +
> +$(srctree)
> +  $(srctree) refers to the root of the kernel source tree. When building the
> +  kernel, this is the same as $(srcroot).
> +
> +$(objtree)
> +  $(objtree) refers to the root of the kernel object tree. It is ``.`` when
> +  building the kernel, but it is different when building external modules.
> +

Thanks, I think it's nice that there is now such a clear definition.
$(srcroot) sounds fine to me.

>  $(kecho)
>    echoing information to user in a rule is often a good practice
>    but when execution ``make -s`` one does not expect to see any output
> diff --git a/Makefile b/Makefile
> index cf1d55560ae2..e5f7ac7647a7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -180,7 +180,24 @@ ifeq ("$(origin O)", "command line")
>    KBUILD_OUTPUT := $(O)
>  endif
>  
> -output := $(KBUILD_OUTPUT)
> +ifdef KBUILD_EXTMOD
> +    ifdef KBUILD_OUTPUT
> +        objtree := $(realpath $(KBUILD_OUTPUT))
> +        $(if $(objtree),,$(error specified kernel directory "$(KBUILD_OUTPUT)" does not exist))
> +    else
> +        objtree := $(CURDIR)
> +    endif
> +    output := $(KBUILD_EXTMOD)
> +    # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
> +    # Make changes the working directory.
> +    srcroot := $(realpath $(KBUILD_EXTMOD))
> +    $(if $(srcroot),,$(error specified external module directory "$(KBUILD_EXTMOD)" does not exist))
> +else
> +    objtree := .
> +    output := $(KBUILD_OUTPUT)
> +endif
> +
> +export objtree srcroot
>  
>  # Do we want to change the working directory?
>  ifneq ($(output),)
> @@ -230,35 +247,33 @@ else # need-sub-make
>  
>  # We process the rest of the Makefile if this is the final invocation of make
>  
> -ifeq ($(abs_srctree),$(CURDIR))
> -        # building in the source tree
> -        srctree := .
> -	building_out_of_srctree :=
> +ifndef KBUILD_EXTMOD
> +srcroot := $(abs_srctree)
> +endif
> +
> +ifeq ($(srcroot),$(CURDIR))
> +building_out_of_srctree :=
>  else
> -        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
> -                # building in a subdirectory of the source tree
> -                srctree := ..
> -        else
> -                srctree := $(abs_srctree)
> -        endif
> -	building_out_of_srctree := 1
> +export building_out_of_srctree :=1
>  endif
>  
> -ifneq ($(KBUILD_ABS_SRCTREE),)
> -srctree := $(abs_srctree)
> +ifdef KBUILD_ABS_SRCTREE
> +    # Do not nothing. Use the absolute path.
> +else ifeq ($(srcroot),$(CURDIR))
> +    # Building in the source.
> +    srcroot := .
> +else ifeq ($(srcroot)/,$(dir $(CURDIR)))
> +    # Building in a subdirectory of the source.
> +    srcroot := ..
>  endif
>  
> -objtree		:= .
> +export srctree := $(if $(KBUILD_EXTMOD),$(abs_srctree),$(srcroot))

With this patch applied, the following breaks for me:

    $ make O=build M=fs/btrfs CONFIG_BTRFS_FS=m
    make[1]: Entering directory '/data/linux/kbuild-review/fs/btrfs'
      CC [M]  super.o
    In file included from <command-line>:
    /data/linux/kbuild-review/include/linux/compiler_types.h:89:10: fatal error: linux/compiler_attributes.h: No such file or directory
       89 | #include <linux/compiler_attributes.h>
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    compilation terminated.

Adding 'ccflags-y += -I$(srctree)/include' to fs/btrfs/Makefile breaks
the build loudly.  I could make it build again with

diff --git a/Makefile b/Makefile
index e5f7ac7647a7b..3d95911f1a68f 100644
--- a/Makefile
+++ b/Makefile
@@ -555,7 +555,7 @@ USERINCLUDE    := \
 LINUXINCLUDE    := \
                -I$(srctree)/arch/$(SRCARCH)/include \
                -I$(objtree)/arch/$(SRCARCH)/include/generated \
-               $(if $(building_out_of_srctree),-I$(srctree)/include) \
+               $(if $(or $(building_out_of_srctree),$(filter $(srctree)/%, $(CURDIR))),-I$(srctree)/include) \
                -I$(objtree)/include \
                $(USERINCLUDE)

but this does not feel good.  It building in-tree modules in this way a
valid thing to do?

Kind regards,
Nicolas

