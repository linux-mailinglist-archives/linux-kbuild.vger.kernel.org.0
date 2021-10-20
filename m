Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7644C434F62
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 17:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhJTP5S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 11:57:18 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:35030 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229952AbhJTP5R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 11:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1634745302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OZVd0Ylu6jmmPcgUD1/QlXsVVvGnq2kXcWK1bL8NgDY=;
        b=kN19iGhBvZ+eJTnhZyJ0sd5QyFRhlBYXv6Qu+ZD+7sE8sIoAI3wiYbx5ZgsJFUchy0kRxd
        mAYUVwwWwLFvVcT3tbvuOKwf0uXBPkpdcaisd62EaxXqJeKypWQwYlzxYRqztEdvT53STO
        kQKi+AwrUM2AQ5kdPDgs2zPlg978oN0=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-nMi8mXSEM_Cw3wgBUT32bw-1; Wed, 20 Oct 2021 17:55:00 +0200
X-MC-Unique: nMi8mXSEM_Cw3wgBUT32bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF4pP29WGrMW0apEhVvLE9RWswsdhc1vB6tekyq60Cbd37utKyP0B81bp9K2jmXws/qTzAIYQneSXtk+99eUtxFlaEYOYbSagxoYJQJZ6QGoULehpfCVgEsFmSP9glccRwb/RhueRN/VqVHCdd1Phz+hkD9/fJfBHFspO5YoWbZjmW/zESHw+WprYtCFxM145o9bdEuQWDj9LMJN4hggtwqYFNu7Zo2Mpn0s9gWfPmv1dMHlAK189h374LxWS8vC19o13ZVgv7hJor9qxABLMzLjCanfrChHeuByQtwhsul5UNi0KSiH+0CaYgBN5NOFqHkma29O+0maBO/ncBltOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZVd0Ylu6jmmPcgUD1/QlXsVVvGnq2kXcWK1bL8NgDY=;
 b=iWvdvDLs2T+/NJmlxQSUPoJKzeLzIbMOgpZznf0+JVPyCSBVbN2pz82x7GuQmUsgfSqbKTgN+xhaSqjwKX+B0hr6XH/piZRHZxMHeUWVSvTFz8zGBLxIDvBIG8yjHm0VC9jb4oLMynheZany1OeTdcrar8FGDl3eW/xX472fpSsIOsOPZ2jans9fEDAUiaaR3aV0EeJ5ITUMii+0guILV7EYNeFySozgFJ9P95jZiazfUDKhcgDm6zFUc/36UGmdUdet4QG6XBmYIZ5TqZE+nNk74zDozNE45mxSflwu/hQF/wJsZGt871B/9V4UtNec5o/Ix8pbWn9ZuTFpF9UrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: rub.de; dkim=none (message not signed)
 header.d=none;rub.de; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 15:54:58 +0000
