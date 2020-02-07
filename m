Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E411553CA
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 09:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgBGIkN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 03:40:13 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com ([40.107.7.122]:38790
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgBGIkM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 03:40:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQKU+YKPqWiq6YhZLO0PsDrPwRx7+8Gje30d/7uWQLJe6/6T+HZoShThu9GCIujO+Y+38CJgcT00Ssvwhnfdm1uBleyenEkdYPlcxI/dJMU5Tx4OJFiwUE9hzXqa5s37felOeh9kkrBsCwFIxDGKAUzFNGwhxEiti8yB3GcZ45NKVayzAtUmsBmBXPf1P+SI15CUKoGO2H5l1lMqryRAfj0qmF4Xg4k9lAIN6LIixHfa4M+c4o9II7iUXxIT38C4uAyAeAsxawCMLZ6c9kSKsNMRmtHCOJIpmUdvUENYKPGiOMcVx6pCGU+qkrdN7PvcDc8ScJ4U7XKFCYntjsrqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w42/F0t6H6xFtD83rrL637/dieotwLR9pDUplRs8cBs=;
 b=AkEIZLkBE2i9X6z6pIl2Qd9zSLFvJWb5pPzDdy2iv+3YXJcofovdaIKUk/qPuqBC7WvU7nhzAf7P6lmPTv1Kyc8vU/AZ4OpSQIT6sYvB7m0dERrMN9eAKhwekQTfE98iCnTBFASdhBlPIdj4QBSXDlh4vuw1Iy31Nt2644X7gGrujcmUn3enrDA4hIreJOPEp70hGsIP6ZHJTZRHflg2nDsodvxY7vVjGVkrlW/3vcNV5zItiZu7BIDnU+P/gwONbDuhiXpj5pxwvO5y5Z3xoqxBqrw0Xv5RSY1oPSf8pxvSirkughbmrRQNW9u8BM3ir1w2rN2/aBsYdmAZM93RWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criteo.com; dmarc=pass action=none header.from=criteo.com;
 dkim=pass header.d=criteo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criteo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w42/F0t6H6xFtD83rrL637/dieotwLR9pDUplRs8cBs=;
 b=pKTS5mp+5ey90lY4VOuX9C7P1xlWlvr6iq0hazFkLocSrJ8WakNMHJfjbvfgaOf587cTCteUwVhpi3kprLqR7pUOzK6HwxT6UroPjLm6HbASZl6KI+VsQk5UmcfPk/6PxPiaSD1hG+VgzE4uXkKepYbRguUVGJoC1HpxKx+mQo0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=e.velu@criteo.com; 
Received: from DB7PR04MB4924.eurprd04.prod.outlook.com (20.176.233.33) by
 DB7PR04MB4346.eurprd04.prod.outlook.com (52.135.131.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 08:40:09 +0000
Received: from DB7PR04MB4924.eurprd04.prod.outlook.com
 ([fe80::1454:75fa:4f70:4a3d]) by DB7PR04MB4924.eurprd04.prod.outlook.com
 ([fe80::1454:75fa:4f70:4a3d%6]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 08:40:08 +0000
Subject: Re: [PATCH 2/2] firmware/dmi: Report DMI Embedded Firmware release
To:     Jean Delvare <jdelvare@suse.de>,
        Erwan Velu <erwanaliasr1@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20190918094323.17515-1-e.velu@criteo.com>
 <20191127150729.860625-1-e.velu@criteo.com>
 <20191127150729.860625-2-e.velu@criteo.com>
 <20200206132430.6082fa87@endymion>
From:   Erwan Velu <e.velu@criteo.com>
Message-ID: <f98afb1d-f637-689e-5dec-3feb74970d1a@criteo.com>
Date:   Fri, 7 Feb 2020 09:38:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <20200206132430.6082fa87@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: LO2P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::35) To DB7PR04MB4924.eurprd04.prod.outlook.com
 (2603:10a6:10:14::33)
MIME-Version: 1.0
Received: from [192.168.4.193] (91.199.242.236) by LO2P265CA0023.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Fri, 7 Feb 2020 08:40:08 +0000
X-Originating-IP: [91.199.242.236]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb6da4ad-5b27-4bc3-6584-08d7aba95669
X-MS-TrafficTypeDiagnostic: DB7PR04MB4346:
X-Microsoft-Antispam-PRVS: <DB7PR04MB4346B27B3D70D0265E19E4DCF21C0@DB7PR04MB4346.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(316002)(66556008)(66476007)(478600001)(66946007)(5660300002)(31686004)(2616005)(956004)(4744005)(4326008)(52116002)(186003)(16576012)(26005)(53546011)(54906003)(110136005)(16526019)(36756003)(8676002)(31696002)(6666004)(81166006)(81156014)(6486002)(2906002)(86362001)(8936002)(7416002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR04MB4346;H:DB7PR04MB4924.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: criteo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ob4bRGgKPj+6fwqNy769KbmH0fPrH7+jI3ZnVs5I1/9QejwrtxY7u2DnbDjMHc2keuwKAAfVSQTpDbmH7LA4cml21J/edtD0sA/NnQyttCNAptKbTt+Oc9d9C8Nved5m7ZhwJE+ODyefOl2XBDZ2yukyTx7PbIl8IfFo1oZc1MoTUTVx5XHFCJ5267WLU4ad9kpzaqAWvhHgZIZf4uDSuNm4xp1ir0y31BvMbNxOeFdshRh6h+9Go1aogvRR7SHggDFdOtJdcheaguMaXhq3LKNHHlKiww6VXtM+b7QHF5YbGxlv/mpXjrv+DtgFebBWl26QiwmQKerTey8DtnLf4hwrBUr8iwQL4EB3L0aAbtT7Py5m/WiRdbNQgHPoKOdCyZzRUhF6kQ4FCDOG6x20b2hyEP6Ve9PAb8CiJUJiP+qSEeJhLJxI2W0zyf9vg/R
X-MS-Exchange-AntiSpam-MessageData: RAKeJYCWaE4miW+vz+STImlvvYH1a5SoTilKuTAtzn440p1z4XNCH/7go/nZWYuLm6pr7gQKq5BrdDRLkVHM/U9JPyEE4buSDIuxlHzTsC8y4K56dNVFMCO+kbkWJKbzQOJRxsEwk5odIx/DP4+uYQ==
X-OriginatorOrg: criteo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6da4ad-5b27-4bc3-6584-08d7aba95669
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 08:40:08.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a35d8fd-574d-48e3-927c-8c398e225a01
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlMb9IqxuW+LirSWvDK2gjtFUWLH4XvfNzLT/d+hwzhgpiH1H+TQlYXkSOO2+DzOcK/4h5bjaY6SFgfur5NrdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4346
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 06/02/2020 13:24, Jean Delvare wrote:
[...]
> Also, as already mentioned during my first review, please merge both
> patches together. They touch exactly the same areas, they are doing
> basically the same thing, and will never be backported individually, so
> splitting them creates more paperwork with no benefit.

Jean,

I applied all your recommendations and submitted a new version of the patch.

Hope you'll like it this way.

Erwan,

