Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F3416F831
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 07:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgBZGrD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 01:47:03 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:58785 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgBZGrD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 01:47:03 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01Q6kp4P019600;
        Wed, 26 Feb 2020 15:46:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01Q6kp4P019600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582699612;
        bh=2VfJIOCvZH0NY/dmW/3ZDhtzj0Q1UN635jNbPpjGUr4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jd5pA8iRcjCYKKrF3kgDrZanUYxXyWnIGkH8aWK1zVz+hOhh5UuIc28UrLYFjAflt
         y62ne42vRqsltkLP5ktMoipKgdRhCwepMx8ru4XYHN52FfsmLDKrVn3Im1vBGbtnpw
         7j380mcPGbIyOjTiDs8v3kZGpyacRgQv7uWaI1mhyS0nE818GDI9QPPAKAZiEIY124
         KwNTPcfflqDai2cpBzdWOqaHFV55nQ0ZPLELDaN7iLVKDfT9/6kPKidaHbmrQUT+Jr
         CGpohC7LXixtKupCEa3Wb70aPbN7TAmZrjGf71GYQ0gNtOv008kp+yXs4/6pntXOFz
         tyAguIycaYenA==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id x123so1134533vsc.2;
        Tue, 25 Feb 2020 22:46:52 -0800 (PST)
X-Gm-Message-State: APjAAAXtBYA0/g5dJV4g1J8YZ71mtXZPoz/7rBm3UG/xHMv/ftTggx5T
        C7hPljBxc5wDmJsZx5aFW9fY8+A1w0mYsOs1/cU=
X-Google-Smtp-Source: APXvYqwkW77CBgQ1pHwOq8iqy4JwoPCgSKHrG7tUDS7YsQUWfdeloJMDAwvhYvtwEDKhmGNtwpbc+CI4rGqKqE3AHTQ=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr2881251vsh.179.1582699611202;
 Tue, 25 Feb 2020 22:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-5-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-5-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Feb 2020 15:46:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT14XvMLp+CFJk4QdgvYCTanXz8KPQ=5C90N+VCOYPu1g@mail.gmail.com>
Message-ID: <CAK7LNAT14XvMLp+CFJk4QdgvYCTanXz8KPQ=5C90N+VCOYPu1g@mail.gmail.com>
Subject: Re: [PATCH 5/5] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 93512dad334d ("dt-bindings: Improve validation build error
> handling"), 'make dtbs_check' does not validate the schema fully.
>
> If you want to check everything, you need to run two commands.
>
>   $ make ARCH=arm dt_binding_check
>   $ make ARCH=arm dtbs_check
>
> You cannot do:
>
>   $ make ARCH=arm dt_binding_check dtbs_check
>
> Because CHECK_DTBS is set, dt-doc-validate and dt-extract-example
> are skipped.
>
> Making it work will be useful for schema writers.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---



Sorry, I take back this patch.

'make dtbs_check dt_binding_chec' does not work.



>
>  Documentation/devicetree/bindings/Makefile  | 6 ++----
>  Documentation/devicetree/writing-schema.rst | 4 ++++
>  Makefile                                    | 8 +++++---
>  3 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 646cb3525373..6efa2094b95e 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -25,10 +25,8 @@ DT_DOCS = $(shell \
>
>  DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
>
> -ifeq ($(CHECK_DTBS),)
> -extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
> -extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
> -endif
> +extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
> +extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
>
>  $(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
>         $(call if_changed,mk_schema)
> diff --git a/Documentation/devicetree/writing-schema.rst b/Documentation/devicetree/writing-schema.rst
> index 7635ab230456..220cf464ed77 100644
> --- a/Documentation/devicetree/writing-schema.rst
> +++ b/Documentation/devicetree/writing-schema.rst
> @@ -147,6 +147,10 @@ Note that ``dtbs_check`` will skip any binding schema files with errors. It is
>  necessary to use ``dt_binding_check`` to get all the validation errors in the
>  binding schema files.
>
> +It is possible to run both in a single command::
> +
> +    make dt_binding_check dtbs_check
> +
>  It is also possible to run checks with a single schema file by setting the
>  ``DT_SCHEMA_FILES`` variable to a specific schema file.
>
> diff --git a/Makefile b/Makefile
> index 83f9b8f6fbaf..59dd768a1c1e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1243,7 +1243,7 @@ dtbs dtbs_check: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
>  dtbs_check: export CHECK_DTBS=1
> -dtbs_check: dt_binding_check
> +dtbs_check: __dt_binding_check
>
>  dtbs_install:
>         $(Q)$(MAKE) $(dtbinst)=$(dtstree)
> @@ -1258,8 +1258,10 @@ PHONY += scripts_dtc
>  scripts_dtc: scripts_basic
>         $(Q)$(MAKE) $(build)=scripts/dtc
>
> -PHONY += dt_binding_check
> -dt_binding_check: scripts_dtc
> +PHONY += dt_binding_check __dt_binding_check
> +dt_binding_check: export CHECK_DT_BINDING=y
> +dt_binding_check: __dt_binding_check
> +__dt_binding_check: scripts_dtc
>         $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
>
>  # ---------------------------------------------------------------------------
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
