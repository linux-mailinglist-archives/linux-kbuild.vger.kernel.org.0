Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07D0A7683
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 23:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfICVuR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 17:50:17 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42271 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfICVuQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 17:50:16 -0400
Received: by mail-pl1-f194.google.com with SMTP id y1so8509427plp.9
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkHv7aeAus4diANg1wa54ZbIxaxA/Tq3Ei6vs6FUsos=;
        b=Nt2xVI4juiydMdYr+RAc8fXr2SLTlZDIHooNPlH4/K2VrMPCQxF1ciTdjdZpCugV9z
         gGlCrWpub8e51uI1VMQpOV+KemHr9nVuBIAlT/8W8p3IRworYJtWxDjQ8UBnepggIaK7
         sgQTBCSzJVcK4Zg4NcBIJDwPE1s60AQQ8JnWshGKGzfia6o1qdSSswt7D5aOg9Cn4vCj
         44PT77nW9hG2x0BJ9qcwcEVxYXhAMxxEa7o8Nt9zYHvC01b/tEsvKLo8aOC7ixvToTET
         sDtW5HZOgXVPV6hxIMhM6l7mANcyodkJcD8HdH1/UizAzqnUMTCTe2BfkUrqDb2T+pDD
         A5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkHv7aeAus4diANg1wa54ZbIxaxA/Tq3Ei6vs6FUsos=;
        b=UebD6207Aw2Pamlz1w+3ZG5GhmIqE4+2Wy60tXp3uk2+bMPtoaCu5fk6NhdXH6ZGtv
         X1kgLh1MflPse6komPeTxdrJ7pBgiXzAfZDU5JE7kprBQhIog8Kwg2hVBns4IohETOTG
         K+xto6X7PNVGHxY85I6zGaDBR49d/hf/lucnMJbNJx88kaHSuGsXHADTH1MU/qdospYP
         kbDE0w596+zjiOO1BQdjgihRkUmTuOgklIaN97+L2psczMrIyyltiKfsCmqEiM6h3bdk
         6DTIkRUROixHSkMeUQnMWV0kfeq38CSFcDxwRL84aY06yhkRykh9X+N98G7FF02+P8HA
         d4Hg==
X-Gm-Message-State: APjAAAU8Sxus4mxMAkeK1pahE9tEJkf4LmpyJrpX56wRPPIer4Y3PXF3
        xQwLTwjVazyYEQw/0RHZ4oWzZf64GA6CeiOgOxwIRA==
X-Google-Smtp-Source: APXvYqy4zWCYgU5e2xW0beLNgOBUiYaYxDq89cCLExVhtfVeyi9sS8nrD9SLD7FG6I0GQCSAL67t/E7yAKElaEQ8DTk=
X-Received: by 2002:a17:902:7296:: with SMTP id d22mr17503056pll.179.1567547415436;
 Tue, 03 Sep 2019 14:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com> <20190831162555.31887-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190831162555.31887-2-yamada.masahiro@socionext.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Sep 2019 14:50:04 -0700
