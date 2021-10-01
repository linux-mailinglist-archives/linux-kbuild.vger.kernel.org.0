Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0E141ED26
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 14:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354230AbhJAMOl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 08:14:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:62569 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354224AbhJAMOl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 08:14:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247974420"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="247974420"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 05:12:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="556273753"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 05:12:54 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mWHPG-007R5W-LO;
        Fri, 01 Oct 2021 15:12:50 +0300
Date:   Fri, 1 Oct 2021 15:12:50 +0300
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
Subject: Re: [PATCH v3 1/4] modpost: Mark uuid_le type only for MEI
Message-ID: <YVb7QvVzNrWzwBna@smile.fi.intel.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
 <YVb4Mf2UrircK7g6@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVb4Mf2UrircK7g6@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 01, 2021 at 01:59:45PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 01, 2021 at 02:37:44PM +0300, Andy Shevchenko wrote:
> > The uuid_le type is used only for MEI ABI, do not advertise it for others.
> > Due to above, bury add_uuid() in its only user.
> 
> Why not just remove it from the user and move to using guid_t instead?
> 
> And then remove this code entirely?

The idea is to decouple ABI available type (uuid_le) from kernel internal one
(guid_t).


-- 
With Best Regards,
Andy Shevchenko


