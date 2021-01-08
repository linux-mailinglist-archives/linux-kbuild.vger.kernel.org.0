Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FAA2EEA70
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Jan 2021 01:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbhAHAbb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 19:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbhAHAbY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 19:31:24 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52630C0612F8
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Jan 2021 16:30:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o13so18987281lfr.3
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jan 2021 16:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v3fiFgkxHB4dBg8a/pmTLn8VoKflEyyrskKHexKjc5k=;
        b=eK4zjuxyXFJ2gaG0Wd4Ql9BVBbzLZSVW7Sw7Jh5FoHSpPl1vDZ5D1DNDbBtczEmxKJ
         V3ScVZRCqrjYfEBAQ+Z0oItJOvxSkoVEMDhcbXcNTxlhFFFF0pua6Sxv+589A67dZ1A2
         5idHoiVnGNpRfGBDdY0PklWQT5JaSw9ylIp8/8HYNedqRkMUvAuF+u1pVfL8wSoDjHjo
         jsPSZNdKZtFf6Ud/9buvO3Qdy8qlPi2AYwDOvUR284bTL4quc2/vKN+PNTv7ML5gMc2K
         JwBwc48MGkdYJZxyMTfh2Xl4bhFqlb7NvvxFHlc7oC14bJAsSQ2a6FR24gkCIqhaQDCQ
         XMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v3fiFgkxHB4dBg8a/pmTLn8VoKflEyyrskKHexKjc5k=;
        b=TittKCYI0ee16P9p8Pvk027+MhdH8V0op9Fv1yMGXwkylDqlH9Hq8zcUKnw1ArFfHF
         S4xtbi3RVfvDOH/w8fsFz43onrJdVg8R0iDEyngFKZn5dNqJ5WrlioZyTfdd8oQD9Fxd
         40y1wKzTueP1rFMakFosrdBocavbdw3YzP09ss3tCW3++5dRK2J3k2PsB87XdO3/FWTx
         tSupyVIv7K/2Fi5HwUud3A/zU1lkVucYXy8fPC2XlTU3n5Wh08ANX2Kq8VQgMzfdWGuD
         RaiWdpVcLCF1NLSnThU/8TdqC1hlqr20gcxsP/gkNvocy2ZnqzcN3O7Dr1GV/+4HTmHk
         XNag==
X-Gm-Message-State: AOAM531zDtDOWehNSS+c1LcoDOioi3o6TPFLGqucuR/i2qn1qk86J64z
        F+362nMt5nW0t0UKa+KPqKtB5ocZvYiZFaqx0FOU3w==
X-Google-Smtp-Source: ABdhPJxXbgn6/QKXbLmBk9FdnADkBECjNCpnK86g/sLTMWMxY37KrrmlfvjRzDy9pO5zEu5cCDMedRtb4ExQ7bRCExE=
X-Received: by 2002:a2e:240f:: with SMTP id k15mr401941ljk.506.1610065842399;
 Thu, 07 Jan 2021 16:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20201216220850.659584-1-willmcvicker@google.com>
 <20201218120138.GA5265@linux-8ccs> <CABYd82bf+RACxboKCxoV=N63ynKwPspGhb6G5yYPiCFKnOk9Hw@mail.gmail.com>
 <20210107143111.GA30412@linux-8ccs>
In-Reply-To: <20210107143111.GA30412@linux-8ccs>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 7 Jan 2021 16:30:25 -0800
Message-ID: <CABYd82bVo4+M18dZ1d2x6e6-_o8YMs50v-VV_Z_DUr2vdRb-Bg@mail.gmail.com>
Subject: Re: [PATCH v4] modules: introduce the MODULE_SCMVERSION config
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jessica,

I looked into the LOCALVERSION= part more and finally figured out how
that part of the script works. I wasn't familiar with how the
parameter substitution worked -- ${parameter:+alt_value}. I verified
that we will only get an SCM version returned when LOCALVERSION_AUTO=y
and updated the Documentation in v5.

Thanks,
Will

