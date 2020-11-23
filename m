Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C69C2C024F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 10:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgKWJbK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 04:31:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726799AbgKWJbJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 04:31:09 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3973206D5;
        Mon, 23 Nov 2020 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606123869;
        bh=q/FGH8VFHpZMxdMzpaO/GqkbfF33SkyeuDgsxQTpAQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c+xXr9zF2+bCngWMABbLRZHwoFSBdO0nzDgbdvs57kHGkBw55SGrIrYtS0eZbqxUb
         PeI8m+j9kGGI4qoUrDTsZCliTUz57os/CKKv7JQ64rKwNI/kSrc4vh4CklSDW9I/PL
         QcS0R/xQtsaXRbNjHZr3YRm6aNtHrCA/QBHQWUz8=
Date:   Mon, 23 Nov 2020 10:32:19 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@google.com
Subject: Re: [PATCH v1 2/2] modules: add scmversion field
Message-ID: <X7uBo6TolwKOrGSZ@kroah.com>
References: <20201121011652.2006613-1-willmcvicker@google.com>
 <20201121011652.2006613-3-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121011652.2006613-3-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 21, 2020 at 01:16:51AM +0000, Will McVicker wrote:
> +/**
> + * struct modinfo_attrs - Module attributes.
> + * @module_uevent: Used to notify udev of events.
> + * @modinfo_version: Module version.
> + * @modinfo_srcversion: Checksum of module source.
> + * @modinfo_scmversion: SCM version of module source.
> + * @modinfo_initstate: Module init state.
> + * @modinfo_coresize: Module core layout size.
> + * @modinfo_initsize: Module init layout size.
> + * @modinfo_taint: Indicates if the module is tainted.
> + * @modinfo_refcnt: Number of references in the kernel to the module.
> + *
> + * These are the module attributes accessible via the sysfs files
> + * /sys/module/<module_name>/<attribute>.
> + *
> + * The following subset of attributes can also be accessed via the modinfo tool
> + * as well: version, srcversion, and scmversion.
> + */
>  static struct module_attribute *modinfo_attrs[] = {
>  	&module_uevent,
>  	&modinfo_version,
>  	&modinfo_srcversion,
> +	&modinfo_scmversion,
>  	&modinfo_initstate,
>  	&modinfo_coresize,
>  	&modinfo_initsize,

This isn't the normal way to document an array, with kerneldoc, I don't
think I've seen that anywhere else in the kernel, have you?

Anyway, again, Documentation/ABI/ is the correct place for this.

thanks,

greg k-h
