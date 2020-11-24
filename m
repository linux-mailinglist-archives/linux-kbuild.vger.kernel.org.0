Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15462C28FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 15:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733249AbgKXOGs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 09:06:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:24716 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729080AbgKXOGs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 09:06:48 -0500
IronPort-SDR: ot1HLOyDR5gtAgWlVwXzzzisYjo872DBZCuQb6+Q36vjvCTX1GBYCqZVFpdyixRnPk0qnPDVZY
 kH/QrE2Lj3Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233555862"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="233555862"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 06:06:47 -0800
IronPort-SDR: rdbaW9Dj8Cj7qajrJR1TxlovQhV7dZDkSPeLve8p3HRgjP/0DDU4fNdmRqet0AbCudFnYhNnBH
 /OVzkdS2QxAw==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="534871695"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 06:06:43 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1khYyv-009PMs-Ci; Tue, 24 Nov 2020 16:07:45 +0200
Date:   Tue, 24 Nov 2020 16:07:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uuid: Make guid_t completely internal type to the
 kernel
Message-ID: <20201124140745.GO4077@smile.fi.intel.com>
References: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com>
 <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
 <20201124133945.GA30840@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124133945.GA30840@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 02:39:45PM +0100, Christoph Hellwig wrote:
> On Fri, Oct 30, 2020 at 08:49:50PM +0200, Andy Shevchenko wrote:
> > diff --git a/include/uapi/linux/uuid.h b/include/uapi/linux/uuid.h
> > index e5a7eecef7c3..c3e175f686f4 100644
> > --- a/include/uapi/linux/uuid.h
> > +++ b/include/uapi/linux/uuid.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >  /*
> > - * UUID/GUID definition
> > + * MEI UUID definition
> >   *
> >   * Copyright (C) 2010, Intel Corp.
> >   *	Huang Ying <ying.huang@intel.com>
> > @@ -22,21 +22,17 @@
> >  
> >  typedef struct {
> >  	__u8 b[16];
> > -} guid_t;
> > +} uuid_le;
> 
> IMHO we should kill this header entirely and move the definition to
> <uapi/linux/mei.h> under a new name so that no one picks up the
> definition by accident.

I would like to do that in a separate series. Here I don't change the status
quo about using it, but for moving it will require to touch MEI code.


-- 
With Best Regards,
Andy Shevchenko


