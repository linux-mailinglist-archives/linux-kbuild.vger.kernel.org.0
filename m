Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB6D120360
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2019 12:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfLPLLR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 06:11:17 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21597 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfLPLLQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 06:11:16 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBGBB79c019508;
        Mon, 16 Dec 2019 20:11:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBGBB79c019508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576494668;
        bh=qBKefwqQitZhL6I4eBQdRTRPWC5kpTe8hnKaQk64Qu4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jgikHonVxQz1G13GekCnlYOR+LJg0Ve/brvtKVsQXFhBzLKWpq6Q2R3OhTSNKBgR1
         wu5F6Yw+9KIh2twSe0Oiuj+NlIu+U23nL5dwyvu+fR5rwQ961tnThjoZqWGsNgk8fg
         Zht/aLcqkDAy4l+IknvtvE4KpaO9SHincgXahHFoACfRlYH4z4++cph9WSL3Dpdmm6
         SaO4DO9RhEi21q9nKpyYtRXrKwElvc8IGKBX5qPesmT0K9/c4h+4xCPCiKgYH2N8U5
         wxUmLC6YJ3rPy13+SvJ6cGNM8zTojuzYorvvixgaxoNlc5QjKmvXttYZwdWgWwElt9
         rBpAwCIcOs0rg==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id x18so3857596vsq.4;
        Mon, 16 Dec 2019 03:11:07 -0800 (PST)
X-Gm-Message-State: APjAAAVNG2fO2+s7dCwXgX8PLFqmfNkhn3syNDqT2BMjK/lsDtFQ368Y
        vjI/mQhOpoxgc6cpSHRsumIa/h6ZpyEvDpuiJTk=
X-Google-Smtp-Source: APXvYqzEgniVxn2J6CNEWQhemKkcpRi7kyQGTsmGSMweO+pJcDNj8liS297PGQU+sz16ijjthuUmbI3aiIupG8ofAWc=
X-Received: by 2002:a67:f055:: with SMTP id q21mr19897000vsm.215.1576494666564;
 Mon, 16 Dec 2019 03:11:06 -0800 (PST)
MIME-Version: 1.0
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org> <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Dec 2019 20:10:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
Message-ID: <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Add yes2modconfig and mod2yesconfig targets.
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

I tested this, and seems working.
Please see some comments below.

On Sat, Dec 7, 2019 at 10:43 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Since kernel configs provided by syzbot are close to "make allyesconfig",
> it takes long time to rebuild. This is especially waste of time when we
> need to rebuild for many times (e.g. doing manual printk() inspection,
> bisect operations).
>
> We can save time if we can exclude modules which are irrelevant to each
> problem. But "make localmodconfig" cannot exclude modules which are built
> into vmlinux because /sbin/lsmod output is used as the source of modules.
>
> Therefore, this patch adds "make yes2modconfig" which converts from =y
> to =m if possible. After confirming that the interested problem is still
> reproducible, we can try "make localmodconfig" (and/or manually tune
> based on "Modules linked in:" line) in order to exclude modules which are
> irrelevant to the interested problem. While we are at it, this patch also
> adds "make mod2yesconfig" which converts from =m to =y in case someone
> wants to convert from =m to =y after "make localmodconfig".
>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> ---
> Changelog since v1:
> - Updated the available 'help' targets in Makefile.
>
>  scripts/kconfig/Makefile   |  4 +++-
>  scripts/kconfig/conf.c     | 17 +++++++++++++++++
>  scripts/kconfig/confdata.c | 26 ++++++++++++++++++++++++++
>  scripts/kconfig/lkc.h      |  3 +++
>  4 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 2f1a59fa5169..4da36f83277f 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -67,7 +67,7 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
>         alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> -       helpnewconfig
> +       helpnewconfig yes2modconfig mod2yesconfig
>
>  PHONY += $(simple-targets)
>
> @@ -135,6 +135,8 @@ help:
>         @echo  '  allmodconfig    - New config selecting modules when possible'
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
> +       @echo  '  yes2modconfig   - Change answers from yes to mod if possible'
> +       @echo  '  mod2yesconfig   - Change answers from mod to yes'


For consistency,
"mod to yes if possible" ?

Turning mod into yes may not be possible
due to some dependencies.

For example, see lib/Kconfig.debug

'depends on m' is a common idiom to limit a CONFIG option
to either m or n.



