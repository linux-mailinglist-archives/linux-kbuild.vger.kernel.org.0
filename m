Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A794041EE6B
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 15:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhJANWv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 09:22:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:57773 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231484AbhJANWv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 09:22:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="222230946"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="222230946"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 06:20:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="708614512"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 06:20:42 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mWISs-007Rxr-TQ;
        Fri, 01 Oct 2021 16:20:38 +0300
Date:   Fri, 1 Oct 2021 16:20:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomas Winkler <tomas.winkler@intel.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@lst.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 2/4] uuid: Make guid_t completely internal type to the
 kernel
Message-ID: <YVcLJmb4h7ZRBmoh@smile.fi.intel.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
 <20211001113747.64040-2-andriy.shevchenko@linux.intel.com>
 <YVb4i330sXrvHLWa@kroah.com>
 <YVcKAH6C/dAZqoAw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVcKAH6C/dAZqoAw@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 01, 2021 at 04:15:44PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 01, 2021 at 02:01:15PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 01, 2021 at 02:37:45PM +0300, Andy Shevchenko wrote:
> > > The guid_t type was defined in UAPI by mistake.
> > > Keep it an internal type and leave uuid_le UAPI
> > > for it's only user, i.e. MEI.
> > 
> > It's used in they hyper-v drivers as a uapi between the kernel and the
> > hypervisor, so isn't that something valid here?
> 
> I'm not sure I see that interface defined in the kernel. As far as I remember
> the guid_t is used solely inside kernel by Hyper-V code and the rest is using
> raw buffers. Can you point out to the specific place(s)?

Ah, it's a leftover inclusion in the uapi! Thanks for noticing.
I will add a patch to replace it.

-- 
With Best Regards,
Andy Shevchenko


