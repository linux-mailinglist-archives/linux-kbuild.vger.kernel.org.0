Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A3A7E39DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Nov 2023 11:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbjKGKeL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 05:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbjKGKd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 05:33:58 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662561BCF;
        Tue,  7 Nov 2023 02:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1699353132; x=1730889132;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2tDT6t8MmJnvDIVN3NVG4fyY4V4XAUVbm2ZeUA7kEN8=;
  b=QKwhNCa7Y2bxXELFtImov6kE3J8A8/bDylKAOvaSELqg5l0bXReSts2v
   5kLiSWIbMDRD+nUwonn7eBCd7OAagaASYuowY5L1ociKKLMPvsBM9gClo
   A3N/iWcae3PqPEkfcsWQfSf1XQrlb0ETqkZgLj8m9k1KhhcdZ9Yv3jonW
   K7v9fBxSgFZq8MGD0LQ/RqmOxgx7l8GAbVK2mEig5HOdLysnPddIM1eg7
   +zpM9c/3Pjd20jQf3ArkWkOhz7IxJ96QDw0v9JidackWlYL9GvcKtMbU6
   NWA0EXlls6Lev5/gec+bT+UmGiLnjLwhL4XICwwQBnxeAkKTXR3MFRmsA
   g==;
X-CSE-ConnectionGUID: GLKxCA7qRD6hgwPrjkpQvQ==
X-CSE-MsgGUID: 4WaHQ3XOTl+kO99WePEYZQ==
X-IronPort-AV: E=Sophos;i="6.03,283,1694707200"; 
   d="scan'208";a="1658985"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
  by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2023 18:32:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ewpTY2rzBN3jZ7gji0AsZvLnsWErv4sQ4kzoNt4D5Nmpge7rR/3eOs6RVcH8bmcz6q4F4cLQS8Bg7XXv7ZYSpkSjwie++Awh0Q3TxqoLPHT9uJueFsESt8fyAD6WYYaqUWOCcy66yf7VTfYweqrLWtfNtAqoIEAB1tRCdd9/+b6b7E+AMyjU/TjW9Q9lxwT+cUf395KsKhWl2/4HB8i+Js13YFYs1N3dHfm4IaWcul+xLA9jLuXymnMCyM0XqunoPMbbAKNBbQA30V+mIi5EbdIFVABnQSIhhJ+Fwi9iu5xFIG9+RQXkowUDMycatukLj2irC4emwlGlVojhgxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tDT6t8MmJnvDIVN3NVG4fyY4V4XAUVbm2ZeUA7kEN8=;
 b=Nf8judB6snrxxrvfmoOJcP230h2JiSTsnWOmyaiyQqd7d6iy0B6GsH+WcPKEsPpS9VDG80lK9dGvWTcrW0MJ8USkc4jmERl3kfCy1cxl9gmn0CkvvNEMMnss5efdf1JtROcS6ixeQAsVEbOSSFO706p7KJMoCdFWJ3fEv03LutXcObkdlKfvS/r2cCSHbvhBDXNNhVezoVFV8lxbzAtpX+YHDmdtdmQSLkAHYkiNW8guLuOPJwlR3nx/Hi6JGMo200vu4KDxAP9jPBAAU6nAQ6KlfkWGCRRif7yi97ZNGzL/cr6wUZiRL11UdOrRMDaf4j3hIGwI3tgRjvwrWDsYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tDT6t8MmJnvDIVN3NVG4fyY4V4XAUVbm2ZeUA7kEN8=;
 b=ZscG8XAvhjCkDp1bNhZ4SY5U3FTjo0nFkdffyhdELct4/sm0gtQhYNv306uQWDRzn4Rlc5z5/y7e9K5zsuOyLz5doLJv+EAQ/JgbmMPaC+5WPbLMBFqzfKv3Ztv5UNbOhMe5xXlw/xwRfYXs9668Dd5gs5mCg7Gc+DAeLnUCHjY=
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by SA0PR04MB7369.namprd04.prod.outlook.com (2603:10b6:806:e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 10:32:09 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::ffca:609a:2e2:8fa0]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::ffca:609a:2e2:8fa0%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 10:32:09 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Damien Le Moal <dlemoal@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 0/4] ata: Drop platform_driver_probe() and convert to
 platform remove callback returning void (part II)
