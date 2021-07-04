Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338703BAF50
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 00:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhGDWWs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 18:22:48 -0400
Received: from mail-eopbgr100092.outbound.protection.outlook.com ([40.107.10.92]:34114
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229636AbhGDWWr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 18:22:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtFfLBjPYB9jEJLSMFWtM3GCLiERZhRthc/hukleiguY941Q2LTONMK30lBglYf71WzUK4rxowMX4kQSGJs1iM+6G6vHgt8jrXc4Y19cI8R5uAP5kNgjL1Gmog2rwC/+CT0rQH3K1YfgQPjJ6QWoeni9RC4dSp37VTKw1JqgVAAH0LMTeLE1XEJlP7Czj3z83zuO/Kmr/Kk1ymFOyXrbhuR5kFg2dvpxTAMsi7QSXSpe0m4U1R0EpjokS+IB6vD7lhjMqfzBuSH4WiSZ1Wr8AVCjp4m8ojTe7JHs2cupfNxcCEGN8TQcvhV1bX7HokDJtJp9KF81G04GmTJzrSzS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34aSAlDzGO0FgG0Ppc7OpvLhb4pNdRW5AQZ4KOKnNfo=;
 b=kDovEfJMTHaVxjvgBkjx4wFy/tqwo9jYCA5L+jx6jk2rAdWMnpxLgXykL4zzc3Yrm//WfAzQUWHODA55KgKPFo19sdV03I2g4b20KjzX5nnzM0NpXTg4jcEUhdYZTb4rWhsP9f4Q0uR9UpVNShBz06B232zc4VyhDdE8TRBnz3lsbynCGlUTZKG3cveY71XcO7f15BegbwmSYIzc135p6YmYzjwAaKRj2No8xgPlKf+tHs7CAQU14N1YeQQAT1ECtedITbQ9YqjQXzXF+h2HvRuOCkSEDg0Xfoey1cocWH0lNs8e91Wmv5MEVdJcVQ007ZD4ucbuQ71GMnw73cMKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34aSAlDzGO0FgG0Ppc7OpvLhb4pNdRW5AQZ4KOKnNfo=;
 b=Mmd+Ai+3f+vfK8nPzAG9kzasxdB41119JJrKayDrnzRbpJnGRtGdwJusQKOtT11tsQqmjgjuyaTER8SifKVmJaWHAAjmg1/EudgfwfLW92DWaQo9W6eyMYi0l+cEFSSsF5s4+bHsUHlyQNt/fVSuzEtAq21EmQLOx2MpXJov/gQ=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=garyguo.net;
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LO2P265MB4085.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Sun, 4 Jul
 2021 22:20:10 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::944f:5a46:312d:8099%3]) with mapi id 15.20.4287.033; Sun, 4 Jul 2021
 22:20:10 +0000
