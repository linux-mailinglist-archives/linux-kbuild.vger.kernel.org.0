Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C8A437B32
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 18:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhJVQ7H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 12:59:07 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:46163 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231453AbhJVQ7G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 12:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634921808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jRaTbxi+FKlmxHwblO/HRUDW4h/OUufE+NVg25M4Jdo=;
        b=FoMBdax9utdUPiWuOEFhgdoI1PZ61eOyEYp+vUa32D0TV0S8ZKP/DCPBh5i5p9yZDBHamV
        62s2RDh1zbdcGK7PoBNQO2ujg+zi2gfT0LxrvfvN+Kl88ouncWFlTWXQILawPwVHkh5Brd
        u9y0xFzfW9ucFKFCaroY5yybMOVLsac=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-tNNHUHftMaWsScGNPIKnPw-1; Fri, 22 Oct 2021 18:56:47 +0200
X-MC-Unique: tNNHUHftMaWsScGNPIKnPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKJVQPqIpfD5O3Y5A9uVbKD52hfIXH9DNJvg5XdppP4RqQLo+s0uRfLKkSRTs0bK1eatDW8OY9q211IuZ/PTSrADSHBSsR6ZR9hErnwAFZ1+b+mUbRTDL1pMJnLzCiWHtjdFlu2RIdTyqyPauSz044lhpQQnYg2m9us5gVcImrmAuqva8GLWh74m8UhGe83OzbMSa9iAst/yOb8pA89AEbMLA6QJVTLuzpgOpcg/qdWcKAMYCb7/iDBSk3GJzWoUAr1tMnMqgFa/MUU3NnfX4/uwaXE2uB0PsrBedFwJFXPKPwrJlbDaiTt1mkH+lhPtP3/rzmqayN4gmJvM3FOXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRaTbxi+FKlmxHwblO/HRUDW4h/OUufE+NVg25M4Jdo=;
 b=Bcpn8EV2a7vgm+4wCieXqDFG0stbfXangaYPwDmvQCdWfXD7gVJNTdZaLU0kfAjpLSS60rnuJyrWDolU+3eNr3JIbK4JhbgMVPCshLeEp48zSIcKgeo7JWG2CWyO823rCnjxrxJ31XvTrO7kZPNzLVOoYYRm8L7Gew4FQMcTvh9f2HUxEG+aGG4JAd1CFN+v9sEJVsUPilYPC1JDXkJuVWZdeUVXKmx02OW8kz+yW0TbbIPQBmZlGYd2PK8LzQEujlUKS/7JVfC3PuHaSRDr18X4RKchymQ0Z9OmufJp18e6XW5D/lQbOVKiGi/vW34B9+ULRgKkemAWIoubMsahuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 22 Oct
 2021 16:56:46 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 16:56:46 +0000
