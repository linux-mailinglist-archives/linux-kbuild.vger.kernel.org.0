Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3F52C2FF8
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 19:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390944AbgKXSbo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 13:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390893AbgKXSbn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 13:31:43 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC74C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 10:31:43 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t3so4382424pgi.11
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 10:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3pDNDxEpeYYvG914Ntyi16QK2xKi5rl8BfIONS+Vyeg=;
        b=ELUJcJFa5YynV0JyRD0UJRvb02Kq/8+szcZ74mPsjminVRYns9l5GjTqtDeD56vdba
         /Vq45RCeCw5y+xBvdcDxpAZhRMo9XCozUXBS0s50mktV6vzOOrrhn5JYNj3KfQN/kITA
         c7pKuuPug34WduB9P1254ddZ3C6QpbRBSFqCbkvDZxN1JW767q9XAlj1y87Vm+U0N23M
         YA9qjlZG3Uy7FmfiAqZ3WQ87Wf1TRG//aomGQugTH0QWcHbyuMMvSvPRRj08Ty5mDtPo
         c1e34nWq0ZeLTeKodqZXNOEQPuxWVtB3mH1q6US9nWc5h3nY+sN4kbzFtVREl1c6Hhu0
         L35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3pDNDxEpeYYvG914Ntyi16QK2xKi5rl8BfIONS+Vyeg=;
        b=d9c4J9O9Spk2VH0TShk3w/W/CG8ajGbzf7u8x9ZkWyNJXYAr5qBH6Mxs278OQFoNny
         udN4DWx2wHTFy3TGhHZryo+wUjmZ1LUQ383v/TilvfGiUswFnEqr//tEpTYtaT3MIbAx
         W9DLJXSeW6eMNrTSJAfrmy0Q9h9s7hAZyHS2taw+Xtd0mPWZHA5DRgNxNh73STJ5HtsR
         x46Uc/oMrNVfOFyq926LDEBI+5O2QMBkXySTwuXcgeFdrGFuAWcoEwm4SJ5TbXKTRjZV
         AycA0H0TfQyfT8f8P7G2F2+zPA9NmaVR8QDkJ0FOdOtXXUqmlb7u98tZTe6FLMePAuYL
         fIqg==
X-Gm-Message-State: AOAM532FCOTl4JheuK7WJ1H3y+SzfBfAIak/KR3nnluQi8KvrDkud8cL
        CxpqONvhoV59i89/ywPJpI2Fsg==
X-Google-Smtp-Source: ABdhPJyghN+EqQmUdCa4cnajESqcIMR9Xebl3t9XLppVtosvtPKWGGg0RUN3t+ytILKbLhb4mu2ytQ==
X-Received: by 2002:a62:1455:0:b029:18b:83a2:768b with SMTP id 82-20020a6214550000b029018b83a2768bmr5154475pfu.3.1606242702917;
        Tue, 24 Nov 2020 10:31:42 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id 64sm15739121pfe.0.2020.11.24.10.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:31:42 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:31:39 -0800
From:   William Mcvicker <willmcvicker@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/2] Add support to capture external module's SCM
 version
Message-ID: <20201124183139.GB737971@google.com>
References: <20201121011652.2006613-1-willmcvicker@google.com>
 <20201123090257.GB6334@infradead.org>
 <20201123221338.GA2726675@google.com>
 <20201124093117.GA21089@linux-8ccs>
 <20201124180516.GA737971@google.com>
 <X71NGClOP5Lqg6M5@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X71NGClOP5Lqg6M5@kroah.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 07:12:40PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 24, 2020 at 10:05:16AM -0800, William Mcvicker wrote:
