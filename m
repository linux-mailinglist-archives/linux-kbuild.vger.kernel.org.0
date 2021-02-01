Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC50530AF78
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 19:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhBASfE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Feb 2021 13:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhBASe7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Feb 2021 13:34:59 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252A1C0613ED
        for <linux-kbuild@vger.kernel.org>; Mon,  1 Feb 2021 10:34:18 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id e15so4018928lft.13
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Feb 2021 10:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3lghFjiZp/Ym1q60E++/PW2PX5JvxZZBRzGE7dUGvN4=;
        b=BpICdDei2DqVrI1L3DA6ltgu2kp6skGDXoJqfZ94Te79HTfmNH0+egGH9AeOjbwmNb
         ZH7Eh6Vinm/mYub71xb6lPkY2XHJhKiS1oz9XwVJGKQjEfCSmnUyxBKSURF1BH3DPG48
         TlEE9tdLDm3TKGN6r8n0VY/K3IQd5XwFnwfX4fvFRlpN0hL3/L3lzueYv66Bj4E7ISFA
         Rxo6B/di8oEJ9Bu1aRMgnKk/oGvjdYBbxtfpWruWzENn8oNaiCwGl21gijOmkeQSC3CY
         2KH8igjw7mPsoyZPpb6CJC4a1MKVFdAwYT7rax4/lmALM+aWC2RejTTN8x0q0iwSHXhp
         E7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3lghFjiZp/Ym1q60E++/PW2PX5JvxZZBRzGE7dUGvN4=;
        b=pjDAeh9NbDvJ/QzBquzJj+PSPgVYhuH7wRBcd/hFtWBAFvroA8EkRc3WA98R8EfJUm
         cOmMmaT5qhtfJQJds/SeHhE5YnbkVpJbswOE/wARcNzuREhzUWcQszXXd7Fz1IAi3VGD
         +n39Y79HwBasR+4sEtcRKlnYgVx3eWGxbdMKcXKpFi5r/SjEoLbN20ZxwgdV9SPkYcmN
         gpd1pAn9i9ol658pXiJAbO3SByFxewjAWIABu4EYjKGIKf+deIqj/8zAToiE4BbGSiKV
         Ud9lsVgzAitmH7I3SNdjT/tkNErzSgjI7Ndw8Icy23BPMKWyKbrcy4Htxaotl8F/7TcH
         Q9wA==
X-Gm-Message-State: AOAM53360N6DO6su1wTy37QI74Y1uEq14oFGOVDUqN+nMv9H/CBIZp62
        C5TAkNSH8/4fMARVkn6wSPWUbqrjZZGIc/duelv0eg==
X-Google-Smtp-Source: ABdhPJyDspnKhgjYTR9BOI6/8Tbqj9/e/wMYLvQDve3iFj+F4ocaDzGOX1Oj3F+JaEeOV7YIuY7Mi94Hf4d93uGB0/k=
X-Received: by 2002:ac2:4561:: with SMTP id k1mr8873000lfm.70.1612204456343;
 Mon, 01 Feb 2021 10:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20210121213641.3477522-1-willmcvicker@google.com>
In-Reply-To: <20210121213641.3477522-1-willmcvicker@google.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Mon, 1 Feb 2021 10:33:59 -0800
Message-ID: <CABYd82Yk91u287iZvkUik+UYg2mHMpHimZzsg72cXOK6k8WpRg@mail.gmail.com>
Subject: Re: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jessica and Masahiro,

Could I get a final look at the latest patchset please? All the issues
have been addressed thus far.

Thanks,
Will

