Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFAA2ED2B0
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 15:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbhAGOgc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 09:36:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729289AbhAGOcT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 09:32:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2491A2333E;
        Thu,  7 Jan 2021 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610029877;
        bh=USX+2TpBUoiVKLv8nPZdH7ewWdDApeo2U7DhVBNhRjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RZH25cGJx/88oQyPhBFR8c1wnkXYfb6eScg1CVBVUNQzBscuJDX8LfAXJMVZSSrRZ
         7rJBo4O38ooluwjCJdHOgNoBATY9JyCRjgZMKapBa+BYwxFfoAhQaBgRFm6/58mJpd
         1Eqkwp8hEuIvAVtBULVc78CtUvN8YNrIWsW+gDAXEjMUGQHLA7BbPUiEKbl3v6cnJ6
         A3ixb7vvbb/xK4rN/9eg1QyNSQf3pt+UUFvnec3XXKGHY44ImSF8gN7Oz4ooi1b36G
         66gwHgDiePqd7zfSEfXDRumUKc8oKwOQNAQ1fEMLUwq8BvJif2jJX/oMoUgX4Y+JGo
         D2571O3jAI48Q==
Date:   Thu, 7 Jan 2021 15:31:12 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v4] modules: introduce the MODULE_SCMVERSION config
Message-ID: <20210107143111.GA30412@linux-8ccs>
References: <20201216220850.659584-1-willmcvicker@google.com>
 <20201218120138.GA5265@linux-8ccs>
 <CABYd82bf+RACxboKCxoV=N63ynKwPspGhb6G5yYPiCFKnOk9Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CABYd82bf+RACxboKCxoV=N63ynKwPspGhb6G5yYPiCFKnOk9Hw@mail.gmail.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Will McVicker [06/01/21 10:44 -0800]:
>Thanks for the vacation notice Jessica! I'm just letting you know I'm
>back as well and am happy to respond to any concerns regarding v4 when
>you get all caught up.
>
>I hope you had a relaxing holiday :)

Hi Will - thanks, same to you!

>On Fri, Dec 18, 2020 at 4:01 AM Jessica Yu <jeyu@kernel.org> wrote:
>>
>> +++ Will McVicker [16/12/20 22:08 +0000]:
>> >Config MODULE_SCMVERSION introduces a new module attribute --
>> >`scmversion` -- which can be used to identify a given module's SCM
>> >version.  This is very useful for developers that update their kernel
>> >independently from their kernel modules or vice-versa since the SCM
>> >version provided by UTS_RELEASE (`uname -r`) will now differ from the
>> >module's vermagic attribute.
>> >
>> >For example, we have a CI setup that tests new kernel changes on the
>> >hikey960 and db845c devices without updating their kernel modules. When
>> >these tests fail, we need to be able to identify the exact device
>> >configuration the test was using. By including MODULE_SCMVERSION, we can
>> >identify the exact kernel and modules' SCM versions for debugging the
>> >failures.
>> >
>> >Additionally, by exposing the SCM version via the sysfs node
>> >/sys/module/MODULENAME/scmversion, one can also verify the SCM versions
>> >of the modules loaded from the initramfs. Currently, modinfo can only
>> >retrieve module attributes from the module's ko on disk and not from the
>> >actual module that is loaded in RAM.
>> >
>> >You can retrieve the SCM version in two ways,
>> >
>> >1) By using modinfo:
>> >    > modinfo -F scmversion MODULENAME
>> >2) By module sysfs node:
>> >    > cat /sys/module/MODULENAME/scmversion
>> >
>> >Signed-off-by: Will McVicker <willmcvicker@google.com>
>> >---
[ added back diff ]
>> >Changelog since v3:
>> >- Dropped [PATCH v2 1/2] scripts/setlocalversion: allow running in a subdir
>> >
>> > Documentation/ABI/stable/sysfs-module | 18 ++++++++++++++++++
>> > include/linux/module.h                |  1 +
>> > init/Kconfig                          | 12 ++++++++++++
>> > kernel/module.c                       |  2 ++
>> > scripts/Makefile.modpost              | 22 ++++++++++++++++++++++
>> > scripts/mod/modpost.c                 | 24 +++++++++++++++++++++++-
>> > 6 files changed, 78 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
>> >index 6272ae5fb366..2ba731767737 100644
>> >--- a/Documentation/ABI/stable/sysfs-module
>> >+++ b/Documentation/ABI/stable/sysfs-module
>> >@@ -32,3 +32,21 @@ Description:
>> > 		Note: If the module is built into the kernel, or if the
>> > 		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
>> > 		this file will not be present.
>> >+
>> >+What:		/sys/module/MODULENAME/scmversion
>> >+Date:		November 2020
>> >+KernelVersion:	5.11

I guess we'll have to bump KernelVersion now (sorry about the timing!)

>> >+Contact:	Will McVicker <willmcvicker@google.com>
>> >+Description:	This read-only file will appear if modpost was supplied with an
>> >+		SCM version for the module. It can be enabled with the config
>> >+		MODULE_SCMVERSION. The SCM version is retrieved by
>> >+		scripts/setlocalversion, which means that the presence of this
>> >+		file depends on CONFIG_LOCALVERSION_AUTO=y or LOCALVERSION=.

I think the "or LOCALVERSION=" part is inaccurate, right? We need
just LOCALVERSION_AUTO for the full scm string for this to work.

>> >+		When read, the SCM version that the module was compiled with is
>> >+		returned. The SCM version is returned in the following format::
>> >+
>> >+		===
>> >+		Git:		g[a-f0-9]\+(-dirty)\?
>> >+		Mercurial:	hg[a-f0-9]\+(-dirty)\?
>> >+		Subversion:	svn[0-9]\+
>> >+		===
>> >diff --git a/include/linux/module.h b/include/linux/module.h
>> >index c4e7a887f469..6bd710308863 100644
>> >--- a/include/linux/module.h
>> >+++ b/include/linux/module.h
>> >@@ -372,6 +372,7 @@ struct module {
>> > 	struct module_attribute *modinfo_attrs;
>> > 	const char *version;
>> > 	const char *srcversion;
>> >+	const char *scmversion;
>> > 	struct kobject *holders_dir;
>> >
>> > 	/* Exported symbols */
>> >diff --git a/init/Kconfig b/init/Kconfig
>> >index b77c60f8b963..d9ae12f16ba2 100644
>> >--- a/init/Kconfig
>> >+++ b/init/Kconfig
>> >@@ -2131,6 +2131,18 @@ config MODULE_SRCVERSION_ALL
>> > 	  the version).  With this option, such a "srcversion" field
>> > 	  will be created for all modules.  If unsure, say N.
>> >
>> >+config MODULE_SCMVERSION
>> >+	bool "SCM version for modules"
>> >+	depends on LOCALVERSION_AUTO
>> >+	help
>> >+	  This enables the module attribute "scmversion" which can be used
>> >+	  by developers to identify the SCM version of a given module, e.g.
>> >+	  git sha1 or hg sha1. The SCM version can be queried by modinfo or
>> >+	  via the sysfs node: /sys/modules/MODULENAME/scmversion. This is
>> >+	  useful when the kernel or kernel modules are updated separately
>> >+	  since that causes the vermagic of the kernel and the module to
>> >+	  differ.

Since I consider this a debug/developer option, let's add a "If
unsure, say N." at the end of this, similar to the other
module options.

Thanks!

Jessica
