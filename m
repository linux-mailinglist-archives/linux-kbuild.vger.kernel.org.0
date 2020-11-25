Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418C42C46AA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 18:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbgKYRZs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Nov 2020 12:25:48 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:42089 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbgKYRZr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Nov 2020 12:25:47 -0500
Received: by mail-pf1-f173.google.com with SMTP id 131so2956500pfb.9;
        Wed, 25 Nov 2020 09:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZtEYBsO/jWtvOI2uD72pD23zazAk+CjJf4X/hzlzzfY=;
        b=ZhDyHc3urPNbhVrmyKYskkb5An/aOvsJs03ma5Se6LNKg0c80fyCKHhFzcghomgn37
         gVagD87bhMbFN7p+mdnWeE+WWqPmzWsLuanzFDg0mw4x4uAt2Df5T4xb6lDw5sEgQH5F
         F8ta/Mq6SzPGJpcdjVNzmbYUKDm+N+1O5mc5aSbBjwquYQYa8YDjQ3pxjZdiezGFl5Ca
         CSKOOoOSeWrKiphh+XmqqaOKQhiRaM33bz1N81O7/gLNGIZoJcleAPj0S0xUBjyNq5ef
         ZGigeNbviXteF+iAdEbmET6QLnpkweNUog2iCv8A7iyWgdMdUjokGSLpIXCaL4oju7lf
         i59Q==
X-Gm-Message-State: AOAM5316RdNupWjRSPBj2xNg7hSbw+QdFt5xWziipwm8hVwQ4JGVIEVq
        dbQSR8BAkmstJhU0VA0HLrA=
X-Google-Smtp-Source: ABdhPJymBrhRlw6b7Aqg8g6wlitHRcfDjy90sqIw03eMp6C6hX2QOe7EDOeR21mf/8UF5vHGwICB0g==
X-Received: by 2002:a17:90a:6393:: with SMTP id f19mr4430415pjj.227.1606325146836;
        Wed, 25 Nov 2020 09:25:46 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id u3sm2523618pfu.47.2020.11.25.09.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 09:25:45 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 7065D40317; Wed, 25 Nov 2020 17:25:44 +0000 (UTC)
Date:   Wed, 25 Nov 2020 17:25:44 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        linux-kernel@vger.kernel.org, mcgrof@kernel.org
Subject: kconfig as a git subtree on Linux
Message-ID: <20201125172544.GJ4332@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I'd like to propose we discuss the possibility of taking kconfig and
making it a git subtree under the Linux kernel. This would allow
other projects outside of the Linux kernel to be able to update their
own copy / fork of kconfig in a jiffie *very* easily.

Why? kconfig has far outlived its own purpose as a modeling variablity
language hack on the Linux kernel, and *is* forked and *used* by *many*
projects, to the point I think ignoring its use outside of the Linux
kernel is doing a disservice to its own growth. Counting just personal
projects I have 3 projects which use kconfig alone. Last time I counted
about 30 or so external projects. I'm confident this is a shy number
of today's reality.

Yes this does beg the question, that if this is done, can / should
this be considered elsewhere. And yes, I'd like to hear the rants
about why this would be a completely unacceptable practice *at all*.

I've been using git subtrees now for another project and I'm *very*
happy with it so far. It lets me keep a project with some code on
its own git tree, and then multiple third party trees can embrace
it, and decide to update later whenever they want. An example is the
update_ssh_config [0] python script which I use on kdevops [1] for
vagrant, but since it is also used for terraform and terraform uses
modules I ended up sharing the code for terraform for its own
terrarorm module [2] [3]. I do most development and unit testing
on the main update_ssh_config git tree, and when I want to integrate
its changes into kdevops I just run:

make refresh

This is because on kdevops I have:

$ cat Makefile.subtrees
# If you need to use a git subtree, please add it here.
add-remotes:
	git remote add update_ssh_config https://github.com/mcgrof/update_ssh_config.git

add-commits:
	git subtree add --prefix=playbooks/roles/update_ssh_config_vagrant/update_ssh_config update_ssh_config master

refresh:
	git fetch update_ssh_config git subtree pull --prefix=playbooks/roles/update_ssh_config_vagrant/update_ssh_config update_ssh_config master

Likewise for my terraform module, however there I just have these
targets on my make Makefile. A person who first git cloned either the
kdevops tree of the terraform module tree would first have to run the
targets:

   * make add-remotes
   * make add-commits

Today's process for updating kconfig on external projects requires
substrantial manual oversight.

[0] https://github.com/mcgrof/update_ssh_config
[1] https://github.com/mcgrof/kdevops/
[2] https://github.com/mcgrof/terraform-kdevops-add-host-ssh-config
[3] https://registry.terraform.io/modules/mcgrof/add-host-ssh-config/kdevops/latest

  Luis
