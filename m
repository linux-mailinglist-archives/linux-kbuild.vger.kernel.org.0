Return-Path: <linux-kbuild+bounces-1278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D588871C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 18:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D562B2422D
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 17:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE705D752;
	Fri, 22 Mar 2024 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="J7K0MSC6";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ETdC6JzI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A35D909
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127673; cv=fail; b=TyMx6ZptYzh4RmdG4jjN9r9i9ixZNuo7Z3TRzUG3FROsuH13oKkv36S2lYBHVMOByo8qenJN47XuBSTdWjpRaMyArPXSqbTvKzYO92Bac1ev/fbMMR22+AeM4t7fQXsLNaz5tx4zJpWC9rNwObspWEqHCTxf6GxzDCU212Jleig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127673; c=relaxed/simple;
	bh=V5LvBcKG4veAf2QmQDMbOY5tYYJ6XypxMbGk/a5XawA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HOvth5EoHQnbMHmYX896lzgr0VC9SjMpbdHhJyHPlZx0JGZg5x/4GlO+5PgJOcRHpL4/qiOLkhGJNDyK4IoVXi5HVkuXCw6wtMOjfCj0p18J8snLH75QfaTNCNYK2mwFpDKUe6t3NUcY/DEV1OM+CqQ/aZs9rvyZDY/PGe8L6vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=J7K0MSC6; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=ETdC6JzI; arc=fail smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42MFj2EP013258;
	Fri, 22 Mar 2024 17:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=dk201812; bh=O543v5AmOHvGWzkWF3Iwv
	qfJdO6CqT3GdvkDNnr24GI=; b=J7K0MSC6iQdn3gE+eZBpZCQAWKxK9FEQ7hK56
	fswQwj4gNbJG6UOgQI2NMTuifVr0kJ/CFbEURD21riLjPaMnaRKaJy9pzKxaRPTP
	/t6JYP8Np1OTUEtgMTjWgp49tEcNlrOuoDekwXd2fB4AUsK+aXq85mwo4PZeG4lW
	tDLk62vgmXlGZldEkfLpJhiz2Lz1Xq05/qKRWgoJzD/VWqhUFXwlZ2t9Yi1zvcqW
	0O1ZYtXC+0jRqqbtSQaw8PdoFjfy0zaNLHg2V44NmW8Nb1c4inVzuloG8h8N4ZED
	cmgvtDTgM1tghf8EXmx3Lt2wJl/NEWO23GAzab0KFy5U9gYsg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3x0x2huaba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Mar 2024 17:13:53 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 17:13:52 +0000
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.6) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 17:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkYvEXaEY4plEJofgueL+utjAngZRtrN4o/ZqWeQHasCmX0ZpjDft7cxiFHJKrfdIpULDLZKrEKEnWHY73s3uFIwcIxYzOStgkpLRcv0HalzdgWrLDP+yivZkhZz1qtyRAVGHVcLaHEEyv1PFncec9jdd5atjockxfF7La/s+ovoi9L9466J5sdMmozlZFW9cHF4iaypuoDseZ/7UI/hsP8qnxsARqphS5WU/U2hCj3tfPABJsDxw2AkbFwChwQmX07tfBfgaf5a+JZg5WIEv5c6AHYh3EwwP5FZ2MM7KDu1KoPTRx+E0QJyQdP5BnXKJEXXA8EogzolSqpfJmiEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O543v5AmOHvGWzkWF3IwvqfJdO6CqT3GdvkDNnr24GI=;
 b=TAIg2l+J8PPsWUVyBwh+R8pI5MauNgI0aORgA3sFidr9BUF2cN3MGtFpUB30b63SE5Quy2z+C2Wk0LbJtSRNSSO4DvO18uLr/xd7vA4Go/oW852sz7Kj5MfpqrZfEAcCFY4sf0xCPrb7H0iSiVSRM8LLE+ZSdItIaj+qQW2rjm+rnBMXssnTHsrpyznn9SSiblYS/ciFj5tZcERDz9TE2PC8gyxCxNYyM1ejMHmy93hZ6sELbMs/tKR1t8Zp4UWzUlgbZUTBrVY2oc6G2n+Loz6eaXRgHWT9yixuLWW4E8VtIP2f7ABhM25INE/1uSV8LaNgdheBCgUz//M15DdelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O543v5AmOHvGWzkWF3IwvqfJdO6CqT3GdvkDNnr24GI=;
 b=ETdC6JzIOBZLYRnqYBhuFsgQJDnwUd7hOoj9nLt9UisAmGSIZzz3155I2sljTdK/1xA0zG5ZdVw8/OLgX8Ldb+pRx4DiO3H6PFWBApPnDO5ExdgfJYJbJpyklRJthLpsobOf4vGYM3GwI844aFyRIRJFJBE8Nvd+wrbF8KGC9QQ=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO0P265MB6069.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:288::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 17:13:48 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:13:48 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Carlos de Paula <me@carlosedp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Topic: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Index: AQHae4ckMsPcRLd2wk2AKuUd+eKAXbFCVfEAgAGrmoA=
