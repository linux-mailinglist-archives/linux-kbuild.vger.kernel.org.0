Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7121583174
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jul 2022 20:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243294AbiG0SIF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jul 2022 14:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239182AbiG0SHr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jul 2022 14:07:47 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7C4C7AC2
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 10:11:22 -0700 (PDT)
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E89593F144
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658941880;
        bh=H/YoNoMBJ5KLzizvRdlp2kaTQKAcETzt8x9wjboShNc=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=f294ewGx3RuSG3n7RyP908ORZRmbHecmM5VYwd9wR8OGMeSoiOgbk6YtQXC4VTZ4S
         nKiy1hi/htLv4QHn5YuzkepU7QVIlFfJ4QCG8YdE9W9gBEUt7ItVPTCTz9DOo0+/DD
         BQwninWot1opMfUg0re/qunCpuYKxCaszaIG3xjFyYZc6Wod8iHbkWNKE7h7ZZP6jA
         XhHJZzBPJFPUBl51Q/NDQ6YQ539fmzKBUt8/qxMW/iOn9M0iaUFZVU3odIIVGJ6/QG
         8hbcvadoNLdlvWmsS+3tSBr/d9pqrMcigh2ja8ucrKwR5MmrKFMlFwd8SQfCpyBvYD
         K6YrN8vrcL/uw==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-10e6895d473so334008fac.17
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 10:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/YoNoMBJ5KLzizvRdlp2kaTQKAcETzt8x9wjboShNc=;
        b=ttonXk7DRBYZUQxEnaqLjfWbjI28FDgH1jtSJvh/oSqrTEHmiMdXZ7z1mYtsCRb77t
         a1Il5/REyhxfgi+LY/97PoLJhVdPou8Y525+H7qiEaEHwZg+vd1cDu4ycKpqKiNDM8Mb
         xm6CRrEGTNI0MZ+GXl3Z7p2TPvoVQIZY21Z97oz5LSwO0x3TXWVFCgu2YxHRaAe2aTYn
         GDHkEwWek4rO6MdmbNmWfebyJF9AYgo2HmQs+zK/maY7epPWeFgf37qB5HdZQcA/ymZA
         fitO/xl1sPj9d5sFO+Kfupf5/akr+S9iv/6dn6nnhGiLP6P8vRH+kWDngeM4x+1q7tGN
         Sq3Q==
X-Gm-Message-State: AJIora+OEBnQiWC4oYjTG4QMx3I6nzWr663D1sSjEFhjIRj4rcALsJr5
        MmaRFTgg3kiia//sde764tJRKuTTrPbnJd/uEsE6pkjTqPtoe63arWC7+yJIl1xD0x29ZSk1rZM
        lk1+BJFfk1fWKDie0FuY7w5JoKMwSOE9B53e2UaZFZyekbFuYhpYxC94thg==
X-Received: by 2002:a9d:2602:0:b0:61c:30c1:fa03 with SMTP id a2-20020a9d2602000000b0061c30c1fa03mr9316718otb.86.1658941879716;
        Wed, 27 Jul 2022 10:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUAq7yzvxs08MQ/1pmGOGHFSPETa6NtLulFJUJqWOK5wr+vL658B/OM4yj6drYQZjU8O1hrMUjyEk+FKH3IyE=
X-Received: by 2002:a9d:2602:0:b0:61c:30c1:fa03 with SMTP id
 a2-20020a9d2602000000b0061c30c1fa03mr9316702otb.86.1658941879435; Wed, 27 Jul
 2022 10:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220722022416.137548-1-mfo@canonical.com> <20220722022416.137548-7-mfo@canonical.com>
 <CAK7LNARbSjmZgp1vg5m2j4oRYHgCUv7Wsj+4-OYdo9Cpe0Xs3A@mail.gmail.com>
