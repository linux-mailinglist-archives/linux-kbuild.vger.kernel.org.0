Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC8C35D16B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Apr 2021 21:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238090AbhDLTrl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Apr 2021 15:47:41 -0400
Received: from mail-eopbgr140058.outbound.protection.outlook.com ([40.107.14.58]:13521
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237848AbhDLTrl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Apr 2021 15:47:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAYzZkMyS2HF8e6/atbK7h8sUqF8EgbBg8iex1I3fwpa6KfQspgxD3R4rQcl3+PpEKd5p/gmDdsKgQWrSRfAZ1JmXnNAtoQ5QyduvNfdlGDdm0qzpUOrmdMxD537NO3BXpF0SWLLeQGGyDtJJ4Y/ODsZVEcG+P1riqM4gvImalKC3PQTW5nXtRzfnX22CywR3jNylWEUCtwujI3N9C+dKxZGy22IcnN+DLgTa/gt0KOZ27rqiRl63O44ChjLBgCSUhZFnl3m42Sq0c9S8o15sF/soF4Hd5/HevCqT4utVXqLerX0ve3gAqOO2R3HzoJEXidrCU1vPgklxmohYsNe4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHnJCSSSiZiGUAmdrhJ0DExhyZlC4EoTu52YPMAvWk=;
 b=oHKcur1wsvjGDSMu9KbG6AqqV4WPfms6DvnI6U69wq3dLDnA9kouaIok0QulcChEdiVg/R9MJERcVupTGBdmUZBfp7FCPWXetwx1ChtHR8kUMIta9ljW95MuRcbwGsVUxHezl7QWO1OgC9VB42ppevnubyXPZFvBj1Kbz1ENAKjZuNRUwoy8G6mhEL4fdFZNLCQ70lSQtffz9O8e8FAttLTX61W3yBQ0IqU4kizY/vywc+8m0cignXY9xrX6lAw5WVOUkl0064FtPXSVvhHxDu5rkc6viu7hyAOGWKbRGo2ZOceMQ7WQbg5mCFdeGFhv6EyH6uo1hRyRGxvnk2tGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=t2data.com; dmarc=pass action=none header.from=t2data.com;
 dkim=pass header.d=t2data.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=t2datacom.onmicrosoft.com; s=selector1-t2datacom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHnJCSSSiZiGUAmdrhJ0DExhyZlC4EoTu52YPMAvWk=;
 b=N2l+PTOBGBM3tlsCrWb6pAbX2vl3IH7ZfLOKfq/OXuX5ArAlWCE2Kct9xwl9vjzBNPhc5pGsTDzKztO05EQQ2maPJfKhiCzh+HCkQKlHOsjo/RbfOt4oJR0CJO2MYprBVEQRYQvCgJWRHAyp+hsvm1S8tWhPjoQytCu0uInMZwA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=t2data.com;
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com (2603:10a6:3:da::10)
 by HE1PR06MB3930.eurprd06.prod.outlook.com (2603:10a6:7:98::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 19:47:14 +0000
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e]) by HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e%8]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 19:47:02 +0000
Reply-To: christian.melki@t2data.com
To:     linux-kbuild@vger.kernel.org
From:   Christian Melki <christian.melki@t2data.com>
Subject: Configuration annotation.
Message-ID: <841a942a-9611-56b6-8c2a-4a819b2499cb@t2data.com>
Date:   Mon, 12 Apr 2021 21:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [81.234.39.46]
X-ClientProxiedBy: HE1PR0402CA0034.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::23) To HE1PR0602MB2858.eurprd06.prod.outlook.com
 (2603:10a6:3:da::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.7.217] (81.234.39.46) by HE1PR0402CA0034.eurprd04.prod.outlook.com (2603:10a6:7:7c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Mon, 12 Apr 2021 19:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a57f4f16-32a8-4a62-a08f-08d8fdebbe67
X-MS-TrafficTypeDiagnostic: HE1PR06MB3930:
X-Microsoft-Antispam-PRVS: <HE1PR06MB39300BFF63F2EA6E84A12D3DDA709@HE1PR06MB3930.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ThPkaIw9a5twpXRKCYDV53rNBct1eGLao83fuK57EMIBCpkpmo/LC+HpKrMhKHYYy39y4+IWX99qqao77MyXPXbzuKu7o0nxiwzHAJso0njsl0ofvTxSFZxuPHMWd4Z5Mgju06LFmItuntoWMgC+wN5TqWSwPIUWCDGvXxm5RsORq4RqyDujh89w/J1TiHDMZ6QpuBRC37wPvXCemgWc1SJgBgkuEYyycHIZ9eonbecN71IQ9Lc4dpdaxMJS6dzPzCx5TGaq73ZZn1gWnGY+Dr1EU6DNcmFZBF0YAsYIxs8yJHflNkdstRTqdnGjpyZJUMBvuath5ys1LCQboG8c8S4l3DvAmFjOnjZ7H0Vlw+ybbM7Va2zLYE6FUXPLgV/ofIwb8wvVizScND/tnl973y2gBP68VbF4S5xp9ejjvw/vHBUoAsn+uk5pfuNXq8TYTKec+w8mKdC+mbRwa5ItAYt9w0zfLkYlHY+qyoddn2D/448U1lIYrU0v9aqUBPuGMFx4xafTdvjltBC2QL8xLKln6QvghCf2Slml0hfQRt4OSLbUya4IyzXNXi4xz2+h/gypF+qisXgyGbUfXZiyPe8JK6krMG4fZo7EKTj6brn3oWW3XPUKh8HPuGbFNaw5xiD2gN/jex9nrSm67IRU5AuFltEOjDnzJ891QbxSV3NPJrZCXjhLPbect6mPusXNraBS1j6rnWgt1alz1+CLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB2858.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(346002)(366004)(136003)(42606007)(376002)(3480700007)(4744005)(478600001)(956004)(8936002)(16576012)(186003)(7116003)(86362001)(44832011)(6916009)(2616005)(8676002)(26005)(31696002)(38100700002)(52116002)(66476007)(38350700002)(66946007)(36756003)(66556008)(31686004)(6486002)(16526019)(316002)(3450700001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGtGTWR2dzF6M0NXVmxOcHMvWkVydEg0YVo4Znc1NG9TcFd3eEVDN1VuajNI?=
 =?utf-8?B?MG52UjZKWG5VWlhTeEs0a1ZVOXRRaWZKV0JYRkdnSXA1dHBrNCtWYldINlIz?=
 =?utf-8?B?OHc3RkpSM1lsYTArODlub3VVQ01FTHhWSnFyWUZvODBZQlo5a1VyU3laWU5N?=
 =?utf-8?B?VWxLYnhJTlhOci92OEVTQ2pUOHdaYW9WNzg4S1YwaXFoam9FT3E0U2ZIenJ4?=
 =?utf-8?B?L3BDMFpwc2doOWY2WExyb1NpbXc5SFV5SGRQb2paTW55ZWtZSUdRRlVlcHhl?=
 =?utf-8?B?MG1OdktnTFRLQkxaRTRXczlrbVRmTENWWnNOeEVnQnQ3dnpQYW4xS2NWNFR4?=
 =?utf-8?B?QVV5b2tNLzhVTmhVdDBCeXZSSG9ndDZFQXB3a2N2OGtXdytFc1F2UnQxNUFo?=
 =?utf-8?B?SWt4bDRuUDRkN2dPbmFTWW1kUkF2ZEh5dEk3M080aU9BOGRkTjQ1dXJ3ZnlO?=
 =?utf-8?B?RGMrQU5ZajkxcFcwQmxtakhEenRjSlBZbWdra0Y3ZnVBMDRIWk1PU2xRcmlV?=
 =?utf-8?B?RzVIeVNCaFA2Q014UGRPUURBaE5iRTh2V2R0U095aW8xckRKUk4rSUpzWHM5?=
 =?utf-8?B?WjRxc2t2ajFEcDQ2UnRHZHppdlhqNmthNWtieWJhS2pVQ3FVcFBSUzBYVEJ2?=
 =?utf-8?B?d1A1emdoZno3V1BwUk42TGhMZi9wSFFxUkhtNUFSTUgyUWQ1WndROXFWMmpR?=
 =?utf-8?B?UUNQRVZpZ29FT201c2RTQ1pCOERYQjJ1MTM1T0ZGSXFhZm9KTnYya214TmJs?=
 =?utf-8?B?MEdGWkM2TGhyeUl5UnZESG40bDd1STdZbmFKajBZZFpiRTJQbUtpaDFRZTd5?=
 =?utf-8?B?WVowMzNrYVNLZ0RGaXNHcThXaDdEQW02cWtINGFud0tXV2RHUzUxRXRseW5E?=
 =?utf-8?B?blVzeUl6aWQrejFGZHpmcXlzSGFkRWk2dldZUXYxMTdSSnJvSnV1bGZBZ1VG?=
 =?utf-8?B?bVpEb0pBR1Bwd1IzcHNVcm5jaFVCMmkzeUNiNWxPaTBvZjNsYVJKVEZCR1Ji?=
 =?utf-8?B?cHRBU05rc1hGTDZmZXhlbzVpVE5ubHlnYjRvNnJ2dDl4M1BYdUU1eHpCZWRx?=
 =?utf-8?B?QkVRNE52V2cyN3NjODJTNE5tWWpvc01aRzFCTUFkRlVOYVd5WVdDd0wvZDJF?=
 =?utf-8?B?ZDZGY2hzT3lFYTlUK21KUHluQXpDQTU1dUo1Zjd1cnYvZDRucXl0aG5jaGRx?=
 =?utf-8?B?QVBWSm5lS0tOMDRaTGFFbUZ0Vzc3ZFNKUkN4NkVJMGxwcTgwUGtMOXYvbDZY?=
 =?utf-8?B?a3dPSmhpQVVlOVpWMzFaWUpQbHpzc3pqczFoSUZLSktESjB4R3p0aE8xZW9m?=
 =?utf-8?B?WEZMRTMzL0tQSHVtaUd4L3VqaWpiSElNUFJBcFcraHFxWURWcWxaQ3l4RGlU?=
 =?utf-8?B?cm1JclhMTkk4MldGVmhxaXRONzNBdEg0bU5DYVZRaWNQMWdzckFubVp4cTdM?=
 =?utf-8?B?UEtjVmFYOGxNR2NFTnZ0bkRqcmp2Qm5PemRwZms4S3NBMUVkdXB3K1lxeDho?=
 =?utf-8?B?cGtKTXpjek5ybU1iczFNcjhqVlM4R0pBOURTNktoVEhCbDNFK3JUV0V2dk5B?=
 =?utf-8?B?cEROR3ZiZDhvTUhRcjQ4ZmtlVHdGR0tzWk1KT1cvUEt6NEV3VzhoSGNZbjVN?=
 =?utf-8?B?Mnpldks2U2o1R2VYeWNuZTJVQktsVjJWRWVZNjA2K2lEYmNwY1M0b3piMjcw?=
 =?utf-8?B?OWxGbUVoTkd1L210aWcwSDZ2T1dMYnhqTlBSMUF1RHZrdDl2TE9XSklVc0pY?=
 =?utf-8?Q?TcPu+kuFmXrzPMRdDt9I7A6U3cP3RjQYvtk3hYJ?=
X-OriginatorOrg: t2data.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57f4f16-32a8-4a62-a08f-08d8fdebbe67
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB2858.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 19:47:02.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 27928da5-aacd-4ba1-9566-c748a6863e6c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LYEZk3VZh+9/ssrAfMfw/gJF0izx4815xvsPLTLQIZVYqTLryqN8uB28Ev3xDvTA127AmmPKl7Il3z5u5NzbUHhEAqiqSl/R6GizgKqWak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB3930
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While maintaining various projects and kernels, I've often found myself
thinking "Why is this selected / configured?".

Sometimes I'll find information in a disjunct documentation system or in
the head of somebody else. But most of the time that piece of
information is just lost. Configurations get moved from various
repositories, so that type of disconnected information also gets trashed.

So here I am thinking that it would be nice if the configuration
supported some form of simple annotation to variable mechanism. Ie, part
of the actual config (only during read / write) and not just a
whashed-away comment.

I thought I should ask before I go about doing something already fixed
or have other obvious solutions.

Thanks.
