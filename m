Return-Path: <linux-kbuild+bounces-5729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E2A321CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 10:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BFA0162814
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C947205AD7;
	Wed, 12 Feb 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dOKGjYSs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7B1D63C0;
	Wed, 12 Feb 2025 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351363; cv=fail; b=gdi/0L3f2Of6s2RWc9wIphAZokLDNxlCclUfqoIFIRgrbK9UnaeEALBZwd4pmXtELlKV1nHaUeHAnH/+fMMV/uOw6j3fz18HWv0Dnh3fGZRu1skhOXi1bMwvjgLaNbYGgt7dIfLSN9XQtPBLlcUO2n5smZscIiaKNfGQ7F4OlW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351363; c=relaxed/simple;
	bh=tqXEwncox18h+mzT14Q6JsnUGrNZuylKzR2pSBgOX8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZmqRI/xa1gjJSntQWZ2UQdIiWw0cDwlo0mJrad0gQA7w/zOoN/PAEG2pikUKwy8mQZJchdQALdyXpwzjZNw2zYkuyPJNhWlW4aIBCnDV0/20qe37Ev5xl3u7erZuGnLeQXd2QSAGalsGyYoeUieDCeoDf7XncRonbM78SLi1Ho4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dOKGjYSs; arc=fail smtp.client-ip=52.101.196.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDGppGesip8W8YGelfdEW/rzlKEVFz8y35hUP+Q5rb9b1eSm7oJuWXxJB+KLmSMEchsGPE2eoao+4Oy5OLxenHMMXnOkkywtuIvsDoWgv32zSax+esN8DAOFSnxA56bjySUlH+JPg6Ex4DbJU4sZm/QE7PwwBSDLb4olYbz0E2SQHZ86Hb4bNGf98C+Bb4CNdD9oZS0CYlGnNr3ukPpcsWFOwyMJensQViO9oWZ0tQG4Z6WwgnSSAUOYb64RxZpAGBALgvWo0+GQz6GkaMqQdOLqO5W6RgmKrmbw8dgVI1WA92Ls8Otd+vt7bEPEozNMDmg3Q/JTPrQRka7rxL8SMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8w6ykNgMgbDA17qshGJ9/28qimeZaVKJeepfwK6ZAs=;
 b=YhRDeoYuqqKeCZDKuEdAAFoQY6XMMUJ4zqc85DGyNLcECuZ+86jGVd2yNVs/NU/x/vk2AyhhnIuv6d6Zn3a53oluHrncXTPaAl8wABVbQLfsamFqidB/CkQgl/y3OmeAGBanRKVYnBc0EzYhOZyh0dUnCbO1qprDPu3B002lVrVI4UGbGViKjpaNNd1ocAZmS2CGL4zeuZ3Jf9ftDff99nr+OoCBI0PvyssSmvCu2IcAsc0rOm/pJwaUQUFEp48c1laUybvnkB+n1YXsTbVrjNcWzPrQ4Fhmv7jEVJmn+cr3E9r3wyPyg8T8VJ6YBTcrvKBAHMwXirTksshQyv6KEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8w6ykNgMgbDA17qshGJ9/28qimeZaVKJeepfwK6ZAs=;
 b=dOKGjYSsAHFiOGniSTjE/9/sU2A6fOlvwxg0jlFkPTTbWULtwhqYGPhKDOqYANtcmBHydQeHswy9tAMd2bG9D4Sj/aox4HoHdE3/zMARQeGbWNHQb1ER8XbNTfqJSMQhdcf5tYqCXUT/rYeQVqHqgHviD17NU3dwLMOtgsAjhCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LO3P265MB2139.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 09:09:18 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a%7]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 09:09:18 +0000