Thread-Topic: [PATCH 0/4] ata: Drop platform_driver_probe() and convert to
 platform remove callback returning void (part II)
Thread-Index: AQHaEWWp7WGshQpZtEaQgitoRdIQ9Q==
Date:   Tue, 7 Nov 2023 10:32:08 +0000
Message-ID: <ZUoSKAWjNhn1kfWS@x1-carbon>
References: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|SA0PR04MB7369:EE_
x-ms-office365-filtering-correlation-id: c6d3d4ce-12d9-4171-1d68-08dbdf7ccbbd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNljRUjsYqhI1bcUmG2CXEJmQvjtfi9H/wweEuiP27u29FrU3rTiczPDnKIY2cpH37bUIofH41NC51Mn7GTKQGcJkJnu6f4o3TCt42SZhzaWVgroeFo+DYYBH41yS9vy3m8+6Wer9fifRsiV7YaCG5C7E9mu9u0Z/xORinNyg6BXi6UP5ll1SSvhxxK3z2kV3yiEv9261WWI1YxvDhEOrCxYeqMKG+hUa4D1O5o4shlXyx5wF8Sp0EgIjOT9a69wgpwFrbB27AnXPUHD3jK+U6rDQbfLufBxbViQY7h8YsfEuP1RGPI3xMUhQdQ7kOMm+JY1FlEVRlrT7V45VDDDcn4yefABKj+f6hDNdipxspO3yv7oQQOoyitoFuiiwA4s3Sg8iXTs//jCLK7Lo6jEQFl/sFHzEZqr4c7ckh8FoxgeCwr9mU8YRZSHKyG9x4IgBKPlI/CThzAe3NCtAIqX4KOiglgaIX9dUrGH/HRz8//+Y9iHmLuf5gNDMqxMtXz3K4DSxFdaUrlY1rsFRorSJZ/eep++TRs4UjxXSJtzhCsIGSVR7YUJhV1ATBMTxCJWvsWuvRJkifi03o9F77MWVnkQO+dRjuzwBjKQfrEUoEe4WLfSWP28YSvJUL2lc4fp3kqaCCklKGzYKY263EnC0rC6g9lAejFkXv+cLfgrRxY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR04MB6272.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(346002)(366004)(136003)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(186009)(1800799009)(38100700002)(2906002)(4326008)(8676002)(8936002)(41300700001)(5660300002)(86362001)(66574015)(82960400001)(122000001)(76116006)(6512007)(9686003)(66899024)(91956017)(316002)(64756008)(6916009)(54906003)(66946007)(66556008)(66476007)(66446008)(6506007)(83380400001)(71200400001)(38070700009)(33716001)(26005)(6486002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eThpNlR0dVhiMHd5bG9SUnhaQlNHL1kwWEZXQkNER3NnRGc5SVczczVhZDc0?=
 =?utf-8?B?TTI0cTRtUWU5SDlscERLVjRMQ29OOWJGaE1SUThDR0grZE5NOWxJZlhEV0VC?=
 =?utf-8?B?QVB6Z2pqS2UxN1hMdlNUYXdNWDFoTVdQa3I3U3h2aVBvRWl6MzBXNEpLOHdM?=
 =?utf-8?B?LzRWSXpvRGZoVGEwQk1BVnZOd1diMXhWOUFBbjFvMzM4OGtMNW9MYXkwYmpX?=
 =?utf-8?B?RlVwTm5UZzJsazRxZXkyRU5RcGtDdkozbTRvL05RbWZJbld6TmFxYlBLL2tN?=
 =?utf-8?B?Q3ZMWVNJSnhnSlRwSzR1SGdrM3hudnVQUHZ3VWlVN1h6UTVqc21pb0MySVBC?=
 =?utf-8?B?Q3RjTy9xU0hMTThjU2VsS1U1NFNlWlJrcU5HdU1oUUsrM2hhbEhneDlqVnZY?=
 =?utf-8?B?VE5JZFM3ajl2UnFjVk43SFhDVHlpbmVLV1ViWGhjd3U0SG92S2RGbzZySVlZ?=
 =?utf-8?B?OFNraTg0clRYc1N6RG1MVXB5U3NaNS9ETTliRUNMaW1YTXU3cXVxNlBPNTFN?=
 =?utf-8?B?Q1RJU1FKYUl5a0xPcUszOEE4ZW84R3hlUXA2cjBTK3ZoTkxlTkw1bzh0dzlF?=
 =?utf-8?B?ZDJGVVBISzhTSUxLbUV6Q3h1ZTNxZzVCdWZ6Snh6dEtkcDZJaVkxNHgyU3dL?=
 =?utf-8?B?Vjh6ZnZBTDVKT3RwSytIanJRaUlaN3QramQwTGdyMW5jbnNIWEViZ0dYaHdw?=
 =?utf-8?B?Q29iT0R6NXRIMUVvcjNQODZPcjlVMHR6czlvY0hNRmtkWkxtV1ZqWlJVQjdu?=
 =?utf-8?B?V3N5ZjdFOFVlWWFTRjZDaHI2YkV1MlNjeXlkcU9DYWpIR0U4anFvSzZNRjJi?=
 =?utf-8?B?Z2NyZ3hKQ01ucXFFclYyRDVTdUhseGM0WlFDVW1od0hvbXo3T01GSXNkcTNn?=
 =?utf-8?B?UG53WUdRdkd0dDRRdmZ4WG1RTCtQWUlBQWE5aHRVWkI1TzIrSzloYjczVGtk?=
 =?utf-8?B?a0NYbFZ6MEFKR1N6Z2FVdEN2aW56RGp1NTl2VFp2Zy9ZdlNZbTZKVWFYSlNx?=
 =?utf-8?B?Tm41NzlOaFVwNktoUHRSeUt3WE1UREZrUXN4ZGVFcERJTkJsTFloN2k0WGdq?=
 =?utf-8?B?dGVGcEE5aTA5OFhOdnFjb01BaWN2SjRqVEorRHB0QjFWeFJRVG9IMmlRV2lu?=
 =?utf-8?B?aW42RlFld25vQUVvelhRcVlOaWlVNE9GMnFjQTFQaUxrVm44YnZtVzhDdVho?=
 =?utf-8?B?WnFKOUVyREZBMHFHS1VUcDAwVHdTc1NXQWJIc3Y5TklMMG9RRWg4V2JIUnVB?=
 =?utf-8?B?S2FpMDBLR1hkcEV5ZktGaFV3VVk4Y2FYbnNsMkU3OTY5ZmF6eE44ejBpdXlw?=
 =?utf-8?B?Nnd2UURRUmg4N0tJZ3UzN1FKQ1d5bXFPS1NwVWUzWndpRk82Z3Y5MFprY2Vq?=
 =?utf-8?B?TXZCcjdWeTM0d01kNHE2QkVpdHRSTkxMRmQxdnhoeEJMSm12ZW9QS3FsSUVP?=
 =?utf-8?B?bGU2clB2NmpZZnBFaW56RGNnQUtkQTE2VWFvVlp3QTRZMEo1cGdkbHZNeVZq?=
 =?utf-8?B?a2RNa01GQzNlUGhINW03akZ4S21Od0IrOHllYkFYUGl0cHhhTTFSMWZFaVlK?=
 =?utf-8?B?bnZVR25qVERlcmpvM3pEOU9ZbE5TdytoQjZBZ0Z1QlZXQmVOeis0RUpEUDJz?=
 =?utf-8?B?Y1p1NWNVc0lXV0F5Mm5HVEFPbzBDT2FHckRlRElYdXJMQ0prd1JIejV2dDMy?=
 =?utf-8?B?dzc2dWtubkRPSHlSdWhGWTBaOWdQYi9QekR3MGkrNUx6cDFubExHOElYTkxU?=
 =?utf-8?B?bHRrQXI0M1NBS2swQUl0OFptZzFMRnNZU1Fta3ZiQXhpY3dNTWJ3OHNURzV2?=
 =?utf-8?B?UkhhQTV0ejNBWUdHeGlJT0U4NVIzT0xZelRjaDNzemZCK1hmdk9Ub2VIUTJQ?=
 =?utf-8?B?RGQ3bFRHUEl6NW1taEZlOEVwUTRSZGt3eXZTK3VJVldpK3l3LzNFd3JCN3lP?=
 =?utf-8?B?eHFqZFphR0xyU05CZDMrNzJCN1ZHV0VSTFB1TDhVTDZ6b2Y3OXIvd1QzSFZi?=
 =?utf-8?B?OGNSSnVvSDFiUlYwNDlxUGVkTnRuSVA1WEYzRERCTHpSdWtobjN2QUlZVXFT?=
 =?utf-8?B?aDd1NzRLVFhGbFdNdjgrWEVGMVM5WjNIWC81UndCeXRPelV0bEg1enpFUEx2?=
 =?utf-8?B?ajdkSERpUkhycndSU25qRjNZaGVsMWRPVmtoUkV1ai9GdG04U0ZVZWF5SGVv?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F6A8BA9FA80BA4696EFFAA87241745E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CBCxK/JepIoF6hpYWCTr7SJIVs9abT9x0g2/uzwghMdz90qdW3mi+/p+AHeYQv06mckmJeLFaRR3VkxabwZ4U+Xmf1e4VNrsBdhwcQTwTrtCY5ul8jyVBEKHxy+InqT6KIOm/+wmM3fGBh/egHOLSqZT0rsiBjCRtarD0og0AoWFss+Hl+IbhtRWUk+mcf6TT0Zle/VbtvfX3g+QTyKIkwRwU2RyWB6uqwL4hOvLyrvmSj0UsuA0YK4yyBrWniuaRceIOS9P0sWkup4qdc8ETdV0WgW9fMt2PecOJ4a6Iw6HqM2hrRZw4kAQOE7VKTuJaYU/L4mFWN+daA78EpyI+Xv0Xucc2OFlyITLDYXO9ywadu0XIpOZ/XUGefBeT8x58se+lvAhgKYfOWm0fSY7E57eIywiHoH9YT/35ThcG+hmOsd+Lxdzo/oPn1Ku2PxRvfSOeZtJQKHjS6gdrtUDre/4oiNV14NiOQ5rVjaJXcyTNrLseZ1cKKkZE4Az93UKK+mKohRiUBKuN4S+CNsbTTG2S8H4vq8Cy41Fmpv27Lla2ZfP0bCP3Q82vBuYqASTE9Fg8H+8ab8fdZoiNRJiiwpF0bPssbvaJhgwjaDrDXCABm0dISEZZJkLxLtIgF45gqmB257UJoG2GZz5wpWdBgEoPzgfpiUUQK+rgISqgk2xrP1hEGu19mFba2i6Xr4nQly6RkkfraA92Dl3zg0ecVSpfBbXRwpnlymRuktABa4YP23CmRoqbr4DkDkX7Fkb4hM7Gp7TzVafsqytWHqpRaA8xISV2+DD/H6STiUJwE4T7vNtfL/ZXSSOPNEn/8lLvO1UXNyaPZgFrOJSCOIT4KjXnvEQeKwrC4vUzb5YoSXemuqstxgU3DH211lkkFn9
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d3d4ce-12d9-4171-1d68-08dbdf7ccbbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 10:32:08.9675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHFHy7GKBhzFV3b1+fqo0+aowh6pWTRTdh03gqDwgPRyS4tI5vRUZcOSyXGaX/kGWEKFKQs0bsVCmUccFQPBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7369
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

