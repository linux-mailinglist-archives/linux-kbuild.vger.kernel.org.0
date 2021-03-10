Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AE23343EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 17:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhCJQzX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 11:55:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:41402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233252AbhCJQyw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 11:54:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B316764FC9;
        Wed, 10 Mar 2021 16:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615395292;
        bh=cVqjY9NqqZ1mPldEDOjxgheuSN/hQpQw0j9ovv7HqR4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tp8Ry2pe/lKmqdxjdC5ni34kK74+DiCESgIYUX9YUbYFe4lxt9IWm6j/A3D7EM8hu
         iJxu4sBb4ALFSCmG4DeOWI7+6nzxQHBBpK9l3XWCtPdTtdVIllT0rj1X1+5PRxYbY4
         s8A96VhokpIGcd4jyrfTn2cPA/97xvHouKq5XnREJBjBJiRx1TvkCPeSICNuKk6PEo
         xAZ8+XHC8XnOV5T9i22b2IAKUscsAkeLhU/dVsMbDA9D2IbJWrEIkoZNLrkNIi2lKY
         ssCTm3Qlx83Ee3W0nkAZNi4pJiiwpwtOZH2ya/+rV31V0LuuYRPHEsqWpqtQjMHNzp
         4u7ZKLqUqB20w==
Received: by mail-ej1-f53.google.com with SMTP id r17so40049708ejy.13;
        Wed, 10 Mar 2021 08:54:51 -0800 (PST)
X-Gm-Message-State: AOAM533FdBpDuE8x0IFzR+I/uzRtfIf9Ks20Nhu2II8QVXW8tzFbHYpF
        jg3lECRyF9olQZNyeerudNg1SGzn4fcZ40MulA==
X-Google-Smtp-Source: ABdhPJwTmwPWc/VmOfuKDmxTHT+xQWyEPiP34nF6fYO3lFyka6rwhMMB91neuQO1rRgY2PCfjJy3w2N5d941G1TPNrw=
X-Received: by 2002:a17:906:2312:: with SMTP id l18mr4756677eja.468.1615395290263;
 Wed, 10 Mar 2021 08:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20210310110824.782209-1-masahiroy@kernel.org>
In-Reply-To: <20210310110824.782209-1-masahiroy@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 10 Mar 2021 09:54:36 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJTpyb6ULWbDwrpxpUQxVxO4g2r6+WVWBM8sg0QOVfu7g@mail.gmail.com>
Message-ID: <CAL_JsqJTpyb6ULWbDwrpxpUQxVxO4g2r6+WVWBM8sg0QOVfu7g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded -O option to dtc
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This piece of code converts the target suffix to the dtc -O option:
>
>     *.dtb      ->  -O dtb
>     *.dt.yaml  ->  -O yaml
>
> Commit ce88c9c79455 ("kbuild: Add support to build overlays (%.dtbo)")
> added the third case:
>
>     *.dtbo     ->  -O dtbo
>
> This works thanks to commit 163f0469bf2e ("dtc: Allow overlays to have
> .dtbo extension") in the upstream DTC, which has already been pulled in
> the kernel.
>
> However, I think it is a bit odd because "dtbo" is not a format name.
> At least, it does not show up in the help message of dtc.
>
> $ scripts/dtc/dtc --help
>   [ snip ]
>   -O, --out-format <arg>
>         Output formats are:
>                 dts - device tree source text
>                 dtb - device tree blob
>                 yaml - device tree encoded as YAML
>                 asm - assembler source
>
> So, I am not a big fan of the second hunk of that change:
>
>         } else if (streq(outform, "dtbo")) {
>                 dt_to_blob(outf, dti, outversion);
>
> Anyway, we did not need to do this in Makefile in the first place.
>
> guess_type_by_name() had already understood ".yaml" before commit
> 4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks"),
> and now does ".dtbo" as well.
>
> Makefile does not need to duplicate the same logic. Let's leave it
> to dtc.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index eee59184de64..90a4e04cd8f5 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -327,7 +327,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> +       $(DTC) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)

I think you should also drop 'yaml' from:

$(call if_changed_rule,dtc,yaml)

Though that's somewhat separate, so either way:

Acked-by: Rob Herring <robh@kernel.org>

Rob
