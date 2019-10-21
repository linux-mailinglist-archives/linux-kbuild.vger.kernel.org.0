Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C4ADF085
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2019 16:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfJUOxH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Oct 2019 10:53:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:49456 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727771AbfJUOxG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Oct 2019 10:53:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EA946ADBF;
        Mon, 21 Oct 2019 14:53:04 +0000 (UTC)
Date:   Mon, 21 Oct 2019 16:53:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Erwan Velu" <erwanaliasr1@gmail.com>
Cc:     "Robert P. J. Day" <rpjday@crashcourse.ca>,
        "Erwan Velu" <e.velu@criteo.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Changbin Du" <changbin.du@intel.com>,
        "Boris Brezillon" <bbrezillon@kernel.org>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
        "Sumit Garg" <sumit.garg@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Michal Marek" <michal.lkml@markovi.net>,
        "Mattias Jacobsson" <2pi@mok.nu>,
        "Masahiro Yamada" <yamada.masahiro@socionext.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] firmware/dmi: Report DMI Bios release
Message-ID: <20191021165321.60be88cd@endymion>
In-Reply-To: <20190918094323.17515-2-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
        <20190918094323.17515-2-e.velu@criteo.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 18 Sep 2019 11:43:20 +0200, Erwan Velu wrote:
> Some vendors like HPe or Dell, encodes the release version of their BIOS

encodes -> encode

> in the "System BIOS {Major|Minor} Release" fields of Type 0.
> 
> This information is useful to know which release of the bios is actually running.
> It could be used for some quirks, debugging sessions or inventory tasks.
> 
> This patch extract these 2 fields in DMI_BIOS_MAJOR_RELEASE & DMI_BIOS_MINOR_RELEASE.
> 
> A typical output for a Dell system running the 65.27 bios is :
> 
> 	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release_major
> 	65
> 	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release_minor
> 	27
> 	[root@t1700 ~]#

I don't think we want two fields. This adds quite some overhead, and
they are not independent from each other anyway. I'd rather have one
field with the values combined:

	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
	65.27
	[root@t1700 ~]#

This would also be in line with how it was implemented in dmidecode. Is
there any reason to NOT go that route?

-- 
Jean Delvare
SUSE L3 Support
