Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA428CA85
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404023AbgJMIwF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 04:52:05 -0400
Received: from mail-eopbgr150047.outbound.protection.outlook.com ([40.107.15.47]:7054
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404020AbgJMIwE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 04:52:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m64jwh+mmc++q7lUxNDmsZe2OTCd6y99/JWrSJwcmpvs53Y7pxyfP0nJz+vOcpa9fyB7N6MFjnVYGiKktraaym51noBBh24vrf4W1iOpx81RYvOrRUw2am5sxOBEhagKkYyOfqJJXcw8DpSEuf/snLNzieurP5pQJFAgMr6SzPnQHk6H+7alP5mMGxQMJRQoR54+QjxvSjFaE86uPPS+pUr7+oox5kRLsqFjeEYpL+2yRJzwTWpoRdn0zSjrdP8jn8/CcC+jogwAV30uYCkBrxR0+nhheaZ4t90npwqkk/yv2W9o584LxqmaXwhjd+Yunx9Ptje2vOVTlgtYPXh+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTlAWv7qX5iPpeSLRayks/GTm1hkIAIXbahNcajION4=;
 b=OVzW5p6thF6+thN7EOa/3UK8+QJtF3c1WxfR8Puy30enBVeZO6QQ/U8pyq/FQfz9Y8KX0z/SxOw94bqKAkaK1hjPK0POMIHyLJ7cxJH5/SFM14aptU4az6Y2k9VJlZp81mDl79c2ss/d1wPJvpeG9+0JCrlU/wgqVE/F1sUti+1Ut6Fmor4tyEwoST2Cx64DS6tjYoCYS3/cOwEgVw/sOPdcFYKDF9i1JGj/RjMBQSF8Ur8Ee9klcGsjkPD6UrIm9o8skjJgi1Ve4lCcoMPnjKL7CHT3oJeyzHwK7oA2sJPdwcSiHDhYe+vrahFCW3JywjhkUlnJIIRvpVraTXVw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTlAWv7qX5iPpeSLRayks/GTm1hkIAIXbahNcajION4=;
 b=La3dH5VbYRmR9SX/Ovs5b+kcy+AtWNmGu0eHr8XtWfLEHJwa1kpPoF5yEriXGsrkXHmHK6BglfXMWc2tkb/Cqe/E/LuJmSx7eZtDkJAV5PB1pSHxTTrXAQ3GirLNRACgRswXQHbj1LKzxv3il4YA0tHroTQOd0d2qijtkcGtqBc=
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB5552.eurprd04.prod.outlook.com (2603:10a6:803:cc::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 08:52:01 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 08:52:01 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver 
Thread-Topic: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver 
Thread-Index: AQHWljcLdefWwQHm40iV4jMajb+Ds6mVTz3Q
Date:   Tue, 13 Oct 2020 08:52:01 +0000
Message-ID: <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
In-Reply-To: <20200929080214.23553-1-sherry.sun@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d999a0bb-9119-459c-7e11-08d86f554029
x-ms-traffictypediagnostic: VI1PR04MB5552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB555256E3B0E2BFA3BCF1BE2A92040@VI1PR04MB5552.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l1GmdSpPm396uExZvtr26lIHjkYuxFqx/D6f+qhFRuMNbgDQzPq+ogSwc1qdYW5rTTompnHkhne6uKojpIcYWx6SuYh/ybycuvfuTjMHgHaoYF2KZkVF3qcmZe7uwWZYK9OlPAz8f/TYlZJR24QFCPbZnKOB/cGE/RkoeuWxkXSaAVGca6c1pD8Btkdnh2IRk+YB/Vyf5zQKcqOFZgU5dgsgvZkqGUjhKKNzvKYrHNWWtCKronB5/2707Oo92A58m+RNktr8ple1CxonzdWaS7Jv250IYzBkaEGIhrcbH1abT3gVaotPtn9oz/l0EeKL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(55016002)(5660300002)(66446008)(4326008)(76116006)(66946007)(4743002)(110136005)(66556008)(54906003)(66476007)(64756008)(8676002)(316002)(83380400001)(52536014)(26005)(186003)(44832011)(9686003)(8936002)(33656002)(7696005)(478600001)(86362001)(71200400001)(2906002)(6506007)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ded2PVLqV1zEryvovdnxh3VZTHHmyg68ZryoC2Qh0eLSEFOVePSTwrZrWyCXLGLMkP+QN/+9XXo4WwHDO+ODlIgqqRlKe5dopEZba5MJAzMcMPPS0SLAHTa8o0IQQJdAOiRiQWogmxqUrbMW+iYBGGVTgFFIMzLeQYamuU5O+OseANrsNopJYnhUfqUdo0pN+gtlBnPGyM19Nv5zFVFjDcedDoZs9DH6uETmMQ9KQz4qAjj4TCBe7ycWLqIK/T4h8Wc1l2QM3PamVmWmEubwnuSZB9notB6QvPgh82GxbFKeYoXbNLGVR0D0eVuBOAlVpt9xdK1bRj2zHe24K7RC1X1o5e8ZOZcKCBDMQv9/2++g8zMsSoTodNPcjVkZpb6w2g7+df6rWesG9dJpRn7i4vPCFn/sQ1RpAevHyBKcRGqk3Kt/wR5yP8RKZ2qN29pejQAkBqYQ2Jv1fmnT9lNFCu4iJxatfQka4nxcWOTins/v8kw5/q+pMMPDwVsA2gpeClL2rrL3sJJwDVmU/rNX97Ms4i6ma2CC+JTF1lfKDDG9v8O2L/6cxHcQq+vbE1rzl1Oxjxad5ny65HBys9v+a2vBKC3MlOFPM7V3E+c9XRb+9bhfvoUe7m2E7bYlOnbogj+0bzojg8s39bHKqKmaWA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d999a0bb-9119-459c-7e11-08d86f554029
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 08:52:01.1390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cL0TDZ0/X7V5CXxSQfVHNLDxB2vvn+Rf/wwseqhrb1C7xSL6NM4UYvPuxsQBGiUaGioZLCRnp0gzf+/+x8L4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5552
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Gentle ping....

> Subject: [PATCH V2 0/2] Add module autoloading support for vop and cosm
> driver
>=20
> Changes in V2:
> 1. Combine patch1 and patch2 in V1 together, as patch1 is a part of
> autoloading support for vop driver in patch2.
>=20
> Add module autoloading support for vop and cosm driver, when the
> vop/cosm device appears, the driver will be autoloaded.
>=20
> Sherry Sun (2):
>   mic: vop: module autoprobing support for vop drivers
>   mic: cosm: module autoprobing support for cosm driver
>=20
>  drivers/misc/mic/bus/cosm_bus.c   |  8 ++++++++
>  drivers/misc/mic/bus/vop_bus.h    |  7 +------
>  drivers/misc/mic/cosm/cosm_main.c |  7 +++++++
>  drivers/misc/mic/vop/vop_main.c   |  2 +-
>  include/linux/mod_devicetable.h   | 15 +++++++++++++++
>  scripts/mod/devicetable-offsets.c |  7 +++++++
>  scripts/mod/file2alias.c          | 27 +++++++++++++++++++++++++++
>  7 files changed, 66 insertions(+), 7 deletions(-)
>=20
> --
> 2.17.1