Date: Fri, 22 Mar 2024 17:13:48 +0000
Message-ID: <e54d4b76-8ff8-41c8-bc43-3038c8ef17e8@imgtec.com>
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
 <20240321154320.GA616931@dev-arch.thelio-3990X>
In-Reply-To: <20240321154320.GA616931@dev-arch.thelio-3990X>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO0P265MB6069:EE_
x-ms-office365-filtering-correlation-id: 5d4abfb9-f2ed-464f-4b77-08dc4a93700f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrJx8cleHRFjN4dWK248EBVS0wym8PabAUxKXsVAab6ns685UQizq5DarYMa7/di+qQqfl3mcHL7YTrzOQ6Ndj1FZkfrXAmGVEJPWlCTwQRHOMKD0JiW+f65Pf9xbRQKnoHDZweWukAPwvuCbt56z25iGavCecZly/cCsqpO5vhDEckykkwQYAaRtFLJgaKL/f5khtkNPJq8+Z/wi12ZMgDO6TQbLyL1+XLeKLL60PETLsPGDLQPeEeAIlFvwHLZziU54ql8P+L23GY5uDz0gdrBXD39hRw2QIurWfs7LqLVVR1bwM2MDyQkMRSof6MPMH2j8PWsyAQbyJh+zkUpawHBAfyrfTMsA2lY8l5JBwSJXO+Wy7ZHjnWHiaoeI7ZBkDFjr1v/jZZP62nm0BsRFniTverm1wiaSASOa6vjt/3sIt2PtsTG9W7vO1SSa0Akgr3aGh/TKMddk83Ua1PIkMwPdY72MKRvp02t4I0qCMobuj4mSalgScPDBJUjYCVVpVKrT4/FcFFnIl4gN2EonELt2glPz0jOxxaFENehkZLlAlvBTCH94I5ebyPDXluKT87Ep1KQiQveUR7YNwjsuL92/x/dr6PTRnqo5DViGvVnJp3B7WOmcQ1CpzK2n6nZRHId2OxjWK1mwn2c39km80PK6YmNbdUKYMls3ZB8myz77Am8asf0D1pH7H3c5yWYsheOR6EvrE2zznE1fDhMAPpZyeaxIdRQEaE6+XripfU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHpwSU84dkhXakZ5TzJXOExMbXR2ZDkyYzg3ZXpJOXpYZzRnQ0M1QUsrd1RT?=
 =?utf-8?B?Y0lnVlZpbnphMHkxbHVtWjVkU1M5QkR5dWpldWt6c3ZvWGtTb1RNMW1JdWxm?=
 =?utf-8?B?R1FCb2dGRzRMRE0rOEhHZUhwQ1Fiam5SbS9ENW5CNDZQYXBhRUdXOTZWMGFt?=
 =?utf-8?B?N05zSkNFdkErUXZEVmlzaEd6c3BvTW9hdy9EeGVlNGdOVHV0WUdSMVhYNXhp?=
 =?utf-8?B?ZURyb2N1RE1ZWmV3S2FQSXZwaFRmQnFCQmFGTkZDRmJ4QlZzdUFSdFpWV0xa?=
 =?utf-8?B?Vkg2dklSeG9RZDNjQWhhYkJhUVRyZjNKVzZITGVvODRNYWxuQ25VZ3hEQU1I?=
 =?utf-8?B?YUFYL1BFNTBSMndITG1RaHVQS1lJMXY1U0xMT0t4bGNYdFVoSXVpeENOVVZ2?=
 =?utf-8?B?R0JUMXJIekN5M1NKQ1E5eHoxR0VpSWgvdUxZY2VKbXh2Lzl4bWNDOEVOdk4z?=
 =?utf-8?B?R0p0azkrNnozdTNyKy9DbEVlUDNjcHk1L0EyVjBTRjdyNStnWU5vdDdyZ09s?=
 =?utf-8?B?U1BMQmFyOGRRYWdXWXJhZ1MzU3NuVlZmTERSWUxJS3lCbmZESDUvTi9nd2pL?=
 =?utf-8?B?M1VDMzh0OENjQWRJRVE4OEhOaVhDWHJvQjV5MHJpaUl4UHV2NndmZTNpbmFo?=
 =?utf-8?B?NWlSV3ppNDZobFpXSHVReWxsdU1UNzRMZXQyTHdrRkJxckZWZkVkWWdLRWpS?=
 =?utf-8?B?M0pYdTNWOW9pRHlRVytQU2ZwWVFVYjh6dzE0R2NNeFlNaUtmcFhDNmxpeTBu?=
 =?utf-8?B?TUMyV2pYZnRjVmdPSlloYUptWkRUNHREc01TZ0I1bDlYblpwQXBiYzlPWkY0?=
 =?utf-8?B?dkdYVHpNY3d3M1JXMEUrYzg5UzdVcGdSckVZWFlJYkVtZnpkMWd2bnBSQmhq?=
 =?utf-8?B?VHNPN0Y0eTRER1krZlhXNmlBM3g2bUdhenBrYlVVSVpWVnVXVWNjc0hTdWxD?=
 =?utf-8?B?ZkJlK3l6bW5SdXdpcGpiazNEU05OQUVMemlnM1U5eSt3cDl4NTVDZU81TFZw?=
 =?utf-8?B?clNocm0vOVowNDFTZHlINDZTUlNTYnNYaDdrWW1Jb3VLcnNoR0NYOWlRc0xi?=
 =?utf-8?B?ZjhDeS9lT0xhY3NRNmF2RTlvdmNwRDFSdHM1YkE1bEJ5TFBRYzY3aFh6c0NV?=
 =?utf-8?B?Sm8wMEsrM2tSV1ZzWkpnSHRYcjR2V1RJeWFueGQ3a0dKeFl5YU9aZ2JHOWpa?=
 =?utf-8?B?R3JZSy9PNkszSFJWN3VITkIwWFJSUWsvZzhRWVN4bDN0ZFlHV2dENjMvbGwy?=
 =?utf-8?B?REZXZnVNS2dPYms3SkNVOTZQNnJIOFduL2h2MUdlUTJxR2FQaS9wOU5laU5P?=
 =?utf-8?B?WjhjRy9jNXY5aXpyYXRQVzl5V3BuR29xMHJPaFlNKy9GNC9pQ3lsa0VXRnVn?=
 =?utf-8?B?WkJBRmlPZGF4SHJiV2VhdExCR2crc2xIWjhUdHdGVkZZWCtZR0Vsc3F0Nk5j?=
 =?utf-8?B?QXVuTm9sZm5teVByT256REp3dGJzU0FkZFpuRUJnY3dhSXFEVUdhOVpmWGFO?=
 =?utf-8?B?S2JQVXZQN0RUdXRGR3JFSnp6V3RvTGYrMHpwQlh3YWdMdWRFakJpN2xEcDlv?=
 =?utf-8?B?RUNxdHdKQmFqTytucGpNVVZEdHFxY1kvL3BZNUJHQlQvaG5oZ0V3c1FzaDZU?=
 =?utf-8?B?bElmL201N0VhQWhOb3JCQk00U0s0dnBLQjNPL1hLc2pjL3BtQjNEeHlQM2xH?=
 =?utf-8?B?QmV0QlBiZWp3a1U3aXVRVnpHYnFYUVdvWUs2cjFlWUl4M1ZjZzZhYTNEb3Iw?=
 =?utf-8?B?c3g5c0NyOE9vb3JkNVN6cGxZUVh1R0FpREFrbytqenJMdkdRSFdSQmJZbEVa?=
 =?utf-8?B?Mzk4eHhmNzZycENsUk5odGc1SEdwOFhubzZzV2NxTEJrbUxDdFBEOUZrVDVy?=
 =?utf-8?B?Z3k0WnFxaXdHbjN3KzhidTlwMm5Vek5RempsK0JJQUtVZWtUaXF5M2dSOXNM?=
 =?utf-8?B?WTJFbXJ0cjhJaS9aNWVTZ3RvZHZ4VCtVWnNsWnYrcUNMeVByYnF4VGp5SzJv?=
 =?utf-8?B?UXFxLyszM1JHSGlsUThBUTdPdFY3VURORThNcE9RejJOUDB1V1Ftc3AwQ1g5?=
 =?utf-8?B?bzBqcnBkS252ZDhoWmtQaXZVRjhMZFVkY2dtU0lNcVlrNWdRRTcwL2ZzaFhM?=
 =?utf-8?B?OUxoMS9wRTYrTGtjZ2lxNUlyZ3dwMG4zVUtPbC9ROFV0OTJZY3BubEdzM1Jn?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KgMWrlxGDYqKPdBkRa0mj4UT"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4abfb9-f2ed-464f-4b77-08dc4a93700f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:13:48.0390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hSoCD2pl2HXcUBL8g7+gw3QQkyCiAH5g476zE4/TanSvKFpEzjIo2dJBNx58TIGZnzIp2b5DnQmgi+W2OYi9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6069
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 4etOiZgEbXi6DZ_3mp1Twep8a5wCmB_-
X-Proofpoint-GUID: 4etOiZgEbXi6DZ_3mp1Twep8a5wCmB_-

