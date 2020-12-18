Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD982DE242
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 13:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgLRMCY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 07:02:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgLRMCY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 07:02:24 -0500
Date:   Fri, 18 Dec 2020 13:01:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608292904;
        bh=K6CUqnb/X7ZPJUEKfo8tMazAcE7KHIZB4MD6YANo84A=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=CM3Sg7wZQ3UhDO5QNEmg1lmWfQiLMKbGnFjcc9E11TJH2ThuGm1DAKMtm0ANW0vr8
         6cSlJyaBZrKSrIl9ed9qSDvYkcaRYwu60KJWVhKiIB76fxd+GEV5XM6vBeeWVqIsae
         y7xSCBrxxdBKSsdbIoYNLigeU31UaNaTl6jwos6ncHFLLrq+1cpPDIDYWI5yjtyG0I
         hQpyNDVBb+JQyhoSRzOXuJGawDRVJY+uV2wrTPHkISTytFIRbUcUajOtpvUNSBJMHA
         Jp327LnjsOGIbsEGWzegyLkaWMZuH/x1Ne+HAaX/x4KZaaF7OX8N1i4TXyZ7S3kAaG
         usenRY5bBSrfA==
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
Message-ID: <20201218120138.GA5265@linux-8ccs>
References: <20201216220850.659584-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201216220850.659584-1-willmcvicker@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Will McVicker [16/12/20 22:08 +0000]:
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
>
>Signed-off-by: Will McVicker <willmcvicker@google.com>

Hi Will, thanks for v4. I'm on vacation for the next two weeks and
with the current merge window almost over, I hope it'd be OK with you
if we revisit this early January. Just wanted to give you a heads up.

Thanks and happy holidays!

Jessica

