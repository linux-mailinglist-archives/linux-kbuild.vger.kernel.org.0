Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1076B27A0E9
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Sep 2020 14:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgI0Mbq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Sep 2020 08:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0Mbq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 08:31:46 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7638523718;
        Sun, 27 Sep 2020 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601209905;
        bh=Zob3tCpUBLz6vvpiX/sBXSDrbhVYjXyMiLLbZaEfJ/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RgcoiqB+fXdkWg/+coXRRBCFl/cD1e2JDi9vHSFNoXZuUeHVtR8GTRVBXqnzpfe32
         EKm0FPMSYeTA0cR6cMCvENP+zugwFXvuON+wdFtbTXq2Ic7P7nPYYpbDFv/MaxQTT2
         sCsDoXpkG/Ir/IcputjE+BkcCfPnp34Pbjf8MZ0U=
Date:   Sun, 27 Sep 2020 14:31:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sherry Sun <sherry.sun@nxp.com>
Cc:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rikard.falkeborn@gmail.com" <rikard.falkeborn@gmail.com>,
        "mst@redhat.co" <mst@redhat.co>, "bp@suse.de" <bp@suse.de>,
        "jhugo@codeaurora.org" <jhugo@codeaurora.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/3] mic: vop: fix a written error in MODULE_DEVICE_TABLE
Message-ID: <20200927123155.GA205468@kroah.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
 <20200925073158.8238-2-sherry.sun@nxp.com>
 <20200927102848.GA88650@kroah.com>
 <VI1PR04MB4960185041AEE411141583EA92340@VI1PR04MB4960.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB4960185041AEE411141583EA92340@VI1PR04MB4960.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 27, 2020 at 12:19:50PM +0000, Sherry Sun wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: 2020年9月27日 18:29
> > To: Sherry Sun <sherry.sun@nxp.com>
> > Cc: sudeep.dutt@intel.com; ashutosh.dixit@intel.com; arnd@arndb.de;
> > masahiroy@kernel.org; michal.lkml@markovi.net; lee.jones@linaro.org;
> > rikard.falkeborn@gmail.com; mst@redhat.co; bp@suse.de;
> > jhugo@codeaurora.org; tglx@linutronix.de;
> > manivannan.sadhasivam@linaro.org; mgross@linux.intel.com; pierre-
> > louis.bossart@linux.intel.com; linux-kernel@vger.kernel.org; linux-
> > kbuild@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH 1/3] mic: vop: fix a written error in
> > MODULE_DEVICE_TABLE
> > 
> > On Fri, Sep 25, 2020 at 03:31:56PM +0800, Sherry Sun wrote:
> > > For vop bus, the first parameter should be vop in MODULE_DEVICE_TABLE.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> > > ---
> > >  drivers/misc/mic/vop/vop_main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/mic/vop/vop_main.c
> > > b/drivers/misc/mic/vop/vop_main.c index d609f0dc6124..589425fa78d4
> > > 100644
> > > --- a/drivers/misc/mic/vop/vop_main.c
> > > +++ b/drivers/misc/mic/vop/vop_main.c
> > > @@ -796,7 +796,7 @@ static struct vop_driver vop_driver = {
> > >
> > >  module_vop_driver(vop_driver);
> > >
> > > -MODULE_DEVICE_TABLE(mbus, id_table);
> > > +MODULE_DEVICE_TABLE(vop, id_table);
> > >  MODULE_AUTHOR("Intel Corporation");
> > >  MODULE_DESCRIPTION("Intel(R) Virtio Over PCIe (VOP) driver");
> > > MODULE_LICENSE("GPL v2");
> > 
> > Doesn't this have to go _after_ the MODULE_DEVICE_TABLE(vop...) support,
> > which you add in patch 2 of this series?
> 
> Yes, this patch must be used in conjunction with Patch2.
> But I think here may be a small bug, in order to distinguish it from the driver
> autoloading support, make this a separate patch.
> 
> I can put this patch together with Patch2 if you think it might look more reasonable.

How about _after_ patch 2, otherwise this patch will break the build,
right?

> > Does this patch here break the build?  If not, how is it working?
> > 
> > And if you only have one vop driver, why do you need autoloading for it?
> > 
> No, it doesn't break the build. But actually it won't work(autoloaded) when kernel boot and vop device appears.
> 
> Although we may only have one vop driver, but in the mic Kconfig, the intel mic/vop/cosm/scif drivers all
> recommended to be built as modules, if we don't add autoloading for them, we may need modprobe them
> one by one manually both on EP and RC side.
> 
> Obviously, for our use case, driver autoloading is more convenient.

Why are these all not "mic_SUFFIX" type drivers?  Why "vop" and "cosm"
and "scif"?

And if you only have 1 driver, then what would cause autoloading?

thanks,

greg k-h
