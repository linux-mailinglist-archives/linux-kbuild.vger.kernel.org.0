Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277A5430912
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 14:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhJQMsF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sun, 17 Oct 2021 08:48:05 -0400
Received: from mga09.intel.com ([134.134.136.24]:36844 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhJQMsE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 08:48:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10139"; a="227994604"
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; 
   d="scan'208";a="227994604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 05:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; 
   d="scan'208";a="717237341"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2021 05:45:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 05:45:53 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 05:45:52 -0700
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2242.012;
 Sun, 17 Oct 2021 15:45:50 +0300
From:   "Winkler, Tomas" <tomas.winkler@intel.com>
To:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        "Lubart, Vitaly" <vitaly.lubart@intel.com>,
        "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: RE: intel_mei_pxp: needs better help text
Thread-Topic: intel_mei_pxp: needs better help text
Thread-Index: AQHXwOnBA6KbpVrfrE+vWdMNeqOXV6vWm8UAgACLvLA=
Date:   Sun, 17 Oct 2021 12:45:50 +0000
Message-ID: <dc2ae3d0c3e6452b80a53ca6ca2b20b8@intel.com>
References: <20211014105334.GA19786@duo.ucw.cz>
 <20211017072356.GA4756@duo.ucw.cz>
In-Reply-To: <20211017072356.GA4756@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thank you,  we will handle that.
Please mind our weekend. 
Thanks
Tomas


> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Sunday, October 17, 2021 10:24
> To: kernel list <linux-kernel@vger.kernel.org>; Lubart, Vitaly
> <vitaly.lubart@intel.com>; Winkler, Tomas <tomas.winkler@intel.com>;
> Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>;
> jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; intel-gfx@lists.freedesktop.org; linux-
> kbuild@vger.kernel.org; masahiroy@kernel.org
> Subject: Re: intel_mei_pxp: needs better help text
> 
> Hi!
> 
> Extended Cc list. Should I attempt to prepare a patch?
> 
> Best regards,
> 							Pavel
> 
> On Thu 2021-10-14 12:53:34, Pavel Machek wrote:
> >
> > CONFIG_INTEL_MEI_PXP:
> >
> > MEI Support for PXP Services on Intel platforms.
> >
> > Enables the ME FW services required for PXP support through
> > I915 display driver of Intel.
> >
> >
> > That's ... very useless help text. According to
> > https://www.phoronix.com/scan.php?page=news_item&px=Intel-PXP-
> Protecte
> > d-Xe-Path this is some kind of DRM. Help text should probably say it
> > has to do with i915 video, and explain the acronyms, and probably its
> > usecases.
> >
> >
> >
> > --
> > http://www.livejournal.com/~pavelmachek
> 
> 
> 
> --
> http://www.livejournal.com/~pavelmachek
