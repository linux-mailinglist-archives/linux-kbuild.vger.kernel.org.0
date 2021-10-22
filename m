Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C21A437B3A
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 18:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbhJVRBN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 13:01:13 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36739 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232149AbhJVRBN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 13:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634921934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=N8Jv1W81iINkOzFonbc0aiKpNMzURheDNHvN8Uy01Bo=;
        b=GGh0o1L9UeejZ3AJtppyQEWZ8mpYbKdME67vaFR+tAntKnLUsQFgo1YYDqbFcTR2WPtwbz
        DxaaPqTVvePH4SkDcTNCxTgSZuXkSVWjpF5aL5MTCAWzxRQcsN2ZmSPqbYcJ8e19guAKfD
        fX+oDdZqLELhKXkNO7RDYgm+2DQKOR4=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-MQxbg_ANP0-_k9Kzh3EQZA-2; Fri, 22 Oct 2021 18:58:53 +0200
X-MC-Unique: MQxbg_ANP0-_k9Kzh3EQZA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu9lf5TcGQNCXnse6/7MfkU1kJDkBGDsqJlELa5NWtTWHCHEGWx0dKeOIyF/E39dbvQT4Yh7kjJLvMLkC9xQmIB3Y9IsOKVu1qDaC9xHtumIXxEevzT89gf5gkaa9Qve3aB40KOETQRDmc/ViIKPJxLV0pglDd0CvOTPkQBBzBEYcGaI+KvoCHTi6RB4lntGgZ6BNuNLXB1e96IsoucROjVKDsP7NTxHGVNtG6M2De2Z4b54A6sFCrw5Qn7Mr5Jh3uRWsrETcAD83eGHR95KmvDIChd1CrMkefRcBDBwN0H/Bt8j9nyRweqygO8T1vFogyrKtd7L4b689p9ZIhOWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8Jv1W81iINkOzFonbc0aiKpNMzURheDNHvN8Uy01Bo=;
 b=QsJbdTaHy0n7N49EfpH7YAQdtDfytzFS2I0bqjj2HkdajFWOZjO0yoxMWNLxBDVp/BfjgyyDMF+2fvBUjtYFM+ZQnG2sd2UJWQNK2i+4npouQ0HwcCBwW0DevszYyW+7YVCd2gn2yO4VlDZhw3RcmWXLnvUq1+uUhu7Dnu+qStSRyUQ28E8pSCywZZ3ZIssFdA7PecH3L1DW89/rf2YS28iXeJg2nGX/XYj79jS3IGDULK+OKfalI0e4P3ziM3ukC/1FmelL29aMe0j+s7sWP/zCX4hYEoVDIo0/qCdKNwLZZ9W0Z70eT8+zZZ2eB7ID4nLBpgB5WmAu6Ztj0STdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 22 Oct
 2021 16:58:52 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 16:58:52 +0000
