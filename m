Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4673BAF2F
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhGDVXY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:23:24 -0400
Received: from mail-eopbgr100129.outbound.protection.outlook.com ([40.107.10.129]:37760
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229814AbhGDVXY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:23:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsQS7hkIYSsk3RaWYvQo3dHEAqDFtkV6BWv1aVzzH0cWKQNze6/HT+/xS4qwht1RgKJ8g4HILTxpcBxrRTAQ8SzKsWQAAQtyGZoL5OfQcB0ySvaNtfAfPy9ckhXb7Zg3P08pFNrOFZzHU3REX2KQ7bViTtNqPLntPaDOFk4ZwFtLcRAhRgCWneuARVineB+hyUtYf3x0H5+B0g6WdbQkkCBjjw0BKUG+kbJhy27katvWcKCFausZz1u0sL2SYxXJ865XS4PgwySw3YFa/cstTUmmDyK+T4931urCHPtc6VCeyKztO0K1pzkU2A0FhH11T+VOEU0HiXA3ojosZ9buwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HlhU3BpdTXwRWiGCadcDs7Hux7YqjhP6S+4GbFQwOc=;
 b=PZWto3NJZI9nGbzBKs6WO9rCLK3ZaroTtO9XDgXnDIen7Iutbt31BWc2Wh69jDo08FBIIY2jLFDC/qaI8aQT5HRYg9Pf0zyxCxY3c/wq6Q0rWKzypQMuARE+YXB86qreEy1W8apt6FeTffRrxhdlcZ5YPu6TOwXX1frmoYaC1PsXsA6cPaDyvUe2VZHwxVz4yF0ZmrDGAj3bbk2b+vOBMykb4FZ7EhNOa2FohBGP/U9ZxXjaeytmDglLsGn5/TKiO3CNqUqShYw79VddOv8TROxOsF7H5JTPswTYCvoc+thBHI5kMbho6R5r2iKNYk0jDRHadzFjZvJUA93w/OTylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HlhU3BpdTXwRWiGCadcDs7Hux7YqjhP6S+4GbFQwOc=;
 b=d+3osRrs3cC8D3xHYFUhPncFzAd3PM7nH/Kq6o9RD41odaGhHGsFAZKOvBrIdyNAf2ofgUEBl76+PLzen/I95/163jlQ104e0mnLzwXK8gbdajJ8yv9uUgn02P0LXZ5hTKecKTb3RO9XIbhqY7twpPqD3oXWQHumuiH1E7XRjMc=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=garyguo.net;
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LNXP265MB2555.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Sun, 4 Jul
 2021 21:20:46 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099%3]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 21:20:46 +0000