In-Reply-To: <CAK7LNARbSjmZgp1vg5m2j4oRYHgCUv7Wsj+4-OYdo9Cpe0Xs3A@mail.gmail.com>
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
Date:   Wed, 27 Jul 2022 14:11:08 -0300
Message-ID: <CAO9xwp33Q9ksED_MxPFJYT=DSsEX5=g_C-b5mcF4irU9dy6Vaw@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] sysctl: introduce /proc/sys/kernel/modprobe_sysctl_alias
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 26, 2022 at 6:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jul 22, 2022 at 11:24 AM Mauricio Faria de Oliveira
> <mfo@canonical.com> wrote:
> >
> > The goal of the earlier patches is to let sysctl userspace tools
> > load the kernel module with a sysctl entry that is not available
> > yet in /proc/sys/ when the tool runs (so it can become available).
> >
> > Let's expose this file for userspace for two reasons:
> >
> > 1) Allow such tools to identify that the running kernel has the
> >    code which produces sysctl module aliases, so they could run
> >    'modprobe sysctl:<entry>' only when it may actually help.
> >
> > 2) Allow an administrator to hint such tools not to do that, if
> >    that is desired for some reason (e.g., rather have the tools
> >    fail if something is misconfigured in a critical deployment).
>
> This flag is just a hint.
> User-space tools are still able to ignore it.
>
> Perhaps, such administrator's choice might be specified in
> tools' configuration file.
>
> For example,
>
> /etc/modprobe.d/forbid-sysctl-alias.conf
>
> may specify
>
>     blacklist:  sysctl:*
>
> if they want to forbid sysctl aliasing.
> (but I do not know if this works or not).

Yes, it's just a hint. I considered this isn't strong enough, but
didn't think more into it.

Now, your idea with modprobe.d is strong enough. We have to change it a bit, as
only 'alias' supports wildcards per modprobe.d(5), then add 'install'
to make sure.

# cat /etc/modprobe.d/disable-sysctl-alias.conf
alias sysctl:* sysctl_alias_off
install sysctl_alias_off /bin/false
# or /bin/true, per the sysadmin.

# modprobe sysctl:nf_conntrack_max
modprobe: ERROR: ../libkmod/libkmod-module.c:990 command_do() Error
running install command '/bin/false' for module sysctl_alias_off:
retcode 1
modprobe: ERROR: could not insert 'sysctl_alias_off': Invalid argument

I'll document this in the commit message for now.

P.S.: Since the flag is a hint to userspace tools in sense 1) as well
(so they know not to run modprobe if sysctl aliases aren't expected),
the idea or the file itself seems worth keeping -- but maybe differently.

Thanks,


>
>
>
>
>
>
>
>
>
>
>
>
>
>
> > Also add a module parameter for that (proc.modprobe_sysctl_alias),
> > for another method that doesn't depend on sysctl tools to be set
> > (that wouldn't fail them to try and set it if it's not there yet).
> >
> > Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
> > ---
> >  fs/proc/proc_sysctl.c  | 8 ++++++++
> >  include/linux/module.h | 1 +
> >  kernel/sysctl.c        | 9 +++++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> > index ebbf8702387e..1e63819fcda8 100644
> > --- a/fs/proc/proc_sysctl.c
> > +++ b/fs/proc/proc_sysctl.c
> > @@ -33,6 +33,14 @@ static void check_struct_sysctl_device_id(void)
> >         BUILD_BUG_ON(offsetof(struct sysctl_device_id, procname)
> >                         != offsetof(struct ctl_table, procname));
> >  }
> > +
> > +/*
> > + * Hint sysctl userspace tools whether or not to run modprobe with sysctl alias
> > + * ('modprobe sysctl:entry') if they cannot find the file '/proc/sys/.../entry'
> > + */
> > +int modprobe_sysctl_alias = 1;
> > +module_param(modprobe_sysctl_alias, int, 0644);
> > +
> >  #else
> >  static void check_struct_sysctl_device_id(void) {}
> >  #endif
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 3010f687df19..5f565491c596 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -304,6 +304,7 @@ struct notifier_block;
> >  #ifdef CONFIG_MODULES
> >
> >  extern int modules_disabled; /* for sysctl */
> > +extern int modprobe_sysctl_alias; /* for proc sysctl */
> >  /* Get/put a kernel symbol (calls must be symmetric) */
> >  void *__symbol_get(const char *symbol);
> >  void *__symbol_get_gpl(const char *symbol);
> > diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> > index 15073621cfa8..b396cfcb55fc 100644
> > --- a/kernel/sysctl.c
> > +++ b/kernel/sysctl.c
> > @@ -1763,6 +1763,15 @@ static struct ctl_table kern_table[] = {
> >                 .mode           = 0644,
> >                 .proc_handler   = proc_dostring,
> >         },
> > +#ifdef CONFIG_PROC_SYSCTL
> > +       {
> > +               .procname       = "modprobe_sysctl_alias",
> > +               .data           = &modprobe_sysctl_alias,
> > +               .maxlen         = sizeof(modprobe_sysctl_alias),
> > +               .mode           = 0644,
> > +               .proc_handler   = proc_dointvec,
> > +       },
> > +#endif
> >         {
> >                 .procname       = "modules_disabled",
> >                 .data           = &modules_disabled,
> > --
> > 2.25.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--
Mauricio Faria de Oliveira
