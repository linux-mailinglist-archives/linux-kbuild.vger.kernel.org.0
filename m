Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385DF437B31
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 18:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbhJVQ6k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 12:58:40 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:55940 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230340AbhJVQ6j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 12:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634921781;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8OTXtf8J/BmIdXSn4kxkRsdagaxpv9KQmTTJuZCmmws=;
        b=V7Z4cTId5xxkH4KtC+n9/wPrh65gVvF/HMkMjZ3kOYRQ+Bwi/qTv8tKKl2KcBL4J4V9pre
        yIGKpTNotLB/5gSRNVBHQ+ssTwttcFi8c8VBJUz9DpNmxdvAVYcXNezISuXpSODTW9AF4R
        u+qPx8Nckp2Ebh0pTPLOWw9xt+ACjEs=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-uWd0lvHpOf-f6YR4jo2MwA-1; Fri, 22 Oct 2021 18:56:20 +0200
X-MC-Unique: uWd0lvHpOf-f6YR4jo2MwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/Z24l+ZWmijaNL75ciibhGCxsthdSaQW/Q2t9i/i/oWIV+gdq0+jz0bYKNyF7CW12zYka9mTneay9Y4rSChZr/2kHZRD1Etx7bs/TlPBfA2jBlj8mqAY60Xhgr9+80QeSEe53iXLN+JIAjrc+N4YFfhGBKcphvbCVhVmpX0iUjhR/taVd0nhp1dKy9QuQ6vsRsl8avqqN4jUBm7rAeqaceXSQ/Nm0Ro/0JYlc2TQ8x2Ou6giodmPSzhEeZlhMFV7EuSNiMYyplkFXPmOZKT4TQdNe9Xyhyb+EwS5cwS307a2vJHIP+v08F6NZHg1iZwZZxOf88u0QhWKz7ZLyUK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OTXtf8J/BmIdXSn4kxkRsdagaxpv9KQmTTJuZCmmws=;
 b=nrjg1lCW1hr+H9eV6qnyzBkYT2p7pkIBZNawAtA0ZxlEhHZ32tSAvAC758KBUPTZ1kgwrsZm0UQaif+ahd5TVLnL/DgrMOwSmH5Qw+lmqLDefZHMPMCDtP2nFM15NWibD4u0pPKeAuCKuO4LTU5d8l17QXyWzMaiKFJig9Jpejq5OWn8KUCChH2H1dnidyf4XiXLkG+0cGQ1P29gFLKhk5KgnnHluje+FmUFRx1Ek72gxhrcMJ9H6z00VE+bY/eNIstko02bQO/Rl/kDsmg9tMqV6L6lNJ19DQOoxlnPCHYh4vS5PlQMbhfJTTjv++Z5B2lIp1JtvVNG3JL9Lj0dmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 22 Oct
 2021 16:56:19 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 16:56:19 +0000
