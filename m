Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E041790C8A
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Sep 2023 16:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjICOut (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Sep 2023 10:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjICOut (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Sep 2023 10:50:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90240110;
        Sun,  3 Sep 2023 07:50:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02AAE60A16;
        Sun,  3 Sep 2023 14:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5260C433C7;
        Sun,  3 Sep 2023 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693752641;
        bh=2Wd98C057DanJGON6Re4/WMF8d8ZzZLZjKjtz8vbpBI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LQ7lNFB5FdJrkqfMGNRJSQXLak9zY54IRboPmf7H1yPnQZ1wb7M3P3HRu57n+zxgz
         D1ph7vyrPidsVv4x3/auy4ImN4+T5BFM9Uzm+b84nVPj70zQyxm+3mfh8JEOh2w61i
         38XxYCBCnCR12z6BPCauVVujSPYhFmzQVezzw2YsuDO+JtLN6I5uNflcuaDtNZClom
         fpfYGFDVylshOwsbbbPM4PSergwfHzmMlnIw/3zCPU5P4Ii51G6SnEYrRzt4F/PQHX
         XTbgHvB7VFot0EbkBTyyIboBgVsw/3oGNRA+fdEAXSOb8Iy2LbGavv97eyGTZgC3Qh
         tUVh7kFJ5aBpA==
Date:   Sun, 3 Sep 2023 23:50:34 +0900
From:   Masami Hiramatsu (Google) <mhiramat@kernel.org>
To:     Alessandro Carminati <alessandro.carminati@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>,
        Francis Laniel <flaniel@linux.microsoft.com>,
        Viktor Malik <vmalik@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        live-patching@vger.kernel.org
Subject: Re: [PATCH v3] scripts/link-vmlinux.sh: Add alias to duplicate
 symbols for kallsyms
Message-Id: <20230903235034.3b9fa3e21180a78eba231166@kernel.org>
In-Reply-To: <CAPp5cGRRFULw37gcRDaOufvBbh=SnOf_UDN1AoRO_Q0-DH3Z9g@mail.gmail.com>
References: <20230828080423.3539686-1-alessandro.carminati@gmail.com>
        <20230830150027.57bf46382eef3206c78de6d2@kernel.org>
        <CAPp5cGRRFULw37gcRDaOufvBbh=SnOf_UDN1AoRO_Q0-DH3Z9g@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2 Sep 2023 09:26:59 +0200
Alessandro Carminati <alessandro.carminati@gmail.com> wrote:

> Hey Masami,
> Thanks a lot for your review and for your time.
> 
> Il giorno mer 30 ago 2023 alle ore 08:00 Masami Hiramatsu
> <mhiramat@kernel.org> ha scritto:
> >
> > Hi Alessandro,
> >
> > Thanks for your update!
> >
> > On Mon, 28 Aug 2023 08:04:23 +0000
> > "Alessandro Carminati (Red Hat)" <alessandro.carminati@gmail.com> wrote:
> >
> > > From: Alessandro Carminati <alessandro.carminati@gmail.com>
> > >
> > > It is not uncommon for drivers or modules related to similar peripherals
> > > to have symbols with the exact same name.
> > > While this is not a problem for the kernel's binary itself, it becomes an
> > > issue when attempting to trace or probe specific functions using
> > > infrastructure like ftrace or kprobe.
> > >
> > > The tracing subsystem relies on the `nm -n vmlinux` output, which provides
> > > symbol information from the kernel's ELF binary. However, when multiple
> > > symbols share the same name, the standard nm output does not differentiate
> > > between them. This can lead to confusion and difficulty when trying to
> > > probe the intended symbol.
> > >
> > >  ~ # cat /proc/kallsyms | grep " name_show"
> > >  ffffffff8c4f76d0 t name_show
> > >  ffffffff8c9cccb0 t name_show
> > >  ffffffff8cb0ac20 t name_show
> > >  ffffffff8cc728c0 t name_show
> > >  ffffffff8ce0efd0 t name_show
> > >  ffffffff8ce126c0 t name_show
> > >  ffffffff8ce1dd20 t name_show
> > >  ffffffff8ce24e70 t name_show
> > >  ffffffff8d1104c0 t name_show
> > >  ffffffff8d1fe480 t name_show
> > >
> > > **kas_alias** addresses this challenge by extending the symbol names with
> > > unique suffixes during the kernel build process.
> > > The newly created aliases for these duplicated symbols are unique names
> > > that can be fed to the ftracefs interface. By doing so, it enables
> > > previously unreachable symbols to be probed.
> > >
> > >  ~ # cat /proc/kallsyms | grep " name_show"
> > >  ffffffff974f76d0 t name_show
> > >  ffffffff974f76d0 t name_show__alias__6340
> > >  ffffffff979cccb0 t name_show
> > >  ffffffff979cccb0 t name_show__alias__6341
> > >  ffffffff97b0ac20 t name_show
> > >  ffffffff97b0ac20 t name_show__alias__6342
> > >  ffffffff97c728c0 t name_show
> > >  ffffffff97c728c0 t name_show__alias__6343
> > >  ffffffff97e0efd0 t name_show
> > >  ffffffff97e0efd0 t name_show__alias__6344
> > >  ffffffff97e126c0 t name_show
> > >  ffffffff97e126c0 t name_show__alias__6345
> > >  ffffffff97e1dd20 t name_show
> > >  ffffffff97e1dd20 t name_show__alias__6346
> > >  ffffffff97e24e70 t name_show
> > >  ffffffff97e24e70 t name_show__alias__6347
> > >  ffffffff981104c0 t name_show
> > >  ffffffff981104c0 t name_show__alias__6348
> > >  ffffffff981fe480 t name_show
> > >  ffffffff981fe480 t name_show__alias__6349
> > >  ~ # echo "p:kprobes/evnt1 name_show__alias__6349" \
> > >  > >/sys/kernel/tracing/kprobe_events
> > >  ~ # cat /sys/kernel/tracing/kprobe_events
> > >  p:kprobes/evnt1 name_show__alias__6349
> > >
> > > Changes from v1:
> > > - Integrated changes requested by Masami to exclude symbols with prefixes
> > >   "_cfi" and "_pfx".
> > > - Introduced a small framework to handle patterns that need to be excluded
> > >   from the alias production.
> > > - Excluded other symbols using the framework.
> > > - Introduced the ability to discriminate between text and data symbols.
> > > - Added two new config symbols in this version: CONFIG_KALLSYMS_ALIAS_DATA,
> > >   which allows data for data, and CONFIG_KALLSYMS_ALIAS_DATA_ALL, which
> > >   excludes all filters and provides an alias for each duplicated symbol.
> > >
> > > https://lore.kernel.org/all/20230711151925.1092080-1-alessandro.carminati@gmail.com/
> > >
> > > Changes from v2:
> > > - Alias tags are created by querying DWARF information from the vmlinux.
> > > - The filename + line number is normalized and appended to the original name.
> > > - The tag begins with '@' to indicate the symbol source.
> > > - Not a change, but worth mentioning, since the alias is added to the existing
> > >   list, the old duplicated name is preserved, and the livepatch way of dealing
> > >   with duplicates is maintained.
> > > - Acknowledging the existence of scenarios where inlined functions declared in
> > >   header files may result in multiple copies due to compiler behavior, though
> > >    it is not actionable as it does not pose an operational issue.
> > > - Highlighting a single exception where the same name refers to different
> > >   functions: the case of "compat_binfmt_elf.c," which directly includes
> > >   "binfmt_elf.c" producing identical function copies in two separate
> > >   modules.
> > >
> > > sample from new v3
> > >
> > >  ~ # cat /proc/kallsyms | grep gic_mask_irq
> > >  ffffd0b03c04dae4 t gic_mask_irq
> > >  ffffd0b03c04dae4 t gic_mask_irq@_drivers_irqchip_irq-gic_c_167
> > >  ffffd0b03c050960 t gic_mask_irq
> > >  ffffd0b03c050960 t gic_mask_irq@_drivers_irqchip_irq-gic-v3_c_404
> >
> > Could you also update the sample output in the patch description?
> > And I can not see this line information but a serial number aliases,
> > is there any way to enable this file-name aliases? (LLVM is not supported?)
> > I think we'd better to have a new CONFIG_KALLSYMS_ALIAS_SRCLINE and
> > clarify what is required.
> 
> In this version of the patch, there's still a fallback action that
> produces the old "__alias__<seqnum>" if the addr2line action fails.
> In the v3 patch, addr2line is default to the native option.

OK, do you know when the addr2line fails? If it is clear, it is
better to unselect the CONFIG_KALLSYMS_ALIAS_SRCLINE instead of
statically failback to seqnum suffix (or failed to build), because
user expects that the built kernel image is including the alias has
suffixes based on src line number.
This is important especially it depends on user environment, because
it gives user to update their environment before building the kernel.

> The CROSS_COMPILE setting remains a manual selection. While in my tests,
> I didn't encounter any issues, and the native addr2line worked well on
> all the architectures I tested, there is still a possibility of failure
> leading to the fallback action. Somthing I will change in the v4.

Good.

> 
> Additionally, if CONFIG_KALLSYMS_ALIAS_DATA is set to 'Y,' data names
> included in the KALLSYMS receive an old-style alias.
> Regarding this matter, I'd like to discuss with you the relevance of
> CONFIG_KALLSYMS_ALIAS_DATA and CONFIG_KALLSYMS_ALIAS_DATA_ALL.

Would you mean that the symbols of DATA can not use src lines?
(what is the "old-style alias" you meant here?)

> Both of these settings aim to provide an alias for variable names as
> well. In the past, I had to "livepatch" a function for an architecture
> that had no support, and I thought it would be beneficial to have
> unique variable names as well. What are your thoughts on this?

Yeah, it is also good for kprobe-events because it supports probes
to access global variables by name. Thus if the alias can specify a
unique symbol, it ensures which variable we will trace.

> >
> > >  ~ #
> > >
> > > https://lore.kernel.org/all/20230714150326.1152359-1-alessandro.carminati@gmail.com/
> > >
> > > Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
> > > ---
> > >  init/Kconfig                        |  36 ++++
> > >  scripts/Makefile                    |   4 +
> > >  scripts/kas_alias/Makefile          |   4 +
> > >  scripts/kas_alias/a2l.c             | 268 ++++++++++++++++++++++++++++
> > >  scripts/kas_alias/a2l.h             |  32 ++++
> > >  scripts/kas_alias/duplicates_list.c |  70 ++++++++
> > >  scripts/kas_alias/duplicates_list.h |  15 ++
> > >  scripts/kas_alias/item_list.c       | 230 ++++++++++++++++++++++++
> > >  scripts/kas_alias/item_list.h       |  26 +++
> > >  scripts/kas_alias/kas_alias.c       | 217 ++++++++++++++++++++++
> > >  scripts/link-vmlinux.sh             |  11 +-
> > >  11 files changed, 910 insertions(+), 3 deletions(-)
> > >  create mode 100644 scripts/kas_alias/Makefile
> > >  create mode 100644 scripts/kas_alias/a2l.c
> > >  create mode 100644 scripts/kas_alias/a2l.h
> > >  create mode 100644 scripts/kas_alias/duplicates_list.c
> > >  create mode 100644 scripts/kas_alias/duplicates_list.h
> > >  create mode 100644 scripts/kas_alias/item_list.c
> > >  create mode 100644 scripts/kas_alias/item_list.h
> > >  create mode 100644 scripts/kas_alias/kas_alias.c
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index f7f65af4ee12..bc69fcd9cbc8 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1737,6 +1737,42 @@ config KALLSYMS_BASE_RELATIVE
> > >         time constants, and no relocation pass is required at runtime to fix
> > >         up the entries based on the runtime load address of the kernel.
> > >
> > > +config KALLSYMS_ALIAS
> > > +     bool "Produces alias for duplicated symbols" if EXPERT
> > > +     depends on KALLSYMS && (DEBUG_INFO_DWARF4 || DEBUG_INFO_DWARF5)
> > > +     help
> > > +       It is not uncommon for drivers or modules related to similar
> > > +       peripherals to have symbols with the exact same name.
> > > +       While this is not a problem for the kernel's binary itself, it
> > > +       becomes an issue when attempting to trace or probe specific
> > > +       functions using infrastructure like ftrace or kprobe.
> > > +
> > > +       This option addresses this challenge by extending the symbol names
> > > +       with unique suffixes during the kernel build process.
> > > +       The newly created aliases for these duplicated symbols are unique
> > > +       names that can be fed to the ftrace sysfs interface. By doing so, it
> > > +       enables previously unreachable symbols to be probed.
> > > +
> > > +config CONFIG_KALLSYMS_ALIAS_DATA
> >
> > You don't need 'CONFIG_' prefix here.
> >
> > > +     bool "Produces alias also for data"
> > > +     depends on KALLSYMS_ALIAS
> > > +     help
> > > +       Sometimes it can be useful to refer to data. In live patch scenarios,
> > > +       you may find yourself needing to use symbols that are shared with
> > > +       other functions. Since symbols face the same issue as functions, this
> > > +       option allows you to create aliases for data as well.
> > > +
> > > +config CONFIG_KALLSYMS_ALIAS_DATA_ALL
> > > +     bool "Removes all filter when producing data alias"
> > > +     depends on CONFIG_KALLSYMS_ALIAS_DATA
> > > +     help
> > > +       When selecting data aliases, not all symbols are included in the set
> > > +       This is because many symbols are unlikely to be used. If you choose
> > > +       to have an alias for all data symbols, be aware that it will
> > > +       significantly increase the size.
> > > +
> > > +       If unsure, say N.
> > > +
> > >  # end of the "standard kernel features (expert users)" menu
> > >
> > >  # syscall, maps, verifier
> > > diff --git a/scripts/Makefile b/scripts/Makefile
> > > index 32b6ba722728..65fafe17cfe5 100644
> > > --- a/scripts/Makefile
> > > +++ b/scripts/Makefile
> > > @@ -49,3 +49,7 @@ subdir-$(CONFIG_SECURITY_SELINUX) += selinux
> > >
> > >  # Let clean descend into subdirs
> > >  subdir-      += basic dtc gdb kconfig mod
> > > +
> > > +# KALLSyms alias
> > > +subdir-$(CONFIG_KALLSYMS_ALIAS) += kas_alias
> > > +
> > > diff --git a/scripts/kas_alias/Makefile b/scripts/kas_alias/Makefile
> > > new file mode 100644
> > > index 000000000000..e1fde69232b4
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/Makefile
> > > @@ -0,0 +1,4 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +hostprogs-always-$(CONFIG_KALLSYMS_ALIAS)    += kas_alias
> > > +
> > > +kas_alias-objs        := duplicates_list.o item_list.o kas_alias.o a2l.o
> > > diff --git a/scripts/kas_alias/a2l.c b/scripts/kas_alias/a2l.c
> > > new file mode 100644
> > > index 000000000000..a9692ac30180
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/a2l.c
> > > @@ -0,0 +1,268 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <unistd.h>
> > > +#include <sys/types.h>
> > > +#include <sys/wait.h>
> > > +#include <string.h>
> > > +#include <stdint.h>
> > > +#include <stdbool.h>
> > > +
> > > +#include "a2l.h"
> > > +
> > > +int addr2line_pid = -1;
> > > +int a2l_in[2];
> > > +int a2l_out[2];
> > > +char line[MAX_BUF];
> > > +char vmlinux_path[MAX_BUF];
> > > +char addr2line_cmd[MAX_CMD_LEN];
> > > +FILE *a2l_stdin, *a2l_stdout;
> > > +
> > > +static char *normalize_path(const char *input_path, char *output_path)
> > > +{
> > > +     char *prev_token = NULL;
> > > +     char *delimiter = "/";
> > > +     char inbuf[MAX_BUF];
> > > +     char *token;
> > > +     char *pos;
> > > +
> > > +     memset(inbuf, 0, MAX_BUF);
> > > +     *output_path = '\0';
> > > +     strncpy(inbuf, input_path, MAX_BUF);
> > > +     if (!input_path || !output_path || strlen(input_path) == 0)
> > > +             return NULL;
> > > +
> > > +     token = strtok(inbuf, delimiter);
> > > +     while (token) {
> > > +             if (strcmp(token, "..") == 0 && prev_token) {
> > > +                     pos = strrchr(output_path, '/');
> > > +                     if (pos)
> > > +                             *pos = '\0';
> > > +
> > > +             } else if (strcmp(token, ".") != 0) {
> > > +                     strcat(output_path, "/");
> > > +                     strcat(output_path, token);
> > > +             }
> > > +
> > > +             prev_token = token;
> > > +             token = strtok(NULL, delimiter);
> > > +     }
> > > +
> > > +     return output_path;
> > > +}
> > > +
> > > +static void path_of(const char *full_path, char *path)
> > > +{
> > > +     const char *last_slash = strrchr(full_path, '/');
> > > +     size_t path_length;
> > > +     char cwd[MAX_BUF];
> > > +
> > > +     if (!last_slash) {
> > > +             if (getcwd(cwd, sizeof(cwd)))
> > > +                     strcpy(path, cwd);
> > > +             else
> > > +                     strcpy(path, ".");
> > > +     } else {
> > > +             path_length = last_slash - full_path;
> > > +             strncpy(path, full_path, path_length);
> > > +             path[path_length] = '\0';
> > > +     }
> > > +}
> > > +
> > > +static bool file_exists(const char *file_path)
> > > +{
> > > +     FILE *file;
> > > +
> > > +     file = fopen(file_path, "r");
> > > +     if (file) {
> > > +             fclose(file);
> > > +             return true;
> > > +     }
> > > +     return false;
> > > +}
> > > +
> > > +int addr2line_init(const char *cmd, const char *vmlinux)
> > > +{
> > > +     if ((!file_exists(cmd)) || (!file_exists(vmlinux))) {
> > > +             printf("file not found\n");
> > > +             return 0;
> > > +             }
> >
> > nit: mis-indentation?
> >
> > > +
> > > +     path_of(vmlinux, vmlinux_path);
> > > +     if (pipe(a2l_in) == -1) {
> > > +             printf("Failed to create pipe\n");
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (pipe(a2l_out) == -1) {
> > > +             printf("Failed to create pipe\n");
> > > +             return 0;
> > > +     }
> > > +
> > > +     addr2line_pid = fork();
> > > +     if (addr2line_pid == -1) {
> > > +             printf("Failed to fork process\n");
> > > +             close(a2l_in[P_READ]);
> > > +             close(a2l_in[P_WRITE]);
> > > +             close(a2l_out[P_READ]);
> > > +             close(a2l_out[P_WRITE]);
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (addr2line_pid == 0) {
> > > +             dup2(a2l_in[P_READ], 0);
> > > +             dup2(a2l_out[P_WRITE], 1);
> > > +             close(a2l_in[P_WRITE]);
> > > +             close(a2l_out[P_READ]);
> > > +
> > > +             execlp(cmd, cmd, ADDR2LINE_ARGS, vmlinux, NULL);
> > > +
> > > +             printf("Failed to execute addr2line command\n");
> > > +             exit(1);
> > > +     } else {
> > > +             close(a2l_in[P_READ]);
> > > +             close(a2l_out[P_WRITE]);
> > > +     }
> > > +
> > > +     a2l_stdin = fdopen(a2l_in[P_WRITE], "w");
> > > +     if (!a2l_stdin) {
> > > +             printf("Failed to open pipe a2l_in\n");
> > > +             return 0;
> > > +     }
> > > +
> > > +     a2l_stdout = fdopen(a2l_out[P_READ], "r");
> > > +     if (!a2l_stdout) {
> > > +             printf("Failed to open pipe a2l_out\n");
> > > +             fclose(a2l_stdin);
> > > +             return 0;
> > > +     }
> > > +
> > > +     return 1;
> > > +}
> > > +
> > > +const char *remove_subdir(const char *home, const char *f_path)
> > > +{
> > > +     int i = 0;
> > > +
> > > +     while (*(home + i) == *(f_path + i))
> > > +             i++;
> > > +
> > > +     return (strlen(home) != i) ? NULL : f_path + i;
> > > +}
> > > +
> > > +char *addr2line_get_lines(uint64_t address)
> > > +{
> > > +     char buf[MAX_BUF];
> > > +
> > > +     fprintf(a2l_stdin, "%08lx\n", address);
> > > +     fflush(a2l_stdin);
> > > +
> > > +     if (!fgets(line, sizeof(line), a2l_stdout)) {
> > > +             printf("Failed to read lines from addr2line\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     if (!fgets(line, sizeof(line), a2l_stdout)) {
> > > +             printf("Failed to read lines from addr2line\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     line[strcspn(line, "\n")] = '\0';
> > > +     strncpy(buf, line, MAX_BUF);
> > > +     return normalize_path(buf, line);
> > > +}
> > > +
> > > +int addr2line_cleanup(void)
> > > +{
> > > +     int status;
> > > +
> > > +     if (addr2line_pid != -1) {
> > > +             kill(addr2line_pid, SIGKILL);
> > > +             waitpid(addr2line_pid, &status, 0);
> > > +             fclose(a2l_stdin);
> > > +             fclose(a2l_stdout);
> > > +             addr2line_pid = -1;
> > > +     }
> > > +
> > > +     return 1;
> > > +}
> > > +
> > > +static char *find_executable(const char *command)
> > > +{
> > > +     char *path_env = getenv("PATH");
> > > +     char *executable_path;
> > > +     char *path_copy;
> > > +     char *path;
> > > +     int n;
> > > +
> > > +     if (!path_env)
> > > +             return NULL;
> > > +
> > > +     path_copy = strdup(path_env);
> > > +     if (!path_copy)
> > > +             return NULL;
> > > +
> > > +     path = strtok(path_copy, ":");
> > > +     while (path) {
> > > +             n = snprintf(0, 0, "%s/%s", path, command);
> > > +             executable_path = (char *)malloc(n + 1);
> > > +             snprintf(executable_path, n + 1, "%s/%s", path, command);
> > > +             if (access(executable_path, X_OK) == 0) {
> > > +                     free(path_copy);
> > > +                     return executable_path;
> > > +             }
> > > +
> > > +     path = strtok(NULL, ":");
> > > +     free(executable_path);
> > > +     executable_path = NULL;
> >
> > nit: mis-indentation?
> >
> > > +     }
> > > +
> > > +     free(path_copy);
> > > +     if (executable_path)
> > > +             free(executable_path);
> > > +     return NULL;
> > > +}
> > > +
> > > +const char *get_addr2line(int mode)
> > > +{
> > > +     char *buf = "";
> > > +
> > > +     switch (mode) {
> > > +     case A2L_CROSS:
> > > +             buf = getenv("CROSS_COMPILE");
> > > +             memcpy(addr2line_cmd, buf, strlen(buf));
> > > +     case A2L_DEFAULT:
> > > +             memcpy(addr2line_cmd + strlen(buf), ADDR2LINE, strlen(ADDR2LINE));
> > > +             buf = find_executable(addr2line_cmd);
> > > +             if (buf) {
> > > +                     memcpy(addr2line_cmd, buf, strlen(buf));
> > > +                     free(buf);
> > > +             }
> > > +             return addr2line_cmd;
> > > +     case A2L_LLVM:
> > > +     default:
> > > +             return NULL;
> > > +     }
> > > +}
> > > +
> > > +char *get_vmlinux(char *input)
> > > +{
> > > +     const char *match_string1 = ".syms";
> > > +     const char *match_string2 = ".tmp_vmlinux.kallsyms";
> > > +     char *result = NULL;
> > > +     char *match_pos;
> > > +
> > > +     match_pos = strstr(input, match_string1);
> > > +     if (!match_pos)
> > > +             return NULL;
> > > +
> > > +     match_pos = strstr(input, match_string2);
> > > +     if (!match_pos)
> > > +             return NULL;
> > > +
> > > +     result = strdup(input);
> > > +     match_pos = strstr(result, match_string1);
> > > +     *match_pos = '\0';
> > > +     return result;
> > > +}
> > > diff --git a/scripts/kas_alias/a2l.h b/scripts/kas_alias/a2l.h
> > > new file mode 100644
> > > index 000000000000..ca6419229dde
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/a2l.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +#ifndef A2L_H
> > > +#define A2L_H
> > > +#include <stdint.h>
> > > +
> > > +#define ADDR2LINE "addr2line"
> > > +#define ADDR2LINE_ARGS "-fe"
> > > +//#define VMLINUX "vmlinux"
> >
> > Nit: this should be removed if it is not used.
> >
> > > +#define MAX_BUF 4096
> > > +#define MAX_CMD_LEN 256
> > > +#define P_READ 0
> > > +#define P_WRITE 1
> > > +#define A2L_DEFAULT 1
> > > +#define A2L_CROSS 2
> > > +#define A2L_LLVM 3
> > > +#define A2L_MAKE_VALUE 2
> > > +
> > > +extern int addr2line_pid;
> > > +extern int a2l_in[2];
> > > +extern int a2l_out[2];
> > > +extern char line[MAX_BUF];
> > > +extern char vmlinux_path[MAX_BUF];
> > > +extern char addr2line_cmd[MAX_CMD_LEN];
> > > +
> > > +int addr2line_init(const char *cmd, const char *vmlinux);
> > > +char *addr2line_get_lines(uint64_t address);
> > > +int addr2line_cleanup(void);
> > > +const char *remove_subdir(const char *home, const char *f_path);
> > > +const char *get_addr2line(int mode);
> > > +char *get_vmlinux(char *input);
> > > +
> > > +#endif
> > > diff --git a/scripts/kas_alias/duplicates_list.c b/scripts/kas_alias/duplicates_list.c
> > > new file mode 100644
> > > index 000000000000..e7a3d2917937
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/duplicates_list.c
> > > @@ -0,0 +1,70 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <stdint.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +#include <stdlib.h>
> > > +#include <stdbool.h>
> > > +
> > > +#include "item_list.h"
> > > +#include "duplicates_list.h"
> > > +
> >
> > /* The item list must be sorted. */
> >
> > I think we can find the duplicated symbol without sorting the list,
> > but such implementation level optimization will be done later.
> 
> I think I will handle this aspect in the v4.

Good :)

> 
> >
> > > +struct duplicate_item *find_duplicates(struct item *list)
> > > +{
> > > +     struct duplicate_item *current_duplicate = NULL;
> > > +     struct duplicate_item *duplicates = NULL;
> > > +     struct duplicate_item *new_duplicate;
> > > +     struct item *current_item = list;
> > > +     bool prev_was_duplicate = false;
> > > +     struct item *prev_item = NULL;
> > > +
> > > +     while (current_item) {
> > > +             if ((prev_item && (strcmp(current_item->symb_name, prev_item->symb_name) == 0)) ||
> > > +                 prev_was_duplicate) {
> > > +                     if (!duplicates) {
> > > +                             duplicates = malloc(sizeof(struct duplicate_item));
> > > +                             if (!duplicates)
> > > +                                     return NULL;
> > > +
> > > +                             duplicates->original_item = prev_item;
> > > +                             duplicates->next = NULL;
> > > +                             current_duplicate = duplicates;
> > > +                     } else {
> > > +                             new_duplicate = malloc(sizeof(struct duplicate_item));
> > > +                             if (!new_duplicate) {
> > > +                                     free_duplicates(&duplicates);
> > > +                                     return NULL;
> > > +                             }
> > > +
> > > +                             new_duplicate->original_item = prev_item;
> > > +                             new_duplicate->next = NULL;
> > > +                             current_duplicate->next = new_duplicate;
> > > +                             current_duplicate = new_duplicate;
> > > +
> > > +                             if ((strcmp(current_item->symb_name, prev_item->symb_name) != 0) &&
> > > +                                 (prev_was_duplicate))
> > > +                                     prev_was_duplicate = false;
> > > +                             else
> > > +                                     prev_was_duplicate = true;
> > > +                     }
> > > +             }
> > > +
> > > +             prev_item = current_item;
> > > +             current_item = current_item->next;
> > > +     }
> > > +
> > > +     return duplicates;
> > > +}
> > > +
> > > +void free_duplicates(struct duplicate_item **duplicates)
> > > +{
> > > +     struct duplicate_item *duplicates_iterator = *duplicates;
> > > +     struct duplicate_item *app;
> > > +
> > > +     while (duplicates_iterator) {
> > > +             app = duplicates_iterator;
> > > +             duplicates_iterator = duplicates_iterator->next;
> > > +             free(app);
> > > +     }
> > > +
> > > +     *duplicates = NULL;
> > > +}
> > > diff --git a/scripts/kas_alias/duplicates_list.h b/scripts/kas_alias/duplicates_list.h
> > > new file mode 100644
> > > index 000000000000..76aa73e584bc
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/duplicates_list.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +#ifndef DUPLICATES_LIST_H
> > > +#define DUPLICATES_LIST_H
> > > +
> > > +#include "item_list.h"
> > > +
> > > +struct duplicate_item {
> > > +     struct item *original_item;
> > > +     struct duplicate_item *next;
> > > +};
> > > +
> > > +struct duplicate_item *find_duplicates(struct item *list);
> > > +void free_duplicates(struct duplicate_item **duplicates);
> > > +
> > > +#endif
> > > diff --git a/scripts/kas_alias/item_list.c b/scripts/kas_alias/item_list.c
> > > new file mode 100644
> > > index 000000000000..48f2e525592a
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/item_list.c
> > > @@ -0,0 +1,230 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <stdint.h>
> > > +#include <string.h>
> > > +#include <stdbool.h>
> > > +#include <assert.h>
> > > +#include "item_list.h"
> > > +
> > > +#define CHECK_ORDER_BY_ADDRESS(sort_by, current, temp, op) \
> > > +     ((sort_by) == BY_ADDRESS && (current)->addr op (temp)->addr)
> > > +#define CHECK_ORDER_BY_NAME(sort_by, current, temp, op) \
> > > +     ((sort_by) == BY_NAME && strcmp((current)->symb_name, (temp)->symb_name) op 0)
> > > +
> > > +struct item *list_index[96] = {0};
> > > +
> > > +void build_index(struct item *list)
> > > +{
> > > +     char current_first_letter = ' ';
> > > +     struct item *current = list;
> > > +
> > > +     while (current) {
> > > +             if (current->symb_name[0] != current_first_letter) {
> > > +                     current_first_letter = current->symb_name[0];
> > > +                     list_index[current_first_letter - 32] = current;
> > > +             }
> > > +             current = current->next;
> > > +     }
> > > +}
> > > +
> > > +struct item *add_item(struct item **list, const char *name, char stype, uint64_t addr)
> > > +{
> > > +     struct item *new_item;
> > > +     struct item *current;
> > > +
> > > +     new_item = malloc(sizeof(struct item));
> > > +     if (!new_item)
> > > +             return NULL;
> > > +
> > > +     strncpy(new_item->symb_name, name, MAX_NAME_SIZE);
> > > +     new_item->symb_name[MAX_NAME_SIZE - 1] = '\0';
> > > +     new_item->addr = addr;
> > > +     new_item->stype = stype;
> > > +     new_item->next = NULL;
> > > +
> > > +     if (!(*list)) {
> > > +             *list = new_item;
> > > +     } else {
> > > +             current = *list;
> > > +             while (current->next)
> > > +                     current = current->next;
> > > +
> > > +             current->next = new_item;
> > > +     }
> > > +     return new_item;
> > > +}
> > > +
> > > +void sort_list(struct item **list, int sort_by)
> > > +{
> > > +     struct item *current = *list;
> > > +     struct item *sorted = NULL;
> > > +     struct item *next_item;
> > > +     struct item *temp;
> > > +
> > > +     if (!(*list) || !((*list)->next))
> > > +             return;
> > > +
> > > +     while (current) {
> > > +             next_item = current->next;
> > > +             if (!sorted ||
> > > +                 (CHECK_ORDER_BY_ADDRESS(sort_by, current, sorted, <) ||
> > > +                 CHECK_ORDER_BY_NAME(sort_by, current, sorted, >=))) {
> > > +                     current->next = sorted;
> > > +                     sorted = current;
> > > +             } else {
> > > +                     temp = sorted;
> > > +                     while (temp->next &&
> > > +                            (CHECK_ORDER_BY_ADDRESS(sort_by, current, temp->next, >=) ||
> > > +                            CHECK_ORDER_BY_NAME(sort_by, current, temp->next, >=)))
> > > +                             temp = temp->next;
> > > +
> > > +                     current->next = temp->next;
> > > +                     temp->next = current;
> > > +             }
> > > +             current = next_item;
> > > +     }
> > > +
> > > +     *list = sorted;
> > > +}
> > > +
> > > +struct item *merge(struct item *left, struct item *right, int sort_by)
> > > +{
> > > +     struct item *current = NULL;
> > > +     struct item *result = NULL;
> > > +
> > > +     if (!left)
> > > +             return right;
> > > +     if (!right)
> > > +             return left;
> > > +
> > > +     if (sort_by == BY_NAME) {
> > > +             if (strcmp(left->symb_name, right->symb_name) <= 0) {
> > > +                     result = left;
> > > +                     left = left->next;
> > > +             } else {
> > > +                     result = right;
> > > +                     right = right->next;
> > > +             }
> > > +     } else {
> > > +             if (sort_by == BY_ADDRESS) {
> > > +                     if (left->addr <= right->addr) {
> > > +                             result = left;
> > > +                             left = left->next;
> > > +                     } else {
> > > +                             result = right;
> > > +                             right = right->next;
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     current = result;
> > > +
> > > +     while (left && right) {
> > > +             if (sort_by == BY_NAME) {
> > > +                     if (strcmp(left->symb_name, right->symb_name) <= 0) {
> > > +                             current->next = left;
> > > +                             left = left->next;
> > > +                     } else {
> > > +                             current->next = right;
> > > +                             right = right->next;
> > > +                     }
> > > +             } else {
> > > +                     if (sort_by == BY_ADDRESS) {
> > > +                             if (left->addr <= right->addr) {
> > > +                                     current->next = left;
> > > +                                     left = left->next;
> > > +                             } else {
> > > +                                     current->next = right;
> > > +                                     right = right->next;
> > > +                             }
> > > +                     }
> > > +             }
> > > +
> > > +             current = current->next;
> > > +     }
> > > +
> > > +     if (left) {
> > > +             current->next = left;
> > > +     } else {
> > > +             if (right)
> > > +                     current->next = right;
> > > +     }
> > > +
> > > +     return result;
> > > +}
> > > +
> > > +struct item *merge_sort(struct item *head, int sort_by)
> > > +{
> > > +     struct item *right;
> > > +     struct item *slow;
> > > +     struct item *fast;
> > > +     struct item *left;
> > > +
> > > +     if (!head || !head->next)
> > > +             return head;
> > > +
> > > +     slow = head;
> > > +     fast = head->next;
> > > +
> > > +     while (fast && fast->next) {
> > > +             slow = slow->next;
> > > +             fast = fast->next->next;
> > > +     }
> > > +
> > > +     left = head;
> > > +     right = slow->next;
> > > +     slow->next = NULL;
> > > +
> > > +     left = merge_sort(left, sort_by);
> > > +     right = merge_sort(right, sort_by);
> > > +
> > > +     return merge(left, right, sort_by);
> > > +}
> > > +
> > > +void sort_list_m(struct item **head, int sort_by)
> > > +{
> > > +     if (!(*head) || !((*head)->next))
> > > +             return;
> > > +
> > > +     *head = merge_sort(*head, sort_by);
> > > +}
> > > +
> > > +int insert_after(struct item *list, const uint64_t search_addr,
> > > +              const char *name, uint64_t addr, char stype)
> > > +{
> > > +     struct item *new_item;
> > > +     struct item *current;
> > > +     int ret = 0;
> > > +
> > > +     current = (list_index[name[0] - 32]) ? list_index[name[0] - 32] : list;
> > > +     while (current) {
> > > +             if (current->addr == search_addr) {
> > > +                     new_item = malloc(sizeof(struct item));
> > > +                     if (!new_item)
> > > +                             return ret;
> > > +                     strncpy(new_item->symb_name, name, MAX_NAME_SIZE);
> > > +                     new_item->symb_name[MAX_NAME_SIZE - 1] = '\0';
> > > +                     new_item->addr = addr;
> > > +                     new_item->stype = stype;
> > > +                     new_item->next = current->next;
> > > +                     current->next = new_item;
> > > +                     ret = 1;
> > > +                     break;
> > > +             }
> > > +             current = current->next;
> > > +     }
> > > +     return ret;
> > > +}
> > > +
> > > +void free_items(struct item **head)
> > > +{
> > > +     struct item *app, *item_iterator = *head;
> > > +
> > > +     while (item_iterator) {
> > > +             app = item_iterator;
> > > +             item_iterator = item_iterator->next;
> > > +             free(app);
> > > +     }
> > > +     *head = NULL;
> > > +}
> > > diff --git a/scripts/kas_alias/item_list.h b/scripts/kas_alias/item_list.h
> > > new file mode 100644
> > > index 000000000000..b4891cb088ee
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/item_list.h
> > > @@ -0,0 +1,26 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +#ifndef ITEM_LIST_H
> > > +#define ITEM_LIST_H
> > > +#include <stdint.h>
> > > +
> > > +#define MAX_NAME_SIZE 256
> > > +#define BY_ADDRESS 1
> > > +#define BY_NAME 2
> > > +
> > > +struct item {
> > > +     char            symb_name[MAX_NAME_SIZE];
> > > +     uint64_t        addr;
> > > +     char            stype;
> > > +     struct item     *next;
> > > +};
> > > +
> > > +void build_index(struct item *list);
> > > +struct item *add_item(struct item **list, const char *name, char stype, uint64_t addr);
> > > +void sort_list(struct item **list, int sort_by);
> > > +struct item *merge(struct item *left, struct item *right, int sort_by);
> > > +struct item *merge_sort(struct item *head, int sort_by);
> > > +void sort_list_m(struct item **head, int sort_by);
> > > +int insert_after(struct item *list, const uint64_t search_addr,
> > > +              const char *name, uint64_t addr, char stype);
> > > +void free_items(struct item **head);
> > > +#endif
> > > diff --git a/scripts/kas_alias/kas_alias.c b/scripts/kas_alias/kas_alias.c
> > > new file mode 100644
> > > index 000000000000..532aeb39f851
> > > --- /dev/null
> > > +++ b/scripts/kas_alias/kas_alias.c
> > > @@ -0,0 +1,217 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <stdint.h>
> > > +#include <unistd.h>
> > > +#include <string.h>
> > > +#include <stdbool.h>
> > > +#include <stdarg.h>
> > > +#include <regex.h>
> > > +
> > > +#include "item_list.h"
> > > +#include "duplicates_list.h"
> > > +#include "a2l.h"
> > > +
> > > +#define SYMB_IS_TEXT(s) ((((s)->stype) == 't') ||  (((s)->stype) == 'T'))
> > > +#define SYMB_IS_DATA(s) ((((s)->stype) == 'b') ||  (((s)->stype) == 'B') || \
> > > +                      (((s)->stype) == 'd') ||  (((s)->stype) == 'D') || \
> > > +                      (((s)->stype) == 'r') ||  (((s)->stype) == 'R'))
> > > +#ifdef CONFIG_KALLSYMS_ALIAS_DATA
> > > +#define SYMB_NEEDS_ALIAS(s) (SYMB_IS_TEXT(s) || SYMB_IS_DATA(s))
> > > +#else
> > > +#define SYMB_NEEDS_ALIAS(s) SYMB_IS_TEXT(s)
> > > +#endif
> > > +#define FNOMATCH 0
> > > +#define FMATCH 1
> > > +#define EREGEX 2
> > > +
> > > +const char *ignore_regex[] = {
> > > +     "^__cfi_.*$",                           // __cfi_ preamble
> > > +#ifndef CONFIG_KALLSYMS_ALIAS_DATA_ALL
> > > +     "^_*TRACE_SYSTEM.*$",
> > > +     "^__already_done\\.[0-9]+$",            // Call a function once data
> > > +     "^___tp_str\\.[0-9]+$",
> > > +     "^___done\\.[0-9]+$",
> > > +     "^__print_once\\.[0-9]+$",
> > > +     "^_rs\\.[0-9]+$",
> > > +     "^__compound_literal\\.[0-9]+$",
> > > +     "^___once_key\\.[0-9]+$",
> > > +     "^__func__\\.[0-9]+$",
> > > +     "^__msg\\.[0-9]+$",
> > > +     "^CSWTCH\\.[0-9]+$",
> > > +     "^__flags\\.[0-9]+$",
> > > +     "^__wkey.*$",
> > > +     "^__mkey.*$",
> > > +     "^__key.*$",
> > > +#endif
> > > +     "^__pfx_.*$"                            // NOP-padding
> > > +};
> > > +
> > > +int suffix_serial;
> > > +
> > > +static inline void verbose_msg(bool verbose, const char *fmt, ...)
> > > +{
> > > +     va_list args;
> > > +
> > > +     va_start(args, fmt);
> > > +     if (verbose)
> > > +             printf(fmt, args);
> > > +
> > > +     va_end(args);
> > > +}
> > > +
> > > +static void create_suffix(const char *name, char *output_suffix)
> > > +{
> > > +     sprintf(output_suffix, "%s__alias__%d", name, suffix_serial++);
> > > +}
> > > +
> > > +static void create_file_suffix(const char *name, uint64_t address, char *output_suffix, char *cwd)
> > > +{
> > > +     const char *f_path;
> > > +     char *buf;
> > > +     int i = 0;
> > > +
> > > +     buf = addr2line_get_lines(address);
> > > +     f_path = remove_subdir(cwd, buf);
> > > +     if (f_path) {
> > > +             sprintf(output_suffix, "%s@%s", name, f_path);
> > > +             while (*(output_suffix + i) != '\0') {
> > > +                     switch (*(output_suffix + i)) {
> > > +                     case '/':
> > > +                     case ':':
> > > +                     case '.':
> >
> > This is not enough because file path will accept more than that.
> > E.g. '+', '&', '-'.
> > So I think we should check it by '!isalnum()'. (allow-list method)
> >
> > > +                             *(output_suffix + i) = '_';
> > > +                             break;
> > > +                     default:
> > > +                     }
> > > +             i++;
> > > +             }
> > > +     } else {
> > > +             create_suffix(name, output_suffix);
> > > +     }
> > > +}
> > > +
> > > +static int filter_symbols(char *symbol, const char **ignore_list, int regex_no)
> > > +{
> > > +     regex_t regex;
> > > +     int res, i;
> > > +
> > > +     for (i = 0; i < regex_no; i++) {
> > > +             res = regcomp(&regex, ignore_list[i], REG_EXTENDED);
> > > +             if (res)
> > > +                     return -EREGEX;
> > > +
> > > +             res = regexec(&regex, symbol, 0, NULL, 0);
> > > +             regfree(&regex);
> > > +             switch (res) {
> > > +             case 0:
> > > +                     return FMATCH;
> > > +             case REG_NOMATCH:
> > > +                     break;
> > > +             default:
> > > +                     return -EREGEX;
> > > +             }
> > > +     }
> > > +
> > > +     return FNOMATCH;
> > > +}
> > > +
> > > +int main(int argc, char *argv[])
> > > +{
> > > +     char t, sym_name[MAX_NAME_SIZE], new_name[MAX_NAME_SIZE + 15];
> > > +     struct duplicate_item  *duplicate_iterator;
> > > +     struct duplicate_item *duplicate;
> > > +     struct item *head = {NULL};
> > > +     bool need_2_process = true;
> > > +     struct item *last = {NULL};
> > > +     struct item  *current;
> > > +     int verbose_mode = 0;
> > > +     uint64_t address;
> > > +     FILE *fp;
> > > +     int res;
> > > +
> > > +     if (argc < 2 || argc > 3) {
> > > +             printf("Usage: %s <nmfile> [-verbose]\n", argv[0]);
> > > +             return 1;
> > > +     }
> > > +
> > > +     if (argc == 3 && strcmp(argv[2], "-verbose") == 0)
> > > +             verbose_mode = 1;
> > > +
> > > +     verbose_msg(verbose_mode, "Scanning nm data(%s)\n", argv[1]);
> > > +
> > > +     fp = fopen(argv[1], "r");
> > > +     if (!fp) {
> > > +             printf("Can't open input file.\n");
> > > +             return 1;
> > > +     }
> > > +
> > > +     if (!addr2line_init(get_addr2line(A2L_DEFAULT), get_vmlinux(argv[1])))
> > > +             return 1;
> > > +
> > > +     while (fscanf(fp, "%lx %c %99s\n", &address, &t, sym_name) == 3) {
> > > +             if (strstr(sym_name, "@_")) {
> > > +                     if (verbose_mode && need_2_process)
> > > +                             printf("Already processed\n");
> > > +                     need_2_process = false;
> > > +                     }
> > > +             last = add_item(&last, sym_name, t, address);
> > > +             if (!last) {
> > > +                     printf("Error in allocate memory\n");
> > > +                     free_items(&head);
> > > +                     return 1;
> > > +             }
> > > +
> > > +             if (!head)
> > > +                     head = last;
> > > +     }
> > > +
> > > +     fclose(fp);
> > > +
> > > +     if (need_2_process) {
> > > +             verbose_msg(verbose_mode, "Sorting nm data\n");
> > > +             sort_list_m(&head, BY_NAME);
> > > +             verbose_msg(verbose_mode, "Scanning nm data for duplicates\n");
> > > +             duplicate = find_duplicates(head);
> > > +             if (!duplicate) {
> > > +                     printf("Error in duplicates list\n");
> > > +                     return 1;
> > > +             }
> > > +
> > > +             verbose_msg(verbose_mode, "Applying suffixes\n");
> > > +             build_index(head);
> > > +             duplicate_iterator = duplicate;
> > > +             while (duplicate_iterator) {
> > > +                     res = filter_symbols(duplicate_iterator->original_item->symb_name,
> > > +                                          ignore_regex, sizeof(ignore_regex) /
> > > +                                          sizeof(ignore_regex[0]));
> > > +                     if (res != FMATCH &&
> > > +                         SYMB_NEEDS_ALIAS(duplicate_iterator->original_item)) {
> > > +                             if (res < 0)
> > > +                                     return 1;
> > > +
> > > +                             create_file_suffix(duplicate_iterator->original_item->symb_name,
> > > +                                                duplicate_iterator->original_item->addr,
> > > +                                                new_name, vmlinux_path);
> > > +                             if (!insert_after(head, duplicate_iterator->original_item->addr,
> > > +                                               new_name, duplicate_iterator->original_item->addr,
> > > +                                               duplicate_iterator->original_item->stype))
> > > +                                     return 1;
> > > +                     }
> > > +
> > > +                     duplicate_iterator = duplicate_iterator->next;
> > > +             }
> > > +
> > > +             sort_list_m(&head, BY_ADDRESS);
> > > +     }
> > > +     current = head;
> > > +     while (current) {
> > > +             printf("%08lx %c %s\n", current->addr, current->stype, current->symb_name);
> > > +             current = current->next;
> > > +     }
> > > +
> > > +     free_items(&head);
> > > +     free_duplicates(&duplicate);
> > > +     addr2line_cleanup();
> > > +     return 0;
> > > +}
> > > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > > index a432b171be82..cacf60b597ce 100755
> > > --- a/scripts/link-vmlinux.sh
> > > +++ b/scripts/link-vmlinux.sh
> > > @@ -89,8 +89,9 @@ vmlinux_link()
> > >
> > >       ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
> > >
> > > -     # The kallsyms linking does not need debug symbols included.
> > > -     if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> > > +     # The kallsyms linking does not need debug symbols included, unless the KALLSYMS_ALIAS.
> > > +     if [ ! is_enabled CONFIG_KALLSYMS_ALIAS ] && \
> > > +         [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
> > >               ldflags="${ldflags} ${wl}--strip-debug"
> > >       fi
> > >
> > > @@ -161,7 +162,11 @@ kallsyms()
> > >       fi
> > >
> > >       info KSYMS ${2}
> > > -     scripts/kallsyms ${kallsymopt} ${1} > ${2}
> > > +     if is_enabled CONFIG_KALLSYMS_ALIAS; then
> > > +             ALIAS=".alias"
> > > +             scripts/kas_alias/kas_alias ${1} >${1}${ALIAS}
> > > +             fi
> >
> > Nit: wrong indentation.
> > And ALIAS is not defined if CONFIG_KALLSYMS_ALIAS=n.
> 
> I rely on the fact that ALIAS is undefined if CONFIG_KALLSYMS_ALIAS=n.
> The undefined variable expands to an empty string, and I was constructing
> my name using this approach. This method functions in this manner with
> all the shells I'm familiar with.

yeah, but I feel this is fragile. you can just add "else" block and
initialize ALIAS with empty string for maintenanceability.

> However, I acknowledge that it's more of a hack than a clean programming
> practice. In version 4, I will provide a cleaner shell programming
> solution.

OK.

Thank you!

> 
> >
> >
> > > +     scripts/kallsyms ${kallsymopt} ${1}${ALIAS} > ${2}
> > >  }
> > >
> > >  # Perform one step in kallsyms generation, including temporary linking of
> > > --
> > > 2.34.1
> > >
> >
> >
> > Thank you,
> >
> > --
> > Masami Hiramatsu (Google) <mhiramat@kernel.org>


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
