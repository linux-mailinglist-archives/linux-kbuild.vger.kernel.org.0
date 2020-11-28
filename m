Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFF2C7591
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732919AbgK1VtR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:17 -0500
Received: from condef-03.nifty.com ([202.248.20.68]:63932 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729527AbgK1R63 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:58:29 -0500
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-03.nifty.com with ESMTP id 0AS8eI3S019852;
        Sat, 28 Nov 2020 17:40:18 +0900
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0AS8drbQ002155;
        Sat, 28 Nov 2020 17:39:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0AS8drbQ002155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606552793;
        bh=aTlTwGLzXn8vCp/ha6WBQD6lF7cen5u0CpCO9/N2svo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XCLpMLLgBRXQcGl0KKFHI6raLksfEzuSsh8yzrdb+4Z1Lk0bHRIHAynHWpwLdhOoB
         M7q0oTBr2lQZdbdepYchKl/XBX3ERsdLkrChd0kHbJ27E2B1CXpzKwlKgSAPaOv9VY
         lsEseVFlYZJj4NKml6t5QgSCwndSuKs7RybFP8yBTRESn2LQCN5i2mldEKR66xfXBm
         kIUAMkjaaWGs67oIulDHlMuM8bAcqUR4GNk+YlUPLHaWq5lW/9iUb7Ar+qjCNCNcEC
         HQkHme1cTmIgCVhaKTTkxpMyi3ftO0bflSpM6uDXZ7FU1LMDCzQp8l0T6NTOquqrej
         lvKfdA8Z+cK0w==
X-Nifty-SrcIP: [209.85.210.173]
Received: by mail-pf1-f173.google.com with SMTP id w202so6478386pff.10;
        Sat, 28 Nov 2020 00:39:53 -0800 (PST)
X-Gm-Message-State: AOAM5335L7i9zzUqQY5xBw6oC+JOCIM58aHddbXsy1NC1LA0jZ1ORt2d
        T1B+zXyXJ9vPcTMTc+OMghu+8wAD3GaxoSlD5/I=
X-Google-Smtp-Source: ABdhPJzH/RRTTCVpDoB9YseNUTY4WRgLuqAm/Y6Usk7qhxKIJVnareeHP77zIoSHjf+XPw5jSr6uwLefc/4a7s+VYwk=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr14878352pji.198.1606552792634;
 Sat, 28 Nov 2020 00:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20201125172544.GJ4332@42.do-not-panic.com>
In-Reply-To: <20201125172544.GJ4332@42.do-not-panic.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Nov 2020 17:39:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATaDqZdOF_KK4z+mPz7FO6gPFCWCviamzR8TmDdpaXYmg@mail.gmail.com>
Message-ID: <CAK7LNATaDqZdOF_KK4z+mPz7FO6gPFCWCviamzR8TmDdpaXYmg@mail.gmail.com>
Subject: Re: kconfig as a git subtree on Linux
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 26, 2020 at 2:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> I'd like to propose we discuss the possibility of taking kconfig and
> making it a git subtree under the Linux kernel. This would allow
> other projects outside of the Linux kernel to be able to update their
> own copy / fork of kconfig in a jiffie *very* easily.
>
> Why? kconfig has far outlived its own purpose as a modeling variablity
> language hack on the Linux kernel, and *is* forked and *used* by *many*
> projects, to the point I think ignoring its use outside of the Linux
> kernel is doing a disservice to its own growth. Counting just personal
> projects I have 3 projects which use kconfig alone. Last time I counted
> about 30 or so external projects. I'm confident this is a shy number
> of today's reality.
>
> Yes this does beg the question, that if this is done, can / should
> this be considered elsewhere. And yes, I'd like to hear the rants
> about why this would be a completely unacceptable practice *at all*.
>
> I've been using git subtrees now for another project and I'm *very*
> happy with it so far. It lets me keep a project with some code on
> its own git tree, and then multiple third party trees can embrace
> it, and decide to update later whenever they want. An example is the
> update_ssh_config [0] python script which I use on kdevops [1] for
> vagrant, but since it is also used for terraform and terraform uses
> modules I ended up sharing the code for terraform for its own
> terrarorm module [2] [3]. I do most development and unit testing
> on the main update_ssh_config git tree, and when I want to integrate
> its changes into kdevops I just run:
>
> make refresh
>
> This is because on kdevops I have:
>
> $ cat Makefile.subtrees
> # If you need to use a git subtree, please add it here.
> add-remotes:
>         git remote add update_ssh_config https://github.com/mcgrof/update_ssh_config.git
>
> add-commits:
>         git subtree add --prefix=playbooks/roles/update_ssh_config_vagrant/update_ssh_config update_ssh_config master
>
> refresh:
>         git fetch update_ssh_config git subtree pull --prefix=playbooks/roles/update_ssh_config_vagrant/update_ssh_config update_ssh_config master
>
> Likewise for my terraform module, however there I just have these
> targets on my make Makefile. A person who first git cloned either the
> kdevops tree of the terraform module tree would first have to run the
> targets:
>
>    * make add-remotes
>    * make add-commits
>
> Today's process for updating kconfig on external projects requires
> substrantial manual oversight.
>
> [0] https://github.com/mcgrof/update_ssh_config
> [1] https://github.com/mcgrof/kdevops/
> [2] https://github.com/mcgrof/terraform-kdevops-add-host-ssh-config
> [3] https://registry.terraform.io/modules/mcgrof/add-host-ssh-config/kdevops/latest
>
>   Luis




I want to keep Kconfig in the kernel tree.

Other projects can throw in scripts/kconfig/,
but in some cases, they might need some adjustments
for their use.



Kconfig is almost standalone, but in reality,
there are some interactions between the build system
and kconfig.


I want to reserve the freedom for optimizations
that span across both kbuild and kconfig.

For example,

058507195b534e6a1b3e8bf716b816ecf090c9c3
8b41fc4454e36fbfdbb23f940d023d4dece2de29

If we split Kconfig out as a standalone project,
such optimizations would become difficult.




A long time has passed since the Kconfig introduction, but
the Kconfig implementation is still in an immature state, in my opinion.


I want to fix them, and some of them are done
in a way that breaks backward compatibility.


In such cases, I fix in-kernel Kconfig files first,
and then, I fix the kconfig implementation.

For example,

Fix users:   8636a1f9677db4f883f29a072f401303acfc2edd
Fix Kconfig: f5451582c4e22ce8912aae4950810f3598c9b516


Fix users:   df8df5e4bc37e39010cfdf5d50cf726fe08aae5b
Fix Kconfig: 09d5873e4d1f70202314b5fe40160f9b14b9d2d0


I can proceed confidently because we have Kconfig files
and scripts/kconfig in the same tree, and I can
do build tests easily.


Again, if we split Kconfig as a standalone project,
I would need to care about which projects would be
affected by such changes, say, not only Linux but also
dozens of projects, which I do not know much about.






-- 
Best Regards
Masahiro Yamada