>         @echo  '  listnewconfig   - List new options'
>         @echo  '  helpnewconfig   - List new options and help text'
>         @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 1f89bf1558ce..ae9ddf88c64d 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -34,6 +34,8 @@ enum input_mode {
>         listnewconfig,
>         helpnewconfig,
>         olddefconfig,
> +       yes2modconfig,
> +       mod2yesconfig,
>  };
>  static enum input_mode input_mode = oldaskconfig;
>
> @@ -467,6 +469,8 @@ static struct option long_opts[] = {
>         {"listnewconfig",   no_argument,       NULL, listnewconfig},
>         {"helpnewconfig",   no_argument,       NULL, helpnewconfig},
>         {"olddefconfig",    no_argument,       NULL, olddefconfig},
> +       {"yes2modconfig",   no_argument,       NULL, yes2modconfig},
> +       {"mod2yesconfig",   no_argument,       NULL, mod2yesconfig},
>         {NULL, 0, NULL, 0}
>  };
>
> @@ -489,6 +493,8 @@ static void conf_usage(const char *progname)
>         printf("  --allmodconfig          New config where all options are answered with mod\n");
>         printf("  --alldefconfig          New config with all symbols set to default\n");
>         printf("  --randconfig            New config with random answer to all options\n");
> +       printf("  --yes2modconfig         Change answers from yes to mod if possible\n");
> +       printf("  --mod2yesconfig         Change answers from mod to yes\n");

Same here.
"if possible"



>  }
>
>  int main(int ac, char **av)
> @@ -553,6 +559,8 @@ int main(int ac, char **av)
>                 case listnewconfig:
>                 case helpnewconfig:
>                 case olddefconfig:
> +               case yes2modconfig:
> +               case mod2yesconfig:
>                         break;
>                 case '?':
>                         conf_usage(progname);
> @@ -587,6 +595,8 @@ int main(int ac, char **av)
>         case listnewconfig:
>         case helpnewconfig:
>         case olddefconfig:
> +       case yes2modconfig:
> +       case mod2yesconfig:
>                 conf_read(NULL);
>                 break;
>         case allnoconfig:
> @@ -638,6 +648,11 @@ int main(int ac, char **av)
>                 }
>         }
>
> +       if (input_mode == yes2modconfig)
> +               conf_rewrite_mod_or_yes(def_y2m);
> +       else if (input_mode == mod2yesconfig)
> +               conf_rewrite_mod_or_yes(def_m2y);
> +

For consistency, why not put these lines into the switch statement below?



>         switch (input_mode) {
>         case allnoconfig:
>                 conf_set_all_new_symbols(def_no);
> @@ -669,6 +684,8 @@ int main(int ac, char **av)
>         case listnewconfig:
>         case helpnewconfig:
>         case syncconfig:
> +       case yes2modconfig:
> +       case mod2yesconfig:

This looks like
yes2mod/mod2yesconfig are interactive modes.
Why do you need this?

I believe yes2mod/mod2yesconfig
should work non-interactively.



>                 /* Update until a loop caused no more changes */
>                 do {
>                         conf_cnt = 0;
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 3569d2dec37c..6832a04a1aa4 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1362,3 +1362,29 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
>
>         return has_changed;
>  }
> +
> +bool conf_rewrite_mod_or_yes(enum conf_def_mode mode)

If you do not use the return value of this function,
could you make it into a void function?



> +{
> +       struct symbol *sym;
> +       int i;
> +       bool has_changed = false;
> +
> +       if (mode == def_y2m) {
> +               for_all_symbols(i, sym) {
> +                       if (sym_get_type(sym) == S_TRISTATE &&
> +                           sym->def[S_DEF_USER].tri == yes) {
> +                               sym->def[S_DEF_USER].tri = mod;
> +                               has_changed = true;

sym_add_change_count(1); seems the convention way
to inform kconfig of some options being updated.



> +                       }
> +               }
> +       } else if (mode == def_m2y) {
> +               for_all_symbols(i, sym) {
> +                       if (sym_get_type(sym) == S_TRISTATE &&
> +                           sym->def[S_DEF_USER].tri == mod) {
> +                               sym->def[S_DEF_USER].tri = yes;
> +                               has_changed = true;
> +                       }
> +               }
> +       }
> +       return has_changed;



Perhaps, the similar for_all_symbols() could be merged, like follows:
(this might be a matter of preference, though)


        tristate old_val = (mode == def_y2m) ? yes : mod;
        tristate new_val = (mode == def_y2m) ? mod : yes;

        for_all_symbols(i, sym) {
                if (sym_get_type(sym) == S_TRISTATE &&
                    sym->def[S_DEF_USER].tri == old_val) {
                              sym->def[S_DEF_USER].tri = new_val;
                              sym_add_change_count(1);





BTW, I have never contributed to the syzbot bug shooting.
So, please teach me if you know this:
Is there a a specific reason why the config set for syzbot
is close to allyesconfig instead of allmodconfig?


Thanks.



--
Best Regards

Masahiro Yamada
