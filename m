Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7DA28CAE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 11:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390739AbgJMJUW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 05:20:22 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:51072
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389649AbgJMJUW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 05:20:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnJOcVRrqoXxXaVTitMuw+FbZN0YgB8SZLyzTWDvUtUjeTjnxL48pIeucLtFRbn6AnVvC9apUYKo0UkvxTtmhMPNxSDUnNKWT3OiSLkqsqSA+Vowtkx4p5j0njb4je+we6s5Ifk8Y8mc1e1MJcBfAQJ4IX2siIPdg2yygnowSgK6H6I/lc6VdR9GGzvqxuT5TriC49YyU5Hvt2CH0zGY5HxmFcOk5K7Gx/eZ06Qnk0P0zqk60VGG3WJj7VqnKMg73rnpmV9wWixY0ZXyIFoaTTIhnaa/MoGHqAKDvkVhrHJ+hw2K1D5MxEgs+x6ExRzmm0lDz9tTbxaVOovjBWGRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJyNSobTmbujRcapPeHeGOwrs7zOPRdE6HeilfKXFAM=;
 b=iQ7+oFFwvPjg+4TdhmlQ+AZz7RyCFvdfn1xPGcDZRdWIfn1m4+AQUScbyNY0gI3zyQlTceg69JobykZwEyRSBvvl/OWflc1wap5JY/WGATVZdkB0ti3DSNnMPkOxKcNE2Tj+osvm8YA2DBazFwu4lWVow/ewPEF4xl3kJNehI6m6QI1QJ6oYIwuvH088KEuX1EajF0vuvfOt7ebuGnc32/uw8A3bZBcSPSNvdPqPTLT6tV9hmPo0wxbC4ewgfNnrRl9pSO9DbW2/+N69JSxEE+JZfHxRaR3xVVq3geXbmE0qzsA7Tlf3gv/xSDD6DrorJyk6KepJkvSuxtdFxqxUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJyNSobTmbujRcapPeHeGOwrs7zOPRdE6HeilfKXFAM=;
 b=KEMdH9XcLYXhfuWXN8Btv6aziCO/HbOc7hUZ5IaUUZvotAg0hZ4rgFq1LmuYGgNBlTsG5+SF5BH6qTCnagHUdOEmysfOI9oVndVKVC6H1np6iG7i6TejiD0jHcxsySMxbKbFY12r2emZHs/NSgJoeTQm7ySPWXWlOfkQ/qdfHW4=
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 09:20:17 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:20:17 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver
Thread-Topic: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver
Thread-Index: AQHWljcLdefWwQHm40iV4jMajb+Ds6mVTz3QgAAFQgCAAAJgUA==
Date:   Tue, 13 Oct 2020 09:20:17 +0000
Message-ID: <VI1PR04MB49609D11121E8656B31A30D192040@VI1PR04MB4960.eurprd04.prod.outlook.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
 <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
 <20201013090850.GA1922404@kroah.com>
In-Reply-To: <20201013090850.GA1922404@kroah.com>
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
x-ms-office365-filtering-correlation-id: 5992ec57-06f2-46ba-a34c-08d86f59333f
x-ms-traffictypediagnostic: VI1PR04MB6927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB692717120B47CA718D63129492040@VI1PR04MB6927.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qYTWxKJw6mayadDot7qY0TYLQne1NP1sd7mPKklhsrL2jZwZMBVQFK6hmlE1ub4wcURUm0L/qsBpyG3wTymXDDQD7e+J5fP/wGjzEUCkboukZPmh6JWMNGr8TYGxA52o5nsu4S68YZNa9t3zB2QpbwS+WG28gcCpu4GTfQYOMzguQueAAbTrBTJT6TuAy0xLkRYoehzRpHZzwutKi9VEs2jaFEUWPInX8NIQj20XOPVyMzgluYN4gl60mf6qcj1W3WDUtZ6JocviCpiStBi1PkD2NNSA2HhsJVYdbw6Po2foJhxMvQuVz9odWqHYbwtYLn4nQgFncJZfHIfYwIvGJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(9686003)(4326008)(66946007)(76116006)(7696005)(6916009)(33656002)(66556008)(4744005)(64756008)(86362001)(52536014)(44832011)(66446008)(66476007)(55016002)(5660300002)(26005)(71200400001)(2906002)(186003)(478600001)(8936002)(8676002)(316002)(6506007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LbFd7DKwleZ3qN0nRsxFiMdFE9XUYvRejoT03LWDBxU2VOm6rI17u/cMW10kmWbrtU20PkxDbyOI3x7U73CYg3yykoKnvIks0hgEtCa7qnzsUO3MRbBMJ1q0NJg5ghJ4tAQoOghZmhVFEKAmscH8LUlFyoj3cle0ME0v6+2r7DWoD33ta/P/PQ7GWC+wfH90eSyMGS7SD3Dr61aPzy/J+fNQeDiNbzQMYrqxYr5Gt2uQwxvfBRH+9zeXA/+h0DTqE4w8cXS1ohUnHBPLAl+uQqRlak/9x8wkmZcPu5HeBJnnHyK/FY/fvXUkT7ksvezw7W5UARFjJP9JN5BjiC5s2Fkjn23yvHsrC+hNX/c2o9XLNHlFzTzEg070FcUa0Ewt4y/aORo9vc3reH/Wmxpo64yCrk4KxyfPwaHWFbJF0KXU6CqBuDw0W2DxHI1WaI6Ll6+r0FOwN7bDO9bY3tQCISy0hFApjBIijDVwd2gLzh8n08hhnvxGzaaBvbUN10MbS23dkxJoDZP7IYAvkc7KWhwMQJoHCeM52mpJAaN0j96kg3h/Tm5cl6kppL+/0lwntrtV5zfZRsbn3CA7bZTYlB0Nw4ObdlVNZVrs8/e3FpLnoCfIPO4WDtc7tMkzKsNx7uxUpNefXnYbSesOR+rIvA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5992ec57-06f2-46ba-a34c-08d86f59333f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 09:20:17.4356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFIPI9Uqiyyk0Kd8OJJPBRK8lq9xGNfrX9oYccrJjh7mZCMfD0n8p3cercRhP9riy2iQ99IQBIRgcHqlH9Tqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Greg,

> Subject: Re: [PATCH V2 0/2] Add module autoloading support for vop and
> cosm driver
>=20
> On Tue, Oct 13, 2020 at 08:52:01AM +0000, Sherry Sun wrote:
> > Gentle ping....
>=20
> It's the merge window, sorry, this fell through the cracks before that
> happened.
>=20
> Please resubmit once 5.10-rc1 comes out.

Thanks for the information, will resubmit the patches after 5.10-rc1.

Best regards
Sherry

>=20
> thanks,
>=20
> greg k-h
