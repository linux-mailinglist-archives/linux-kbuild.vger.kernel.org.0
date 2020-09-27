Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC5E27A07F
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Sep 2020 12:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI0K3k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Sep 2020 06:29:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0K3k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 06:29:40 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89DA023977;
        Sun, 27 Sep 2020 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601202579;
        bh=aOwH8iIqA7JJ3o/j0lguFmo1NUlzR01llp7/+J/WiyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r1lNFFbIkEo20kq6eIV9MmI4SB0aWDgLqmvTXJTAXYU9kQKWs0E6995OEPa/ZdS2t
         lALZ7uUSQsOCsO5uhb3NsJPKm+A7hs2GlZuLFMLUnIJLuUkt3CNxuMDxWtHQvQIZ/k
         HLcvDcLbfnwBka4wnGoUejGD2M2Lq6gjX8A4RqLI=
Date:   Sun, 27 Sep 2020 12:29:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sherry Sun <sherry.sun@nxp.com>
Cc:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        lee.jones@linaro.org, rikard.falkeborn@gmail.com, mst@redhat.co,
        bp@suse.de, jhugo@codeaurora.org, tglx@linutronix.de,
        manivannan.sadhasivam@linaro.org, mgross@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 3/3] mic: cosm: module autoprobing support for cosm driver
Message-ID: <20200927102949.GB88650@kroah.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
 <20200925073158.8238-4-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925073158.8238-4-sherry.sun@nxp.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 25, 2020 at 03:31:58PM +0800, Sherry Sun wrote:
> Add uevent callback for cosm_bus and add cosm_device_id for cosm driver
> which is needed for MODULE_DEVICE_TABLE. Also adding struct
> cosm_device_id in devicetable-offsets.c and the cosm entry point in
> file2alias.c.
> 
> Cosm driver will be autoloaded when cosm device appears.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/misc/mic/bus/cosm_bus.c   |  8 ++++++++
>  drivers/misc/mic/cosm/cosm_main.c |  7 +++++++
>  include/linux/mod_devicetable.h   |  8 ++++++++
>  scripts/mod/devicetable-offsets.c |  3 +++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  5 files changed, 37 insertions(+)
> 
> diff --git a/drivers/misc/mic/bus/cosm_bus.c b/drivers/misc/mic/bus/cosm_bus.c
> index 5f2141c71738..736e27bbc9f9 100644
> --- a/drivers/misc/mic/bus/cosm_bus.c
> +++ b/drivers/misc/mic/bus/cosm_bus.c
> @@ -14,6 +14,13 @@
>  /* Unique numbering for cosm devices. */
>  static DEFINE_IDA(cosm_index_ida);
>  
> +static int cosm_uevent(struct device *d, struct kobj_uevent_env *env)
> +{
> +	struct cosm_device *dev = dev_to_cosm(d);
> +
> +	return add_uevent_var(env, "MODALIAS=cosm:cosm-dev%u", dev->index);
> +}
> +
>  static int cosm_dev_probe(struct device *d)
>  {
>  	struct cosm_device *dev = dev_to_cosm(d);
> @@ -33,6 +40,7 @@ static int cosm_dev_remove(struct device *d)
>  
>  static struct bus_type cosm_bus = {
>  	.name  = "cosm_bus",
> +	.uevent = cosm_uevent,
>  	.probe = cosm_dev_probe,
>  	.remove = cosm_dev_remove,
>  };
> diff --git a/drivers/misc/mic/cosm/cosm_main.c b/drivers/misc/mic/cosm/cosm_main.c
> index ebb0eac43754..627e7d5f3a83 100644
> --- a/drivers/misc/mic/cosm/cosm_main.c
> +++ b/drivers/misc/mic/cosm/cosm_main.c
> @@ -12,6 +12,7 @@
>  #include <linux/idr.h>
>  #include <linux/slab.h>
>  #include <linux/cred.h>
> +#include <linux/mod_devicetable.h>
>  #include "cosm_main.h"
>  
>  static const char cosm_driver_name[] = "mic";
> @@ -323,6 +324,12 @@ static int cosm_suspend(struct device *dev)
>  	return 0;
>  }
>  
> +static struct cosm_device_id __maybe_unused cosm_driver_id_table[] = {
> +	{ .name	= "cosm-dev*" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(cosm, cosm_driver_id_table);
> +
>  static const struct dev_pm_ops cosm_pm_ops = {
>  	.suspend = cosm_suspend,
>  	.freeze = cosm_suspend
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 736cdc236cf9..ea6cdfe1a3a3 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -845,4 +845,12 @@ struct vop_device_id {
>  };
>  #define VOP_DEV_ANY_ID	0xffffffff
>  
> +/* cosm */
> +#define COSM_NAME_SIZE			32
> +#define COSM_MODULE_PREFIX	"cosm:"
> +
> +struct cosm_device_id {
> +	char name[COSM_NAME_SIZE];
> +};
> +
>  #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index 393acaa5302a..499a2832878d 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -247,5 +247,8 @@ int main(void)
>  	DEVID_FIELD(vop_device_id, device);
>  	DEVID_FIELD(vop_device_id, vendor);
>  
> +	DEVID(cosm_device_id);
> +	DEVID_FIELD(cosm_device_id, name);
> +
>  	return 0;
>  }
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8063b778eedf..f7c80e4da137 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1383,6 +1383,16 @@ static int do_vop_entry(const char *filename, void *symval,
>  	return 1;
>  }
>  
> +/* Looks like: cosm:S */
> +static int do_cosm_entry(const char *filename, void *symval,
> +			  char *alias)
> +{
> +	DEF_FIELD_ADDR(symval, cosm_device_id, name);
> +	sprintf(alias, COSM_MODULE_PREFIX "%s", *name);
> +
> +	return 1;
> +}
> +
>  /* Does namelen bytes of name exactly match the symbol? */
>  static bool sym_is(const char *name, unsigned namelen, const char *symbol)
>  {
> @@ -1458,6 +1468,7 @@ static const struct devtable devtable[] = {
>  	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
>  	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
>  	{"vop", SIZE_vop_device_id, do_vop_entry},
> +	{"cosm", SIZE_cosm_device_id, do_cosm_entry},
>  };
>  
>  /* Create MODULE_ALIAS() statements.
> -- 
> 2.17.1
> 

You are adding MODULE_DEVICE_TABLE() support for a class of drivers, but
then never adding that support to those drivers?  Why add this at all
then?  Shouldn't you also be modifying a bunch of drivers to get this to
work properly?

thanks,

greg k-h