Message-ID: <CAKwvOdm0zcyaBLdSVc7PmjUa-wyVuCaN=6qZoPLvnoJC1ammog@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 31, 2019 at 9:26 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> options for GCC, but now it is a historical misnomer since we use it
> also for Clang, DTC, and even kernel-doc.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Rename it to more sensible, and shorter KBUILD_EXTRA_WARN.
>
> For the backward compatibility, KBUILD_ENABLE_EXTRA_GCC_CHECKS is still
> supported (but not advertised in the documentation).
>
> I also fixed up 'make help', and updated the documentation.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - new patch
>
> Changes in v2: None
>
>  Documentation/kbuild/kbuild.rst | 14 +++++++++-----
>  Makefile                        |  2 +-
>  scripts/Makefile.build          |  2 +-
>  scripts/Makefile.extrawarn      | 13 +++++++++----
>  scripts/Makefile.lib            |  4 ++--
>  scripts/genksyms/Makefile       |  2 +-
>  6 files changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 62f9d86c082c..f1e5dce86af7 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -105,6 +105,15 @@ The output directory can also be specified using "O=...".
>
>  Setting "O=..." takes precedence over KBUILD_OUTPUT.
>
> +KBUILD_EXTRA_WARN
> +-----------------
> +Specify the extra build checks. The same value can be assigned by passing
> +W=... from the command line.
> +
> +See `make help` for the list of the supported values.
> +
> +Setting "W=..." takes precedence over KBUILD_EXTRA_WARN.
> +
>  KBUILD_DEBARCH
>  --------------
>  For the deb-pkg target, allows overriding the normal heuristics deployed by
> @@ -241,11 +250,6 @@ To get all available archs you can also specify all. E.g.::
>
>      $ make ALLSOURCE_ARCHS=all tags
>
> -KBUILD_ENABLE_EXTRA_GCC_CHECKS
> -------------------------------
> -If enabled over the make command line with "W=1", it turns on additional
> -gcc -W... options for more extensive build-time checking.
> -
>  KBUILD_BUILD_TIMESTAMP
>  ----------------------
>  Setting this to a date string overrides the timestamp used in the
> diff --git a/Makefile b/Makefile
> index 06e1e21c0f45..016d72eb3ddf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1538,7 +1538,7 @@ help:
>         @echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK (sparse by default)'
>         @echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>         @echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
> -       @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
> +       @echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'
>         @echo  '                1: warnings which may be relevant and do not occur too often'
>         @echo  '                2: warnings which occur quite often but may still be relevant'
>         @echo  '                3: more obscure warnings, can most likely be ignored'
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2a21ca86b720..f72aba64d611 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -85,7 +85,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>
> -ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
> +ifneq ($(KBUILD_EXTRA_WARN),)
>    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
>  endif
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index d226c5fb13e2..53eb7e0c6a5a 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -8,14 +8,19 @@
>
>  KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
>
> +# backward compatibility
> +KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
> +
>  ifeq ("$(origin W)", "command line")
> -  export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
> +  KBUILD_EXTRA_WARN := $(W)
>  endif
>
> +export KBUILD_EXTRA_WARN
> +
>  #
>  # W=1 - warnings which may be relevant and do not occur too often
>  #
> -ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
>
>  KBUILD_CFLAGS += -Wextra -Wunused -Wno-unused-parameter
>  KBUILD_CFLAGS += -Wmissing-declarations
> @@ -48,7 +53,7 @@ endif
>  #
>  # W=2 - warnings which occur quite often but may still be relevant
>  #
> -ifneq ($(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>
>  KBUILD_CFLAGS += -Wcast-align
>  KBUILD_CFLAGS += -Wdisabled-optimization
> @@ -65,7 +70,7 @@ endif
>  #
>  # W=3 - more obscure warnings, can most likely be ignored
>  #
> -ifneq ($(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifneq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
>
>  KBUILD_CFLAGS += -Wbad-function-cast
>  KBUILD_CFLAGS += -Wcast-qual
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7ab17712ab24..df83967268ba 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -248,7 +248,7 @@ quiet_cmd_gzip = GZIP    $@
>  DTC ?= $(objtree)/scripts/dtc/dtc
>
>  # Disable noisy checks by default
> -ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  DTC_FLAGS += -Wno-unit_address_vs_reg \
>         -Wno-unit_address_format \
>         -Wno-avoid_unnecessary_addr_size \
> @@ -259,7 +259,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
>         -Wno-pci_device_reg
>  endif
>
> -ifneq ($(findstring 2,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
>  DTC_FLAGS += -Wnode_name_chars_strict \
>         -Wproperty_name_chars_strict
>  endif
> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index baf44ed0a93a..78629f515e78 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -12,7 +12,7 @@ genksyms-objs := genksyms.o parse.tab.o lex.lex.o
>  #
>  # Just in case, run "$(YACC) --version" without suppressing stderr
>  # so that 'bison: not found' will be displayed if it is missing.
> -ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>
>  quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
>        cmd_bison_no_warn = $(YACC) --version >/dev/null; \
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
