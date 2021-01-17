Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF062F9387
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Jan 2021 16:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbhAQPXF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 10:23:05 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43288 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729307AbhAQPXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 10:23:02 -0500
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10HFLTM0006793;
        Mon, 18 Jan 2021 00:21:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10HFLTM0006793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610896890;
        bh=FG2gGcmdP4WmBk+rZQECkvFn+QzfbAKBhzjYiHrJjGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XXIL1ByMmDwShaYhYD7mamzlW+POE4PCqA+R5lqu4ty+ggDMp0akhlgREgmwtOYTH
         aIzt6FydkvY2azT1NY7ArTdJXa4MzJfWZHl/rtop5Dj7TFqSJWnWPuqUPrKApALmbp
         fX72TPJOztPNafamq9SneQDOITs8YkM5Hs1uagm/5rBNhAsMVqM3Pbr+z0FaaZlylJ
         Vxrd3zFzn7py2u2A4UZKTFmejBSQRiKNGtCOPoxBnFHc2Xxq/sHQ9PMC0VnzNnd5hL
         EjCAQz8pMMjNqA4JHeE2PGedcwJzQSDKvQqMfTLYhi6HtGqSCCwedOdXynag6qXbMs
         vt8RDCMXtJpUw==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id c132so9358410pga.3;
        Sun, 17 Jan 2021 07:21:29 -0800 (PST)
X-Gm-Message-State: AOAM5307IPM/DnIkLLdwLiPstRvVNzG4zmBt5phWbv5zgkfAOkRMW3Hd
        r+PvZ4aBxTYG3su0Ge0don9uKwKLlDHNvC4QB+M=
X-Google-Smtp-Source: ABdhPJzwkTgzqGwrx1K+g99a5F+jfNTyrk2izmTFhL4bLZn5CC1PLTnC+PT8iUp+4JhgamxFUm32DvL5LSKFcHmy7Pw=
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr22070169pfl.80.1610896888921; Sun, 17
 Jan 2021 07:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20210108003035.1930475-1-willmcvicker@google.com>
In-Reply-To: <20210108003035.1930475-1-willmcvicker@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 18 Jan 2021 00:20:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzf6Q4-X8hf5QmXBxJUtOECqE0Y6EQVrQ7kmnzaBKk3A@mail.gmail.com>
Message-ID: <CAK7LNARzf6Q4-X8hf5QmXBxJUtOECqE0Y6EQVrQ7kmnzaBKk3A@mail.gmail.com>
Subject: Re: [PATCH v5] modules: introduce the MODULE_SCMVERSION config
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 8, 2021 at 9:30 AM Will McVicker <willmcvicker@google.com> wrote:
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
>  Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
>  include/linux/module.h                |  1 +
>  init/Kconfig                          | 14 ++++++++++++++
>  kernel/module.c                       |  2 ++
>  scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
>  scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
>  6 files changed, 80 insertions(+), 1 deletion(-)
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
> index f54b6ac37ac2..f1126b60adb7 100644
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
> @@ -77,6 +78,17 @@ src := $(obj)
>  include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>               $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>
> +# Get the external module's source path. KBUILD_EXTMOD could either be an
> +# absolute path or relative path from $(srctree).


No.
KBUILD_EXTMOD could either be an absolute or relative path from $(objtree).



> This makes sure that we
> +# aren't using a relative path from a separate working directory (O= or
> +# KBUILD_OUTPUT) since that may not be the actual module's SCM project path.
> +# So check the path relative to $(srctree) first.
> +ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
> +       module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
> +else
> +       module_srcpath := $(KBUILD_EXTMOD)
> +endif
> +

This hunk is pointless in my view.

The code should be much simpler, as follows:



--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)

 input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
+module_srcpath := $(srctree)

 else

@@ -82,9 +83,20 @@ MODPOST += -e

 input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+module_srcpath := $(KBUILD_EXTMOD)

 endif








>  # modpost option for external modules
>  MODPOST += -e
>
> @@ -85,6 +97,16 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
>
>  endif
>
> +ifeq ($(CONFIG_MODULE_SCMVERSION),y)
> +# Get the SCM version of the module. Sed verifies setlocalversion returns
> +# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
> +module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
> +       sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
> +ifneq ($(module_scmversion),)
> +MODPOST += -v$(module_scmversion)


A space after -v for consistency.



> +endif
> +endif
> +
>  # modpost options for modules (both in-kernel and external)
>  MODPOST += \
>         $(addprefix -i ,$(wildcard $(input-symdump))) \
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d6c81657d695..489b65bc37de 100644
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
> @@ -2584,6 +2600,11 @@ int main(int argc, char **argv)
>                 case 'd':
>                         missing_namespace_deps = optarg;
>                         break;
> +               case 'v':
> +                       if (!optarg)
> +                               fatal("'-v' requires an argument defining the SCM version.");


The existing -i, -T, -o, -d options take an argument as well.
Why don't they have such a check as you added?
The answer is because getopt() checks it.


I applied your patch, and ran modpost directly
with -v at the end of the command line.


masahiro@oscar:~/workspace/linux$ ./scripts/mod/modpost  -v
./scripts/mod/modpost: option requires an argument -- 'v'


I see the error message from getopt() instead of
your hand-made error check.








> +                       strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
> +                       break;
>                 default:
>                         exit(1);
>                 }
> @@ -2630,6 +2651,7 @@ int main(int argc, char **argv)
>                 add_depends(&buf, mod);
>                 add_moddevtable(&buf, mod);
>                 add_srcversion(&buf, mod);
> +               add_scmversion(&buf);
>
>                 sprintf(fname, "%s.mod.c", mod->name);
>                 write_if_changed(&buf, fname);
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>


-- 
Best Regards
Masahiro Yamada
