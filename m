Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EE02C31E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 21:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730925AbgKXU0r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 15:26:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:41522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730924AbgKXU0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 15:26:46 -0500
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl [82.217.20.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A61A2087C;
        Tue, 24 Nov 2020 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606249605;
        bh=sUhs4Bt1+pntTUMGJQaEm3uZeXooCjP85V1v8Z3u2CY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QlkZvfcivCURkEB8Z++6C2vq6kYMcEzvr8z7UJYETsKQsBk074ZDaaN9sb/HWIGHv
         cUw0b2LJkK+zx46wy+YpPWR82EiPoO9N9u7RqIZkWdBGBxjWtS//69XuM/vIsBFCv+
         aSfWnaUsYrh8etmPNsJs7xFTLDSi9UtZJ3i9AN0o=
Date:   Tue, 24 Nov 2020 21:24:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     William Mcvicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/2] Add support to capture external module's SCM
 version
Message-ID: <X71r+kHD87CV9tcL@kroah.com>
References: <20201121011652.2006613-1-willmcvicker@google.com>
 <20201123090257.GB6334@infradead.org>
 <20201123221338.GA2726675@google.com>
 <20201124093117.GA21089@linux-8ccs>
 <20201124180516.GA737971@google.com>
 <X71NGClOP5Lqg6M5@kroah.com>
 <20201124183139.GB737971@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124183139.GB737971@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 10:31:39AM -0800, William Mcvicker wrote:
> On Tue, Nov 24, 2020 at 07:12:40PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Nov 24, 2020 at 10:05:16AM -0800, William Mcvicker wrote:
> > > On Tue, Nov 24, 2020 at 10:31:18AM +0100, Jessica Yu wrote:
> > > > +++ William Mcvicker [23/11/20 14:13 -0800]:
> > > > > On Mon, Nov 23, 2020 at 09:02:57AM +0000, Christoph Hellwig wrote:
> > > > > > On Sat, Nov 21, 2020 at 01:16:49AM +0000, Will McVicker wrote:
> > > > > > > These two patches add module support to capture an external module's SCM
> > > > > > > version as a MODULE_INFO() attribute. This allows users to identity the SCM
> > > > > > > version of a given kernel module by using the modinfo tool or on the device
> > > > > > > via sysfs:
> > > > > > 
> > > > > > As this obviously is of no use for in-tree modules it falls under the we
> > > > > > don't add code to support things that are not in tree rule and has no
> > > > > > business in the kernel.
> > > > > 
> > > > > Hi Christoph,
> > > > > 
> > > > > Ah sorry, I didn't intend this to come across as only for external modules.
> > > > > That just seemed like the easiest way to explain how the scmversion attribute
> > > > > can be different from the vermagic. We mainly need this for in-tree kernel
> > > > > modules since that's where most our drivers are. Let me re-phrase this with
> > > > > that in mind. Basically, I like to look at this as an improved version of the
> > > > > existing srcversion module attribute since it allows you to easily identify the
> > > > > module version with a quick SCM version string check instead of doing a full
> > > > > checksum on the module source.
> > > > > 
> > > > > For example, we have a setup to test kernel changes on the hikey and db845c
> > > > > devices without updating the kernel modules. Without this scmversion module
> > > > > attribute, you can't identify the original module version using `uname
> > > > > -r`. And for kernel modules in the initramfs, you can't even use modinfo to get
> > > > > the module vermagic.  With this patch, you are able to get the SCM version for
> > > > > *all* kernel modules (on disk and in the initramfs) via the sysfs node:
> > > > > /sys/module/<mod>/scmversion. This also works the other way around when
> > > > > developers update their kernel modules to fix some bug (like a security
> > > > > vulnerability) but don't need to update the full kernel.
> > > > 
> > > > Hi Will,
> > > > 
> > > > If this were also intended for in-tree kernel modules, then why do
> > > > intree modules only get the UTS_RELEASE string in their scmversion
> > > > field, which basically already exists in the vermagic? Or do you plan
> > > > to change that?
> > > > 
> > > > Jessica
> > > 
> > > Hi Jessica,
> > > 
> > > Thanks for asking! The reason in-tree kernel modules get the UTS_RELEASE string
> > > is for a few reasons:
> > > 
> > > (1) It contains the SCM version (since UTS_RELEASE has that).
> > > (2) It allows you to get the SCM version via the sysfs node (useful for modules
> > > in the initramfs).
> > > (3) It helps identify that that particular kernel module was in-tree when
> > > originally compiled.
> > > (4) Using UTS_RELEASE also allows us to respect the privacy of kernels with
> > > "# CONFIG_LOCALVERSION_AUTO is not set" by not including the SCM version in the
> > > module scmversion attribute.
> > > 
> > > Now, if we don't care about knowing if a module was in-tree or not (since
> > > we only care about in-tree modules here anyway), I can update the patch to have
> > > a consistent format regardless of in-tree or external. Personally, I like the
> > > UTS_RELEASE version better because it gives me more information from the sysfs
> > > node which is useful when debugging issues related to modules loaded in
> > > initramfs.
> > 
> > We already know if a module was built in-or-out of tree, the "O" taint
> > flag is set, so that information is already in the module today, right?
> > Can't that be used somehow here?
> > 
> > thanks,
> > 
> > greg k-h
> Hi Greg,
> 
> Let me prefix this with this, I do see the benefits of having a consistent
> scmversion format for intree and out-of-tree modules. So I'm happy to fix that
> in the next patchset.
> 
> Now, I could be wrong, but I believe the taint flag is only printed when the
> module is loaded:
> 
>   XXX: loading out-of-tree module taints kernel.
> 
> or when there's a kernel WARNING or kernel crash. But that assumes you have the
> full logs when the kernel booted or you have a full crash stack in the kernel.
> 
> Modinfo does have an attribute that indicates if the module is intree or
> not:
> 
> $ modinfo -F intree out_dir/./net/netfilter/nf_log_common.ko
> Y
> 
> But that is not queriable via sysfs.

Look at the file in /sys/modules/MODULENAME/taint

That should show you this value.

> Ideally, we'd like to be able to get all
> this information via sysfs so that it can be captured in our bug reports.

I think you already have it :)

This is independent of your "source code id value" idea though...

thanks,

greg k-h
