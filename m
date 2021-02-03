Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AA430DE94
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 16:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbhBCPrS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 10:47:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:59712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234560AbhBCPrE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 10:47:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04F2864D9E;
        Wed,  3 Feb 2021 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612367182;
        bh=96x1/gBkvEl/hdEhVih245wwQ8gSXLwBaaP/RpbNLi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZ88J2hDrL3Gx+bCkm3uaUIRUGjlgd2l0hVAr11i0rxmq/mRmZ4r9/WSrDWEtrSAd
         owZ7ZRRz/v9ugZgC+YMCD+dVAmve+0e0/XuUjH9LhzKl0tI62UHYfSq8bgSerrkahh
         AvbcrH9X/isX7kBaR25uYsvtZAyjnEAKfhvprC3Ycio48ebfcydtQfhylXzVrXEbZt
         9J1vNcOh2U7YrBH8qK9r7ijmidlAEvSh2yD/HUQomMJX7Sv/Xa+2PiIX4/MZEJXpds
         cDM2M+XcpR+i1+VfXT9NLyPH0kY3xIcN0v2O64excYd3OTmUjlHsCxYwLqBJcZN66l
         /zVmj40HlvWnw==
Date:   Wed, 3 Feb 2021 16:46:16 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
Message-ID: <YBrFSLASG5yiqtZT@gunter>
References: <20210121213641.3477522-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210121213641.3477522-1-willmcvicker@google.com>
X-OS:   Linux gunter 5.10.9-1-default x86_64
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Will McVicker [21/01/21 21:36 +0000]:
>Config MODULE_SCMVERSION introduces a new module attribute --
>`scmversion` -- which can be used to identify a given module's SCM
>version.  This is very useful for developers that update their kernel
>independently from their kernel modules or vice-versa since the SCM
>version provided by UTS_RELEASE (`uname -r`) will now differ from the
>module's vermagic attribute.
>
>For example, we have a CI setup that tests new kernel changes on the
>hikey960 and db845c devices without updating their kernel modules. When
>these tests fail, we need to be able to identify the exact device
>configuration the test was using. By including MODULE_SCMVERSION, we can
>identify the exact kernel and modules' SCM versions for debugging the
>failures.
>
>Additionally, by exposing the SCM version via the sysfs node
>/sys/module/MODULENAME/scmversion, one can also verify the SCM versions
>of the modules loaded from the initramfs. Currently, modinfo can only
>retrieve module attributes from the module's ko on disk and not from the
>actual module that is loaded in RAM.
>
>You can retrieve the SCM version in two ways,
>
>1) By using modinfo:
>    > modinfo -F scmversion MODULENAME
>2) By module sysfs node:
>    > cat /sys/module/MODULENAME/scmversion

Hi Will,

First off, thanks for being patient and being responsive throughout the patch
review process.

Personally, I am rather neutral towards this feature. We already provide
CONFIG_MODULE_SRCVERSION to provide a checksum of a module's source files and I
think the SCMVERSION is a nicer alternative. I can see how an optional
scmversion field might be helpful information for distro developers in testing
environments and in situations where it is possible for the kernel and modules
to be updated/packaged separately (for instance, the kernel selftest modules
under lib/ are in-tree modules that are provided as a separate kernel module
package in SLE).

Generally, out of principle, I do not want to merge a patch that's been NAK'd
repeatedly; even if I take the patch it'd likely be contested all the way up to
the merge window. So this boils down to whether Christoph (and maybe Greg) are
fine with this being a debug option that's not enabled by default.

Thanks,

Jessica
