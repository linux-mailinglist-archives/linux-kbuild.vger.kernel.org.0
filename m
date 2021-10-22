Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6693A437B37
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 18:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhJVRAZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 13:00:25 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:36645 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233413AbhJVRAY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 13:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634921886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+b0+DSIuR+okNW2+IHEkKFqrVzSTXp2BeuG6+JurE6c=;
        b=nOWTFq8oFFcGEcbu0cJAOGu1RJZUC0lShHujvMGm1GT1GaEFk9futJ0aiZEhyySZSsUQsu
        x2nbJ0UJl2U3Y5X3mYncwQdc/LYfUUS7RrUj/G3s2LLYktWi/0WJay+sHhKbGvEmlI/eDt
        WgrwyBFe+v9s2SjbSjRyykPNn7LnRAc=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-Ty1XytkvNgamQ-75WGgpLA-1; Fri, 22 Oct 2021 18:58:05 +0200
X-MC-Unique: Ty1XytkvNgamQ-75WGgpLA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5OrhWNXwVFx39rw/yNHSy0wdZ2ip1gr9PPYdRhvKcDt4v0yyBB37IwWwfiCT7m3Kj+MIssZpR22iJJgy0RnNeYghN35EkUemaFFsvQ3EBpNzjxu6Tk7XmZZh5UHziz92W8MRYX3JqAjO9ZaisLjSHwE1coMNWb4NVq+iu0JEFScUnzSBLIjIpGLhp6nxc29/HzDgdXUrmBfiZ4nJvnj1VlNrKdxhPPJNVO/doSWe8+zZycpmF53spwtN1yovi2Q95rVxEigq5+ufseAtt1usMVcwri4182zZYqyKzggr3WYfubB+7Sea8PjfHY1XRx2Yfm8hNtsVoAvYwHA+NyKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+b0+DSIuR+okNW2+IHEkKFqrVzSTXp2BeuG6+JurE6c=;
 b=WdAlx54EjUvACHwdvSHsJPikm8azNopi3BWINvJIWvNmLEilAglhf9jfDkeQSQUhgaF1Jbya8UFOBR+Ij6iczkBmxM4ZnPszOlG4vs/LFZFTFASHHUSoKXr42D/M6R4OR11piGzQBELrkIl8H/yzgaDVuaMdjC7xUlijTRAJPWPCEoLyGNfGmm1G5aC+Y98TwNkE2hMb7vxhuBCXKUrIht6kBHCGCMgu48wIcPvO8GP/RNJ5o7bBd20MWiAGawKmj5N/VBeSTC6idY2UT8MeOdWbZ5twwQ9uHi/Q2ALir1WkqENyNgn+LYnKci8RRVbvxdfa8O1zonfwCvqgNZr6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 22 Oct
 2021 16:58:04 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 16:58:04 +0000
