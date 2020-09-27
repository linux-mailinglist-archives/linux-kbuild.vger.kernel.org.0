Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5930C27A125
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Sep 2020 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgI0NE1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Sep 2020 09:04:27 -0400
Received: from mail-eopbgr00089.outbound.protection.outlook.com ([40.107.0.89]:42917
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726149AbgI0NE1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 09:04:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQl+UO1rZ6lXXJT/lw758NqTSXXjI+AvKIuQe27zVlLWmNuxSOub0nzhUau0qkkdomHdudceWfSfRGIWXavIBLXHeZyjbqkafs0emjTl4hiuhvjeAI5WiPejH9YvEy8xeD8nGPX6bJ1VeKdP55YX7ofCcnqHG9SSQcjd0G4UNtlpYy4gbQ76CrODK4cMBFu6A/hbJt9psYcKQxZL52gw1bTajiCwx7ogZDXIwfbbJHxsguJHkluRE02rSUtBqJe4AySP6Ke5TP+9tzxuOMiZQY4XR+A9ijszySAqDjk1QQxgk2aokCNetQiV0gUaM11Op+0LtEBD9USAZStBvwVgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNHevuTZT/v4tGPmpQ0M5B5c5jDY5HGumHq1Tnqno4s=;
 b=Hg+KsDi96tUNJBFpV+8ItGuQBvn+gAvMO7pcxpHj4xiPfsGWuAT/N4WmPI1GNYxEdVSO82jvQKrd0FHf4sl4Zw7/rv/9yYoTktdA1VeFgKKZKNbSdz7NsBKflrd93QFYlCUE5AHcyHYWbZH4x0VJVDTZht9RFKbJ5LyxSKhRaDWGQo7STU3qcwgDoi/W9iy5TJl/LAEohnYWoIp61NbvZS0cz0lYE9X0TtDXj1LYsQgJDL52Cx+jJ2OlNEGtmqkez7xEcWLehXuUNPLC0eGp2kXAyTFlpfE+4KYKEsvI/tC4jsrpiv43xaKL3cTGxcQ3W3asflbv/SquzoFaAnGl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNHevuTZT/v4tGPmpQ0M5B5c5jDY5HGumHq1Tnqno4s=;
 b=lTVKfCyra+fE9PSdmmbjvk3So+SjZbJ/EgRi6sZrl81//p4Jel39dSLRZVGevIRJUkylEO/ouOMu2ed1a7Jv/KXziMUyoFffyZkyStdbiQ7kG7JH94vESqenADLmvTv0Hft2x1vw7TeTUqw4PSr1BvlGHVlXXgnrfUayUbGpXHM=
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB7165.eurprd04.prod.outlook.com (2603:10a6:800:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Sun, 27 Sep
 2020 13:04:21 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Sun, 27 Sep 2020
 13:04:21 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rikard.falkeborn@gmail.com" <rikard.falkeborn@gmail.com>,
        "bp@suse.de" <bp@suse.de>,
        "jhugo@codeaurora.org" <jhugo@codeaurora.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
Subject: RE: [PATCH 3/3] mic: cosm: module autoprobing support for cosm driver
Thread-Topic: [PATCH 3/3] mic: cosm: module autoprobing support for cosm
 driver
Thread-Index: AQHWkw4kQ+ZeBhWf/UyRfs5dZf5Gy6l8TCSAgAAhQzA=
Date:   Sun, 27 Sep 2020 13:04:21 +0000
Message-ID: <VI1PR04MB49609EF02BAF03BBFAAD19BE92340@VI1PR04MB4960.eurprd04.prod.outlook.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
 <20200925073158.8238-4-sherry.sun@nxp.com> <20200927102949.GB88650@kroah.com>
In-Reply-To: <20200927102949.GB88650@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [114.219.66.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 038b372b-55a9-4212-dd0d-08d862e5d9c8
x-ms-traffictypediagnostic: VI1PR04MB7165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7165D338CCCEE6447036E51192340@VI1PR04MB7165.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCZ91ps/3kdn55oovNjkWPMrjrvDYf0Ojdt0eLf6k73h7Whyl2DrFldveCx5Kk2dW73ANUM1ZaPgvaUqffeLMvexMtsS/xxMdtJNbRBrJqeoZ11zrGZrnsO09hMSOSlfAY0mPOhqksJYsaobd1eb1bgxklnRvEVMB6IR9O78eKcfhUX9xE7J7OV9ODupOcIYphATzaNFe7za0gNQjYvlHQVn0g+rvcBaP5Aq8Nnf7DwShKOxGctPPLBQSGlcbJGDUm3qkqxheP8XGQ9q7oLSBdQonMbGMVkM6IR5IGSna6aB3Gllp1WAlHWzWlINTof6afS5TatTWo+XHK58nMQos5GQDe93X2ktYDM/2nc+43fXhTT0KFl0shyy9qrkguqN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(7416002)(66476007)(64756008)(33656002)(6506007)(7696005)(66556008)(6916009)(66446008)(26005)(186003)(5660300002)(52536014)(54906003)(316002)(478600001)(44832011)(4326008)(8676002)(8936002)(2906002)(55016002)(9686003)(71200400001)(86362001)(83380400001)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: E6OWXv7RCrPghRJulv/wWRhrLP7bg9sJzojUkrDu+YYBIblQOImM7CR/FHpJEDSr2yUUPOfMXVRcc4cxdic/B71IOKBUvER3xXrWFn8VF+F64A9jyDOX9x4ExkPl5G4fE+POSm0RSkaAWv9Z+K6J0eTXYYIbRvLxKsBRpPs4pDRxFgMS7a/5uN+OUV6Vq9IUKSIhxkSX3gPhvPhOx6+66ZFzArZW7wCLux9/13T/dv7+iKwAwk7x+folFe1YUU8/fYDEmhyAm9O7nEXNh05d7o35bxmV/TqTp8UU0HSFUfTBUPhGbegEjDTAlhrGFlyY6oGf0yI3LNJDeV5rTY7Jc3uROjEuGIn6gp2zWSwxR9qs4ZDj5/KrphOOnobPVy0mNzUgvy2Y0JvGszvBl7Z+kVRSwDckgacsDMsD+DMb5gOZjaRlM8GG13QNb631OOVJ8WIehsqgjkncJp6zA33gQnIF+8+QIITSZL8cBGOHArgRw1cacKeJeSZGruKtbZKorRgJKDOl444TTA31FXBzDA7c3fwt9Ew1LoUyagkPfXwtlPUBjEbxq2AC+oR4ntNLHIdrE1Kw4jUGBBKF6/GDnImOciGjhzuBpqeZfKFT3jDNyFqOXzkCm+C0HN18m2d+HvK5pmkhFx1BaCK80pij4g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038b372b-55a9-4212-dd0d-08d862e5d9c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 13:04:21.2048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roWxwn95EJmOojkqIIv2e/OF/NFRoYmxR4LSf8ZcNtBBKwfgPNlDrq3u1iwhdylE/I6pddUcE4sMgNt8x2MhEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7165
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Greg,
>=20
> On Fri, Sep 25, 2020 at 03:31:58PM +0800, Sherry Sun wrote:
> > Add uevent callback for cosm_bus and add cosm_device_id for cosm
> > driver which is needed for MODULE_DEVICE_TABLE. Also adding struct
> > cosm_device_id in devicetable-offsets.c and the cosm entry point in
> > file2alias.c.
> >
> > Cosm driver will be autoloaded when cosm device appears.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  drivers/misc/mic/bus/cosm_bus.c   |  8 ++++++++
> >  drivers/misc/mic/cosm/cosm_main.c |  7 +++++++
> >  include/linux/mod_devicetable.h   |  8 ++++++++
> >  scripts/mod/devicetable-offsets.c |  3 +++
> >  scripts/mod/file2alias.c          | 11 +++++++++++
> >  5 files changed, 37 insertions(+)
> >
> > diff --git a/drivers/misc/mic/bus/cosm_bus.c
> > b/drivers/misc/mic/bus/cosm_bus.c index 5f2141c71738..736e27bbc9f9
> > 100644
> > --- a/drivers/misc/mic/bus/cosm_bus.c
> > +++ b/drivers/misc/mic/bus/cosm_bus.c
> > @@ -14,6 +14,13 @@
> >  /* Unique numbering for cosm devices. */  static
> > DEFINE_IDA(cosm_index_ida);
> >
> > +static int cosm_uevent(struct device *d, struct kobj_uevent_env *env)
> > +{
> > +	struct cosm_device *dev =3D dev_to_cosm(d);
> > +
> > +	return add_uevent_var(env, "MODALIAS=3Dcosm:cosm-dev%u", dev-
> >index);
> > +}
> > +
> >  static int cosm_dev_probe(struct device *d)  {
> >  	struct cosm_device *dev =3D dev_to_cosm(d); @@ -33,6 +40,7 @@
> static
> > int cosm_dev_remove(struct device *d)
> >
> >  static struct bus_type cosm_bus =3D {
> >  	.name  =3D "cosm_bus",
> > +	.uevent =3D cosm_uevent,
> >  	.probe =3D cosm_dev_probe,
> >  	.remove =3D cosm_dev_remove,
> >  };
> > diff --git a/drivers/misc/mic/cosm/cosm_main.c
> > b/drivers/misc/mic/cosm/cosm_main.c
> > index ebb0eac43754..627e7d5f3a83 100644
> > --- a/drivers/misc/mic/cosm/cosm_main.c
> > +++ b/drivers/misc/mic/cosm/cosm_main.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/slab.h>
> >  #include <linux/cred.h>
> > +#include <linux/mod_devicetable.h>
> >  #include "cosm_main.h"
> >
> >  static const char cosm_driver_name[] =3D "mic"; @@ -323,6 +324,12 @@
> > static int cosm_suspend(struct device *dev)
> >  	return 0;
> >  }
> >
> > +static struct cosm_device_id __maybe_unused cosm_driver_id_table[] =3D=
 {
> > +	{ .name	=3D "cosm-dev*" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(cosm, cosm_driver_id_table);
> > +
> >  static const struct dev_pm_ops cosm_pm_ops =3D {
> >  	.suspend =3D cosm_suspend,
> >  	.freeze =3D cosm_suspend
> > diff --git a/include/linux/mod_devicetable.h
> > b/include/linux/mod_devicetable.h index 736cdc236cf9..ea6cdfe1a3a3
> > 100644
> > --- a/include/linux/mod_devicetable.h
> > +++ b/include/linux/mod_devicetable.h
> > @@ -845,4 +845,12 @@ struct vop_device_id {  };
> >  #define VOP_DEV_ANY_ID	0xffffffff
> >
> > +/* cosm */
> > +#define COSM_NAME_SIZE			32
> > +#define COSM_MODULE_PREFIX	"cosm:"
> > +
> > +struct cosm_device_id {
> > +	char name[COSM_NAME_SIZE];
> > +};
> > +
> >  #endif /* LINUX_MOD_DEVICETABLE_H */
> > diff --git a/scripts/mod/devicetable-offsets.c
> > b/scripts/mod/devicetable-offsets.c
> > index 393acaa5302a..499a2832878d 100644
> > --- a/scripts/mod/devicetable-offsets.c
> > +++ b/scripts/mod/devicetable-offsets.c
> > @@ -247,5 +247,8 @@ int main(void)
> >  	DEVID_FIELD(vop_device_id, device);
> >  	DEVID_FIELD(vop_device_id, vendor);
> >
> > +	DEVID(cosm_device_id);
> > +	DEVID_FIELD(cosm_device_id, name);
> > +
> >  	return 0;
> >  }
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c index
> > 8063b778eedf..f7c80e4da137 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -1383,6 +1383,16 @@ static int do_vop_entry(const char *filename,
> void *symval,
> >  	return 1;
> >  }
> >
> > +/* Looks like: cosm:S */
> > +static int do_cosm_entry(const char *filename, void *symval,
> > +			  char *alias)
> > +{
> > +	DEF_FIELD_ADDR(symval, cosm_device_id, name);
> > +	sprintf(alias, COSM_MODULE_PREFIX "%s", *name);
> > +
> > +	return 1;
> > +}
> > +
> >  /* Does namelen bytes of name exactly match the symbol? */  static
> > bool sym_is(const char *name, unsigned namelen, const char *symbol)  {
> > @@ -1458,6 +1468,7 @@ static const struct devtable devtable[] =3D {
> >  	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
> >  	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
> >  	{"vop", SIZE_vop_device_id, do_vop_entry},
> > +	{"cosm", SIZE_cosm_device_id, do_cosm_entry},
> >  };
> >
> >  /* Create MODULE_ALIAS() statements.
> > --
> > 2.17.1
> >
>=20
> You are adding MODULE_DEVICE_TABLE() support for a class of drivers, but
> then never adding that support to those drivers?  Why add this at all
> then?  Shouldn't you also be modifying a bunch of drivers to get this to
> work properly?

I also wonder why Intel didn't add the specific implementation code to supp=
ort MODULE_DEVICE_TABLE() like here.
The MODULE_DEVICE_TABLE() macro was written here, but it has no effect befo=
re.

The changes in this patches is enough to support the drivers autoloading,
there no need to modify other codes to make this function works.

Regards
sherry
>=20
> thanks,
>=20
> greg k-h
