Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F6E2C0248
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 10:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgKWJ3R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 04:29:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:47746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgKWJ3R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 04:29:17 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AE4F206D5;
        Mon, 23 Nov 2020 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606123756;
        bh=c0jF4OeEL9UePNjfHtVi7chADarlrEpvdY3Wd0rD6W0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gKwJTFlfOyz/OYhK6roUFyIjywqn4CFDoshp7qg+T1YsQF+oqRsQ3CYpEfPR9Sq+G
         QME0pBwj/n82VEaALzJJClmDkcgSBLEzUJVu+O22xoBazpdlwBQhr4V/Xjbff/a15j
         iBWz9He6wWrasm6nJ5HtRi5pj0kP/uusfw6ltiLQ=
Date:   Mon, 23 Nov 2020 10:30:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@google.com
Subject: Re: [PATCH v1 2/2] modules: add scmversion field
Message-ID: <X7uBMNijXtaeWnzu@kroah.com>
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
> Add the modinfo field `scmversion` to include the SCM version of kernel
> modules, e.g. git sha1. This allows one to identify the exact source
> code version of a given kernel module.
> 
> You can retrieve it in two ways,
> 
> 1) By using modinfo
>     > modinfo -F scmversion <module_name>
> 2) By module sysfs node
>     > cat /sys/module/<module_name>/scmversion

I agree with Christoph that this doesn't help any in-kernel stuff, so I
don't think it can be merged.  Why not just build these modules as part
of the normal kernel build process, the Android build system should
allow that, right?

But even if it was ok, you are adding new sysfs attributes without a
Documentation/ABI/ update, which is not ok either, so always remember
that for future patches.

thanks,

greg k-h