Date:   Fri, 22 Oct 2021 09:57:56 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC v3 01/12] Add picosat.h
Message-ID: <YXLtlHKiawJtnsf4@garbanzo>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
 <4df70e2e-52f8-db07-2032-bccfbbf84eb9@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4df70e2e-52f8-db07-2032-bccfbbf84eb9@rub.de>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by SJ0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:33b::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.8 via Frontend Transport; Fri, 22 Oct 2021 16:58:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040a15e2-d0f2-4e5a-76a3-08d9957d1d00
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS: <VI1PR04MB329364EA39CAF0B664E7752DF0809@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4T1VAVz1LvW7YjK10KfY1Y1gxcnwkcEs0/6s1ksZCSeLBnqbxHqPzk+bcYRI65HqkqS+DTlxbxaKv1KyFJ6ev9YeK73vaV4RCQ0DutA+tWWgV9A6EtKpeyCJc5qC0/VswyJHEvtQweEmqe0HfyUWPQ38gOjcOJMJOzYeZv2g03/CRxvWoU4yIlZsVzZh0r+4pbv/Ipx1rR5/gXzl2hxWq+rO985NsZkLkPmfjVgRxcxCuu13LVkm7pfSclR43UlbRwYYE1C/wXdqJ7Hdlw9fKFJ2YjanSoS25tpnjvm5jNqa3rljPZS37Oa2i1mi5PYDqk4XAgYtX5WB9TrbeyHxlukr+HE5QHwGoWTaFp4SzaKCo8ggGVynEQpDfGqH9NlcmXoiiFCC4lD3Fc9bbxT4XBMq2j/gLyBxVD7WYWAR5GbTTmFYdRzicJOxbgryuIOXVbBH2vQFTmNf91RESvwqi4VQhvne93+hRdEb9jqyVB8i+jmmDMEcjYdCqZU8JcwotokD8H2FIfr2Dp3mnH9GxsSElcCkJkHvprKSQor7aESQUq7/0slR28nXm7d7gVGfsBVV/svxouuFBWpZHn1b/snnMjz6JrQznPGM/pbpQtSk+bkxx2dRF0vLT8k8t5R3mdydr70uekhzNUWXkDMRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(9576002)(9686003)(54906003)(4326008)(186003)(2906002)(508600001)(8936002)(316002)(6496006)(6916009)(66476007)(6666004)(55016002)(8676002)(66556008)(33716001)(38100700002)(66946007)(4744005)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pg+U7yP+EreIycgJlIfiNUsfQpuTg5ds3Pv1S+RL2nm6PgBgGof8Hf+fcN93?=
 =?us-ascii?Q?w0WqRdFz9IJNGQ8BTDj5KrkglpS0riGsHbeF2eCRopV3ia5VdC5WhI2Pj50w?=
 =?us-ascii?Q?iiCDDHw4hrrjMMNovwrP9RTAZwIGDiAP/izILr99dlpXVrd0V+Mog1OYNT6I?=
 =?us-ascii?Q?wSkcWpVmAyTwnSTVBE1ZJO1FMT1bR4/MPxkAXn/WIo4Z4pk0FRSHt3HKu8vE?=
 =?us-ascii?Q?QbZHOEdUhNsaUnesylGNokohqkOQsKccLvn14QScYnLKE0dAqmEbiXBHMNyF?=
 =?us-ascii?Q?hA+fCoTapsIXwz9cnF1ECw8Yn68wORhZiaVyIkVKPWanT8kUEWGK2CAps66O?=
 =?us-ascii?Q?2JOCEBP2W2eKIwrTreZqxKfvp4Sn47LbcL0QGywkwTcXW1CpdIrJLT049d5J?=
 =?us-ascii?Q?eofjFqjMBVkmMYskl1JyBosvFgY9wdnPbJuy7umcX8VixEFaU7RaJoIjMHpy?=
 =?us-ascii?Q?U5EFnOdgXcTtWbhd2vqQ1D91gJWOKCNvUfl3fwDxxv9Wf2X/KNIMtrilvxeF?=
 =?us-ascii?Q?h7MqIXlJErPldyfAgY2W1JBklla4d2mvvn1DIcBqI4cWj6sH5ItL+v/kyPsB?=
 =?us-ascii?Q?guH0VZoOmE5ingzpOKicVuFMYIHutfxbfNNZn/QRf0K0/8vSukZL1uddE/3T?=
 =?us-ascii?Q?6RozdxPDSf8gPaamdc7flR7JxHpPVYCgAsLJeU4idbWsFbxx3y32o4XyhDwS?=
 =?us-ascii?Q?QaJjIYUU6EvYxcaIYQWIj72A55W2u2/J6neobt9ZqLFy6BkY5jwvKPjqru1t?=
 =?us-ascii?Q?iHIz5LkMFUJMy8u72wWNB0sWCvlmN2KQYYQ52A90ws8gVf2PeIlSYvV76tuh?=
 =?us-ascii?Q?wxdrZrLPk19KgspJA4ug6FATom0ZBF6Gkf+VIUvGxZUDfWr2YKE4ctaOeszG?=
 =?us-ascii?Q?CzIBEvjgokh1Mny2kJJtkOmkGnhoBP7s/OzNR0yrBQwRKUjdOlaxiP7preX3?=
 =?us-ascii?Q?4edpqNP6B+JzJ2wgexkutq/fiDoF8GaGNlvsBALxgwsKevYie4nOpmcXPMpD?=
 =?us-ascii?Q?a1QTmO7yb5JMGm3XOfRCBisHAKxdjB3WNvA43b9g8qpxAuXOa7JSPdv6hCIQ?=
 =?us-ascii?Q?017il89BDoFZd/qUmVj2VddPw2uZ8iKDTEDtRdSirU96OnzVehoom9dCQSXe?=
 =?us-ascii?Q?+TU3V/BjwoICblxZb9oUmvLpqHpcewcnhSjDBHhimpbyMgEoQyqd3++TYp3p?=
 =?us-ascii?Q?NOUsTUcGtlYBmI1Q8Z9GyHvE3LzAr00MlcX900rklPNcWp2mniQt0pnMEhg1?=
 =?us-ascii?Q?r35aa5+QGh9axvCv6GtVNl+ELDayXAp5SKYbsFqks6GpG/czlPh1eFari4GI?=
 =?us-ascii?Q?3D4hqKE0a6GuWedQMV91AGI1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040a15e2-d0f2-4e5a-76a3-08d9957d1d00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 16:58:04.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luis.chamberlain@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 03:35:45PM +0200, Thorsten Berger wrote:
> PicoSAT is the SAT solver used in this project. This commit contains the
> header file for PicoSAT.

No Signed-off-by tag here. It would be good to specify then also
what version was taken in the commit log, and where the upstream project
lies.

  Luis

