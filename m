Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D80B41ECB9
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 13:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354053AbhJAMBb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 08:01:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230510AbhJAMBb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 08:01:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C09961A05;
        Fri,  1 Oct 2021 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633089587;
        bh=ArSVrDrRl5VLN57bSGxGInuPa+Tz4UEH754s1g6KYZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z71CBi6WRIVTWiRMNrH38wVP4NehPIE+e40ML1h7mpw0iz5SSfrwiq4ywzs4VMtWm
         McVurSfkFyMPg+9m7b0E8pCR/+dkz19vbPCy5kvkyXB2ifFBLieYTIA9CauPfu6bUU
         E6waxhkIHFwcK51tS1fQkUz6cpBNuZ3Y/bLsiOfg=
Date:   Fri, 1 Oct 2021 13:59:45 +0200
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
Subject: Re: [PATCH v3 1/4] modpost: Mark uuid_le type only for MEI
Message-ID: <YVb4Mf2UrircK7g6@kroah.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 01, 2021 at 02:37:44PM +0300, Andy Shevchenko wrote:
> The uuid_le type is used only for MEI ABI, do not advertise it for others.
> Due to above, bury add_uuid() in its only user.

Why not just remove it from the user and move to using guid_t instead?

And then remove this code entirely?

thanks,

greg k-h
