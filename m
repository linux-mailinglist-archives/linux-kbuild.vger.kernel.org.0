Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599F8270B14
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Sep 2020 08:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgISGWh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Sep 2020 02:22:37 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29843 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgISGWf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Sep 2020 02:22:35 -0400
X-Greylist: delayed 137514 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 02:22:34 EDT
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 08J6MBlG013966;
        Sat, 19 Sep 2020 15:22:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 08J6MBlG013966
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600496532;
        bh=3qpLDuWy/DcoGkn4p3JVkeymEbMB7rJdUSRKY9QQZKc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wRMTMSfMOuL9Xf72hlZ42qrP5U1IBm+MptAkfb6n8TnJi4NXAvyPyHBJy7FOxpiJR
         KgXqI4Up6hXdRiqQi3bb+h/vDllcwRoDaRiabmusTVaYiZuJBFTyDjLKPzJZe3ypFN
         qk9jE19qJ0NWY02tEN1Uq/FclMegtoOA9QA7CpkddZUdYbcb3/4JsUgcGKMbBKHXBa
         Ws0OWUb+pjG0LHJy9ynO82wpLDKcvrxATiXVmBaiVOQAS159FeU/tXSFma6395xTU/
         KWSTzP8PwwcSlLwO+tx/tO5UpQ8DvJG0fyRQQTyeB9lGp0qtpNN4lacsG+bgE6WCLn
         epVfcVFZMokUg==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id s65so4765028pgb.0;
        Fri, 18 Sep 2020 23:22:11 -0700 (PDT)
X-Gm-Message-State: AOAM532YI7rqzaHixAd6QzMGicuD4GgLU7p6Ils/e2xqoIxzJOCdd0/q
        MfMwdW7QD4F6Q2vULQ2XnSyzKwpmzrIKupWhcAE=
X-Google-Smtp-Source: ABdhPJxJkXyCd6E0zMHk36ByBV/pa6RSIREVA4aqiLpGXE/V99ureSaipjtIDpiJTeT1xFn+XHzf+JVFpzfxQpTImpk=
X-Received: by 2002:a63:d242:: with SMTP id t2mr30414737pgi.47.1600496530866;
 Fri, 18 Sep 2020 23:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 19 Sep 2020 15:21:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com>
Message-ID: <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com>
Subject: Re: [PATCH] modpost: allow modpost to fail on warnings
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Filipe Brandenburger <filbranden@google.com>,
        Greg Thelen <gthelen@google.com>,
        Michael Davidson <md@google.com>,
        Eugene Surovegin <surovegin@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 19, 2020 at 6:50 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> From: Filipe Brandenburger <filbranden@google.com>
>
> Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
> kbuild fail when modpost generates any warnings. This will avoid
> misses such as [1] where the SOF CI did not catch a missing module
> license.
>
> This was initially contributed in 2016 [2], rebase/clean-ups and tests
> by Pierre Bossart.
>
> Test example:
> $ KBUILD_MODPOST_FAIL_ON_WARNINGS=1 make
>   GEN     Makefile
>   DESCEND  objtool
>   CALL    sof-dev/scripts/atomic/check-atomics.sh
>   CALL    sof-dev/scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   MODPOST Module.symvers
> Kernel: arch/x86/boot/bzImage is ready  (#13)
> WARNING: modpost: missing MODULE_LICENSE() in sound/soc/intel/boards/snd-soc-sof-sdw.o
> make[2]: *** [sof-dev/scripts/Makefile.modpost:114: Module.symvers] Error 2


I think [1] should be an error instead of a warning
by default.



> [1] https://lkml.org/lkml/2020/9/17/2343
> [2] https://patchwork.kernel.org/patch/8343431/
>
> Signed-off-by: Filipe Brandenburger <filbranden@google.com>
> Cc: Greg Thelen <gthelen@google.com>
> Cc: Michael Davidson <md@google.com>
> Cc: Eugene Surovegin <surovegin@google.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  Documentation/kbuild/kbuild.rst |  5 +++++
>  scripts/Makefile.modpost        |  5 ++++-
>  scripts/mod/modpost.c           | 12 +++++++++++-
>  3 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 2d1fc03d346e..cc102aad8619 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -229,6 +229,11 @@ KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
>  symbols in the final module linking stage. It changes such errors
>  into warnings.
>
> +KBUILD_MODPOST_FAIL_ON_WARNINGS
> +-------------------------------
> +KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to turn all warnings into
> +errors in the final module linking stage.
> +
>  KBUILD_MODPOST_NOFINAL
>  ----------------------
>  KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index f54b6ac37ac2..69297cd6f8ce 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -34,6 +34,8 @@
>
>  # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
>  # symbols in the final module linking stage
> +# KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to fail whenever modpost
> +# generates warnings
>  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
>  # This is solely useful to speed up test compiles
>
> @@ -47,7 +49,8 @@ MODPOST = scripts/mod/modpost                                                         \
>         $(if $(CONFIG_MODVERSIONS),-m)                                                  \
>         $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)                                        \
>         $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)                                  \
> -       $(if $(KBUILD_MODPOST_WARN),-w) \
> +       $(if $(KBUILD_MODPOST_WARN),-w)                                                 \
> +       $(if $(KBUILD_MODPOST_FAIL_ON_WARNINGS),-F)                                     \
>         -o $@
>
>  ifdef MODPOST_VMLINUX
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 69341b36f271..422f1cfca289 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -39,6 +39,9 @@ static int sec_mismatch_fatal = 0;
>  static int ignore_missing_files;
>  /* If set to 1, only warn (instead of error) about missing ns imports */
>  static int allow_missing_ns_imports;
> +/* Turn warnings into errors */
> +static int fail_on_warnings;
> +static int warnings_count;
>
>  enum export {
>         export_plain,      export_unused,     export_gpl,
> @@ -59,6 +62,7 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
>         switch (loglevel) {
>         case LOG_WARN:
>                 fprintf(stderr, "WARNING: ");
> +               warnings_count++;
>                 break;
>         case LOG_ERROR:
>                 fprintf(stderr, "ERROR: ");
> @@ -2559,7 +2563,7 @@ int main(int argc, char **argv)
>         struct dump_list *dump_read_start = NULL;
>         struct dump_list **dump_read_iter = &dump_read_start;
>
> -       while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
> +       while ((opt = getopt(argc, argv, "ei:mnT:o:awEFNd:")) != -1) {
>                 switch (opt) {
>                 case 'e':
>                         external_module = 1;
> @@ -2588,6 +2592,9 @@ int main(int argc, char **argv)
>                 case 'w':
>                         warn_unresolved = 1;
>                         break;
> +               case 'F':
> +                       fail_on_warnings = 1;
> +                       break;
>                 case 'E':
>                         sec_mismatch_fatal = 1;
>                         break;
> @@ -2671,5 +2678,8 @@ int main(int argc, char **argv)
>
>         free(buf.p);
>
> +       if (fail_on_warnings && warnings_count)
> +               err |= 2;
> +
>         return err;
>  }
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
