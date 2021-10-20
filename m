Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF31434F80
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 17:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhJTQAB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 12:00:01 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:40168 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230440AbhJTQAA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 12:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634745465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x276VhVN9HUAm7mPGh+0PPslUDUd5QjDCh4MsTkKp9E=;
        b=QdXHhClenxLM03GMRf+HWtxrcCsPntFltn0+aNaxm0/owXXmjyMFLnZdmTD1xNMBH/Y2qZ
        SeOmbapjLhGaL+0vgkcYWd1mKPJ8B6mTKqhJmYagl+NC61W8veDxMlcRwhYKzO9M4804W0
        I5qKtrwTQu79TnRZgLWqbCtvXVJYmS4=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-ohrZcgIZMRyMVwQuyMcNHA-1; Wed, 20 Oct 2021 17:57:43 +0200
X-MC-Unique: ohrZcgIZMRyMVwQuyMcNHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWNzvMRmC2VyUWz12dD5cHh96FJohwqYCu4Dkttfb4k6H9qCRb0aKXmTScqR+As1aufmuZUmpkuh/Ic4XSEvpPqDkTJrrcsVnqwrpDZPJCdGXf1dBrdz+Ke6KsJJ5wrvwXs+Dd4Mxfgvreb0JYjOi+sJ2dnndpvHnxxrtOCbsW29IWtcaZjsYo3/M6Quw5kUBRuAwvVxwaOcTWTYEjJwMTvsIS4KjPfCeRuAu9MIs2OPCTSXpU/mMRQxdJvg/c+9CIhT+b8bFctZSmWDMlqlE9mm6eoVGQuqhGP/w3lA7RNY8nxkvvVu1ekiwKKAdUoV+opSFggXJhtWr3F9PS1V8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x276VhVN9HUAm7mPGh+0PPslUDUd5QjDCh4MsTkKp9E=;
 b=VXAgvdo0S0DKKwugAPEBZs2atIpgoI3SSK+qxkdujT/fi3thCJHHARwYMsGLK9a3vDQYH74XwlqNi/LFQlkxGilY8rfuGcwLlUb4ojUAV8OYvHbJTyygTnWbwEvNoFfGLUhaDCe3Pj+kpbZpkjX08SdSIuX/hLqxa29La3S4pRe3QOvmcxhaDws9nTE1aF7nvOj9k/6jigTy+VKaocd5UBE1elhlwmaLtzHoAkiYXSZK9MeYeY35zJ7pZBO7KV3VTDui/QjE2NxKh8J9RjXfxfOF8uM+BDgT8YGUuoQj5w29Wcg/H9mIozwB3BfXrf81xHckLpR9AWQCQk7m5/JLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 15:57:42 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 15:57:42 +0000
Date:   Wed, 20 Oct 2021 08:57:34 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     Boris Kolpackov <boris@codesynthesis.com>,
        linux-kbuild@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