On Thu, Jan 7, 2021 at 6:31 AM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Will McVicker [06/01/21 10:44 -0800]:
> >Thanks for the vacation notice Jessica! I'm just letting you know I'm
> >back as well and am happy to respond to any concerns regarding v4 when
> >you get all caught up.
> >
> >I hope you had a relaxing holiday :)
>
> Hi Will - thanks, same to you!
>
> >On Fri, Dec 18, 2020 at 4:01 AM Jessica Yu <jeyu@kernel.org> wrote:
> >>
> >> +++ Will McVicker [16/12/20 22:08 +0000]:
> >> >Config MODULE_SCMVERSION introduces a new module attribute --
> >> >`scmversion` -- which can be used to identify a given module's SCM
> >> >version.  This is very useful for developers that update their kernel
> >> >independently from their kernel modules or vice-versa since the SCM
> >> >version provided by UTS_RELEASE (`uname -r`) will now differ from the
> >> >module's vermagic attribute.
> >> >
> >> >For example, we have a CI setup that tests new kernel changes on the
> >> >hikey960 and db845c devices without updating their kernel modules. When
> >> >these tests fail, we need to be able to identify the exact device
> >> >configuration the test was using. By including MODULE_SCMVERSION, we can
> >> >identify the exact kernel and modules' SCM versions for debugging the
> >> >failures.
> >> >
> >> >Additionally, by exposing the SCM version via the sysfs node
> >> >/sys/module/MODULENAME/scmversion, one can also verify the SCM versions
> >> >of the modules loaded from the initramfs. Currently, modinfo can only
> >> >retrieve module attributes from the module's ko on disk and not from the
> >> >actual module that is loaded in RAM.
> >> >
> >> >You can retrieve the SCM version in two ways,
> >> >
> >> >1) By using modinfo:
> >> >    > modinfo -F scmversion MODULENAME
> >> >2) By module sysfs node:
> >> >    > cat /sys/module/MODULENAME/scmversion
> >> >
> >> >Signed-off-by: Will McVicker <willmcvicker@google.com>
> >> >---
> [ added back diff ]
> >> >Changelog since v3:
> >> >- Dropped [PATCH v2 1/2] scripts/setlocalversion: allow running in a subdir
> >> >
> >> > Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
> >> > include/linux/module.h                |  1 +
> >> > init/Kconfig                          | 12 ++++++++++++
> >> > kernel/module.c                       |  2 ++
> >> > scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
> >> > scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
> >> > 6 files changed, 78 insertions(+), 1 deletion(-)
> >> >
> >> >diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> >> >index 6272ae5fb366..2ba731767737 100644
> >> >--- a/Documentation/ABI/stable/sysfs-module
> >> >+++ b/Documentation/ABI/stable/sysfs-module
> >> >@@ -32,3 +32,21 @@ Description:
> >> >            Note: If the module is built into the kernel, or if the
> >> >            CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
> >> >            this file will not be present.
> >> >+
> >> >+What:              /sys/module/MODULENAME/scmversion
> >> >+Date:              November 2020
> >> >+KernelVersion:     5.11
>
> I guess we'll have to bump KernelVersion now (sorry about the timing!)
>
> >> >+Contact:   Will McVicker <willmcvicker@google.com>
> >> >+Description:       This read-only file will appear if modpost was supplied with an
> >> >+           SCM version for the module. It can be enabled with the config
> >> >+           MODULE_SCMVERSION. The SCM version is retrieved by
> >> >+           scripts/setlocalversion, which means that the presence of this
> >> >+           file depends on CONFIG_LOCALVERSION_AUTO=y or LOCALVERSION=.
>
> I think the "or LOCALVERSION=" part is inaccurate, right? We need
> just LOCALVERSION_AUTO for the full scm string for this to work.
>
> >> >+           When read, the SCM version that the module was compiled with is
> >> >+           returned. The SCM version is returned in the following format::
> >> >+
> >> >+           ===
> >> >+           Git:            g[a-f0-9]\+(-dirty)\?
> >> >+           Mercurial:      hg[a-f0-9]\+(-dirty)\?
> >> >+           Subversion:     svn[0-9]\+
> >> >+           ===
> >> >diff --git a/include/linux/module.h b/include/linux/module.h
> >> >index c4e7a887f469..6bd710308863 100644
> >> >--- a/include/linux/module.h
> >> >+++ b/include/linux/module.h
> >> >@@ -372,6 +372,7 @@ struct module {
> >> >    struct module_attribute *modinfo_attrs;
> >> >    const char *version;
> >> >    const char *srcversion;
> >> >+   const char *scmversion;
> >> >    struct kobject *holders_dir;
> >> >
> >> >    /* Exported symbols */
> >> >diff --git a/init/Kconfig b/init/Kconfig
> >> >index b77c60f8b963..d9ae12f16ba2 100644
> >> >--- a/init/Kconfig
> >> >+++ b/init/Kconfig
> >> >@@ -2131,6 +2131,18 @@ config MODULE_SRCVERSION_ALL
> >> >      the version).  With this option, such a "srcversion" field
> >> >      will be created for all modules.  If unsure, say N.
> >> >
> >> >+config MODULE_SCMVERSION
> >> >+   bool "SCM version for modules"
> >> >+   depends on LOCALVERSION_AUTO
> >> >+   help
> >> >+     This enables the module attribute "scmversion" which can be used
> >> >+     by developers to identify the SCM version of a given module, e.g.
> >> >+     git sha1 or hg sha1. The SCM version can be queried by modinfo or
> >> >+     via the sysfs node: /sys/modules/MODULENAME/scmversion. This is
> >> >+     useful when the kernel or kernel modules are updated separately
> >> >+     since that causes the vermagic of the kernel and the module to
> >> >+     differ.
>
> Since I consider this a debug/developer option, let's add a "If
> unsure, say N." at the end of this, similar to the other
> module options.
>
> Thanks!
>
> Jessica