Date:   Fri, 22 Oct 2021 09:56:10 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 05/12] Add definitions
Message-ID: <YXLtKtziFSHravm6@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <0e45e80f-d489-2390-92d7-533396d2ad83@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e45e80f-d489-2390-92d7-533396d2ad83@rub.de>
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by BYAPR07CA0032.namprd07.prod.outlook.com (2603:10b6:a02:bc::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 16:56:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36b5761a-08f4-4f06-866f-08d9957cde11
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS: <VE1PR04MB73601851633CBE2CA8F8DAC6F0809@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zOW1NhKyc5Zub6C1b7i9ZAnhxCTdDbT0niBkJdi+Zz35isBriOJQawLx8xwHh1KFbB1xjdV/LUFLoium+avCwrVL/gfIpZNY3Z8uoAewlzfi/OnjVq8b3vqJPTOXEC3enUzutgNYcQYAN5NbJ+ukPFgmhpDyJOYGT6ayVD9BkHz/XV9sc12E1OvbVqvK1KXHFLuzb2P1ev3a7SLGhonLLseztbkMja94BQNTTGoHDFiFoZXEuIZz5Zcx/a5n+fHAbtQjGgAExtY1wY+H+LFQ8M9+fjrT8zTvvZKogKEzns0D07TvZ055dMaYUXji31gXNPLUXD+M2Pyh4/+v8E/4rx88CpbhHK8+ng99nT7/WCef+JpNZ01x4mwSHK9knQdDnc9PExWy/sE6vlvUci1UqImYVNWzXadLoCXHKC/ue8VoMpB7sAhMBygAL5eUxH+htoqzfni5Pzb024gRdwtby+g5Tlm7D6pWuRQ4gVZH84w+5Uws8VYAY5io30N+ETgXEPv+zy7jtHuPTelmtdXVQn4MzMyuxUCrOGZFi8n3LxT/OEdM+4qJl4U6l3snZzzeQqSyA30IvnmoIAxL2jnpRe43Ki0g25DY7bJ7jYweuo39ExQT4lZnV0izBzLZ/JTj1k7twK2uoEmAfq/2V2t7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6666004)(26005)(38100700002)(316002)(186003)(956004)(8936002)(33716001)(4744005)(8676002)(66946007)(9576002)(66556008)(66476007)(4326008)(6496006)(2906002)(9686003)(6916009)(55016002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?12naJbSPgiIj/ZaY9KdrzemR7NIpV21HbverEMbKLGOfIfIiCg8LiJJFChb1?=
 =?us-ascii?Q?XLjVUHGTkDgEjIyjzK4F7KlfFzFfanggX5m6rRKXeeUkakfIvGhSaXx0kclb?=
 =?us-ascii?Q?pjBbYYLu5S8w6p5y80anfEQ+ZtABewHGA52349HjeCUwkP3h+kapyOkYG1yv?=
 =?us-ascii?Q?KfW4dV59pWlVnSUDpuSPFEDGKKBUNf0u/Qu+Ueaqv9UfhSwRkJEX3+8qeCuu?=
 =?us-ascii?Q?WKBR/lMwgLMXEObP861Oi1v4stq3QvTHRcu+WLC/Xdj4izDKU/hY/CLGMSFA?=
 =?us-ascii?Q?6fUYM5f7vr6BVG52d0I1eKANlMU0POmHI7sNGsa86wSXxUQOjh2Zna+8ewvo?=
 =?us-ascii?Q?gcvKx2wDD8r93TLTJgR8ZVvqgb4I5zwSgmyWN2J7T6vN57ogm5yLk/DoUILQ?=
 =?us-ascii?Q?UUNUyagNI4TCXavbvaL165w4EHJ3rlvIWdT3PLEOyEJoyAyns88eBdV8OKw3?=
 =?us-ascii?Q?ppvM7S5e2IFOnwlDM0fXsmxMetprvjKb3xK+jszC+UKU00v100uOMLAjAg0d?=
 =?us-ascii?Q?QBzlmMRsmbdqtFwtNg0CJl/8CALGHwbf3gp2Xt2zjxKU7Yiyd95ypjYbcXnI?=
 =?us-ascii?Q?9aI0maIn0HEO5hwFKYCWQx/EdKecTMs2TfXpKA87uYFMPSz5aUDKIGCMltzR?=
 =?us-ascii?Q?FsVqEdNd4JfvSW1wYb3Cy4km10DzwlCDz8xMzdH5vYYfbAERwHzkZoI4DVG2?=
 =?us-ascii?Q?2RW1uOrAB3lGYCDMk8oBPcn9zvIpIOZ+PbbVyOFGjMr0ya7f73B9FkoQY5G+?=
 =?us-ascii?Q?+5kvOx5Nq/XND1r0NyCQzjs9aI4l8+z4O8fI97EpMhbcMxjr5O1H+kL7o2A3?=
 =?us-ascii?Q?KRYdhW91x30/9jOf8QRfUzr+GWgrwwdQ8Mxcdt6qkmy9tVa5nbKcnnxgEOwr?=
 =?us-ascii?Q?8Pa2VtzmmztQY7o0WybMWHZQ20vG+FEcbWMmQH6sXAqxBSfL+hXEnneh+yIJ?=
 =?us-ascii?Q?DgHpB8zDcEN8+p/hzGTmd5XoXndFnHrFDK8G1/Tm4vyDTQwyVzOXRiBzIZmY?=
 =?us-ascii?Q?vEPEh9WfEUFSFHlLckHolGxleyP3kwsMB36gP8ZCRAN6DFgqmJ2y/6N8XG4h?=
 =?us-ascii?Q?8dBOqV4ppYzkkN8wWrCtLrFfoZgkcCcSqPuxXsplsNt3M0/0A/2KvOVMcPSv?=
 =?us-ascii?Q?yhftAaeKWjz1au4HktPabmSzQViQuV1t2Pg8SVqA6bSoEbzt/oLLDsryiV1B?=
 =?us-ascii?Q?gmigTioRLJlekhdwuTBUuS1SPRPTk5G7ltvLd8sETGaSDrM5o14ZE5KeaOaJ?=
 =?us-ascii?Q?hCyF+VKarOkPiTKQQ7hM/Cm9NGQVqySXsQBzHhSIIKaVbxQAN3AdLDHCyUUq?=
 =?us-ascii?Q?WtP8lKZTYEcTIRvJCjP1euuh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b5761a-08f4-4f06-866f-08d9957cde11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 16:56:18.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:40:45PM +0200, Thorsten Berger wrote:
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>

The description goes before the SOB (Signed-off-By) tags.

So move all the below

-----
> We need to be able to store constraints for each symbol.
> We therefore add several expresssions for each such struct which we define
> in a header-file.
> Finally, we prepare the Makefile.
-----

Before the above tags.

  Luis

