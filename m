Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF3E66345
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 03:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbfGLBO1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 21:14:27 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34843 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfGLBO1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 21:14:27 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6C1E6m1029468;
        Fri, 12 Jul 2019 10:14:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6C1E6m1029468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562894047;
        bh=1XlKNIsRyo1l/cxW3VBAJovS/iXd6i68z26pLb22QEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sqtGhTVlzop7FbaFI9lmnsAJ1i/aUrM1kGVxyYsm6zKXRfF1Fs2dlQilUwRrxPV8E
         Yt95eZFEDvohY0mbcb0wK/2KdI4lPnAWQyKIG+5exZc344MoVQ06Co/rgV5vGOyZRp
         RLdjYWUvsKMhfYVy8eBgZ3ds//fGO5+2Ed8bPFxnMO/438XJcLYykP0frwUBwrwTdV
         jxA+Dfzzcln5KwUfw+x6+tnhHEdV7F2Bx0r0F1EcH2zVQJjM+E6YiG5z0WibyNrOf3
         HCMoXgJy4INaWEjGmZP7NrJ2jIQhCVGcuDbhxX23vyn6Kge6sL7V9+FyrmZ3ApU4P0
         0+R7f475jxn1g==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id o2so3358533uae.10;
        Thu, 11 Jul 2019 18:14:07 -0700 (PDT)
X-Gm-Message-State: APjAAAXAYLd4Lu6xY5raQZi7aVpLMo11Ew3nfXPXpJ7grGmO0aajS/qP
        EPPqHkGQiNjBRXCly+4RMxvISVFndf/zkLA8TN0=
X-Google-Smtp-Source: APXvYqxcYiDYHQs17TJsCeED1Rf1S4KyBF4LSvM07qFUCehhjvIrwGH9whv3NcCrkQMgrbv0hNuOoy5oQDDQWdc6m9g=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr7042711uaf.95.1562894046337;
 Thu, 11 Jul 2019 18:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org>
In-Reply-To: <20190712010556.248319-1-briannorris@chromium.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 12 Jul 2019 10:13:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
Message-ID: <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
To:     Brian Norris <briannorris@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 12, 2019 at 10:06 AM Brian Norris <briannorris@chromium.org> wrote:
>
> When building out-of-tree (e.g., 'make O=...'), __FILE__ ends up being
> an absolute path, and so WARN() and BUG() end up putting path names from
> the build system into the log text. For example:
>
>   # echo BUG > /sys/kernel/debug/provoke-crash/DIRECT
>   ...
>   kernel BUG at /mnt/host/source/[...]/drivers/misc/lkdtm/bugs.c:71!
>
> Not only is this excessively verbose, it also adds extra noise into
> tools that might parse this output. (For example, if builder paths
> change across versions, we suddenly get a "new" crash signature.)
>
> All in all, this looks much better as:
>
>   kernel BUG at drivers/misc/lkdtm/bugs.c:71!
>
> It appears the Kbuild system is fairly entrenched in using
> $(KBUILD_OUTPUT) for the ${CWD}, which necessarily means that the
> preprocessor will get handed an absolute path. It seems the only
> solution then, is to do some sort of post-processing on __FILE__.
>
> It so happens that lib/dynamic_debug.c already solves this sort of
> problem, so I steal its solution for use in panic/warn/bug code as well.


BTW, did you see this?

commit a73619a845d5625079cc1b3b820f44c899618388
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri Mar 30 13:15:26 2018 +0900

    kbuild: use -fmacro-prefix-map to make __FILE__ a relative path





> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> I'd be happy to entertain better solutions to this problem, but so far,
> I haven't been creative enough to come up with one.
>
> I'm also unsure of who best to address this to. If anyone has better
> pointers, I'm all ears.
>
>  include/linux/bug.h |  2 ++
>  kernel/panic.c      | 21 +++++++++++++++++++--
>  lib/bug.c           |  3 ++-
>  lib/dynamic_debug.c | 18 ++++--------------
>  4 files changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/bug.h b/include/linux/bug.h
> index fe5916550da8..6ab59e53801d 100644
> --- a/include/linux/bug.h
> +++ b/include/linux/bug.h
> @@ -76,4 +76,6 @@ static inline __must_check bool check_data_corruption(bool v) { return v; }
>                 corruption;                                              \
>         }))
>
> +const char *trim_filepath_prefix(const char *path);
> +
>  #endif /* _LINUX_BUG_H */
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 4d9f55bf7d38..0bed3101f049 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -546,6 +546,23 @@ struct warn_args {
>         va_list args;
>  };
>
> +/**
> + * trim_filepath_prefix - retrieve source-root relative path from a __FILE__
> + * @path: a __FILE__-like path argument.
> + * Return: path relative to source root.
> + */
> +const char *trim_filepath_prefix(const char *path)
> +{
> +       int skip = strlen(__FILE__) - strlen("kernel/panic.c");
> +
> +       BUILD_BUG_ON(strlen(__FILE__) < strlen("kernel/panic.c"));
> +
> +       if (strncmp(path, __FILE__, skip))
> +               skip = 0; /* prefix mismatch, don't skip */
> +
> +       return path + skip;
> +}
> +
>  void __warn(const char *file, int line, void *caller, unsigned taint,
>             struct pt_regs *regs, struct warn_args *args)
>  {
> @@ -556,8 +573,8 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
>
>         if (file)
>                 pr_warn("WARNING: CPU: %d PID: %d at %s:%d %pS\n",
> -                       raw_smp_processor_id(), current->pid, file, line,
> -                       caller);
> +                       raw_smp_processor_id(), current->pid,
> +                       trim_filepath_prefix(file), line, caller);
>         else
>                 pr_warn("WARNING: CPU: %d PID: %d at %pS\n",
>                         raw_smp_processor_id(), current->pid, caller);
> diff --git a/lib/bug.c b/lib/bug.c
> index 1077366f496b..2aa91d330451 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -191,7 +191,8 @@ enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
>         printk(KERN_DEFAULT CUT_HERE);
>
>         if (file)
> -               pr_crit("kernel BUG at %s:%u!\n", file, line);
> +               pr_crit("kernel BUG at %s:%u!\n", trim_filepath_prefix(file),
> +                       line);
>         else
>                 pr_crit("Kernel BUG at %pB [verbose debug info unavailable]\n",
>                         (void *)bugaddr);
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 8a16c2d498e9..0896f067ba17 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -13,6 +13,7 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__
>
> +#include <linux/bug.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> @@ -67,17 +68,6 @@ static LIST_HEAD(ddebug_tables);
>  static int verbose;
>  module_param(verbose, int, 0644);
>
> -/* Return the path relative to source root */
> -static inline const char *trim_prefix(const char *path)
> -{
> -       int skip = strlen(__FILE__) - strlen("lib/dynamic_debug.c");
> -
> -       if (strncmp(path, __FILE__, skip))
> -               skip = 0; /* prefix mismatch, don't skip */
> -
> -       return path + skip;
> -}
> -
>  static struct { unsigned flag:8; char opt_char; } opt_array[] = {
>         { _DPRINTK_FLAGS_PRINT, 'p' },
>         { _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
> @@ -164,7 +154,7 @@ static int ddebug_change(const struct ddebug_query *query,
>                             !match_wildcard(query->filename,
>                                            kbasename(dp->filename)) &&
>                             !match_wildcard(query->filename,
> -                                          trim_prefix(dp->filename)))
> +                                          trim_filepath_prefix(dp->filename)))
>                                 continue;
>
>                         /* match against the function */
> @@ -199,7 +189,7 @@ static int ddebug_change(const struct ddebug_query *query,
>  #endif
>                         dp->flags = newflags;
>                         vpr_info("changed %s:%d [%s]%s =%s\n",
> -                                trim_prefix(dp->filename), dp->lineno,
> +                                trim_filepath_prefix(dp->filename), dp->lineno,
>                                  dt->mod_name, dp->function,
>                                  ddebug_describe_flags(dp, flagbuf,
>                                                        sizeof(flagbuf)));
> @@ -827,7 +817,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>         }
>
>         seq_printf(m, "%s:%u [%s]%s =%s \"",
> -                  trim_prefix(dp->filename), dp->lineno,
> +                  trim_filepath_prefix(dp->filename), dp->lineno,
>                    iter->table->mod_name, dp->function,
>                    ddebug_describe_flags(dp, flagsbuf, sizeof(flagsbuf)));
>         seq_escape(m, dp->format, "\t\r\n\"");
> --
> 2.22.0.410.gd8fdbe21b5-goog
>


-- 
Best Regards
Masahiro Yamada
