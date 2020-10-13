Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDE028CAC6
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404207AbgJMJIO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 05:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404121AbgJMJIN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 05:08:13 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA54A208D5;
        Tue, 13 Oct 2020 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602580093;
        bh=p8NqRmOJyLfUXcRw4LsDuaSZ1HDIpCdA36ZLSHLW/ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swrPY+ehjIps6I5ADtKcbruEshXfKuJBthgcSvqjuo1WMUGUBnYM4ZHzXxwiyTUEL
         p9J4dqgUGTn3tyLx4F65ZDyh0S3/LCLduQ7MHIUb67SQjyZBPXsGZ6/XoNldf0MTB6
         6HU2JMkwc8wlRjN4/YP+z3GomyCwU5XFGPufpc/U=
Date:   Tue, 13 Oct 2020 11:08:50 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Sherry Sun <sherry.sun@nxp.com>
Cc:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver
Message-ID: <20201013090850.GA1922404@kroah.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
 <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 13, 2020 at 08:52:01AM +0000, Sherry Sun wrote:
> Gentle ping....

It's the merge window, sorry, this fell through the cracks before that
happened.

Please resubmit once 5.10-rc1 comes out.

thanks,

greg k-h
