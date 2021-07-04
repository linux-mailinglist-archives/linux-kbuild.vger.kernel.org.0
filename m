Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7633BB3D9
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 01:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhGDXUS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 19:20:18 -0400
Received: from mail-eopbgr100139.outbound.protection.outlook.com ([40.107.10.139]:9440
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231910AbhGDXRA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 19:17:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyqNSHHw7cuS/IrtZdN6ldiOR00CtWbTnEWbEgk+kXuFCfDrfA3i9Z4zTtvNqYLRw9rjdSXJoECBZps1aG3zCVu53J5krDOuoqobEwsKBf26cUCM7l41dGc2qfzZxeH2yw2HtXfvXSpeepJpBtoswvP7Hf757IvGLVTweV+q6J+gqBTN+bYeZky6rLwHx7puocQ1rievFyPk+ECqljiQA3ObcbUU5w5Bg/YuQN0i0uKq8nhzuXSnr3JQq89rDpaEV4KHGf/bz0MRnhJs2io6ubxEwRQ3tvcOC+NpaBwIEx9Cyw6qsbrJ+Zw4yarSxRWyBqOlKp7jjxn/yZoyMAEyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfrCVsry10xeaBnLvJVmHCxdRb/Gy+q8St+kATaiojk=;
 b=bFLgZlGMMrSQHGrrvcpPGk3tqhcwKONNGW7s3JoQ510i4mp4hIpbtjs1A1lPL5uy9JXGxp/O9AcdGfYMdLkHTd217YOywiEN5qMKVgYC1A/YiylIvyJBcE8iufpihnHiRfOBESsVyCVsB/HUlNYKQhDXMknvcUwn/0DlZcwT9fcJV4FggisTMTOTvUr93OhrHUTjdOUpB4No+clh5jgaiaCz+SummUVdi2enp4DHCHR0OWj+vi5HeKB8+tp24E2Ob7zv0+2CWbIWY8NJlnI14R/uX9hZ9ewyWKFvVOb/OWY/irDo+9RCc4r/bs8EJKZXIgADCo1HJfGJtjp0dPKsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfrCVsry10xeaBnLvJVmHCxdRb/Gy+q8St+kATaiojk=;
 b=aP+bcw2GAA12JZAr0x1r54vhkahzABfd+sMAmdIVgnqsWRafYbBP1RZwqPjbhUmue0m6wF4ZwX3i7SjALquR7WJIkvczmi4aycbA3aNxMcjdl9ZK2WusK5bBcJiOxV1WjLFOGDUNmOoK1Oq5wXKWlUdaSKJGYxgxui2Ti/3Fi1U=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=garyguo.net;
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LO2P265MB3997.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Sun, 4 Jul
 2021 23:14:20 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099%3]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 23:14:19 +0000
Date:   Mon, 5 Jul 2021 00:14:17 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <20210705001417.00003d1f@garyguo.net>
In-Reply-To: <YOI5O6/RpaN1P6mM@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
        <20210704202756.29107-2-ojeda@kernel.org>
        <YOIicc94zvSjrKfe@casper.infradead.org>
        <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
        <YOIpM3iFT5roz69i@casper.infradead.org>
        <20210704232007.0000357e@garyguo.net>
        <YOI5O6/RpaN1P6mM@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:470:6972:501:ac54:3e6d:9d2c:fe4e]
