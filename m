Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614CE22BB34
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 03:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGXBGu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 21:06:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:24762 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgGXBGu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 21:06:50 -0400
IronPort-SDR: bJFi10tTnHFOCu0w0BlbIAH/eoqdBah8UZ5vcMAKLirlrFXkungTFPEb6B7RvWdCn8aEHq3qyo
 MATYeWky1rGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="138142282"
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; 
   d="scan'208";a="138142282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 18:06:49 -0700
IronPort-SDR: bMs8aUGR39PW22vlKUmh73TYXuFQXfvozPE0Xtpp30nbttMg+9c6y9UWHmmYq/C3LjimvK86Rk
 OBBDfyzqeH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; 
   d="scan'208";a="463054103"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.146.107])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2020 18:06:46 -0700
Date:   Fri, 24 Jul 2020 09:06:45 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        andi.kleen@intel.com, ying.huang@intel.com,
        andriy.shevchenko@intel.com, philip.li@intel.com,
        rong.a.chen@intel.com
Subject: Re: [RFC PATCH] makefile: add debug option to enable function
 aligned on 32 bytes
Message-ID: <20200724010645.GB65362@shbuild999.sh.intel.com>
References: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
 <20200722203919.8b7c9b35ff51d66550c3846c@linux-foundation.org>
 <20200723062933.GA65362@shbuild999.sh.intel.com>
 <20200723175704.44c4b890e76dc6dc68bf3674@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723175704.44c4b890e76dc6dc68bf3674@linux-foundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 23, 2020 at 05:57:04PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2020 14:29:33 +0800 Feng Tang <feng.tang@intel.com> wrote:
> 
> > > > gcc has an option '-falign-functions=n' to force text aligned, and with
> > > > that option enabled, some of those performance changes will be gone,
> > > > like [1][2][3].
> > > > 
> > > > Add this option so that developers and 0day can easily find performance
> > > > bump caused by text alignment change,
> > > 
> > > Would they use it this way, or would they simply always enable the
> > > option to reduce the variability?
> > 
> > I may mis-understood it in my last reply. If you are asking about how
> > will developers and 0day use this option, for 0day, I've talked with
> > 0day folks, they may just enable it by default, as 0day cares more about
> > the performance delta caused by a commit (Adding Philip and Rong from
> > 0day).
> 
> OK, thanks, I suspected as much.
> 
> The patch is so simple and probably-will-work, I guess we toss it in
> there and see.

Thanks!

> However it would be good if the 0day people could use it for a while
> and then provide some feedback on whether it is actually proving
> useful.  If not, we get to remove some stuff.

Yes, 0day is a good user to try this.

Thanks,
Feng