Message-ID: <YXA8biZ0kwoNSwW2@garbanzo>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
 <boris.20211020141745@codesynthesis.com>
 <e397cd12-e9dc-a305-49b9-f5c6ac3ae10f@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e397cd12-e9dc-a305-49b9-f5c6ac3ae10f@rub.de>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend Transport; Wed, 20 Oct 2021 15:57:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ec45a7a-9bd8-49fb-07a5-08d993e2598a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6383D7E4E0357F2E4E1029F0F0BE9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UH0lryJkOPP0fvbS/nCgKsbnhKZxOSV57+lkN8WT0SV73B58R6e1Cnu6w7QOLFPtbal8Rp8/xnSnJVJvGag7KJ110MAqJ7SoakrKhkHauA2vdsV+GYeosnMfgidQ3jptqYNi7uAYI2VX8Q119QaITKA/z8bPW/CCLcI6vn7tI/vYH005ChWEL8gtvszKgjalN1+tbYXWnM3PZ16HaR/Y91knhJkcP+VKnoLo9HxxIvTKuGkLxpFwI6E0hsTKM2yQEXq7UM49j/pO0Zzcj+1jKcDx00LGvYEB+VPSvzQL1IqZ1UnrU8k5OFCkhZwJsq9A/xzUaCvEnc3Yc/+UKMFtUBmgs+wSLj688cv8s6g+uOlEguguV3VS4+/i/GtYw72sHycraSxq9BZdyDxrwJRETLJ4fcC5qfOmF07FSyjK53AKRQ04ddUQQSQ7CopUggS1aRNivUJW7EI+UcYGKDZMlmB8YJVExNPF8ULxjdQld91pEiwrFO5m+284JUVgWfZ77P+o8fIp3tHTSzjBJxEJntucNfdzd/9envFtelSCZGtUuqy5JYJ0cufafAqPmCNgr3uY2thnjlJB/2shronzJOfKhaTwx2WbskTbFZKE0t2xV48vmTGi+GzcB7tyLlL32gaF6sAq9ta546PkCczbbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66556008)(55016002)(6666004)(8936002)(26005)(8676002)(956004)(6496006)(38100700002)(54906003)(66476007)(4326008)(186003)(6916009)(83380400001)(9686003)(53546011)(2906002)(66946007)(316002)(33716001)(9576002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Qg2DnthzHx5sJ1ki1D7rOzpSyKTyO+mnW/LUB2OIatAwxDIwRmZBxWnXTo8?=
 =?us-ascii?Q?W4xp5nhomrg79D5Z5tH8QZEIF0V10E2c37zh/N4UbvihppMI95EBD5IqeUTV?=
 =?us-ascii?Q?TEp1B1j9DkBExcEh0nkTz3XhaqUgjkuchEXhKuYsVQ3lrZM6otxVP11tBKE9?=
 =?us-ascii?Q?baGEiRiX/E0ozTAs3USL8QBu4dGOK+AaY0VWgobGlt7LrzCmhz/lhqzwLb6S?=
 =?us-ascii?Q?k9Q4NH6xLRkZSZMP6b9rzhn7fg6bqs1LyUho3+UOm9WzNizfyhNv7paZtPC7?=
 =?us-ascii?Q?NmkuwV/UzE5P6tflDnzNr4pJxBJ9P2vZ0PU1q+hPmO0rMxKMXPIV02QJRZbp?=
 =?us-ascii?Q?hnVoxqgj8cym0R/V4CHUkEkGXF3e7DOVMfsQ2fyo0/qby22+NJZa9vqj9cVX?=
 =?us-ascii?Q?CF+26UNb/oLyQYNCphXti0zk6iFvX1A0T9OCkFqJKdq2yuTotnoQNte6eII3?=
 =?us-ascii?Q?PsfzOCD7bOWakACuaNgtPrpN54bMSWhF1zt6cJqMM2C4hdYBCN6X/DpuEY1S?=
 =?us-ascii?Q?u3iKUDuCwk74MB9Q+gAyE1ikhZ009WFj5f5rDHW5tW6kxT+t9Q/OOTVcADty?=
 =?us-ascii?Q?0RafY71i7BP7ZVrIKGotXzvQRtHVJHRE2cqGb+3rgRxIAQf/fP6votIN+lS3?=
 =?us-ascii?Q?A+B8ETH+aFi5vpkyMklp6JvVPsL6KXpvsKaXifaAK3lSn/qlVBYUeAl9HJKs?=
 =?us-ascii?Q?qf6UiaUTFrkJCiZYy3MImcWiU46j7ehbW47dmPBizuWb00kSn0NIYc4zV/x+?=
 =?us-ascii?Q?giInsFP66c5x0dYraFfOb4YOb84gOFXRcHiF0x8OUfdxq5jvxXydFgaC1qzW?=
 =?us-ascii?Q?gkqljC0TyaZjKhG1/FEQNQeXdmzcgnPmbbx7HITlVaxOH0gIAd2/RX4UB2Zy?=
 =?us-ascii?Q?pFZfsEUgNrrvB2anx/VTzxMEcxLHF/OFEa0rmQv907c/tIXyvY7/90+b4T7Z?=
 =?us-ascii?Q?dkiRgtzKeSrZ4irpeGKxC1hc9yaVpuE0cBkM6ikW/MPgRFuJPIdrbHkKSjiu?=
 =?us-ascii?Q?ITT4Km4QW5260nhcEZhdrNNLNBrkj5Lq+55KpgymGy5GLGLNbDUg+AkT0F/+?=
 =?us-ascii?Q?FL669iTF0TPp27PwnuwQgLmE3kTj45XIaHJ6KhOeY6/OiRQI+qRZT0ZdKN+T?=
 =?us-ascii?Q?hnUxwAPryyk1Ye9voOu5dxBsGb1jY3FxYGoKmhrV8tAJWkmS8JO/WGEl6E2Q?=
 =?us-ascii?Q?43DVOlOoscCwh3DcaTOh2nRt70wTZuTYqthsfZgEMv1w/5soJrVBIURWquWa?=
 =?us-ascii?Q?ZjCATzzEP4RfA3t3kA//8q/+O0o0W6DICYXnKJ6TdgRr/tOQvZj0/0rGiMfc?=
 =?us-ascii?Q?PCAJlQHpqvkvci8LuuC6jHky?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec45a7a-9bd8-49fb-07a5-08d993e2598a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 15:57:42.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU8H5TUFeStNJ7E1a6AU3U85htd53dExSpu43dXqbiztTI9wdz6EelFCpaBCdUkB0kfG+T58qgtmNmmCpoveWOah/jU3NJWZvLKcxOGIUZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 04:37:49PM +0200, Thorsten Berger wrote:
> On 20.10.2021 14:25, Boris Kolpackov wrote:
> > Thorsten Berger <thorsten.berger@rub.de> writes:
> > 
> > > New UI extensions are made to xconfig with panes and buttons to allow users
> > > to express new desired target options, calculate fixes, and apply any of
> > > found solutions.
> > > 
> > > [...]
> > > 
> > > You can see a YouTube video demonstrating this work [2].
> > While the demo looks impressive, I wonder if you ran into many cases
> > where the number of solution and/or the number of fixes in a solution
> > is large (and therefore would be hard for a human to make a decision
> > about)?
> > 
> > My closest experience with something like this is aptitude and the
> > few times I tried to use it to solve package dependency issues were
> > futile because of that (i.e., large number of alternative solutions
> > and large number of changes in each solution).
> Thanks! BTW, I've opened a new thread, since the emails with the main
> patches didn't go through before (were too large) -- perhaps you can switch
> to that one.

Use git format-patch --subject-prefix="RFC v3" for your v3 series.

 Luis

