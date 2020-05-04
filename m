Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F521C46E6
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 21:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgEDTPr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 May 2020 15:15:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgEDTPq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 15:15:46 -0400
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E2542073E;
        Mon,  4 May 2020 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588619745;
        bh=F7Qmmhq6TcbGJuhxEEsR8hmeCqnfcivsCGguf9UeE7E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zYsiT55HzuWGF97RueqOkkgrNj8YtTjj5Y+T928v3pCL9O1IU/503Q4bKizkgtWnk
         dghRszYP2nSZszZsW0w39j8v9aVRZp7flQlVKmVIM8cBypwmJ9HU3Wt6M0oa8TpvIr
         axm0aBdhbzUOyVpiPnfeXKuySio2SDn/31utg7yk=
Received: by mail-ot1-f51.google.com with SMTP id z17so9947243oto.4;
        Mon, 04 May 2020 12:15:45 -0700 (PDT)
X-Gm-Message-State: AGi0PubBJsywy+uhqdPfPhd/xglwFM46fviI7/UNlIviE4UfHt+3w4/s
        QAJA7pW2F1kjmSJKcp0vIOrN6MfwOLr7UCwUIw==
X-Google-Smtp-Source: APiQypK3VZQ36VWy3e7C0F+WtWxSO1XQD91KJ/cOHPDKIxPLR1SVmk2HUWN/cm9ekPsDYqbb2I8+UQJKA4ppbF9fZsM=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr14640730otn.107.1588619744639;
 Mon, 04 May 2020 12:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200504020651.37031-1-masahiroy@kernel.org> <20200504020651.37031-2-masahiroy@kernel.org>
In-Reply-To: <20200504020651.37031-2-masahiroy@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 May 2020 14:15:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com>
Message-ID: <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/dtc: compile separate dtc-yaml
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVo77+977+9w6Ju?= <marek.behun@nic.cz>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 3, 2020 at 9:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote=
:
>
> Marek Beh=C3=BAn reported a case where pkg-config fails to detect the
> libyaml-dev package, which is presumably a bug of the distro.
>
> Irrespective of that, I am not a big fan of pkg-config in the Makefile
> parse stage. The cost of pkg-config is quite small, but it is evaluated
> everytime we run make, even when we do 'make mrproper'. This commit
> changes the Makefile to not rely on pkg-config at all.

I don't really love the solution here... I'm inclined to just make
libyaml always required. Anyone building dtbs should care about
validating them. However, there's some dts files sprinkled in the tree
such as DT unittests and I don't want to break allmodconfig for CI,
0-day, etc. Though eventually we may have to.

> The normal build should not require libyaml-dev while we need to compile
> dtc with libyaml for the schema check.
>
> Build two dtc variants:
>
>   scripts/dtc/dtc      for *.dts -> *.dtb
>   scripts/dtc/dtc-yaml for *.dts -> *.dt.yaml

My longer term plan is to integrate the schema checks into dtc. This
would be some sort of plugin to dtc found or specified at run-time. It
would eliminate the need for 2 passes of dtc and the 2nd case will go
away.

> 'make dtbs_check' or 'make dt_binding_check' without libyaml-dev installe=
d
> will fail like this:
>
>   scripts/dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or direc=
tory
>
> I hope people will notice what to do.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.lib      |  9 +++++----
>  scripts/dtc/.gitignore    |  1 +
>  scripts/dtc/Makefile      | 28 +++++++++++-----------------
>  scripts/dtc/dtc-no-yaml.c |  3 +++
>  4 files changed, 20 insertions(+), 21 deletions(-)
>  create mode 100644 scripts/dtc/dtc-no-yaml.c
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 8f9f2abf3d67..ca12412304b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -246,6 +246,7 @@ quiet_cmd_gzip =3D GZIP    $@
>  # DTC
>  # ----------------------------------------------------------------------=
-----
>  DTC ?=3D $(objtree)/scripts/dtc/dtc
> +DTC_YAML ?=3D $(objtree)/scripts/dtc/dtc-yaml

Can we make 'DTC' override both and keep this an internal detail.

>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -286,13 +287,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>
>  __cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp)=
 $< ; \