Date:   Sun, 4 Jul 2021 23:20:07 +0100
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
Message-ID: <20210704232007.0000357e@garyguo.net>
In-Reply-To: <YOIpM3iFT5roz69i@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
        <20210704202756.29107-2-ojeda@kernel.org>
        <YOIicc94zvSjrKfe@casper.infradead.org>
        <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
        <YOIpM3iFT5roz69i@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:470:6972:501:ac54:3e6d:9d2c:fe4e]
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:16::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:ac54:3e6d:9d2c:fe4e) by LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Sun, 4 Jul 2021 22:20:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb69c7ef-bf4a-4d23-060e-08d93f39e2ba
X-MS-TrafficTypeDiagnostic: LO2P265MB4085:
X-Microsoft-Antispam-PRVS: <LO2P265MB4085CFC814AB8055B3B00053D61D9@LO2P265MB4085.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdNpbTgE5N81NQ1EoQHU4BAkOchF/zRW58wsl7o0zWvTsE5SnHXTNdssGFALRR64+XT1uKmwVkCP58ViSZTzdBKXCCX214u5PqSJ5rGEuuU3gxCEcUcmrou0FGRt/ZaqnjxBJNf00cR4ybPZzIjimaheMdRw9flfy1DKNNJsMi38Fb1Hf3qYq8cLKYGq9uS0cIJaRrSuGvh29+VTgt4uFhesQmF6U2Ocr3rnERC+/SkeAaU0eUaSAn/0IPZMiwmvLDnekMVXnb9g1VqAYXKJZloBbj2KMx1B6FrANZYVJfMtgLUhH6WlKQC5VYxpm3r8YabnmYzH2SWZLDIQl/zX4hZtVXkbz0bMCJGHtbdcBZa53lUbZlZwldrVyosqBy0pCJhlCnIF9YbFMPMzVAl42Ef4ezUFlKr5YFGQ8Q+3t554d1jsQ1wVsvDesy/cDediAv4/+hvMbNyAOHHTbcLU60jxlZy7jdXbM5+fTMbmQyJgZEWlyKsMscDSJttrzmTW4SP9b597SarRYANnkS/N0+221DUQUyfmgf2kuuPRUP0JGgCzE3Z2Sa1zV99q/ophXrddImfFnJ6V+Hxi0vbiTq0+KWjhfLxXlcp+1WgQNvP6GMeE0glkfwMqyYsLQZAb0L1bvtl+wkoELiLmjeubIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(376002)(136003)(346002)(396003)(366004)(54906003)(83380400001)(7416002)(6916009)(66946007)(66476007)(66556008)(53546011)(316002)(1076003)(36756003)(8676002)(5660300002)(86362001)(8936002)(6496006)(4326008)(52116002)(38100700002)(2906002)(6486002)(186003)(478600001)(2616005)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOaBhxyi7Yc4L3UlN9KkxJZSDjkjdrd0aPUkv173IYn3e49R9EzRKK8VT7bP?=
 =?us-ascii?Q?aqnqL7bLdL0iU2avF6QtlEfCPvA/Q7jSHHAoJoFWiFoi+6rzXaj2EAIqQzeq?=
 =?us-ascii?Q?Nxk5xY55tVqxg/u7bIFnIJ20fDKAiBtYWAP8ROcR7I/li6AiadYox/6OpqeZ?=
 =?us-ascii?Q?JSa5LTgXB85vR3fGSOi224mDazKg0pCs4No//TG3TPkkcBy+vYEZ/4A7f2hZ?=
 =?us-ascii?Q?OUrcYg6jr0ZXGL/pb53L1YbOq9PzrV/LRwb1BbLcSzexbKE04SAsSr9Zyw6Y?=
 =?us-ascii?Q?/ODob+3MJ8Li/rwQbwmNmaiaHLL/Qgby7FN6z0gfRNo80kazbqIdxZ+7iskp?=
 =?us-ascii?Q?uC8c8fuF+5/1G75WVzhVA4lLL/at3Z5q+PS3o0i3ZYcn0rv/1kih0zv/segh?=
 =?us-ascii?Q?sxa8bumgIw5aWQ20pgd7NBGnP94KQod/XPUvYRqt6PhS6lfZr2bL68tBfs0Z?=
 =?us-ascii?Q?ndy5Dv/TucU/sVYwoJpGJFHv/Ye4mHKw7yHH34MdmmdUSXDO+Hj9S1GRC/bJ?=
 =?us-ascii?Q?EQwwxAABZ6w5ytipFh9XlBaAKE25zQjsAv4ttbFLLqhpn/QVsQ6NSLyfQTFp?=
 =?us-ascii?Q?Jwtq3j2Pv44SNYMAp7kGvpS/ziGUeVPGzXg2cfLFBOMs6i0DVud51+2orrmY?=
 =?us-ascii?Q?gqcDNw/rvpAj9DfaPSMiGmnMRtoxT17H33lNdI0VhTLh/JYpFvh+P+882AXm?=
 =?us-ascii?Q?O4Pl+/zYX3hJKD1v3tgZeUmoAGOFuDTOb1afyWVww0QEj5PQb8if8gbIyxHZ?=
 =?us-ascii?Q?Tg1rOyNIVclqB9Ux/tc7TfwWSD3NEPIcFtEUyVNYN7q6MtbQkDBzL5UHljkT?=
 =?us-ascii?Q?ck6EWg0An+grEiIE4PoxzGuhpPZmzPomGVviWS6dI8NVmMQf4qljNTQmEMkK?=
 =?us-ascii?Q?hkwrLlgM/fWj/Qh4pPu2055lOCCRzK//MnLUEj20c5RuL/9+AR9cf+py/Qfd?=
 =?us-ascii?Q?XUZv0I6fkx8g1AT4iBpzvtQW30Uwu0zvPgW3u860RiG2bUzDOmnbc3IPQbR/?=
 =?us-ascii?Q?9aBH9Oiq6to30NT2ilbbSeKZ/CoveaSYLrZMU5BFHLbmvPZA2GQylWBqHt96?=
 =?us-ascii?Q?o3A/KZjEOagz0odeGxf0JhK2cbd7KH24NK0LiI9rzvmOmjsXy0k4SC/ixnBi?=
 =?us-ascii?Q?Mnd95VpclU5q+iIJVJ4SCS4IXPttkgmt7Q8CBAgYrVaKbOl2Mloj1uEvQSrn?=
 =?us-ascii?Q?AcA/5YXU9fc+tlM+maojBH0qu3CH3xGC6MwO/iTZgmvz0oybAkzvmIn7H1bQ?=
 =?us-ascii?Q?lHMXmCrMxoaY+/+u0Z+0ztpXUYQUh75DNqCkZ6gtCCRNwIVhRUuoUnokgQLo?=
 =?us-ascii?Q?DDsWcVX+KGoJanyCfQmEl5yPyo9TZmv3APkXa0VyK1J4bs6BXMujT9O6sHy8?=
 =?us-ascii?Q?/qcqVdMgrva5L4MEKDTEusObJ7gS?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cb69c7ef-bf4a-4d23-060e-08d93f39e2ba
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2021 22:20:10.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmiuNmrDkQwsJhadZSslvADCI2SJ9ewT9h+5CjVqg8mnXDLteb6X+MHNU2nDQ/lxjmtTwPQVZF/nlgnbG/a2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4085
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 4 Jul 2021 22:33:39 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Sun, Jul 04, 2021 at 11:17:50PM +0200, Miguel Ojeda wrote:
> > On Sun, Jul 4, 2021 at 11:05 PM Matthew Wilcox
> > <willy@infradead.org> wrote:  
> > >
> > > What happened to my suggestion from last time of encoding symbols
> > > < 128 as 0-127 and symbols larger than that as (data[0] - 128) *
> > > 256 + data[1]) ?  
> > 
> > Nothing, sorry, we focused on other parts (e.g. the allocation
> > panics) during this iteration. I can take a look for v2.  
> 
> Here's what I have.  Build testing now.
> 
> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index c851ca0ed357..0d45a6e5fdc3 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -67,6 +67,14 @@ static unsigned int
> kallsyms_expand_symbol(unsigned int off, len = *data;
>  	data++;
>  
> +	/* lengths larger than 128 are encoded as two bytes */
> +	if (len >= 128) {
> +		len -= 128;
> +		len *= 256;
> +		len += *data;
> +		data++;
> +	}
> +
>  	/*
>  	 * Update the offset to return the offset for the next
> symbol on
>  	 * the compressed stream.
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..701566e01a1d 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -467,10 +467,16 @@ static void write_src(void)
>  	output_label("kallsyms_names");
>  	off = 0;
>  	for (i = 0; i < table_cnt; i++) {
> +		int len = table[i]->len;
>  		if ((i & 0xFF) == 0)
>  			markers[i >> 8] = off;
>  
> -		printf("\t.byte 0x%02x", table[i]->len);
> +		if (len >= 128) {
> +			printf("\t.byte 0x%02x\n", len / 256 + 128);
> +			len %= 256;
> +			off++;
> +		}
> +		printf("\t.byte 0x%02x", len);
>  		for (k = 0; k < table[i]->len; k++)
>  			printf(", 0x%02x", table[i]->sym[k]);
>  		printf("\n");

This is big endian.