T24gU3VuLCBOb3YgMDUsIDIwMjMgYXQgMDQ6MDA6MzVQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgdHlwZXMg
b2YgcGF0Y2hlcyBoZXJlIHRoYXQgd291bGQganVzdGlmeSB0bw0KPiBkaWZmZXJlbnQgc2VyaWVz
LiBCdXQgYXMgdGhlIHBhdGNoZXMgYXJlIG5vdCBpbmRlcGVuZGVudCBJIGNob3NlIHRvIHB1dA0K
PiB0aGVtIGluIGEgc2luZ2xlIHNlcmllcy4NCj4gDQo+IFRoZSBmaXJzdCB0d28gcGF0Y2hlcyBk
cm9wIHVzYWdlIG9mIHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgpLiBUaGlzIGlzIGENCj4gY29uY2Vw
dCB0aGF0IGlzbid0IHNvIHJlbGV2YW50IGFueSBtb3JlIHRvZGF5LiBJIGRpZG4ndCBjaGVjaywg
YnV0IGl0DQo+IHNhdmVzIHR5cGljYWxseSBvbmx5IGEgZmV3IDEwMGsgYW5kIHRoZXJlIGFyZSB0
aG91Z2h0cyB0byBkZXByZWNhdGUgaXQNCj4gdG8gc2ltcGxpZnkgdGhlIGNvcmUuIEdldHRpbmcg
dGhlIHVzYWdlIHJpZ2h0IGlzIG5vdCB0cml2aWFsIHRob3VnaCB0aGUNCj4gZHJpdmVycyBoZXJl
IGdvdCBpdCBuZWFybHkgcmlnaHQuIFRoZSBhbHRlcm5hdGl2ZSB0byB0aGVzZSBwYXRjaGVzIGlz
IHRvDQo+IGFkZCBfX3JlZmRhdGEgdG8gdGhlIGRyaXZlciBzdHJ1Y3QgaWRlYWxseSB3aXRoIGEg
Y29tbWVudCBkZXNjcmliaW5nIHRoZQ0KPiBuZWVkIGxpa2UgaXMgZS5nLiBkb25lIGluIGNvbW1p
dCA1YjQ0YWJiYzM5Y2EgKCJwbGF0Zm9ybS94ODY6IGhwLXdtaTo6DQo+IE1hcmsgZHJpdmVyIHN0
cnVjdCB3aXRoIF9fcmVmZGF0YSB0byBwcmV2ZW50IHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZyIp
Lg0KPiBOb3RlIHRoYXQgdGhlIHdhcm5pbmcgb25seSBoYXBwZW5zIHN0YXJ0aW5nIHdpdGggY29t
bWl0IGYxNzdjZDBjMTVmYw0KPiAoIm1vZHBvc3Q6IERvbid0IGxldCAiZHJpdmVyInMgcmVmZXJl
bmNlIC5leGl0LioiKSB0aGF0IGlzIGV4cGVjdGVkIHRvDQo+IGJlIHBhcnQgb2YgdjYuNy1yYzEu
DQoNCkhlbGxvIFV3ZSwNCg0KQ29uc2lkZXJpbmcgdGhhdCB0aGVzZSBwYXRjaGVzIGFyZSBmb3Ig
ZS5nLiBhbWlnYSwgd2hpY2ggbWlnaHQgbm90IGhhdmUNCnRoYXQgbXVjaCBzcGFyZSBSQU0gdG8g
c3RhcnQgd2l0aCwgcGVyaGFwcyB0aGVzZSAxMDBLIGV4dHJhIHRoYXQgeW91IGdldA0KZnJvbSB1
c2luZyBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkgaXMgYWN0dWFsbHkgc2lnaWZpY2Fu
dCBvbiB0aGVzZQ0KcGxhdGZvcm1zPw0KDQpBbHRob3VnaCB0aGVzZSB0d28gZHJpdmVycyBzZWVt
IHRvIGJlIHRoZSBvbmx5IEFUQSBkcml2ZXJzIGxlZnQgdXNpbmcgdGhpczoNCiQgZ2l0IGdyZXAg
cGxhdGZvcm1fZHJpdmVyX3Byb2JlIGRyaXZlcnMvYXRhIHwgd2MgLWwNCjINCg0KVGh1cywgZm9y
IHRoZSBzZXJpZXM6DQpSZXZpZXdlZC1ieTogTmlrbGFzIENhc3NlbCA8bmlrbGFzLmNhc3NlbEB3
ZGMuY29tPg==