> > On Tue, Nov 24, 2020 at 10:31:18AM +0100, Jessica Yu wrote:
> > > +++ William Mcvicker [23/11/20 14:13 -0800]:
> > > > On Mon, Nov 23, 2020 at 09:02:57AM +0000, Christoph Hellwig wrote:
> > > > > On Sat, Nov 21, 2020 at 01:16:49AM +0000, Will McVicker wrote:
> > > > > > These two patches add module support to capture an external module's SCM
> > > > > > version as a MODULE_INFO() attribute. This allows users to identity the SCM
> > > > > > version of a given kernel module by using the modinfo tool or on the device
> > > > > > via sysfs:
> > > > > 
> > > > > As this obviously is of no use for in-tree modules it falls under the we
> > > > > don't add code to support things that are not in tree rule and has no
> > > > > business in the kernel.
> > > > 
> > > > Hi Christoph,
> > > > 
> > > > Ah sorry, I didn't intend this to come across as only for external modules.
> > > > That just seemed like the easiest way to explain how the scmversion attribute
> > > > can be different from the vermagic. We mainly need this for in-tree kernel
> > > > modules since that's where most our drivers are. Let me re-phrase this with
> > > > that in mind. Basically, I like to look at this as an improved version of the
> > > > existing srcversion module attribute since it allows you to easily identify the
> > > > module version with a quick SCM version string check instead of doing a full
> > > > checksum on the module source.
> > > > 
> > > > For example, we have a setup to test kernel changes on the hikey and db845c
> > > > devices without updating the kernel modules. Without this scmversion module
> > > > attribute, you can't identify the original module version using `uname
> > > > -r`. And for kernel modules in the initramfs, you can't even use modinfo to get
> > > > the module vermagic.  With this patch, you are able to get the SCM version for
> > > > *all* kernel modules (on disk and in the initramfs) via the sysfs node:
> > > > /sys/module/<mod>/scmversion. This also works the other way around when
> > > > developers update their kernel modules to fix some bug (like a security
> > > > vulnerability) but don't need to update the full kernel.
> > > 
> > > Hi Will,
> > > 
> > > If this were also intended for in-tree kernel modules, then why do
> > > intree modules only get the UTS_RELEASE string in their scmversion
> > > field, which basically already exists in the vermagic? Or do you plan
> > > to change that?
> > > 
> > > Jessica
> > 
> > Hi Jessica,
> > 
> > Thanks for asking! The reason in-tree kernel modules get the UTS_RELEASE string
> > is for a few reasons:
> > 
> > (1) It contains the SCM version (since UTS_RELEASE has that).
> > (2) It allows you to get the SCM version via the sysfs node (useful for modules
> > in the initramfs).
> > (3) It helps identify that that particular kernel module was in-tree when
> > originally compiled.
> > (4) Using UTS_RELEASE also allows us to respect the privacy of kernels with
> > "# CONFIG_LOCALVERSION_AUTO is not set" by not including the SCM version in the
> > module scmversion attribute.
> > 
> > Now, if we don't care about knowing if a module was in-tree or not (since
> > we only care about in-tree modules here anyway), I can update the patch to have
> > a consistent format regardless of in-tree or external. Personally, I like the
> > UTS_RELEASE version better because it gives me more information from the sysfs
> > node which is useful when debugging issues related to modules loaded in
> > initramfs.
> 
> We already know if a module was built in-or-out of tree, the "O" taint
> flag is set, so that information is already in the module today, right?
> Can't that be used somehow here?
> 
> thanks,
> 
> greg k-h
Hi Greg,

Let me prefix this with this, I do see the benefits of having a consistent
scmversion format for intree and out-of-tree modules. So I'm happy to fix that
in the next patchset.

Now, I could be wrong, but I believe the taint flag is only printed when the
module is loaded:

  XXX: loading out-of-tree module taints kernel.

or when there's a kernel WARNING or kernel crash. But that assumes you have the
full logs when the kernel booted or you have a full crash stack in the kernel.

Modinfo does have an attribute that indicates if the module is intree or
not:

$ modinfo -F intree out_dir/./net/netfilter/nf_log_common.ko
Y

But that is not queriable via sysfs. Ideally, we'd like to be able to get all
this information via sysfs so that it can be captured in our bug reports.

Thanks,
Will
