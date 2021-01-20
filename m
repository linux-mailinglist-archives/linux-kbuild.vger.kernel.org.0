Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649D12FC59F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 01:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730873AbhATAUK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 19:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730718AbhATATr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 19:19:47 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D4DC061798
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 16:19:06 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u11so23975897ljo.13
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 16:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7kfbV0Qzt+pmUiMe0QaaqHxOAXEcZkVZL3jAdqBSxAI=;
        b=OXI7W5ude/vwnzkqquQyKprdR/f5Ld6hQOFx7BAtL7uCFIFWfhIGtRqrKtOY6ziiOm
         xcMhEbeOOjj2kBToRdFRIOkNBsZbHXz2xe3l9am39i7xWtT/naVntPKS0kaF/bJqm/4z
         tErmcnHQ5ih3bAPsDg5NPe0ysQrNT4nevhW5Ot2CpVvUJ9ebftxWDDVV8U3u30rRphNh
         0+Y968aff0Fi4w9tmuFlfLStrZhrBEGJPY6XiXuAAB2lVGLkcSpDKF2qFKOTyoC7L1lJ
         DSUh6B20AyzYyX9Zpd2PzVjsPSIYIULSycgTCumL6SugkGKC7sZjYk8199kP2SQhfS5I
         580Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kfbV0Qzt+pmUiMe0QaaqHxOAXEcZkVZL3jAdqBSxAI=;
        b=CcYtu1vj69wa5cSZsLl2rN3hAOktXw2zxTtDH9jPTnJTel+zFXSf6guMInJ6avES7q
         Bq1Khin1lXE5H8zw3XVSW1zJEXnfDzY2kYVWJG5XXYh7DcHWlayTWnZnjRSRYB3+Hu5G
         4QedXeJuqDgHpZ5phiwbvGuFWl2oeXWCYCSumcGVzUfVDtsUK6GnDcpkRNuUoJLNWMI2
         dyMqKit0w2C74dEeLEketisso7p76AoEtz5rPRRPHMbEpyjgPowqhe/uAcczJbXeCXxo
         OU0SykCYMEoxk05eNUGGyXD5mJQtec6xZDU//QGUhEP2CpLW02AJC/tzQcW838PbLYqz
         nkjA==
X-Gm-Message-State: AOAM530swTewJp9wXG9br4VDeS0VkJegoAGbMWNQy9Xk1CroD1PiEfZD
        +ONKsBEw83QTm25TrO9WUqygyUDWr1hRZa3lq9kBEw==
X-Google-Smtp-Source: ABdhPJzEi/1QmaWZYn95yNl7dSuua/IJtqxOhps96S6v717FIwUvfSVpZtFMPwSG7a1eX3AQnL9eHZfCQKbkY56Or7k=
X-Received: by 2002:a2e:240f:: with SMTP id k15mr3113707ljk.506.1611101943465;
 Tue, 19 Jan 2021 16:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20210108003035.1930475-1-willmcvicker@google.com>
 <CAK7LNARzf6Q4-X8hf5QmXBxJUtOECqE0Y6EQVrQ7kmnzaBKk3A@mail.gmail.com> <CABYd82ajiVkYaLPJzaWhVwi_b0nEU=qQGXp34rgYmKQ07skrfg@mail.gmail.com>
In-Reply-To: <CABYd82ajiVkYaLPJzaWhVwi_b0nEU=qQGXp34rgYmKQ07skrfg@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Tue, 19 Jan 2021 16:18:47 -0800
Message-ID: <CABYd82a=xJr7AoWFPmahOarbUZSxxOA_+VQbN2EK0unZU-bjTg@mail.gmail.com>
Subject: Re: [PATCH v5] modules: introduce the MODULE_SCMVERSION config
To:     Masahiro Yamada <masahiroy@kernel.org>
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

Hi Masahiro,

After testing your suggestions for module_srcpath, I remembered why I
needed this:

+ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
+       module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
+else
+       module_srcpath := $(KBUILD_EXTMOD)
+endif

Basically KBUILD_EXTMOD actually has two uses when defined as a relative path:

(1) defines the path to the external module's source relative to $(srctree)
(2) defines the path to the external module's build artifacts relative
to $(objtree)