Date:   Fri, 22 Oct 2021 09:56:37 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 06/12] Add files for building constraints
Message-ID: <YXLtRc8WFEIkMrgB@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <3d287808-ec2b-9a22-3b33-f50b707f6372@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d287808-ec2b-9a22-3b33-f50b707f6372@rub.de>
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend Transport; Fri, 22 Oct 2021 16:56:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1979d650-8d64-45c3-1c25-08d9957ceeb4
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS: <VE1PR04MB736073CB678263A302648F22F0809@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OF7YU12TDw3uf5pi6h5ibc2TmzfdHYax/17zDjNq8KSOCuv+syZl6oxfGXcMoHxuR7iQauEMT2t+AwPzijx8yvzUfMuXBVXB9Vzh5riuI/A/opkY0FdFimDmZYIuoYsemEDEUA3/vlUCLo8+ipvDAeHtFWnPdoRU//NSK8fTu6UhNXN9aoOXP9mPX6qQ9AWHaQkLZP6Mc5KmvwDgrve7CoVoMbbtDTlrC3G8FObpNE5wyUmzS8k3nDmIepgO8c0sMH41b7HeqHu+AcqLvAV2a3Acwj7FuVWVn3LcimvmqlyMnJ05G7jkewmkLd+Hh75gdhw1wLJ98cQV/TPlNkQ7jiIOjMiwAo4GW3iNrckrVEHdhWeWREmLg3VDS5BRoJpFXF3lVKNOqhkZGhaJWyPcHDUArRSEu65cBTKl6KjY5eWawserJiywNOGY5hYKplECwLS1L/5kqbB9br8dvBIUDBkRRbJAMKpghaZXLtkz4VXdHa5WqBMZkkbYRNlFmn4UZ3/75a6dxSJ15JorQ1WgqIMTZkEYZRMczf39/wrOM0Ob5iOwPkITTQMLbG1YGDAZp5SzYtp7DwM5ADGOd16VuRN9am6CWyRtqx/4JUPCJCXPtBuSDq5omK8vUwntU8tbgt8PpOFzRqaY280xWD3vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6666004)(26005)(38100700002)(316002)(186003)(956004)(8936002)(33716001)(4744005)(8676002)(66946007)(9576002)(66556008)(66476007)(4326008)(6496006)(2906002)(9686003)(6916009)(55016002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSkAXpGkiniEHwQF+/nK1xwFR1JZOwuoBVR5GxhAbFdzjm1y87sN3LlzciqH?=
 =?us-ascii?Q?IQt0wUkJosnKHRp3unFC/iZwrlCLCGEKmJEXw/wHV/i3eDsPta8xKziH/3u0?=
 =?us-ascii?Q?EHvINOuUMf1s4L0JFtmiLnbGEsQ/bQcMYKBAnQIYYHPlrXGpeLPejGbQ+o+i?=
 =?us-ascii?Q?Qcf1w/uIQdmLGfk08DEYTJrWxcEmSNNCm1Tr+Ns+gSIQ0hM/QcqLQE44KjkZ?=
 =?us-ascii?Q?/7bxhfIfw4aImyMGbld+T3KhBBbpv3lyC1u/9gHH2W6EIw/Wd0yPZ68sdHQP?=
 =?us-ascii?Q?QqT045eZK1Yz+M3/dUfiQOdtR50vixNB4nE/sXS7iOs3jJTRPJLIL1ayF5i2?=
 =?us-ascii?Q?8o4rWJSjd9leSMFpAfMmZid96OZpCFIgwbohd540RZv8IHzDFGs9S4q2zCJD?=
 =?us-ascii?Q?ckz+Hf84MKtnZ/pGllA3+813eTvzQUCX2gme+gNE9MnbNc2qrxxfTUgZFP3h?=
 =?us-ascii?Q?Nz4zW76KHq6rL66bac+MpZMy+/vifiabwerZD8/Sv8cKtEevvhHwwBT3mIFz?=
 =?us-ascii?Q?phgDNX2un3yDUz8Jz4NWbmKiFPhFfP3lpqGyu8Zmwpra3/YOsvoiJPJp/fBn?=
 =?us-ascii?Q?als8NkNkM08n/aDYncHr54wzNuOdmweCDDmzdfLTV4AQs0oA5Q0dhx5EM/mb?=
 =?us-ascii?Q?uN22k0olSDYXwC/VCA8YqD2WhxXfzYeXVHtAZVrznQGUKrt3U1PGysUXkl6d?=
 =?us-ascii?Q?GQA4rJpEFI6s0PgFxPoelP60nESS+CyzdRcBF8iIJkzzh0FkNbhiU56ZoE3D?=
 =?us-ascii?Q?2rbapDr10bxD1slx+aERk69STFc0GzpjnKO0LloZSKOCGPSLawXxjTq5xD2s?=
 =?us-ascii?Q?iO7EPyKBjg7dKN5sGrYZrwLa3FPanc+We7Pl/XwXmvnr5EUr7VZ9nwwLlJVT?=
 =?us-ascii?Q?VjEO5DgqpGpI606UUuULPqHB1QABTwiQx8nfaP/iDGoAvUGC70yn0pvz6xtP?=
 =?us-ascii?Q?XaC+h5QOOibiZRHq+rmJkWR+WgY6MhaX4erTYVagfTnYgMUIUlIA18ZfWq7u?=
 =?us-ascii?Q?9LwYeOhVl/CLgeS7cd3qcb8IYn1Mg1ZADzRcS9RE767feg6d6Ci8YTMS6+mr?=
 =?us-ascii?Q?DOOIoO6iZEbO+kUQqaqh9xwGCKCIzD7p/AnrrdEBCfiycgVX3KjwuV0m0yln?=
 =?us-ascii?Q?3usIN/+WyyGr86Gqp3f6XNuA5TM+ZRhNVxNPJo5L0WMhcOoNk1B4Kjnr7+hP?=
 =?us-ascii?Q?uQy8j///Uo9JYcKo4+wcgKmJTyBfzNE/F3171B4e8juSBowboHpBBOUSR22s?=
 =?us-ascii?Q?oKHD+VOiSB1ADAVanXShPrH4bsov/rIs3nsSbIgBLWLJ2WIPXZQarQ39BBUl?=
 =?us-ascii?Q?L2WV3/rjbS692R9vsYtSrQrq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1979d650-8d64-45c3-1c25-08d9957ceeb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 16:56:46.4379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:41:58PM +0200, Thorsten Berger wrote:
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> 
> These files translate the Kconfig-model into propositional logic and store
> the constraints for each symbol in the corresponding struct.

Likewise here.

