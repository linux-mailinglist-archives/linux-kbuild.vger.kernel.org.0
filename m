Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A1FF0BED
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 03:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfKFCPh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 21:15:37 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:63832 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbfKFCPh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:15:37 -0500
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xA62FJD7015466;
        Wed, 6 Nov 2019 11:15:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xA62FJD7015466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573006520;
        bh=q3zphXHxuEurf32e+SfSrZs3yg7iEF8jHJ+lowoFQXo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J2buaLoJSn3U7iiauVyOODfEpf2sqHe2BqhjxlP/f6ecbMNSb4Kc6/Bd+UVFeRqfg
         Uzs3k1ZO5z1ksqfacuVMEtmFQTAbH+DnjJl0ZFZsfan2HPuZAp8WhK3KbIyWmSHSuC
         pT0T3JjQ8ZHJsle5PfK0X50b4bisMdaVB6aM9MooB2gCVfeXhE857KMsSnX9IYZc7p
         E3Ass2a+EKPRoK0xPvfPvFdG6I/s168zzfYazrMhbJulUTjizSSlC6utw6H2Rm2TL/
         6uyeKcDkOWKYD/22q+WEM3Uc442NYgYp7BCcJ/FOaHv2sUzEoI2A37REn75eDwvU9b
         3spoNWPtIhdIg==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id o9so5103563uat.8;
        Tue, 05 Nov 2019 18:15:19 -0800 (PST)
X-Gm-Message-State: APjAAAWfNtSUsC/31nnY1k8QYDOAdPT+RmmUSN8jTyfIKWyKVJjwRBJK
        BPswl5EIUirApZF8zCEo/eoYkt8fgR29TUZ3VXo=
X-Google-Smtp-Source: APXvYqysJI7ma1Y818Ohf6IXGOgJ9lynHOfZvU8Cq86R3aC5K/SOVfJwIYEH3O2MJkAWzd4rH1apYKPITLsP39MJ77Y=
X-Received: by 2002:ab0:279a:: with SMTP id t26mr168196uap.40.1573006518680;
 Tue, 05 Nov 2019 18:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20191104221008.30078-1-labbott@redhat.com>
In-Reply-To: <20191104221008.30078-1-labbott@redhat.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 11:14:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9+S6+7RYCgTXHt+au6KuiULutk=ohNdjzWsmLZ2fiFg@mail.gmail.com>
Message-ID: <CAK7LNAR9+S6+7RYCgTXHt+au6KuiULutk=ohNdjzWsmLZ2fiFg@mail.gmail.com>
Subject: Re: [PATCHv2] kconfig: Add option to get the full help text with listnewconfig
To:     Laura Abbott <labbott@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Cline <jcline@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 5, 2019 at 7:13 AM Laura Abbott <labbott@redhat.com> wrote:
>
> make listnewconfig will list the individual options that need to be set.
> This is useful but there's no easy way to get the help text associated
> with the options at the same time. Introduce a new targe
> 'make helpnewconfig' which lists the full help text of all the
> new options as well. This makes it easier to automatically generate
> changes that are easy for humans to review. This command also adds
> markers between each option for easier parsing.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Dropped rfc tag, renamed extendedlistnewconfig -> helpnewconfig.
> Added another missing help text.

Applied to linux-kbuild.
Thanks.



> ---
>  scripts/kconfig/Makefile |  5 ++++-
>  scripts/kconfig/conf.c   | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ef2f2336c469..71a956cec64a 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  syncconfig has become an internal implementation detail and is now
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
> -       alldefconfig randconfig listnewconfig olddefconfig syncconfig
> +       alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> +       helpnewconfig
> +
>  PHONY += $(simple-targets)
>
>  $(simple-targets): $(obj)/conf
> @@ -134,6 +136,7 @@ help:
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
>         @echo  '  listnewconfig   - List new options'
> +       @echo  '  helpnewconfig   - List new options and help text'
>         @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
>         @echo  '                    default value without prompting'
>         @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 40e16e871ae2..1f89bf1558ce 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -32,6 +32,7 @@ enum input_mode {
>         defconfig,
>         savedefconfig,
>         listnewconfig,
> +       helpnewconfig,
>         olddefconfig,
>  };
>  static enum input_mode input_mode = oldaskconfig;
> @@ -434,6 +435,11 @@ static void check_conf(struct menu *menu)
>                                                 printf("%s%s=%s\n", CONFIG_, sym->name, str);
>                                         }
>                                 }
> +                       } else if (input_mode == helpnewconfig) {
> +                               printf("-----\n");
> +                               print_help(menu);
> +                               printf("-----\n");
> +
>                         } else {
>                                 if (!conf_cnt++)
>                                         printf("*\n* Restart config...\n*\n");
> @@ -459,6 +465,7 @@ static struct option long_opts[] = {
>         {"alldefconfig",    no_argument,       NULL, alldefconfig},
>         {"randconfig",      no_argument,       NULL, randconfig},
>         {"listnewconfig",   no_argument,       NULL, listnewconfig},
> +       {"helpnewconfig",   no_argument,       NULL, helpnewconfig},
>         {"olddefconfig",    no_argument,       NULL, olddefconfig},
>         {NULL, 0, NULL, 0}
>  };
> @@ -469,6 +476,7 @@ static void conf_usage(const char *progname)
>         printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
>         printf("[option] is _one_ of the following:\n");
>         printf("  --listnewconfig         List new options\n");
> +       printf("  --helpnewconfig         List new options and help text\n");
>         printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>         printf("  --oldconfig             Update a configuration using a provided .config as base\n");
>         printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
> @@ -543,6 +551,7 @@ int main(int ac, char **av)
>                 case allmodconfig:
>                 case alldefconfig:
>                 case listnewconfig:
> +               case helpnewconfig:
>                 case olddefconfig:
>                         break;
>                 case '?':
> @@ -576,6 +585,7 @@ int main(int ac, char **av)
>         case oldaskconfig:
>         case oldconfig:
>         case listnewconfig:
> +       case helpnewconfig:
>         case olddefconfig:
>                 conf_read(NULL);
>                 break;
> @@ -657,6 +667,7 @@ int main(int ac, char **av)
>                 /* fall through */
>         case oldconfig:
>         case listnewconfig:
> +       case helpnewconfig:
>         case syncconfig:
>                 /* Update until a loop caused no more changes */
>                 do {
> @@ -675,7 +686,7 @@ int main(int ac, char **av)
>                                 defconfig_file);
>                         return 1;
>                 }
> -       } else if (input_mode != listnewconfig) {
> +       } else if (input_mode != listnewconfig && input_mode != helpnewconfig) {
>                 if (!no_conf_write && conf_write(NULL)) {
>                         fprintf(stderr, "\n*** Error during writing of the configuration.\n\n");
>                         exit(1);
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