X-ClientProxiedBy: LO2P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::30) To LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:16::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:ac54:3e6d:9d2c:fe4e) by LO2P265CA0090.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Sun, 4 Jul 2021 23:14:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8e271ad-6212-4d00-44e1-08d93f4173d2
X-MS-TrafficTypeDiagnostic: LO2P265MB3997:
X-Microsoft-Antispam-PRVS: <LO2P265MB3997F823B493F968B0DFEC82D61D9@LO2P265MB3997.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEyLEFBNdUsKRjpwbUp+H8i+6Tm5MwMLmSNg5LemNirlhhKPTOvdNQ5HywSHvc+SnBXB/EmB/S6RXAkFrm0P7DNdi+zUtyzjbiFJ/HiD4otzRhqTC+pLSGRqDLqN7EgBevQ148wn2mfn/7fZf8D+dmZLOI9+muGnA3Ri4NxabKdAvaV69H07xHK0GKPEwsu1xugkorQpawuzCy4fQNBZqXGQik/1Wvk8xDSkeY/LMar5yIH5gJFA3G0KCLSMMBRfoYzW0K2QF3SHYwUuDUIST7x/+wIQzfl3sdJJxS6+IOXltVXuwz1GrC25UoygsX0fEPBpI+bELfvx3Qvh8CIAadTwREiKloUn1lKeyfUdQDnF5zPKLG1qDrxy9lOHP26osoDv/Q7l0DhY907+Ju01G9iOiBw/uZYt6erhySVlirqm2KtXSZI+rF7kl96Xz5c7gbJWHeRCpXu69iYtQGNv5ljBoDZZgBJrXTt8pl0tqq1b2NCpacX1SDBshSBWzFef39O5OUtGxvBqPzQdiNAWr70vv6v5ISwJS36ZbXBPLzxIxgntHNzajx5fbvLJl0zz0P4R68EARrZugJctZU2phk6tP9nomUZL04sIwrrdIk6RB4yCIT3Ru/awfJ4A0mwEGVu+Re5JyU8p0QTBRCIkQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(39830400003)(366004)(346002)(38100700002)(5660300002)(478600001)(8936002)(8676002)(4744005)(4326008)(66556008)(66476007)(66946007)(6486002)(52116002)(2616005)(36756003)(316002)(6916009)(54906003)(16526019)(186003)(1076003)(6496006)(86362001)(7416002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4JK62ESdZ2zFNOxEWNvKR407S9iREkcDoRHqIcUucZ07uX7v9qSEdYScZrs?=
 =?us-ascii?Q?HYq7CczYL5p1tBfpMS/kjVGNW++kxEUFmORSS3HiO8+0FP8UbnerT1ePGFS9?=
 =?us-ascii?Q?QEQQA/owYkm8EIULHjtLWpxoYRjPBXJqOz58oI1KOi7h8XOJymNgHKFXkV/o?=
 =?us-ascii?Q?6FKFOPVEYDdTQQ0QL2gGTSpb1uMW5hZZTsN4eaijH4lDeqJVzxZELwzpTx7k?=
 =?us-ascii?Q?PSLTzrW98m/rAIn3mU7HMJROjIjtLbGVnkZf/qWRBcwtcNaF9iq6B1CAfpG3?=
 =?us-ascii?Q?zUQRO2Oi+01BlNG2co+vXJb0HjDznlheLz7S8M6UXgtdY4C/RR9JL37t4L1S?=
 =?us-ascii?Q?F4rHkVL1QYrNjfFwIA0harlDEKNWRJ3CXu4vcQqg1eaJabJA4rRfNirsDjfu?=
 =?us-ascii?Q?vM6Kwx+788yiUGvfNmyB/PIALPUhpQopxMh7W4cKCmK0BP0Rzrm2XeTZHcIF?=
 =?us-ascii?Q?/SSVL7ewbpXpKPlK/sfmx6TuldbgrwaiuhU7/nHJvYt7IJqFOU6goQ5uiQ0x?=
 =?us-ascii?Q?HktXtK5hzt6lmCymvfotsAGNEcUKZHdjQ9ZZTQtrVu+8Sl/FI5Rkq6dl5HQ+?=
 =?us-ascii?Q?i9MiOCx4xHWPvKamSN/jbLbKOYi1LrwiN9WVocc4Vu2WOhLjgDI0QLVSDZt+?=
 =?us-ascii?Q?BRH9i9mXfMr5bO0tcez/02Hu6Lku2B9cHq87ceByRKBxu3oAiN5KTbUAVjR3?=
 =?us-ascii?Q?zZ0+gLZpXJrHSTChi7XtzD7625fQ139QLFcvfzk5X8vACYs3QNR4bWe0fsxQ?=
 =?us-ascii?Q?vLJXHSXVhrUIj5cY9IgXlU+D29MRcq5+sRezM8VYwadnv8Lhih6ufiuiF5tb?=
 =?us-ascii?Q?HpOc8MXKEF4kzrAub6ItLNHl3y57Xu5j7w1I9hFJhejUMdfvn7F4tUlrH36b?=
 =?us-ascii?Q?SyqQ6KjgwPZXQ1T67+fgrpH+Yh+1cVfJr2YbmtO0Xyk3bLzP05raLA7H3Yx8?=
 =?us-ascii?Q?+xEzN49+lpYtnEQRkOPeMLfMC9y+mBDzfAsRbAJ2GWZpuckQnQsKDvRn9Ekg?=
 =?us-ascii?Q?zMAjY6qQZxyQbabD3wtrdn7+0gMfTG3NVAvbg5A72Inp7M99erkt+9iVNeub?=
 =?us-ascii?Q?Job6K/2DiIpLQVTSKsg8PfbfYGBXC1qPrR7FdZrYxuKfDG2KL801og0lBY2N?=
 =?us-ascii?Q?8dCEO949Zn+lG4ZwtripL6rL83mu+ZZm0k1kRaH9u2zKH26VNisTEh0x3pHq?=
 =?us-ascii?Q?24n8EJVQ2itcxbqkCqtyMNAdtR5MhB+6lG0ikpOxQnniuoRKfZR4SQChRBpI?=
 =?us-ascii?Q?flEqREFRKT1YQdQKxKrMnLEZQDvH0W6h41BLmpBhKWNpnF4DFOaBHpz2sggM?=
 =?us-ascii?Q?9KVoSmnk9gMPcggUdTLfWJ85hZ3kble3OfGQx7YEBFB1DDJ1PDAyGOrylQRa?=
 =?us-ascii?Q?hSTthSTN1TIPtWE7IxrvjxA1wmEp?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e271ad-6212-4d00-44e1-08d93f4173d2
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2021 23:14:19.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++g6ymPhbMD9op1th2busZBGVGO8jNvX3UZGZUcmcVZz+CKcwH6BWm66P54wpJrtVLAcktca/dvO6yIg+BGsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3997
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 4 Jul 2021 23:42:03 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Sun, Jul 04, 2021 at 11:20:07PM +0100, Gary Guo wrote:
> > This is big endian.  
> 
> Fundamentally, it doesn't matter whether it's encoded as top-7 +
> bottom-8 or bottom-7 + top-8.  It could just as well be:
> 
>         if (len >= 128) {
>                 len -= 128;
>                 len += *data * 256;

Do you mean `*data * 128`?

>                 data++;
>         }
> 
> It doesn't matter whether it's compatible with some other encoding.
> This encoding has one producer and one consumer.  As long as they
> agree, it's fine.

I am aware that this is only for internal tooling so it doesn't
really matter. I mentioned that it's big endian to do top-7 +
bottom-8 because Linus suggests that big-endian shouldn't be
used.
