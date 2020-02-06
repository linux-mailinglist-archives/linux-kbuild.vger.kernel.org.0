Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC181543F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 13:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBFMZC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Feb 2020 07:25:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:32904 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgBFMZC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 07:25:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 31ECDB1B2;
        Thu,  6 Feb 2020 12:25:00 +0000 (UTC)
Date:   Thu, 6 Feb 2020 13:24:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Erwan Velu <erwanaliasr1@gmail.com>
Cc:     Erwan Velu <e.velu@criteo.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware/dmi: Report DMI Embedded Firmware release
Message-ID: <20200206132430.6082fa87@endymion>
In-Reply-To: <20191127150729.860625-2-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
        <20191127150729.860625-1-e.velu@criteo.com>
        <20191127150729.860625-2-e.velu@criteo.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 27 Nov 2019 16:07:26 +0100, Erwan Velu wrote:
> Servers that have a BMC encodes the release version of their firmwarein the

encodes -> encode
firmwarein -> firmware in

>  "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
> 
> This information is used to know which BMC release actually runs.
> It could be used for some quirks, debugging sessions or inventory tasks.
> 
> A typical output for a Dell system running the 3.75 bios is :
> 
>     [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release
>     3.75
>     [root@t1700 ~]#
> 
> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> ---
>  drivers/firmware/dmi-id.c       | 3 +++
>  drivers/firmware/dmi_scan.c     | 1 +
>  include/linux/mod_devicetable.h | 1 +
>  scripts/mod/file2alias.c        | 1 +
>  4 files changed, 6 insertions(+)
> 
> diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
> index a2aac65ff771..93eca3222fb0 100644
> --- a/drivers/firmware/dmi-id.c
> +++ b/drivers/firmware/dmi-id.c
> @@ -43,6 +43,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_version,		0444, DMI_BIOS_VERSION);
>  DEFINE_DMI_ATTR_WITH_SHOW(bios_date,		0444, DMI_BIOS_DATE);
>  DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,		0444, DMI_SYS_VENDOR);
>  DEFINE_DMI_ATTR_WITH_SHOW(bios_release,         0444, DMI_BIOS_RELEASE);
> +DEFINE_DMI_ATTR_WITH_SHOW(fw_release,           0444, DMI_EMBEDDED_FW_RELEASE);

I suggest naming the define DMI_EC_FIRMWARE_RELEASE. "EC" is the
commonly accepted abbreviation for "embedded controller". "FW" on the
other hand is ambiguous as it can stand for firmware but also firewire
or firewall.

Likewise I think the sysfs attribute should be named
"ec_firmware_release".

>  DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
> @@ -80,6 +81,7 @@ static ssize_t get_modalias(char *buffer, size_t buffer_size)
>  		{ "bvr", DMI_BIOS_VERSION },
>  		{ "bd",  DMI_BIOS_DATE },
>  		{ "br",  DMI_BIOS_RELEASE },
> +		{ "efr", DMI_EMBEDDED_FW_RELEASE },
>  		{ "svn", DMI_SYS_VENDOR },
>  		{ "pn",  DMI_PRODUCT_NAME },
>  		{ "pvr", DMI_PRODUCT_VERSION },
> @@ -190,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
>  	ADD_DMI_ATTR(bios_version,      DMI_BIOS_VERSION);
>  	ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
>  	ADD_DMI_ATTR(bios_release,      DMI_BIOS_RELEASE);
> +	ADD_DMI_ATTR(fw_release,        DMI_EMBEDDED_FW_RELEASE);
>  	ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
>  	ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
>  	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index d010c915c1ab..5394aa553140 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -467,6 +467,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
>  		dmi_save_ident(dm, DMI_BIOS_VERSION, 5);
>  		dmi_save_ident(dm, DMI_BIOS_DATE, 8);
>  		dmi_save_release(dm, DMI_BIOS_RELEASE, 21);
> +		dmi_save_release(dm, DMI_EMBEDDED_FW_RELEASE, 23);
>  		break;
>  	case 1:		/* System Information */
>  		dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 618933d770e6..ad64a101676d 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -533,6 +533,7 @@ enum dmi_field {
>  	DMI_BIOS_VERSION,
>  	DMI_BIOS_DATE,
>  	DMI_BIOS_RELEASE,
> +	DMI_EMBEDDED_FW_RELEASE,
>  	DMI_SYS_VENDOR,
>  	DMI_PRODUCT_NAME,
>  	DMI_PRODUCT_VERSION,
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index cc48930cc02a..c0e1d379d9df 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -937,6 +937,7 @@ static const struct dmifield {
>  	{ "bvr", DMI_BIOS_VERSION },
>  	{ "bd",  DMI_BIOS_DATE },
>  	{ "br",  DMI_BIOS_RELEASE },
> +	{ "efr", DMI_EMBEDDED_FW_RELEASE },
>  	{ "svn", DMI_SYS_VENDOR },
>  	{ "pn",  DMI_PRODUCT_NAME },
>  	{ "pvr", DMI_PRODUCT_VERSION },

Also, as already mentioned during my first review, please merge both
patches together. They touch exactly the same areas, they are doing
basically the same thing, and will never be backported individually, so
splitting them creates more paperwork with no benefit.

-- 
Jean Delvare
SUSE L3 Support
