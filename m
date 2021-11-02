Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD616442EF8
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 14:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhKBNTy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 09:19:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:60430 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhKBNTy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 09:19:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="292090908"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="292090908"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 06:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="489107359"
Received: from kumarsh2-mobl.gar.corp.intel.com ([10.215.113.239])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 06:17:14 -0700
Message-ID: <0d0f1d106cfbd98e352a0f08904d04d08a6fec04.camel@linux.intel.com>
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc:     Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Date:   Tue, 02 Nov 2021 06:17:10 -0700
In-Reply-To: <nycvar.YFH.7.76.2111021249520.12554@cbobk.fhfr.pm>
References: <20211029152901.297939-1-linux@weissschuh.net>
         <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
         <1bb82b37-06e4-4937-ba0d-57fd301eaf2e@t-8ch.de>
         <85cb78cd-92d9-69ed-9360-f5d6f8f904af@redhat.com>
         <nycvar.YFH.7.76.2111021249520.12554@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2021-11-02 at 12:50 +0100, Jiri Kosina wrote:
> On Mon, 1 Nov 2021, Hans de Goede wrote:
> 
> > > > Since most of the changes here are under drivers/hid and since
> > > > the latter
> > > > patches depend on 1/6, I believe it would be best to merge the
> > > > entire series
> > > > through the HID tree, here is my ack for this:
> > > > 
> > > > Acked-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> > > 
> > > Please note that patch 6 modifies a driver that is not yet
> > > available in the HID
> > > and 5.15 trees but only in pdx86/for-next.
> > 
> > Right, but given where we are in the cycle this is going to be
> > something to
> > merge post 5.16-rc1 anyways which resolves the dependency issue.
> > 
> > I guess it might be good to send this our in a later pull-req as a
> > fix series
> > for a later 5.16-rc# though, to avoid the eclite and chrome-ec
> > drivers from
> > autoloading on all systems with an ISH, even though they usually
> > will not be
> > used there.
> 
> I'll be happy to take this as 5.16 fixups after the merge window is
> over 
> (I am not adding anything new to the branches now, before Linus
> merges HID 
> tree), but I'd still like to see Ack from Srinivas.
Done.

Thanks,
Srinivas

> 
> Thanks,
> 