On Thu, Jan 21, 2021 at 1:36 PM Will McVicker <willmcvicker@google.com> wrote:
>
> Config MODULE_SCMVERSION introduces a new module attribute --
> `scmversion` -- which can be used to identify a given module's SCM
> version.  This is very useful for developers that update their kernel
> independently from their kernel modules or vice-versa since the SCM
> version provided by UTS_RELEASE (`uname -r`) will now differ from the
> module's vermagic attribute.
>
> For example, we have a CI setup that tests new kernel changes on the
> hikey960 and db845c devices without updating their kernel modules. When
> these tests fail, we need to be able to identify the exact device
> configuration the test was using. By including MODULE_SCMVERSION, we can
> identify the exact kernel and modules' SCM versions for debugging the
> failures.
>
> Additionally, by exposing the SCM version via the sysfs node
> /sys/module/MODULENAME/scmversion, one can also verify the SCM versions
> of the modules loaded from the initramfs. Currently, modinfo can only
> retrieve module attributes from the module's ko on disk and not from the
> actual module that is loaded in RAM.
>
> You can retrieve the SCM version in two ways,
>
> 1) By using modinfo:
>     > modinfo -F scmversion MODULENAME
> 2) By module sysfs node:
>     > cat /sys/module/MODULENAME/scmversion
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
> Changelog since v5:
> - Simplified scripts/Makefile.modpost to not check for a relative M= path
> - Added space between -v and $(module_scmversion)
> - Updated modpost.c to not check for a missing argument to -v
>
>  Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
>  include/linux/module.h                |  1 +
>  init/Kconfig                          | 14 ++++++++++++++
>  kernel/module.c                       |  2 ++
>  scripts/Makefile.modpost              | 14 ++++++++++++++
>  scripts/mod/modpost.c                 | 22 +++++++++++++++++++++-
>  6 files changed, 70 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> index 6272ae5fb366..a75d137e79f4 100644
> --- a/Documentation/ABI/stable/sysfs-module
> +++ b/Documentation/ABI/stable/sysfs-module
> @@ -32,3 +32,21 @@ Description:
>                 Note: If the module is built into the kernel, or if the
>                 CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
>                 this file will not be present.
> +
> +What:          /sys/module/MODULENAME/scmversion
> +Date:          November 2020
> +KernelVersion: 5.12
> +Contact:       Will McVicker <willmcvicker@google.com>
> +Description:   This read-only file will appear if modpost was supplied with an
> +               SCM version for the module. It can be enabled with the config
> +               MODULE_SCMVERSION. The SCM version is retrieved by
> +               scripts/setlocalversion, which means that the presence of this
> +               file depends on CONFIG_LOCALVERSION_AUTO=y. When read, the SCM
> +               version that the module was compiled with is returned. The SCM
> +               version is returned in the following format::
> +
> +               ===
> +               Git:            g[a-f0-9]\+(-dirty)\?
> +               Mercurial:      hg[a-f0-9]\+(-dirty)\?
> +               Subversion:     svn[0-9]\+
> +               ===
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 7a0bcb5b1ffc..3b1612193cf9 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -372,6 +372,7 @@ struct module {
>         struct module_attribute *modinfo_attrs;
>         const char *version;
>         const char *srcversion;
> +       const char *scmversion;
>         struct kobject *holders_dir;
>
>         /* Exported symbols */
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..3d9dac3c4e8f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2131,6 +2131,20 @@ config MODULE_SRCVERSION_ALL
>           the version).  With this option, such a "srcversion" field
>           will be created for all modules.  If unsure, say N.
>
> +config MODULE_SCMVERSION
> +       bool "SCM version for modules"
> +       depends on LOCALVERSION_AUTO
> +       help
> +         This enables the module attribute "scmversion" which can be used
> +         by developers to identify the SCM version of a given module, e.g.
> +         git sha1 or hg sha1. The SCM version can be queried by modinfo or
> +         via the sysfs node: /sys/modules/MODULENAME/scmversion. This is
> +         useful when the kernel or kernel modules are updated separately
> +         since that causes the vermagic of the kernel and the module to
> +         differ.
> +
> +         If unsure, say N.
> +
>  config MODULE_SIG
>         bool "Module signature verification"
>         select MODULE_SIG_FORMAT
> diff --git a/kernel/module.c b/kernel/module.c
> index 4bf30e4b3eaa..d0b359c7e9c9 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -837,6 +837,7 @@ static struct module_attribute modinfo_##field = {                    \
>
>  MODINFO_ATTR(version);
>  MODINFO_ATTR(srcversion);
> +MODINFO_ATTR(scmversion);
>
>  static char last_unloaded_module[MODULE_NAME_LEN+1];
>
> @@ -1298,6 +1299,7 @@ static struct module_attribute *modinfo_attrs[] = {
>         &module_uevent,
>         &modinfo_version,
>         &modinfo_srcversion,
> +       &modinfo_scmversion,
>         &modinfo_initstate,
>         &modinfo_coresize,
>         &modinfo_initsize,
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index f54b6ac37ac2..13ec3e96650c 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
>
>  input-symdump := vmlinux.symvers
>  output-symdump := Module.symvers
> +module_srcpath := $(srctree)
>
>  else
>
> @@ -82,9 +83,22 @@ MODPOST += -e
>
>  input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
>  output-symdump := $(KBUILD_EXTMOD)/Module.symvers
> +module_srcpath := $(KBUILD_EXTMOD)
>
>  endif
>
> +ifeq ($(CONFIG_MODULE_SCMVERSION),y)
> +# Get the SCM version of the module. Sed verifies setlocalversion returns
> +# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
> +# Note: relative M= paths are not supported when building the kernel out of the
> +# srctree since setlocalversion won't be able to find the module srctree.
> +module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
> +       sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
> +ifneq ($(module_scmversion),)
> +MODPOST += -v $(module_scmversion)
> +endif
> +endif
> +
>  # modpost options for modules (both in-kernel and external)
>  MODPOST += \
>         $(addprefix -i ,$(wildcard $(input-symdump))) \
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d6c81657d695..92c4bd88f875 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -30,6 +30,8 @@ static int have_vmlinux = 0;
>  static int all_versions = 0;
>  /* If we are modposting external module set to 1 */
>  static int external_module = 0;
> +#define MODULE_SCMVERSION_SIZE 64
> +static char module_scmversion[MODULE_SCMVERSION_SIZE];
>  /* Only warn about unresolved symbols */
>  static int warn_unresolved = 0;
>  /* How a symbol is exported */
> @@ -2264,6 +2266,20 @@ static void add_intree_flag(struct buffer *b, int is_intree)
>                 buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
>  }
>
> +/**
> + * add_scmversion() - Adds the MODULE_INFO macro for the scmversion.
> + * @b: Buffer to append to.
> + *
> + * This function fills in the module attribute `scmversion` for the kernel
> + * module. This is useful for determining a given module's SCM version on
> + * device via /sys/modules/<module>/scmversion and/or using the modinfo tool.
> + */
> +static void add_scmversion(struct buffer *b)
> +{
> +       if (module_scmversion[0] != '\0')
> +               buf_printf(b, "\nMODULE_INFO(scmversion, \"%s\");\n", module_scmversion);
> +}
> +
>  /* Cannot check for assembler */
>  static void add_retpoline(struct buffer *b)
>  {
> @@ -2546,7 +2562,7 @@ int main(int argc, char **argv)
>         struct dump_list *dump_read_start = NULL;
>         struct dump_list **dump_read_iter = &dump_read_start;
>
> -       while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
> +       while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:v:")) != -1) {
>                 switch (opt) {
>                 case 'e':
>                         external_module = 1;
> @@ -2584,6 +2600,9 @@ int main(int argc, char **argv)
>                 case 'd':
>                         missing_namespace_deps = optarg;
>                         break;
> +               case 'v':
> +                       strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
> +                       break;
>                 default:
>                         exit(1);
>                 }
> @@ -2630,6 +2649,7 @@ int main(int argc, char **argv)
>                 add_depends(&buf, mod);
>                 add_moddevtable(&buf, mod);
>                 add_srcversion(&buf, mod);
> +               add_scmversion(&buf);
>
>                 sprintf(fname, "%s.mod.c", mod->name);
>                 write_if_changed(&buf, fname);
> --
> 2.30.0.280.ga3ce27912f-goog
>
