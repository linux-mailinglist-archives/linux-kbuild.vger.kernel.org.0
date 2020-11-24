Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E4A2C216E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 10:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgKXJbZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 04:31:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:39000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727901AbgKXJbZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 04:31:25 -0500
Received: from linux-8ccs (p57a232c3.dip0.t-ipconnect.de [87.162.50.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB3762073C;
        Tue, 24 Nov 2020 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606210284;
        bh=x0XNcCstZjxyoqDI6BWYieEkdE0LoYUSxI5vbd2Ij40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jQVvTuFX40PXw2b7BBSRbLHLcLh9+vA1uWMNIV8HgVKyS/T/OHkZMrmq3qat0j0Kr
         bFC8e8IPoF1vwB3UsqQiZ7zg1QmSbjm0OXZtMZkbkC8/cLMhsBw6uOXA2kiXrgXj9T
         6z1J7C6OsuwFstdqbNJdn3+HP35jBfpvFNj/kyNY=
Date:   Tue, 24 Nov 2020 10:31:18 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     William Mcvicker <willmcvicker@google.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/2] Add support to capture external module's SCM
 version
Message-ID: <20201124093117.GA21089@linux-8ccs>
References: <20201121011652.2006613-1-willmcvicker@google.com>
 <20201123090257.GB6334@infradead.org>
 <20201123221338.GA2726675@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201123221338.GA2726675@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ William Mcvicker [23/11/20 14:13 -0800]:
>On Mon, Nov 23, 2020 at 09:02:57AM +0000, Christoph Hellwig wrote:
>> On Sat, Nov 21, 2020 at 01:16:49AM +0000, Will McVicker wrote:
>> > These two patches add module support to capture an external module's SCM
>> > version as a MODULE_INFO() attribute. This allows users to identity the SCM
>> > version of a given kernel module by using the modinfo tool or on the device
>> > via sysfs:
>>
>> As this obviously is of no use for in-tree modules it falls under the we
>> don't add code to support things that are not in tree rule and has no
>> business in the kernel.
>
>Hi Christoph,
>
>Ah sorry, I didn't intend this to come across as only for external modules.
>That just seemed like the easiest way to explain how the scmversion attribute
>can be different from the vermagic. We mainly need this for in-tree kernel
>modules since that's where most our drivers are. Let me re-phrase this with
>that in mind. Basically, I like to look at this as an improved version of the
>existing srcversion module attribute since it allows you to easily identify the
>module version with a quick SCM version string check instead of doing a full
>checksum on the module source.
>
>For example, we have a setup to test kernel changes on the hikey and db845c
>devices without updating the kernel modules. Without this scmversion module
>attribute, you can't identify the original module version using `uname
>-r`. And for kernel modules in the initramfs, you can't even use modinfo to get
>the module vermagic.  With this patch, you are able to get the SCM version for
>*all* kernel modules (on disk and in the initramfs) via the sysfs node:
>/sys/module/<mod>/scmversion. This also works the other way around when
>developers update their kernel modules to fix some bug (like a security
>vulnerability) but don't need to update the full kernel.

Hi Will,

If this were also intended for in-tree kernel modules, then why do
intree modules only get the UTS_RELEASE string in their scmversion
field, which basically already exists in the vermagic? Or do you plan
to change that?

Jessica