Date:   Sun, 4 Jul 2021 22:20:43 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <20210704222043.000026b3@garyguo.net>
In-Reply-To: <YOIicc94zvSjrKfe@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
        <20210704202756.29107-2-ojeda@kernel.org>
        <YOIicc94zvSjrKfe@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:470:6972:501:ac54:3e6d:9d2c:fe4e]
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:16::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:ac54:3e6d:9d2c:fe4e) by LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Sun, 4 Jul 2021 21:20:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed65cd6-5289-4680-028e-08d93f3196ad
X-MS-TrafficTypeDiagnostic: LNXP265MB2555:
X-Microsoft-Antispam-PRVS: <LNXP265MB25555D83A3D85FA9164D59AFD61D9@LNXP265MB2555.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2MCZTjU9jxgFtl8IgaxJqfce4Gj2bFby/asZV1OFROyNHestmH0sZroFhsX6IT3Ox21rMkq9zX7yBFqLaPzMIws5tIx1ZqzDJzCadSyyDA/PClh/udzAssJzd7dWvIo571mKBxMxjdomQQnmA7ZoNX8APLtp4PKelil/dF6UB28N+jdSygLQT0lqH6ABcqECQEeBiXg+FxQFhYvtpyeB6DvZZiolc1bFIVtOi5xMdOlc2lcPEAcKOvMNF7h86jLZgJextEjRh9denMMpXh2nFwM6pcMAqR/RXqupDYSDsRodqurmHWmhOL8pI2j+DhK5TtufS9ek7cRVdWjtDl1zXp4ngN5lp8hvYwplVTLFVOECT8ckn9aJ+Kk5/eCY2iYvTUF/jmhsvzKqo6gWMHPUKb9S94JDvRl+rYy4xDE7xbeycxlJBlWoqUKwPWhcWoP3S29pWaUE1SBZc/BZnaquwqhAURBjI4nnVQa4iqbEY3+/jcxj6J9LB/84eWpWSrlvFCaPBRLIm60bjjjXLhXqmhIAgQj83i4nGWURoHUDppq/eI201+qFzILTgCFOwDw6OTiPrzkKL2+WjL/wAHQbIjL4yxSLO6QGvN5PwKrMX7gOejXVATW0oK0O0J9yBEpPNO59ObmNXsKDLdqHg+ZZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(39830400003)(396003)(2616005)(508600001)(6916009)(186003)(5660300002)(8936002)(7416002)(83380400001)(1076003)(316002)(6486002)(54906003)(52116002)(66946007)(16526019)(6496006)(38100700002)(8676002)(36756003)(4326008)(86362001)(2906002)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AfWXdWJGtthDEEmCQQnlI76zszwFhcoMKQO7dfR14YCpjYHCEmFuPiRU3C5?=
 =?us-ascii?Q?VA07SlbCOxDZu4tzrvJHFddm6Fz0Sko2KtNtmkKqZuV9ZAFpjksKShXIo9+a?=
 =?us-ascii?Q?DsQ7/CW/4K1UuNsnNT6zRBOsRilg0oaBwkyP8cXZGcBTQM4Fz5K3phCI4q91?=
 =?us-ascii?Q?AvzGdXvwu8ZUg1Q1J0fWcmkq9nC8s1bq+apm++HeWbvJgmAgbDDen3sVWQhd?=
 =?us-ascii?Q?MA/khBqHiZe1O7gdee8xTuNN2ISm3vAzPPXFbpWpnPzgoqFl868HEoUFkpKd?=
 =?us-ascii?Q?/mAQ+vY/z8jIljPiUgWahfrKa2efgtR8wFFPpnc3KTQQLC4qnEcSAuyNdIzx?=
 =?us-ascii?Q?2CvhOxX6RkKbsijFMpnp6YcCqE44CLrEJ1mc4EF9zoNfmwQmbrmo0kv5l8/H?=
 =?us-ascii?Q?sSleoZiBstmTWhMzu6QtW8c72wyF4ytTYjxfvstGVqsRsu3hRHPQ2s9XzWMP?=
 =?us-ascii?Q?z2cGp9Zl6nHDFWPxeUlMx16/6vrZwhTQ8/fiksrtiUnrW2+HY9Nh4MukiZhp?=
 =?us-ascii?Q?LsOi+9RfNzAfVqsEy/SQ/1rZH1IFTlJo9cWdno552iB0aOb+wa8bNjldcOTe?=
 =?us-ascii?Q?iEhdU1q+jUUv5ORu80jtx+h2FyPrd+ySt91Yi4Q5zV/g4XB0jEJKxLpLzQCg?=
 =?us-ascii?Q?v7LJjiwZO8YAMYz1hYOCrwiVDmY/zwnfvncP8C3L7Jd/D/ts3g/33lfjv1Sd?=
 =?us-ascii?Q?Gjz7sNGaAvqQkoXM9MPcLSO4uv9EBm1g4rCgam254cKhVXepmOZlzn51a/wz?=
 =?us-ascii?Q?EbjYHJ9mTb0v9ZY1aKTTB4/m1Y7s0KFJwW8g0DQJx8e4VTLHpO7qVaiXTPNB?=
 =?us-ascii?Q?9JDv2P6hqxcgqt9GsLDoad7VUKMEpF/4mXZ3nv+tNStplmFPkRhCIwAnFs6M?=
 =?us-ascii?Q?YDGcJH0Q7EbTmw7yKVny/xRgs8JZnq6QTVN2dS79WNCdcfN5oyUSGYKWVZgs?=
 =?us-ascii?Q?/8cAlmGrhnYyW7jdXdLj9VrB88414n+jXXkjSNGHyeHPEJLt0rW80qmSl9Hi?=
 =?us-ascii?Q?4uyMiEZesQ9EgBIIE93y/kkUMPQwMPReF/YR9PU2962mL1OQLdXgN0og+cSf?=
 =?us-ascii?Q?uOKJpAxN0x4ruuC4D0ugkfbgzPoWvMX5jW6dR6ZgXau4cVdC7n50VhQHDXFt?=
 =?us-ascii?Q?KhhYQ+mJkWYarqQcbTbw1FVxcVVWoOwgpzb2Im5ouTdRmQ2zAk3vxNewEMif?=
 =?us-ascii?Q?1uIi7nFVSr5ycTnj+Mkxp4UmHSxgJSdwHSj3uMq1zqjbY9ifoWLazFFZtFID?=
 =?us-ascii?Q?ZDuQVDai6/GUSILg+2CB/cyD0t+gorysSSo8jDiU59+ihfRUZaWr9mhkIsmS?=
 =?us-ascii?Q?DbCVdjiiTYiO6xz4I9aw9y4P8tObyOML3MfyvnK49bs1PkX1OJrWWO5nZ5YJ?=
 =?us-ascii?Q?33f5gpjX+1RDM/0KDeJOenCZfOof?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed65cd6-5289-4680-028e-08d93f3196ad
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2021 21:20:46.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He4GUwlWcEaT5qpZIRjXF1nxQrZeuANGTKdDaaZ/7SBeJMevUk6z3bN8iHGoLHEsh1TqrcY4NXRpzAewMmGbMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2555
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 4 Jul 2021 22:04:49 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Sun, Jul 04, 2021 at 10:27:40PM +0200, ojeda@kernel.org wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> > 
> > Rust symbols can become quite long due to namespacing introduced
> > by modules, types, traits, generics, etc.
> > 
> > Increasing to 255 is not enough in some cases, and therefore
> > we need to introduce 2-byte lengths to the symbol table. We call
> > these "big" symbols.
> > 
> > In order to avoid increasing all lengths to 2 bytes (since most
> > of them only require 1 byte, including many Rust ones), we use
> > length zero to mark "big" symbols in the table.  
> 
> What happened to my suggestion from last time of encoding symbols <
> 128 as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
> data[1]) ?

Yeah, I agree ULEB128 or similar encoding scheme would be better than
using 0 as an escape byte. If ULEB128 is used and we restrict number of
bytes to 2, it will encode numbers up to 2**14 instead of 2**16 like the
current scheme, but that should be sufficient anyway.

- Gary
