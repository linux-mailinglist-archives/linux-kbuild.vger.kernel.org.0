Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779BD437B64
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 19:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbhJVRGD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 13:06:03 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:20101 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233737AbhJVRFd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 13:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634922194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5abJDVnMNN9VH85NtPpGf4u/+FvXoF/3R4VGQrBJRP8=;
        b=BFqI6yParOyUpjGz0C4ZeozTyd/A2uHvSYtiBc5mp6s9JTrWAv4o9HPz8yUMWzMQ8N3i7v
        Tj2j3g1glOUcvpeZ7pTECJYCDHOIWYNuo3Jbzr5dVKHsfLdYqdHABfU9VxpEhx7Z5Xkaok
        n+FbYGLwftzR5m7TkQgtrTp3KsO+jgA=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-_SSN-C7POWSuUZ7QaX5Lxw-1;
 Fri, 22 Oct 2021 19:03:13 +0200
X-MC-Unique: _SSN-C7POWSuUZ7QaX5Lxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzgaJWZu0vNaEB/gqiuvl/lHiKJcSl/ZhawFyzPGGOeZ4kOIOUB6P444kHg/cenWmdiAmnPBBLFK9AFnCa9raCf+3KZRUDysm/vlLEnqW8pG3S1C5eUrttMgBcAi14Or9lTXhTEClAN8vPjBH+vK72hm+0lc3v4FoaLDERHR42KqLQIyLhtYQs3jdU8Z1doCuW5otkV6U/AMuUwvoDznp9aj4ze5cRRlHB63iHoeC5tY3Z63rAGc8rPhvzz/CjW0GFLbjXxWSvaOTjhR+3HB5p1YERh1ZvRlz98WUM7tzGqd0EbU/V10h/Z9xC+44E8Xbh8NOCbbR5TLV4+ucHTIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5abJDVnMNN9VH85NtPpGf4u/+FvXoF/3R4VGQrBJRP8=;
 b=hkbh0uGd+3twz31XzJwhIIfSP8O9Ryss3sPPYaR+HW/D38CWaYTS9sVusjMhaenrWXltVypX4gGtCnyvVCIswBVHNOYeIXe/4eztKpMmIcinqFVDUKw8nK4rxzTZj6Ep3/WRmg+hENTproJWVFb8dQnB215gIDy98AcouH7Op42Oxf2iVZYozNRskv6iJVkO5XKQQ01yFdPoiOyCrkYP1dtI14Mkd7fAy6g+6yYZaMnVBgNEne+VVSdH0N9xD5RaUmdCRiR468KnPoB7B27CkwgUKLtYoWA1BTj0PUdHkzk6Axb5mB71kJsp6vatV/clemf43/QuuhGE6/wycmz5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 22 Oct
 2021 17:03:12 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 17:03:12 +0000
Date:   Fri, 22 Oct 2021 10:03:04 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 12/12] Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA
 & MODULE_SIG_KEY_TYPE_ECDSA