Received: from VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4]) by VI1PR04MB5325.eurprd04.prod.outlook.com
 ([fe80::4517:3b51:fe79:75a4%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 15:54:58 +0000
Date:   Wed, 20 Oct 2021 08:54:48 -0700
From:   Luis Chamberlain <mcgrof@suse.com>
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     linux-kbuild@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RFC 01/12] Add picosat.h
Message-ID: <YXA7yCyGIcGYBLnj@garbanzo>
References: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de>
 <0e7cd166-1d5e-8b05-e748-1c50f44cbfa4@rub.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7cd166-1d5e-8b05-e748-1c50f44cbfa4@rub.de>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To VI1PR04MB5325.eurprd04.prod.outlook.com
 (2603:10a6:803:60::14)
MIME-Version: 1.0
Received: from garbanzo (136.24.173.63) by BYAPR11CA0100.namprd11.prod.outlook.com (2603:10b6:a03:f4::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 15:54:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89aec7d-86c2-4e28-de05-08d993e1f770
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6383C3671C5E89CE90071258F0BE9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjofpGPztNBoDAMjM++lu6xqgDnjc62PHd9mGWjZLmWLO2oIYIRMS6NcAHXyoYsRO02YAWbNoc4QcgjOYHYZP7S/96xDRYhDWVeETuOTBPeuTXZKjgF3ZbeylNielHsz6DXIbRM+qjSLmXwBBCn1EWFMR5dt20cbOeyyhmdP2UWW9SrZxQ9XjpW7G4Vk5jyXKhbD9srqqawfrS5gKvZlB9+q+khVyHz3JBk5F2oc8tuYHwzEem9ixEEz6xvRIRcDTGkFDlEOsdtVGNjoJSKecX/YJh6gTVWuz9R0zvLSOVtp8IYaCikUXRa7nsVsn61kn3CJ6r47nufcTuUEknaV+/kgV8xyV94wytvRxjq0Sav7xq9GlccKo8rMYMcyK8UGKzIO5Ifp9fZgzVP8FWtBooM7CWy4dBQWKrGRPMJYvF0OrL8tyZTxkuLyqMx3C38Q3DUfPylW8RCuX6P2FxfArfARCAEPnIiAdFpK7XSyJUPM8dyedx1MobU5Pg5WbhPXWItumErqm2q8IWLHxyG/nx2dJtx28BsTB62Mkn+vUnPxJq9bKaaHsQnamcbmSr7cZFxjFWSteWxMkl6UQ7xh6pweurlXQDHxc6k2Ipcir+j4B3RgvTSrSD5MJf68lAoZClmwbNBrIN8H2wV2tO2hvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5325.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66556008)(55016002)(6666004)(8936002)(26005)(8676002)(956004)(6496006)(38100700002)(54906003)(66476007)(4326008)(186003)(6916009)(9686003)(558084003)(2906002)(66946007)(316002)(33716001)(9576002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mn7C5sawMgzxeAwYPznmnbuEsyG4xprz2UTFixYpt1L3IRBYTmB1TY433da6?=
 =?us-ascii?Q?W1ZZYKUIbpSwi/Bu9KJ/FmHcTSegEjN4KVgbokeMwYOddGc2N8nb6RcceLMg?=
 =?us-ascii?Q?zo33nbehhX+bTxQ34PvNRjEn6Y20VXfCuw1qImb284FMYco8BZLJS1gGMbU8?=
 =?us-ascii?Q?IH5PPScoEYSf6hGkmiwdAB7OlC0c0pp58Zl7kLhBvXpJx5vDLTGK+QiGerhz?=
 =?us-ascii?Q?qk4dhomhftZPmWNR6IkcLg+cIA81Pc23d8RrdCV7wU7CMCzfC0IfLv+ekowd?=
 =?us-ascii?Q?GowtwHI7+b3oyGRUZLzisqAy8oAlmcrhOqM1c3wqboHsuNP5AvO7+kG8EFY8?=
 =?us-ascii?Q?t/RYSV2LvoxOo3SJWvqpPLNdbGoP6DSTIZi7nGEHBRBUnGqdJkywedInyZHr?=
 =?us-ascii?Q?LuLoK1aXschsy4pjUi3U5ywRSDXsVHN5QkJPpIsyPCbFT3uTMu2JqiK7RGoF?=
 =?us-ascii?Q?iIkwZUgrEmZW8pLUEE2HhyB2ucvFYPx40EtfdZo6iQcqid1fsL8NzukiPPLa?=
 =?us-ascii?Q?L2yh7P5qBRdKb6jj06QwfjtVGcwt2jaKiXh3ZgazpKVIMh3uviDk9qK+abZX?=
 =?us-ascii?Q?QuIEtx3Ef8SsFot5Kh2izksnE931+4u/gtYPlLGctpGKnkQ/Ephuvh0azM6n?=
 =?us-ascii?Q?SjFQv8ginNYbQdaIvKohRG6TzWWelLvZh2rQF4tqoF2ZzBqxmmw7iUFvf6g4?=
 =?us-ascii?Q?IwTbODT1XIOfeBAdW2QF4EiCh8R9Y07W9GsnlPl10Oe6NMVjkFhlDA1UZM2Q?=
 =?us-ascii?Q?ef7I6zA1T7bA0paKASZBak8C8qKL8Qqg3JrUTIkFoyv3P4sbsTT2c6Ym4OjY?=
 =?us-ascii?Q?AYCAkXgv1D0SuNy+lTejXYLWGDRRNNbvp8De5hagcJvweBbSFCmXpj2uCL9U?=
 =?us-ascii?Q?mKvpZPXBPZ8YwI5T8OXral9eVcjjr/zOR0fAMH6qH519q7Ro0Y6tr5uA8iAm?=
 =?us-ascii?Q?T5YHedq4NMqypomqIOQS0+DHsBoGzzSNmpS/wVfslUkbiwI72IoWMxC9oPhh?=
 =?us-ascii?Q?2DVV7hBFfafvrWYFJmSCqhqPQ8rlbzMKg0kMgfjw5FnJd/hqRJ/lJEpDVvdj?=
 =?us-ascii?Q?Az1NxzKivEw18qaVdvudLiNEHCY8GGSWiKQ+HNpO3PRHHXZMI3DA5s7oQ8Wy?=
 =?us-ascii?Q?6H4Rkx4oseHSbuul7K+WgEpj8TAKXhiCgfi64yRTmDb/+hOLBJVM6g4G7VPO?=
 =?us-ascii?Q?ilXYZqkwY5moDrq6DKHfn3UKDa1D+B4DP404nmvJKKoGMRn9lY3dw246XC4R?=
 =?us-ascii?Q?kZXcJJUSQ5dh8c17fMZUPe0Aflfmtr1pMCsvt3otLCpRe/1qEh2hlx5woPxR?=
 =?us-ascii?Q?NLP5Bmv021vhmmYrhiuD2HUc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89aec7d-86c2-4e28-de05-08d993e1f770
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5325.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 15:54:58.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPv59b7nbfZRW3QZAVZkTNYiDg1GkXgzXz0A5dTQ3Vd+vQsI5fM6UqLk0dqFAW9a7PLgLj/OYlk1a9wwxxEDEcfzGeG6NIx1Wa70vC8nm+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Commit logs cannot be empty, and just a subject. Please add a
description for each patch.

  Luis