Date:   Fri, 22 Oct 2021 09:58:43 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 02/12] Add picosat.c (1/3)
Message-ID: <YXLtww9JjCD64R26@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <bfd8f79f-62dd-3899-621a-dfe17af70cc0@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfd8f79f-62dd-3899-621a-dfe17af70cc0@rub.de>
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by SJ0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:a03:333::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 16:58:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f564f01e-ed67-4a5d-a569-08d9957d398f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3293CF6249DF3C473602E4CFF0809@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eh2tLAZvcDiOgJPzOzB5OiQLc5ZqGcweaNW0DyHSWT8zIHHySjyX3qlJwPLdFk9/rll1GnvQ5fb5v45Dhyq8b+BNOIG3T/HN1r1xBOgFYgTIizjFL+V1HFjykqTRxZ3p1u7GZFu2XGWnQIEa3jmhq1m/htH8EngEY+UK6RO5cFKcaEvEKRbzmvPMWLLUMm4VpsLPUhVyS7Y0xaKdgHI2uPvBaTNucrZcSgp/mSDZV1J98zw7RmQnyLrjR76BiOBc0jykE1XufUNZVHMIe6SwbX0lTCy3OM5gDuoRJrS2tmgkGITDPdE99sqpu85JfiCuZRAv1JP9SarTAO33chIhjXF9MM3oGH24/jlUPQsgQZyzbOJf+RvbgTceUMwrkp6vob6wqpSUY5eLoiP9fMqjgRiLRSdsRs7Q7G18O4Snh/YyDjuDLg2bsrIHF6+0sxJxEY/adipAAS+IzfAQxh+22BWAuTyZd9K9E6ZsNhNFg4wkGfHoAYL2u1JQQC228+hPojyNkDEMOboIMczL3uQLDDbW/q1ePgEXHmWPD6C4jU7+gNU/tZzHgz9qgEKAwHgP6c+4LUggOJyAocaygx5fZZaW8AO6QY0Vi+KBNKwV5YVAQjsNSic9+2cjLMEQZ+9OPm0w4ViduZ/rB+6j7Kg70g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(9576002)(9686003)(54906003)(4326008)(186003)(2906002)(508600001)(8936002)(316002)(6496006)(6916009)(66476007)(6666004)(55016002)(8676002)(66556008)(33716001)(38100700002)(66946007)(4744005)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WV65Hzih2Q50jE24rO8a6Bm8PyuLM+Go6jQD+X/ooD8heu6OUs1LBU1M7rel?=
 =?us-ascii?Q?hcC1FFOMaITFxxCzHLKZCL4OM0GVwwh8+NEdAhka5y62tTTbmAyrKRmG9j8z?=
 =?us-ascii?Q?0wkH599vTlw44LURSasF0x8VFjntg4LqXfDWAH3MjykbdHx4xBjiQNn6qVra?=
 =?us-ascii?Q?fvQlmDzmfgoUY7uydGypR2XtkBnONwIm/QltNe7Ip1ihiH2mu/Ap1lGZ7CE8?=
 =?us-ascii?Q?IRLtoy8wf31Ep8zJlQCBinl8L3xdltziXLJZtgJw80QNnY5nPZ/MltjdYgH5?=
 =?us-ascii?Q?0YUmfJNBnXetUQqyDinvceiZuZK52ALrg+QS1qi9z5jXq590rOBaOwltWqoy?=
 =?us-ascii?Q?4xf1HusI3FJuDh7Pw7yxZQULsV2LgT9njjZb67KIHT/9dskcVgTesiRuuR5H?=
 =?us-ascii?Q?vSSvV9sPU/712LeogteDIaPkultRJNrjMIXDghrboCicg1dbRFRP384Qn9yc?=
 =?us-ascii?Q?oGxft+IP/+cF8TpyGHg5jJcn2q2Up+1UR3M+1sFV73OrK2QaOPHuVUlaUJLo?=
 =?us-ascii?Q?yIGYAQq7bYAh4EZcytu5VeStcWToUvliydOEvwxx6/KV6n0Gmsj1Ab+JnG1p?=
 =?us-ascii?Q?Dpt8MwPO77pWcZOmwQPEsVuKCTierSkf/ybr0IDh0VJFqiQmb46MVNEExQ0j?=
 =?us-ascii?Q?N718Ci4BvbJZAwjQ/NmaWG1MutyxnpwqZazVNg6zjrEmzancLjgG00K6n1DU?=
 =?us-ascii?Q?HpCt0axIwIj7v+fd8FIfSNy0F9Qa4FNUuWh8D/7VBbGVLZ+ekPf4qUc0UOR6?=
 =?us-ascii?Q?joz1GnDwcLey188abJeIZj2L6Ss62RRncR3etpE+zJ0O97kmrD7MsTDgxqYu?=
 =?us-ascii?Q?XqyIi+PVfd8z78ZeW9aQbjnIx+Uydo8xhQkEks0bScoeb2bnr9FZXgLIM7aV?=
 =?us-ascii?Q?2+99h+Do2G5h8YlltHzsUjYHo1Mn9wna4ZoT6x/32dWcLji/6LoiozGxJsu4?=
 =?us-ascii?Q?SdmWIsJJJgc1mvtYDfx6jCRaiV5zOKnSmhEvK0phvJD93oJd1yvx/6SYVYIB?=
 =?us-ascii?Q?ks0rev1wuwxPXlvWR1p7PYG/QQ+wF9I2j36k4zWESL5uu+Bgay4jK9tEc3bV?=
 =?us-ascii?Q?MeWmHStrL5RZCMW+KACn0csGEjWLoEdPMwCeucf4im4QEqPGWae6pHiquoux?=
 =?us-ascii?Q?uWm6ymX0Gc3+ACvC4pLwosmRVyqMKU195bkM95JiZ6fZKjmMuTtD1WmWsQfB?=
 =?us-ascii?Q?EbpfKLJYI77YRMiGdFI0Mpx4vfhWkh/GWPgy7BwlrthUWx8GgwgS0aLqHM9p?=
 =?us-ascii?Q?Vk/ixfDjb1nVm9RkG53ftbV75ra7S6WYKgzjjh/aB9OgmffY/g2bVzwB/m8T?=
 =?us-ascii?Q?hWo8BFFomvh5aEwL9EXBR/r0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f564f01e-ed67-4a5d-a569-08d9957d398f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 16:58:52.0330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:36:37PM +0200, Thorsten Berger wrote:
> Subject: [RFC v3 02/12] Add picosat.c (1/3)
> 
> PicoSAT is the SAT solver used in this project. picosat.c is the actual
> SAT solver. Since the file is too big for a single patch, it needs to be
> split up. This patch contains the first part of the file.

No SOB here....