> -       $(DTC) -O $(1) -o $@ -b 0 \
> +       $(1) -O $(2) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>
>  quiet_cmd_dtc =3D DTC     $@
> -      cmd_dtc =3D $(call __cmd_dtc,dtb)
> +      cmd_dtc =3D $(call __cmd_dtc,$(DTC),dtb)
>
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
> @@ -303,7 +304,7 @@ DT_BINDING_DIR :=3D Documentation/devicetree/bindings
>  DT_TMP_SCHEMA ?=3D $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
>
>  quiet_cmd_dtc_yaml =3D DTCYAML $@
> -      cmd_dtc_yaml =3D $(call __cmd_dtc,yaml)
> +      cmd_dtc_yaml =3D $(call __cmd_dtc,$(DTC_YAML),yaml)
>
>  quiet_cmd_dtb_check =3D  CHECK   $@
>        cmd_dtb_check =3D  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -=
p $(DT_TMP_SCHEMA) $@
> @@ -313,7 +314,7 @@ define rule_dtc_yaml
>         $(call cmd,dtb_check)
>  endef
>
> -$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
> +$(obj)/%.dt.yaml: $(src)/%.dts $(DTC_YAML) $(DT_TMP_SCHEMA) FORCE
>         $(call if_changed_rule,dtc_yaml)
>
>  dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
> diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
> index b814e6076bdb..e0cf8222c137 100644
> --- a/scripts/dtc/.gitignore
> +++ b/scripts/dtc/.gitignore
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  dtc
> +dtc-yaml
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index ef85f8b7d4a7..c6d7e2b70f08 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,28 +1,22 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>
> -hostprogs                      :=3D dtc
> -always-$(CONFIG_DTC)           +=3D $(hostprogs)
> -always-$(CHECK_DT_BINDING)     +=3D $(hostprogs)
> +# Build the yaml variant for DT schema validation, which requires libyam=
l
> +# development package. The normal build does not need it.
> +hostprogs                      :=3D dtc dtc-yaml
> +always-$(CONFIG_DTC)           +=3D dtc
> +always-$(CHECK_DTBS)           +=3D dtc-yaml
> +always-$(CHECK_DT_BINDING)     +=3D dtc-yaml
>
> -dtc-objs       :=3D dtc.o flattree.o fstree.o data.o livetree.o treesour=
ce.o \
> -                  srcpos.o checks.o util.o
> -dtc-objs       +=3D dtc-lexer.lex.o dtc-parser.tab.o
> +common-objs    :=3D flattree.o fstree.o data.o livetree.o treesource.o \
> +                  srcpos.o checks.o util.o dtc-lexer.lex.o dtc-parser.ta=
b.o
> +dtc-objs       :=3D dtc-no-yaml.o $(common-objs)
> +dtc-yaml-objs  :=3D dtc.o yamltree.o $(common-objs)
> +HOSTLDLIBS_dtc-yaml :=3D -lyaml

Does this work for yocto? As we had this before commit 067c650c456e.
Not clear if this changed for any reason or just 'let's use pkg-config
everywhere'.

Or is there another way to fix yocto issue and we can just check the
header exists. I assume yocto needs some prefix in front of
'/usr/include/yaml.h'?

>  # Source files need to get at the userspace version of libfdt_env.h to c=
ompile
>  HOST_EXTRACFLAGS :=3D -I $(srctree)/$(src)/libfdt
>
> -ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> -ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
> -$(error dtc needs libyaml for DT schema validation support. \
> -       Install the necessary libyaml development package.)
> -endif
> -HOST_EXTRACFLAGS +=3D -DNO_YAML
> -else
> -dtc-objs       +=3D yamltree.o
> -HOSTLDLIBS_dtc :=3D $(shell pkg-config yaml-0.1 --libs)
> -endif
> -
>  # Generated files need one more search path to include headers in source=
 tree
>  HOSTCFLAGS_dtc-lexer.lex.o :=3D -I $(srctree)/$(src)
>  HOSTCFLAGS_dtc-parser.tab.o :=3D -I $(srctree)/$(src)
> diff --git a/scripts/dtc/dtc-no-yaml.c b/scripts/dtc/dtc-no-yaml.c
> new file mode 100644
> index 000000000000..f3459e45835f
> --- /dev/null
> +++ b/scripts/dtc/dtc-no-yaml.c
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#define NO_YAML
> +#include "dtc.c"
> --
> 2.25.1
>
