Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262C81CEE54
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 09:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgELHhP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 03:37:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:57850 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgELHhP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 03:37:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id F08CEAEAC;
        Tue, 12 May 2020 07:37:15 +0000 (UTC)
Date:   Tue, 12 May 2020 09:37:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Erwan Velu <erwanaliasr1@gmail.com>
Cc:     Erwan Velu <e.velu@criteo.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Changbin Du <changbin.du@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        open list <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
Message-ID: <20200512093710.74fd1dd5@endymion>
In-Reply-To: <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
References: <20200207083550.360461-1-e.velu@criteo.com>
        <20200211142112.649d7237@endymion>
        <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
        <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Erwan,

On Mon, 11 May 2020 19:10:52 +0200, Erwan Velu wrote:
> Jean, I don't see my patches in the 5.7-rc series.
> Is there anything wrong with them ?

Nothing wrong with your patch, but unfortunately I missed the merge
window and sent my pull request a few days too late, so it was not
accepted. Your patch is still in my pending queue:

http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/

and therefore included in every linux-next snapshot, but it won't be
merged in v5.7, you'll have to wait for v5.8.

This is entirely my fault and I am sorry about that.

-- 
Jean Delvare
SUSE L3 Support
