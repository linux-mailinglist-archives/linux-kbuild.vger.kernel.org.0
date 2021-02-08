Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732B5312FB8
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 11:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbhBHKyf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 05:54:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:47518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbhBHKuO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 05:50:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3F9C64E8A;
        Mon,  8 Feb 2021 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612781242;
        bh=aEmETdAAaqlh641eroVBM3hnbdYUk9TPTg1/0fBiOdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KoBZknK/t/arwDGGPinIqqLC5St7DRWfxSLKxzuC558dyJ+cvOVjamOGOZWxtAt9I
         Fnp6lqlbJiuFbz7XJG68VsKN6EjOgQHWjsBxKvY07Pe4CH8PIUoWlPNMYiXd6lDsDT
         Jedu9uJU1lZURZGGODarxd/SWVYCOvADEzIyrChE=
Date:   Mon, 8 Feb 2021 11:47:19 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, giometti@enneenne.com,
        abbotti@mev.co.uk, hsweeten@visionengravers.com, kw@linux.com,
        helgaas@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kbuild@vger.kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        linuxarm@openeuler.org, prime.zeng@huawei.com
Subject: Re: [PATCH 1/4] driver core: Use subdir-ccflags-* to inherit debug
 flag
Message-ID: <YCEWtxYgbRPET4Sr@kroah.com>
References: <1612518255-23052-1-git-send-email-yangyicong@hisilicon.com>
 <1612518255-23052-2-git-send-email-yangyicong@hisilicon.com>
 <YB0Vk6ERJ3lFc3WD@kroah.com>
 <08017751-a1be-ea07-50de-73d14ab6d57e@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08017751-a1be-ea07-50de-73d14ab6d57e@hisilicon.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 08, 2021 at 06:44:52PM +0800, Yicong Yang wrote:
> Hi Greg,
> 
> On 2021/2/5 17:53, Greg KH wrote:
> > On Fri, Feb 05, 2021 at 05:44:12PM +0800, Yicong Yang wrote:
> >> From: Junhao He <hejunhao2@hisilicon.com>
> >>
> >> Use subdir-ccflags-* instead of ccflags-* to inherit the debug
> >> settings from Kconfig when traversing subdirectories.
> > 
> > That says what you do, but not _why_ you are doing it.
> 
> i'll illustrate the reason and reword the commit.
> 
> > 
> > What does this offer in benefit of the existing way?  What is it fixing?
> > Why do this "churn"?
> 
> currently we have added ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG in the Makefile
> of driver/base and driver/base/power, but not in the subdirectory
> driver/base/firmware_loader. we cannot turn the debug on for subdirectory
> firmware_loader if we config DEBUG_DRIVER and there is no kconfig option
> for the it.

Is that necessary?  Does that directory need it?

thanks,

greg k-h
