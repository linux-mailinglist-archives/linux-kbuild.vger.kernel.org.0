Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7D1437B3B
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 18:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbhJVRB4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 13:01:56 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:41962 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232149AbhJVRBx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 13:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634921974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0MVTJA5G/qsje3dvPyY+4/DFcgy6T1/ywl3CkgeWiFo=;
        b=dlBAUYh/eT26jNe1IM9VqIeMLpa63KJbrjRBIYUxEN66lGVAeON5HNplfd+Xwc2FWF/1zE
        zuPiuPQjtzEh3PCUl6mUtLo54Oe6z5r76DgBscgJuLi+SCG9f7SsenZSTyUQN5ihHXmANz
        MCG13vFGgANtyASvGiK3fl49EDcfup4=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-UFieX4i8MJKuW_KBofc4zw-1; Fri, 22 Oct 2021 18:59:33 +0200
X-MC-Unique: UFieX4i8MJKuW_KBofc4zw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6nTLCqqSlau0faITyCVEzAkqFm2LotPUZ3lUJeLRDJ110WiGU0MtOIVnN+E2mTka1FYmJ1EA3IuSD/Dj//AkarlDQMC8H6FM7CEztvCEFF/K1NQwu1w12R8bCDeFRCBBswgko2EkbwAvOMzhWugUu+nrUqoQiMj/cuBFbktgw4W7GwiN2wRyL6KCSPFLezSFwn9EW0GQHMd59PRKnfoDjqPjxH5XhVzDAvnDWx8ADMY3+og/DUl3c+Oc61QcweG660urYou0bRoraaP5pfZXBpGylOqzOynVBNY89Mv16dxM5KK4bGsNYufUJA5f3f3QrfAltFO97Cifrg7JQNtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MVTJA5G/qsje3dvPyY+4/DFcgy6T1/ywl3CkgeWiFo=;
 b=Gk7cOQgihKmRD1c1zk3o+iCCQvfRpwtt2RBqWGanNHEFayfz/C9xlG5hyE/K/fxL+y18eP9ijQS1CMTLFKEHCW2r377w7xPCmaGmQxlhQ6Duf+Mxuyzj/nQ4FYJxinyFEXXVPuVVGtBOgAXChnAfEHd4AlCi4qglpGXVDdnnB9sdsyPAljTCdwm5bFD6CgDLbDeJlz92MFeOuPuTdzdX1gWClSj+AMK1D2T3I5SxB8f+yvyztVx1g3VaNcYblxqdW+s7yyjy2r98dGtadUzklQIdASk71Hji11Mvr5tWE+bTIu33ADG2SbNdfHE/jnPkG8dN/y/oFsRs87gxt05YGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 22 Oct
 2021 16:59:32 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 16:59:32 +0000