Since setlocalversion is run from $(objtree), we need to use
$(srctree)/$(KBUILD_EXTMOD) when it's a relative path. Just to note,
if I do just use KBUILD_EXTMOD, then the script setlocalversion fails
to find the srctree and returns an empty string.

Please correct me if I'm wrong. I messed around with this by adding
many prints to Makefile.modpost and setlocalversion to make sure
everything was defined as expected.

Thanks,
Will

On Tue, Jan 19, 2021 at 1:48 PM Will McVicker <willmcvicker@google.com> wrote:
>
> Thanks for the review Masahiro! I'll upload v6 shortly.
>
> --Will
>
> On Sun, Jan 17, 2021 at 7:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, Jan 8, 2021 at 9:30 AM Will McVicker <willmcvicker@google.com> wrote:
> > >
> > > Config MODULE_SCMVERSION introduces a new module attribute --
> > > `scmversion` -- which can be used to identify a given module's SCM
> > > version.  This is very useful for developers that update their kernel
> > > independently from their kernel modules or vice-versa since the SCM
> > > version provided by UTS_RELEASE (`uname -r`) will now differ from the
> > > module's vermagic attribute.
> > >
> > > For example, we have a CI setup that tests new kernel changes on the
> > > hikey960 and db845c devices without updating their kernel modules. When
> > > these tests fail, we need to be able to identify the exact device
> > > configuration the test was using. By including MODULE_SCMVERSION, we can
> > > identify the exact kernel and modules' SCM versions for debugging the
> > > failures.
> > >
> > > Additionally, by exposing the SCM version via the sysfs node
> > > /sys/module/MODULENAME/scmversion, one can also verify the SCM versions
> > > of the modules loaded from the initramfs. Currently, modinfo can only
> > > retrieve module attributes from the module's ko on disk and not from the
> > > actual module that is loaded in RAM.
> > >
> > > You can retrieve the SCM version in two ways,
> > >
> > > 1) By using modinfo:
> > >     > modinfo -F scmversion MODULENAME
> > > 2) By module sysfs node:
> > >     > cat /sys/module/MODULENAME/scmversion
> > >
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >  Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
> > >  include/linux/module.h                |  1 +
> > >  init/Kconfig                          | 14 ++++++++++++++
> > >  kernel/module.c                       |  2 ++
> > >  scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
> > >  scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
> > >  6 files changed, 80 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> > > index 6272ae5fb366..a75d137e79f4 100644
> > > --- a/Documentation/ABI/stable/sysfs-module
> > > +++ b/Documentation/ABI/stable/sysfs-module
> > > @@ -32,3 +32,21 @@ Description:
> > >                 Note: If the module is built into the kernel, or if the
> > >                 CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
> > >                 this file will not be present.
> > > +
> > > +What:          /sys/module/MODULENAME/scmversion
> > > +Date:          November 2020
> > > +KernelVersion: 5.12
> > > +Contact:       Will McVicker <willmcvicker@google.com>
> > > +Description:   This read-only file will appear if modpost was supplied with an
> > > +               SCM version for the module. It can be enabled with the config
> > > +               MODULE_SCMVERSION. The SCM version is retrieved by
> > > +               scripts/setlocalversion, which means that the presence of this
> > > +               file depends on CONFIG_LOCALVERSION_AUTO=y. When read, the SCM
> > > +               version that the module was compiled with is returned. The SCM
> > > +               version is returned in the following format::
> > > +
> > > +               ===
> > > +               Git:            g[a-f0-9]\+(-dirty)\?
> > > +               Mercurial:      hg[a-f0-9]\+(-dirty)\?
> > > +               Subversion:     svn[0-9]\+
> > > +               ===
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 7a0bcb5b1ffc..3b1612193cf9 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -372,6 +372,7 @@ struct module {
> > >         struct module_attribute *modinfo_attrs;
> > >         const char *version;
> > >         const char *srcversion;
> > > +       const char *scmversion;
> > >         struct kobject *holders_dir;
> > >
> > >         /* Exported symbols */
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index b77c60f8b963..3d9dac3c4e8f 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -2131,6 +2131,20 @@ config MODULE_SRCVERSION_ALL
> > >           the version).  With this option, such a "srcversion" field
> > >           will be created for all modules.  If unsure, say N.
> > >
> > > +config MODULE_SCMVERSION
> > > +       bool "SCM version for modules"
> > > +       depends on LOCALVERSION_AUTO
> > > +       help
> > > +         This enables the module attribute "scmversion" which can be used
> > > +         by developers to identify the SCM version of a given module, e.g.
> > > +         git sha1 or hg sha1. The SCM version can be queried by modinfo or
> > > +         via the sysfs node: /sys/modules/MODULENAME/scmversion. This is
> > > +         useful when the kernel or kernel modules are updated separately
> > > +         since that causes the vermagic of the kernel and the module to
> > > +         differ.
> > > +
> > > +         If unsure, say N.
> > > +
> > >  config MODULE_SIG
> > >         bool "Module signature verification"
> > >         select MODULE_SIG_FORMAT
> > > diff --git a/kernel/module.c b/kernel/module.c
> > > index 4bf30e4b3eaa..d0b359c7e9c9 100644
> > > --- a/kernel/module.c
> > > +++ b/kernel/module.c
> > > @@ -837,6 +837,7 @@ static struct module_attribute modinfo_##field = {                    \
> > >
> > >  MODINFO_ATTR(version);
> > >  MODINFO_ATTR(srcversion);
> > > +MODINFO_ATTR(scmversion);
> > >
> > >  static char last_unloaded_module[MODULE_NAME_LEN+1];
> > >
> > > @@ -1298,6 +1299,7 @@ static struct module_attribute *modinfo_attrs[] = {
> > >         &module_uevent,
> > >         &modinfo_version,
> > >         &modinfo_srcversion,
> > > +       &modinfo_scmversion,
> > >         &modinfo_initstate,
> > >         &modinfo_coresize,
> > >         &modinfo_initsize,
> > > diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > > index f54b6ac37ac2..f1126b60adb7 100644
> > > --- a/scripts/Makefile.modpost
> > > +++ b/scripts/Makefile.modpost
> > > @@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
> > >
> > >  input-symdump := vmlinux.symvers
> > >  output-symdump := Module.symvers
> > > +module_srcpath := $(srctree)
> > >
> > >  else
> > >
> > > @@ -77,6 +78,17 @@ src := $(obj)
> > >  include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
> > >               $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
> > >
> > > +# Get the external module's source path. KBUILD_EXTMOD could either be an
> > > +# absolute path or relative path from $(srctree).
> >
> >
> > No.
> > KBUILD_EXTMOD could either be an absolute or relative path from $(objtree).
> >
> >
> >
> > > This makes sure that we
> > > +# aren't using a relative path from a separate working directory (O= or
> > > +# KBUILD_OUTPUT) since that may not be the actual module's SCM project path.
> > > +# So check the path relative to $(srctree) first.
> > > +ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
> > > +       module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
> > > +else
> > > +       module_srcpath := $(KBUILD_EXTMOD)
> > > +endif
> > > +
> >
> > This hunk is pointless in my view.
> >
> > The code should be much simpler, as follows:
> >
> >
> >
> > --- a/scripts/Makefile.modpost
> > +++ b/scripts/Makefile.modpost
> > @@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)
> >
> >  input-symdump := vmlinux.symvers
> >  output-symdump := Module.symvers
> > +module_srcpath := $(srctree)
> >
> >  else
> >
> > @@ -82,9 +83,20 @@ MODPOST += -e
> >
> >  input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
> >  output-symdump := $(KBUILD_EXTMOD)/Module.symvers
> > +module_srcpath := $(KBUILD_EXTMOD)
> >
> >  endif
> >
> >
> >
> >
> >
> >
> >
> >
> > >  # modpost option for external modules
> > >  MODPOST += -e
> > >
> > > @@ -85,6 +97,16 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
> > >
> > >  endif
> > >
> > > +ifeq ($(CONFIG_MODULE_SCMVERSION),y)
> > > +# Get the SCM version of the module. Sed verifies setlocalversion returns
> > > +# a proper revision based on the SCM type, e.g. git, mercurial, or svn.
> > > +module_scmversion := $(shell $(srctree)/scripts/setlocalversion $(module_srcpath) | \
> > > +       sed -n 's/.*-\(\(g\|hg\)[a-fA-F0-9]\+\(-dirty\)\?\|svn[0-9]\+\).*/\1/p')
> > > +ifneq ($(module_scmversion),)
> > > +MODPOST += -v$(module_scmversion)
> >
> >
> > A space after -v for consistency.
> >
> >
> >
> > > +endif
> > > +endif
> > > +
> > >  # modpost options for modules (both in-kernel and external)
> > >  MODPOST += \
> > >         $(addprefix -i ,$(wildcard $(input-symdump))) \
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index d6c81657d695..489b65bc37de 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -30,6 +30,8 @@ static int have_vmlinux = 0;
> > >  static int all_versions = 0;
> > >  /* If we are modposting external module set to 1 */
> > >  static int external_module = 0;
> > > +#define MODULE_SCMVERSION_SIZE 64
> > > +static char module_scmversion[MODULE_SCMVERSION_SIZE];
> > >  /* Only warn about unresolved symbols */
> > >  static int warn_unresolved = 0;
> > >  /* How a symbol is exported */
> > > @@ -2264,6 +2266,20 @@ static void add_intree_flag(struct buffer *b, int is_intree)
> > >                 buf_printf(b, "\nMODULE_INFO(intree, \"Y\");\n");
> > >  }
> > >
> > > +/**
> > > + * add_scmversion() - Adds the MODULE_INFO macro for the scmversion.
> > > + * @b: Buffer to append to.
> > > + *
> > > + * This function fills in the module attribute `scmversion` for the kernel
> > > + * module. This is useful for determining a given module's SCM version on
> > > + * device via /sys/modules/<module>/scmversion and/or using the modinfo tool.
> > > + */
> > > +static void add_scmversion(struct buffer *b)
> > > +{
> > > +       if (module_scmversion[0] != '\0')
> > > +               buf_printf(b, "\nMODULE_INFO(scmversion, \"%s\");\n", module_scmversion);
> > > +}
> > > +
> > >  /* Cannot check for assembler */
> > >  static void add_retpoline(struct buffer *b)
> > >  {
> > > @@ -2546,7 +2562,7 @@ int main(int argc, char **argv)
> > >         struct dump_list *dump_read_start = NULL;
> > >         struct dump_list **dump_read_iter = &dump_read_start;
> > >
> > > -       while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
> > > +       while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:v:")) != -1) {
> > >                 switch (opt) {
> > >                 case 'e':
> > >                         external_module = 1;
> > > @@ -2584,6 +2600,11 @@ int main(int argc, char **argv)
> > >                 case 'd':
> > >                         missing_namespace_deps = optarg;
> > >                         break;
> > > +               case 'v':
> > > +                       if (!optarg)
> > > +                               fatal("'-v' requires an argument defining the SCM version.");
> >
> >
> > The existing -i, -T, -o, -d options take an argument as well.
> > Why don't they have such a check as you added?
> > The answer is because getopt() checks it.
> >
> >
> > I applied your patch, and ran modpost directly
> > with -v at the end of the command line.
> >
> >
> > masahiro@oscar:~/workspace/linux$ ./scripts/mod/modpost  -v
> > ./scripts/mod/modpost: option requires an argument -- 'v'
> >
> >
> > I see the error message from getopt() instead of
> > your hand-made error check.
> >
> >
> >
> >
> >
> >
> >
> >
> > > +                       strncpy(module_scmversion, optarg, sizeof(module_scmversion) - 1);
> > > +                       break;
> > >                 default:
> > >                         exit(1);
> > >                 }
> > > @@ -2630,6 +2651,7 @@ int main(int argc, char **argv)
> > >                 add_depends(&buf, mod);
> > >                 add_moddevtable(&buf, mod);
> > >                 add_srcversion(&buf, mod);
> > > +               add_scmversion(&buf);
> > >
> > >                 sprintf(fname, "%s.mod.c", mod->name);
> > >                 write_if_changed(&buf, fname);
> > > --
> > > 2.30.0.284.gd98b1dd5eaa7-goog
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
