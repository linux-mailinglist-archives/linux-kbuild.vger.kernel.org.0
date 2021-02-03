Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC90730DEE7
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 16:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhBCP5Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 10:57:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:33148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234668AbhBCPzz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 10:55:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B71AA64E3D;
        Wed,  3 Feb 2021 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612367681;
        bh=6klP67F/eJlyfcD5sePw8yJKwGPDEhrxwWlDTcc1Z80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w2sF7j3dmDgddukSnhCXQQ1UlATkp2X+YrR5kJ6m86eC6Mzl4ybjK6B7tJzqwEl7o
         c/WwMbQyUqo7xIkcPDy5GnH3BcXBGuvn3Dp7HLVe9+crZMvMzr30/LTzaauXja2/rm
         vsJK0Voe/naMBeP58LHZwFutjZHV8XbcfVd6xbbw=
Date:   Wed, 3 Feb 2021 16:54:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
Message-ID: <YBrHPqlQHppzBPpn@kroah.com>
References: <20210121213641.3477522-1-willmcvicker@google.com>
 <YBrFSLASG5yiqtZT@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBrFSLASG5yiqtZT@gunter>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 03, 2021 at 04:46:16PM +0100, Jessica Yu wrote:
> +++ Will McVicker [21/01/21 21:36 +0000]:
> > Config MODULE_SCMVERSION introduces a new module attribute --
> > `scmversion` -- which can be used to identify a given module's SCM
> > version.  This is very useful for developers that update their kernel
> > independently from their kernel modules or vice-versa since the SCM
> > version provided by UTS_RELEASE (`uname -r`) will now differ from the
> > module's vermagic attribute.
> > 
> > For example, we have a CI setup that tests new kernel changes on the
> > hikey960 and db845c devices without updating their kernel modules. When
> > these tests fail, we need to be able to identify the exact device
> > configuration the test was using. By including MODULE_SCMVERSION, we can
> > identify the exact kernel and modules' SCM versions for debugging the
> > failures.
> > 
> > Additionally, by exposing the SCM version via the sysfs node
> > /sys/module/MODULENAME/scmversion, one can also verify the SCM versions
> > of the modules loaded from the initramfs. Currently, modinfo can only
> > retrieve module attributes from the module's ko on disk and not from the
> > actual module that is loaded in RAM.
> > 
> > You can retrieve the SCM version in two ways,
> > 
> > 1) By using modinfo:
> >    > modinfo -F scmversion MODULENAME
> > 2) By module sysfs node:
> >    > cat /sys/module/MODULENAME/scmversion
> 
> Hi Will,
> 
> First off, thanks for being patient and being responsive throughout the patch
> review process.
> 
> Personally, I am rather neutral towards this feature. We already provide
> CONFIG_MODULE_SRCVERSION to provide a checksum of a module's source files and I
> think the SCMVERSION is a nicer alternative. I can see how an optional
> scmversion field might be helpful information for distro developers in testing
> environments and in situations where it is possible for the kernel and modules
> to be updated/packaged separately (for instance, the kernel selftest modules
> under lib/ are in-tree modules that are provided as a separate kernel module
> package in SLE).
> 
> Generally, out of principle, I do not want to merge a patch that's been NAK'd
> repeatedly; even if I take the patch it'd likely be contested all the way up to
> the merge window. So this boils down to whether Christoph (and maybe Greg) are
> fine with this being a debug option that's not enabled by default.

I am neutral on this, I don't care one way or the other.

thanks,

greg k-h
