Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE516112B
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 16:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfGFOqi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 10:46:38 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:22881 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfGFOqi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:46:38 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x66EkULl016033;
        Sat, 6 Jul 2019 23:46:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x66EkULl016033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562424391;
        bh=ZJ10EKLPrCltaw+PSBLcUT4O4A9NpW6iZ5g1mBNFBBc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Iz/T/QGrjWfKD9+rki3JKLTSOKGnHolC+sPKp64PvnpNdOc8ROna0g5fqViD4Wudu
         9GrYHNWSH7UORY3NUFww5t5iYvN2FWYmlRxBmIkUAEba9ek53zNaALLNT7hGopjnwH
         8FfJ1Z/jpiqM1LQ29owJo0OGZmoYAVVkp68YdlPFz7TPxnBD5f6PpGRMvrncL8YDSl
         NGlzy7nwlbRyvDteCWlpU+luxxK6U6FJs35wrZUuxTrfJ+shuFEzSXPRqqpKEYUg3t
         3zyt0VT2Pk7LecPKNxmogGjgiST0dVKQ/x9JEmUaj2lKXXzq6uVW07jzK1rBEnwovU
         dkFMJ8yTgiCug==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id r3so5522638vsr.13;
        Sat, 06 Jul 2019 07:46:30 -0700 (PDT)
X-Gm-Message-State: APjAAAWUUREZ7ufTiCGywIm4Tv61vbqC3/vWwQojWvSMHcCXmG83lTl2
        vj5wB1k1X1CM0UJIPtmsg+WNONdWMMtRcTKydhg=
X-Google-Smtp-Source: APXvYqxWN82nJ1XdKGDR+rQ6OJH+iZCanU+/hg7ucTSn4jv2te+dio6J+QsAsC7rCMCkOHjxedOHbCTC4KQ5bf/x/B8=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr5144105vsd.215.1562424389636;
 Sat, 06 Jul 2019 07:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 23:45:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsdbV5MD4nBiSwky9jQue8+tRGwAxkFwYwyV-b17cYMw@mail.gmail.com>
Message-ID: <CAK7LNAQsdbV5MD4nBiSwky9jQue8+tRGwAxkFwYwyV-b17cYMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: rename arg-check to cmd-check
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 23, 2019 at 1:07 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I prefer 'cmd-check' for consistency.
>
> We have 'echo-cmd', 'cmd', 'cmd_and_fixdep', etc. in this file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>  scripts/Kbuild.include | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index f641bb0aa63f..4bec04c89750 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -213,12 +213,12 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
>  # See Documentation/kbuild/makefiles.txt for more info
>
>  ifneq ($(KBUILD_NOCMDDEP),1)
> -# Check if both arguments are the same including their order. Result is empty
> +# Check if both commands are the same including their order. Result is empty
>  # string if equal. User may override this check using make KBUILD_NOCMDDEP=1
> -arg-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
> +cmd-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
>                           $(subst $(space),$(space_escape),$(strip $(cmd_$1))))
>  else
> -arg-check = $(if $(strip $(cmd_$@)),,1)
> +cmd-check = $(if $(strip $(cmd_$@)),,1)
>  endif
>
>  # Replace >$< with >$$< to preserve $ when reloading the .cmd file
> @@ -234,12 +234,12 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
>  any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
>
>  # Execute command if command has changed or prerequisite(s) are updated.
> -if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
> +if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
>         $(cmd);                                                              \
>         printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
>
>  # Execute the command and also postprocess generated .d dependencies file.
> -if_changed_dep = $(if $(strip $(any-prereq) $(arg-check)),$(cmd_and_fixdep),@:)
> +if_changed_dep = $(if $(strip $(any-prereq) $(cmd-check)),$(cmd_and_fixdep),@:)
>
>  cmd_and_fixdep =                                                             \
>         $(cmd);                                                              \
> @@ -249,7 +249,7 @@ cmd_and_fixdep =                                                             \
>  # Usage: $(call if_changed_rule,foo)
>  # Will check if $(cmd_foo) or any of the prerequisites changed,
>  # and if so will execute $(rule_foo).
> -if_changed_rule = $(if $(strip $(any-prereq) $(arg-check)),$(rule_$(1)),@:)
> +if_changed_rule = $(if $(strip $(any-prereq) $(cmd-check)),$(rule_$(1)),@:)
>
>  ###
>  # why - tell why a target got built
> @@ -275,7 +275,7 @@ why =                                                                        \
>      $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
>          $(if $(wildcard $@),                                                 \
>              $(if $(strip $(any-prereq)),- due to: $(any-prereq),             \
> -                $(if $(arg-check),                                           \
> +                $(if $(cmd-check),                                           \
>                      $(if $(cmd_$@),- due to command line change,             \
>                          $(if $(filter $@, $(targets)),                       \
>                              - due to missing .cmd file,                      \
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