--------------KgMWrlxGDYqKPdBkRa0mj4UT
Content-Type: multipart/mixed; boundary="------------EtfOiHb2lE1I31A4PIzuNHFJ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Carlos de Paula <me@carlosedp.com>, linux-kbuild@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-ID: <e54d4b76-8ff8-41c8-bc43-3038c8ef17e8@imgtec.com>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
 <20240321154320.GA616931@dev-arch.thelio-3990X>
In-Reply-To: <20240321154320.GA616931@dev-arch.thelio-3990X>

--------------EtfOiHb2lE1I31A4PIzuNHFJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21/03/2024 15:43, Nathan Chancellor wrote:
> On Thu, Mar 21, 2024 at 11:58:51AM +0000, Matt Coster wrote:
>> From: Karolis Mituzas <karolis.mituzas@imgtec.com>
>>
>> This matches the behavior for arm64 [1] and prevents clobbering of
>> vmlinux-${KERNELRELEASE}.
>>
>> [1]: commit 0df57d90bfd6 ("kbuild: buildtar: add arm64 support")
>>
>> Fixes: 7d0bc44bd0ea ("kbuild: buildtar: add riscv support")
>> Signed-off-by: Karolis Mituzas <karolis.mituzas@imgtec.com>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>>  scripts/package/buildtar | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
>> index 72c91a1b832f..a36aca2a27cc 100755
>> --- a/scripts/package/buildtar
>> +++ b/scripts/package/buildtar
>> @@ -96,7 +96,7 @@ case "${ARCH}" in
>>  	riscv)
>>  		for i in Image.bz2 Image.gz Image; do
>=20
> This patch seems fine but it does introduce a slight inconsistency with=

> the rest of this script, as vmlinuz implies a compressed boot image but=

> Image is not compressed. Probably does not really matter but I feel lik=
e
> it is worth mentioning.

I agree this doesn't seem like the perfect solution, but I'm not sure
what that would look like. We could easily pull the Image case out of
the loop and use vmlinux there, but then the original vmlinux would
still be clobbered.

>>  			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
>> -				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinu=
x-${KERNELRELEASE}"
>> +				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinu=
z-${KERNELRELEASE}"
>>  				break
>>  			fi
>>  		done
>> --=20
>> 2.44.0
>>

--------------EtfOiHb2lE1I31A4PIzuNHFJ--

--------------KgMWrlxGDYqKPdBkRa0mj4UT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZf28SwUDAAAAAAAKCRB5vBnz2d5qsDGt
AP9VwnL9HnVelJV0Fl0UCYXrcJydV+GpZxCQnOWGJa2kuQEAyhWyseH6p0orYgw8c/MOmGo0GVZU
7hSmjZfovN+l9AI=
=hM2u
-----END PGP SIGNATURE-----

--------------KgMWrlxGDYqKPdBkRa0mj4UT--

