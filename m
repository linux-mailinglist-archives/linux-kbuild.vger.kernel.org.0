Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A196541ECCE
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 14:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354233AbhJAMDC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 08:03:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:45768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231321AbhJAMDC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 08:03:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86B8361A6F;
        Fri,  1 Oct 2021 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633089678;
        bh=ZU2CmUx0o5LjUJGRX9uZtVps9VmntCNHLLzJYGKU5lw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x2o1+PA7si6r9DRBDsHGvbytTVlm0zvpge3YaOtRZSzYYr7OvCVTCaYG2zJYyTE/A
         rCyY1nVISznHpLtmdhls1etxZ5A6v8czPsRs+VFLG2ut/0b+y5CWNp1iDJxyf19hLB
         8l32L0mxDXL/YX7mQXxYAH/s1E0D6d+xftRmQUXM=
Date:   Fri, 1 Oct 2021 14:01:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <YVb4i330sXrvHLWa@kroah.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
 <20211001113747.64040-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001113747.64040-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 01, 2021 at 02:37:45PM +0300, Andy Shevchenko wrote:
> The guid_t type was defined in UAPI by mistake.
> Keep it an internal type and leave uuid_le UAPI
> for it's only user, i.e. MEI.

It's used in they hyper-v drivers as a uapi between the kernel and the
hypervisor, so isn't that something valid here?

As I didn't see a 0/4 for this series, I'm confused as to your end-goal
here.  What are you trying to do with this series?

thanks,

greg k-h