Date:   Fri, 22 Oct 2021 09:59:24 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 03/12] Add picosat.c (2/3)
Message-ID: <YXLt7AQUUwmK3exq@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <61051172-6078-4920-a335-3ad1c8ab0d1c@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61051172-6078-4920-a335-3ad1c8ab0d1c@rub.de>
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by BYAPR08CA0030.namprd08.prod.outlook.com (2603:10b6:a03:100::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend Transport; Fri, 22 Oct 2021 16:59:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01f82ed5-c9dd-4561-1def-08d9957d517f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS: <VI1PR04MB32930786837E8DBCA372331EF0809@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vf8/294ke89QvM8g1Ds69w+J0ZWBy49Juw8AyENtcKYFvEgDUHgtYFNDvu049hklboeFWRoXg1SBc/56NyvQQoIvDFUx9ykiqsGxXYszO5oWSqtX5xB9R0qpk481dQL5GL4LPKkSNURCsdtLh6aZ63jCBruY03zttFt4XA22jRbPBuAwKdWkzqTx4zYuE4eLoTC4Qwz1/7FKTQ7hXtbhm0i13Np9W+h8pxmd1SbdOxuPA30qvn+t/WW1lopIvLgqt01CVk1M6Wt6pzWCqPcYyRttz5emvWfdKHTSKYMVRC1dQB1e0wg6Y7A5Iee+JS2Tr+pHN2+Yo87z6WvrqLMEv45fJ2bNeYRzu9WKAIeMouBiSHZKH5wpXaSW6JyPydwbKo7uReQGFSt6QTFUQaHvRE5yoYSj883mZ4Y9YVNi2g8X8O9zzxIFeBCrN9yYJT6KH7kG1Fj/8GIi/yqpbUmxrHACrGVMOAzu0ky8HbOuLlFP6NLsWJ58EAjXZMTKRugKzlAEQ5j7eeN2O6Z7WMbOUpo/7IU7tKGmhUvWTASw02gy0PVW04IYkMXGCXEX/bPC6eoDYkdGXmxuLuHDA18/MEcjr7SO0hWTTk3D1OdlE1KjyjkI4SWfFiuemdpuooqrZfZfMcTlLKjJy0GjNkYjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(9576002)(9686003)(54906003)(4326008)(186003)(2906002)(558084003)(508600001)(8936002)(316002)(6496006)(6916009)(66476007)(6666004)(55016002)(8676002)(66556008)(33716001)(38100700002)(66946007)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mt/5DEsStmJKblXnEqa86TDNfIB6JlUt7OfPObMP1lKpcpgGUWuIiu3c1Jiy?=
 =?us-ascii?Q?impklBvx61U9d6iTHAmORQQaAbYf2q709bjlzIhibHGkzYJBoIJ9BneXwyxN?=
 =?us-ascii?Q?nQPQxnJPmLUZ6DPuB59Rx/Md/g4rsSwzTnToz9yYqiXCGMSTwsOfr0tYRwv9?=
 =?us-ascii?Q?O1cyoEqbrcYwqtp1K6kzluDf8Wn7YHuf9Ruzc5rwcrgBBdwM6Q1tpE+wR1hY?=
 =?us-ascii?Q?8CJO/OgA0a8cZ7DNTO5UpYPWN9lEcJo/7DuAiAoQU2tGdCypsVH5CmXesK10?=
 =?us-ascii?Q?ZXPka4rgIVcBwY3nc42Jlms/jD//CV1eTgcLOM23UK/2pPCBKSCPM30ivDHx?=
 =?us-ascii?Q?7GiA2YkUT6Y0L+jMsrNnfkjqlQPCuNwL1V20CbU9XX6MchRIgWqVJQJj75aF?=
 =?us-ascii?Q?GtEqc3Kiw/5891Qd82cGgX/CG8sfqbN46m6+gUj7lKRfEwDsolCTKR1Ab0sJ?=
 =?us-ascii?Q?zStkFM5jGF8MJXTOcSLKNWSUdtxyRmEKaf5E1j6gjKNbKwtW5IEACDGqFqE2?=
 =?us-ascii?Q?Xfb8dipGuZIcczlRNk4GhJrssudJT5V6KRUkT19TbDGxZz0DI4mjenD2xxO9?=
 =?us-ascii?Q?glthp7RBRSt0jPO0nVi4G+G2oAgcd8y3a/kkdZLQ37/JGeXPAdN+2U9GK0OK?=
 =?us-ascii?Q?lhi3k5pQPRUtcph3/MFIYdP5g/4eCw0Q/j79lJDZcZzf6CIUw66AZ+W3iPir?=
 =?us-ascii?Q?y9LIYkruSl1clB+DQJrEhoNxUEJoZCsk6IHpEo6jzUU2dRFAZ3f2nwixdLAe?=
 =?us-ascii?Q?qgUKAxDcdxtw2dqZn+KTlGvr9ROHLI4kdg/6O2myUWOScZeA4lbQ7XZ7WOF5?=
 =?us-ascii?Q?chvWdEUls2wD7GnsdUlt19WgD4IaVmHZJGan+gvWbEOfSQm03BFhfMz/EIQc?=
 =?us-ascii?Q?dTQOA5wJglEAWx15fQX17GsyrzRGi9+YanpGvvTdnGY9X1SMZf5dHTy8JeRw?=
 =?us-ascii?Q?8M3SsvqloxWxbaV7Hg6xlFAOPehFmeD2xA3M06sd/r5eS9CAkCOO/p3cj7Lu?=
 =?us-ascii?Q?L6wt4u8/jqW+zwH6S+PBaBzUWRh5n+JkskI1e4lS59Gb1vI2QAo6RDdox/IU?=
 =?us-ascii?Q?Ovw8XhChQaU6Jt0kfFh0y7Xq1zFk4SbP4IU9yunpSrdxQ79ocCi08hh7KXsF?=
 =?us-ascii?Q?6b8w1ecrMBrdy2CsddoRR+LIgdKgaJNpoIiwKe5qh1CBmTuc223ajdkUeDz0?=
 =?us-ascii?Q?y1pmH83fJ0o4nN3+UCQdXa/El7uNWSv8HG9LOrOfSa6/EpU4DWpmLF8etemF?=
 =?us-ascii?Q?6FOnY+oZ0/gUTbMG9bDcTstQQSSYd+sPUpepotvoxhEJw/c9iHC/vZtIiEOe?=
 =?us-ascii?Q?ql3MjatWaeCPgSs+BxlozhqI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f82ed5-c9dd-4561-1def-08d9957d517f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 16:59:32.1471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:38:07PM +0200, Thorsten Berger wrote:
> The second part of picosat.c

No SOB tag here, please add a SOB tag to each and every patch you
submit.

  Luis