Message-ID: <YXLuyNtspVCBC+Gi@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <60888f89-5e0d-5ab0-61dc-903be05a906b@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60888f89-5e0d-5ab0-61dc-903be05a906b@rub.de>
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by BY3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:39a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 17:03:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93de033a-f351-4f49-789c-08d9957dd50b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3293EC1D1D97CFC87EB214F3F0809@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4g/uAjOosFV0wzSKk52IxGfKYBP1hAss+BY9j4IDytCEDtNPED57D/hnBeNRbQLjRJh2HXeQnZLssepGHrukJI8pLHW06Mm/q4UTZskzRYfXW6lt1YnOC8AfL8s5FgBm/jAuAtkpi+5O1IGOYYnn2frzxLLq7u3WMggxMz+Iv9rtL6e3FU/I7+JzanSlLTuHim7FgjjfkXrCd02881EfwfVn+icV1ScVyopeAYpb/uwqk4VzGeLYP/5HPbpIDYPbAUDAkXfTnH8uGhJQLzXi2nmRvRoA4hK2D6TO8BlG8lXqWGAm+QtXSXGWHZB7P2K3jrlZV8MN0dxPbnUDHMSLAr9d4cG23HBLfSa0UYSf43EWNQva8GpXZHqervm4HIATEtNexn7hqwFm/iphkTpLHvZEaejvTMEfIfJX9h5KNiCpswsP81ewDTeUV+VasAhcFkTw9ak1q4FNDVBgSh3ozdWQA/Y9nyLloFlfutMsQ5RDrlx2E5eqmHv0jUhe1ORVWAhcWN4czA+yWAanEsO3eB+T/TJf3lXnLtB2SM/NEiYitdfzl0sMydLs+LZc8JBhEuQmBiJx+bs07XdRA6c97zc1S/zd2hAi6aBnou4H8FRu0VL6dd7QI3LRIq/8FV5xv7MgrDYGj/wUWB20yN2U+cjCLmNX5qfYgDtU61LYD/u5thBzc04WDJ814oO+0MnQgOTNj/X00qQwovqlui6Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(9576002)(9686003)(54906003)(4326008)(186003)(2906002)(508600001)(8936002)(316002)(6496006)(6916009)(66476007)(6666004)(55016002)(8676002)(66556008)(33716001)(38100700002)(66946007)(5660300002)(956004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RoxagqHWWxf1UwiUv0Dm0QwPPHxpbnnEY7J5LJ5tPYXSo+o6ZpBVOql59xJh?=
 =?us-ascii?Q?m2NqsZguR1GEsf6wyL06f7vSds+DBSDc5pbiOK2MHw8BWJgX4hKMg8TCIw4j?=
 =?us-ascii?Q?oy8EOXQQ/65Ftz2FYENi9DPcagJqrk3QtlsmzJhtwwELqsMbEGNlqR7dh6k/?=
 =?us-ascii?Q?k1gEnGtKhOD2OBIFe0vk+4AOVJyPLqT4YOc/2TGsmDBQ8x8r3MlIhz6VR+uy?=
 =?us-ascii?Q?9vnpJZQTvIFQpzPzVwecCEXMpRpvQj8Vx1TOdSYedzevKAz5A4ygcA6lvCa0?=
 =?us-ascii?Q?Sn5+cF4pTwtqVeeNk/N6M8lPq0KFi6rnf+js1akOH6p+3jpoS+FQE8/P92IO?=
 =?us-ascii?Q?YItY3eiy+Qd1pkFsY8ZhyXGjPLJW6+HOmXtaxU6/X216hcThi0aByJl2EOcA?=
 =?us-ascii?Q?cL+A6OIs/PCYh3W2dY8aCdGAUE/5Fm6r98szylUxqngBsM5lGMqB47/W6Hqt?=
 =?us-ascii?Q?nRaFUAP1IDZuu+MelNW7MV6J8RGZ1+h4tKwN7dCucetEA7su/k+5Jok5kpvw?=
 =?us-ascii?Q?kbXopg4Wf9+Rbw7OKCgijD8MVOIZjTR02koo4Q+wLA30nQLJDhQNZF+b9DY5?=
 =?us-ascii?Q?u5JLM+20G39GMz3pXZ0C1AAPH4x9TESwxy5RY3kDigV/rTdKuWvavBEswqGh?=
 =?us-ascii?Q?F3lZQTyLw96HHhB30Tl6Z9Iq83fI6dgBdwtrTJS00ZviS5kOE2hd0KjuKsts?=
 =?us-ascii?Q?SwJcAq69Qz4A0XTH+MdcNVlxj0v9LQyxhcw4h3uw1R9zkKym1JrrQWsu57hA?=
 =?us-ascii?Q?BIAM3GtfA3Ea1Y2gYNWflvpj6pqgC+RuCi0a+MD4672F/JEiE8dpOHAV+wyc?=
 =?us-ascii?Q?I39sKlDvMf5UP+aJAjvZqCo5Wrxf97B/ke/r4o1YPNifq1qMpv0pdG9bOjZS?=
 =?us-ascii?Q?3GzQe8dmoBf98NM+efWiKxkjp9C14+z9sC8+E1ZzFcLhzMUjeBFkqUM2upnl?=
 =?us-ascii?Q?twnipi+CluEkxs6Q21AB39aNQjmbFzo1fbCjQuUzSz2Ab0XHeEtC7SLkyYls?=
 =?us-ascii?Q?beZWiYJs7DBrr4FH9+KFLITs8zR4xhpxJe8m+SbSg2AT1R9v3upYi/RhLA4A?=
 =?us-ascii?Q?ZsH4sSF2DBqZCKR/KHp+ct1RMHwewvfenkB8HrXprCuhhlVxj+x0uuSMiDyb?=
 =?us-ascii?Q?/Vq4Tv1q9L5We3I0tlGlSREQbTJDi0yUxUWnPBRLtbnzsKobAfGWhqXFgOS9?=
 =?us-ascii?Q?oTApjAcm3OmGWMAGeTRbdqKyCHT2iIoqQwHxS0P1dhLo3Mu+m4ZVVFOau60I?=
 =?us-ascii?Q?8+OIRpR+slV90qVcVQPIyq4smuSub7BY5a9ytp40TRWnLocGYLlY7aSiKTO3?=
 =?us-ascii?Q?MlRlECW5qQ2vVE9pfqNINSJ/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93de033a-f351-4f49-789c-08d9957dd50b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 17:03:12.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:48:55PM +0200, Thorsten Berger wrote:
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
> This choice group presents a problem as it is possible that no option can be
> chosen when the choice group is visible.
> Every option contains additional dependencies compared to the group. Hence it
> is possible that the group is visible, but not a single option can be chosen
> as these additional dependencies are not satisfied.
> By moving these additional dependencies from the options into the group, a
> visible choice group ensures that both options can be chosen.
> 

Re-arrange so that description goes first and then you put the SOB tags
/ Reviewed-by tags.

Also, be sure to use ./scripts/get_maintainer.pl foo.patch, and when you
send your patches on v4, please add all the emails you collect to the
target audience. This patch in particular should be reviewed by folks
who maintain the file being changed. Please also cc linux-kernel@vger.kernel.org
on your patch set.

  Luis