Date: Wed, 12 Feb 2025 09:09:14 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
Message-ID: <20250212090914.6ef7e83b@eugeo>
In-Reply-To: <87lduc44c3.fsf@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
	<kW0CDyK5M8DuLPr_1HwIXcnVP4x8evlFoq0BOjldchTZqkGiqzNJ-dtpV7s5QHLbbmm6cW529GeDTo_GoDKfdQ==@protonmail.internalid>
	<20250211164004.6de768c3@eugeo>
	<87lduc44c3.fsf@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0646.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::15) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LO3P265MB2139:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2719e6-b489-414d-7903-08dd4b44edc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jMuE3le8D4zNCUAs2PxDeaTGYZO6fLJqHfkDn5KuiGU73UFChvKMgDpscBRk?=
 =?us-ascii?Q?2yqL+nLbXMhRYXic4ySI9FBO5Vwdn/e/ArdDE0H2Han+iP5u40sg3G7o/9qW?=
 =?us-ascii?Q?q2LcSUffLUwfZcjQ3YdDySCo2FOXPaiEe5d1WLAorEnJcgblAKAknxFKX8P7?=
 =?us-ascii?Q?V3ntgNgDR60kinDeU2ZWSuRT3PMDuW5c96EeBjOAQ0dDKlJfFUj7cCrBarKa?=
 =?us-ascii?Q?xNKHKx0wksOvhDUwFcU7kfeQ2zCB4zC4VSeqksP3IGYAmHzfJD/Hy9LEGS8b?=
 =?us-ascii?Q?jK1IC95G3cmwYGBwfDYakhK4GXrSiRqWJv7+UF3Jh+ClC5bO6+MRr9a0GxeG?=
 =?us-ascii?Q?TzBD14XbTc9Tqsz6T+988fpHYirvg0kMrL/88uJfmsXgtwCGboiL4B9wXwOI?=
 =?us-ascii?Q?XhXKh88UNOFAKSs23jXNF2954uE7TyDLJszLSO/IuhnBr5uKJ9PHdQors+sx?=
 =?us-ascii?Q?dcKvtU9cJNFOkwJ9cYK2pntHSabopW4C88L7mv6fHYr66yjN/KMTB+7rwhId?=
 =?us-ascii?Q?sRKFyzuv2/k0qJNEwhrPXp9JNBR6afoRLYX6r4aP6YSdj31jj00ykBuzVdXc?=
 =?us-ascii?Q?uWNa1WXHeQ+HgZU+NyRn/AK6dWizrD8SJQhdPAT+Ofb+hhsYQ19C6B/W+zU5?=
 =?us-ascii?Q?z19chrqWc+JxLq//hSECswyJKbPIJ1pgHSo31K0+s0NH79FZhw+rEyp8ppiT?=
 =?us-ascii?Q?tRlrvJF6CfmDMUBlz2LLEL4qvH5Knkbr4zjXGpNS8N1g3MEqPO7ygsPgX0Os?=
 =?us-ascii?Q?Y8Nz3qR5w2mSxmu9NMJmYs6VeHr1B67V7XbsMIGSdnFuHY2v0CaJYyKSZKh0?=
 =?us-ascii?Q?KT34jgfXO9KGn3OdkqyfxpOPUVPTVdMucIrLCOU2tXQMT/yqDDA08g6Ez50P?=
 =?us-ascii?Q?ai1xssK6uynLjVspILZLXtCE97Hah+CEkrCcvBJkB1JdhixjgtGHUAxr5MSQ?=
 =?us-ascii?Q?qUF7QTHRFAMWH9HB2JWNUg2FurByfNF24f+QfZxZhbjrchX6fJHBGfR04NN4?=
 =?us-ascii?Q?UkQRLYO45tAiN4dpxOHAZewe/RdHdpRyQ78aG9CfzgWKwbIuPpmY48ugGkL/?=
 =?us-ascii?Q?oz2YBHUcXVoucptx2UMsNqHhxUkYYFpN6pnnCuTTjxycAdrCz/rR3n9lpO/K?=
 =?us-ascii?Q?LKspEzM+xzWDGFRx3l6j4p2lWpoMJBrZyJ8oSfO18fiDdfIK6MOjpUDGCwCF?=
 =?us-ascii?Q?X+oIZjKXlXf+plUINk1uyNk5Sy5LPtjLJd9Y2bB/4rH82Ygpc2HXQicmXjSV?=
 =?us-ascii?Q?E6nGyZN0CJqbcMUQG3WWhOgcDcHNXCgmFUYr11l5loGL21De3YtDsuPxBoo4?=
 =?us-ascii?Q?ihgObkPFLgDoMoqzMH3VddgRc3NFssaEA+g6p9B2fnTIOIXVNZyU/qNShCQf?=
 =?us-ascii?Q?C8d1yn0tKLlntuqNs1L86wsOrJOH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qmwMWA1oHH7PfLFcR1dfiCjgJGyTHJNpSnTkhQhl1rPZzFalqEdQvOn/DMv?=
 =?us-ascii?Q?kdPE+WHqcXZrB5f4YVWHJTMWTZHE9Lo0m9XQI2eFZVbfTJnNuDI89Zpyv39f?=
 =?us-ascii?Q?whJwlx3ZUdGNbgRS/o/ltZiFeaPhL7Uj5yH6XvOdr+6qQTBHWyINwWTweoqE?=
 =?us-ascii?Q?VrVvDd+QMyD5cIWn9n0p55U8/LSitRV9DGTKW8Ha9PzbCnEds4pyex5v+6kP?=
 =?us-ascii?Q?YhDasqiEwZ+t57uptwNnYxiAEgdl5gVrd8lk7qIuXbpqR5pF7O1FYoTZtlBt?=
 =?us-ascii?Q?ms8bn52ch9pKE4nFPSf9RrkC9hEYXkj5KVEyvZAqq4UCXQTQTpyYiRROfkwg?=
 =?us-ascii?Q?8Vw+B8/I6uk27P+aheszRGgOYM3OeDgHJbVAoFIG46+PEk8uNiZkcDaQU7PX?=
 =?us-ascii?Q?gcLGc5z+mGCPBrUT+5CExW1s9RIcM8sGJusnxBmpsD4GKPL6W+0cSvdzqmz8?=
 =?us-ascii?Q?rzhM5kRSzafLxfNJ9+sjgaCojEofS3MpmyIU6CePLl5Sp5JUjeqoDsnHhEIv?=
 =?us-ascii?Q?BEwYwbwuB2pK/YBP5q/qq2Ncd+MszcKDoBCMiQIsp7D2SmgYmgQVmAbozdtD?=
 =?us-ascii?Q?V+CgWpT0wlZqcciekthGYi0aGHOwoIvmqYu5l3w2r4TPm0XBLapc1JVlFaDi?=
 =?us-ascii?Q?rtUCDTI0f1GfZN2knWdT3Nha4+oKmwOzKrYv2caxuGLHJwpuKe6M266Zy1q+?=
 =?us-ascii?Q?loAKUUXS4aKLJV6bTeZhZ1c9iuW9RIy4OrZFmnsE16Vr8lgpoPPQqERC1QCc?=
 =?us-ascii?Q?DR1JjKHxOMbLDaTHmITRjLdihrmeC9IWV7/2JxWsC9oM0ALuq1C1ZZz1qVk1?=
 =?us-ascii?Q?SVotwCqcaYUEyRxgd3ZfU0a77/DEEhrn1k9+lcdYYSJdJTBQ4t8cOFENweWk?=
 =?us-ascii?Q?5pzMKIrR4Z4bjrLgpMlRJKwNcbrgLc30yX00iSzq3ALjzsUwy56hC2wBcYAH?=
 =?us-ascii?Q?JRZvSe1uqLR1oZYHLuYzzSOL11FguUhwyilmAeBv3tY39J669M69sLRpJwA5?=
 =?us-ascii?Q?FiVOCuvaSwTdIwCjKjmNiZYcYjcfNT0ISJ3iF3V9coCaOeVedVRWjz35b7O0?=
 =?us-ascii?Q?w1875PnB+/zR/24JtIIiqbcfF8MUmXHQgpTZFl1YIneVQ1pZOKi5+GgC8sDq?=
 =?us-ascii?Q?qxuPBxd3OG6Rnb764tpBYxLAPnWchTAI5ocuixHxhRYN/hJA/tomPSRxKg+q?=
 =?us-ascii?Q?1ZilQM8R8P9Q4F4yQnW8n2F6BtUAkFEmEZJBryfyu3513SvQ4s7XC5wZpPxN?=
 =?us-ascii?Q?ylnO0p+S20a+NePBT88my9dKErAsLCS6uuN6fqhDyA3HXKTvqXG8vpcO9j79?=
 =?us-ascii?Q?muh0cyq5d+FRVfgLKLWvz29sQMP9KbJoIfqOatbSbuCAjjj7zEUk629gAVl4?=
 =?us-ascii?Q?5PgQifSKCQUYrmMiz16XHvLPk/eZmo767Q0asazMBd8Nf/Y9yGj3HX3y7M2d?=
 =?us-ascii?Q?4MeWXo1IffaI/eGsxZSHW0JjDT9GpIlF4G007dCCVHs9bYmnfMru+d/UxO7V?=
 =?us-ascii?Q?CBKGmKqixdnib46k0369N0kEEDYvGYIo1+Rbfcjh2foEXLr2uXSvVTi57WWs?=
 =?us-ascii?Q?JwDav3biFRv/iwU9oS6UalwoFkuljh0fQvquc8+gENCvJDpjxK2SjHVo7JTs?=
 =?us-ascii?Q?akyNXqZ5gZQwi82EqaVLBVSRxhH0tL4jcoJtPtTILU4u?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2719e6-b489-414d-7903-08dd4b44edc4
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:09:18.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilKmr2fP8hc8ytr0JfnY5CPPnyMt+XeEKjpzVoG/vPrNqZjidnJhbIp03Pqiw120JxkJ8h7+R2QPakmJG1ogtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2139

On Tue, 11 Feb 2025 21:24:44 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Gary Guo" <gary@garyguo.net> writes:
> 
> > On Tue, 11 Feb 2025 16:57:36 +0100
> > Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >  
> >> The `Index` implementation on `BStr` was lost when we switched `BStr` from
> >> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
> >> implementing `Index` for `BStr` when `Index` would be implemented for
> >> `[u8]`.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/kernel/str.rs | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> index 002dcddf7c768..1eb945bed77d6 100644
> >> --- a/rust/kernel/str.rs
> >> +++ b/rust/kernel/str.rs
> >> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
> >>      }
> >>  }
> >>
> >> +impl<Idx> Index<Idx> for BStr
> >> +where
> >> +    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,  
> >
> > I think I'd prefer
> >
> > 	[T]: Index<Idx>,  
> 
> Is that equivalent?

Sorry, I meant `[u8]: Index<Idx>`. This makes more semantic sense that
"what ever can index a byte slice, it can also index BStr". This is
also how our CStr and the array primitive type implements its Index
operation.

They should be equivalent as libcore does

	impl<T, I> Index<I> for [T] where I: SliceIndex<[T]> { ... }

Best,
Gary

> 
> 
> Best regards,
> Andreas Hindborg
> 
> 


