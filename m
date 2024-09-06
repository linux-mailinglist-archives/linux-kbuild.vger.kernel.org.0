Return-Path: <linux-kbuild+bounces-3437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546F96F75C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E07628172D
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4D01D2F43;
	Fri,  6 Sep 2024 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K1NBOMmD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iB6KL9FY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E91D1F7F;
	Fri,  6 Sep 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634154; cv=fail; b=Md9nUgSbfgw058X42mjknvU9nSQFIuUz8o4n+qAqd9vPPuM7OcmwukPx2cqQNKg7dqnKd59YsYQ1+86uJ916Fv8CH2bmyo2UlcDsqi3l/B2QxwtQc84cSL6SfxSuO1DNK4Jrjmwpcz2ySqsVRP3s+p1W2Gvzr3rXyQCcpt1alQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634154; c=relaxed/simple;
	bh=HfaJmVidPjFbichwXQtFR6AYdyX1vdupcWbosj1cvOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aVh10vF6CutoV8HoZpmw1XQju1sRqvSwKx28mNOnikFFh/wMwb9JFh0OW2eRkm4g/6dLdQcCoGU32PqZ4KHH7k3X05s3oF9O0eN1czgNj56g7kL9NJ1muBjG2iwCCOXA18zfTDosV04O6pgQYkIJ1siRTONGe5SLnsgKdRTlMEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K1NBOMmD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iB6KL9FY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486D8lkn013009;
	Fri, 6 Sep 2024 14:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=CtJW+WGBSP3iXalZW4CWLxi2x2AUPQ5gAHhyPjrT9vE=; b=
	K1NBOMmDF0kNoe+yKhRUwBwQ1ChEt4IzYbKra2uH1nBlSONbP2oxLBUmSZIQONml
	MntaFXN4QbYebI0af/Fdsgj8VWmLCDn3siXLMiaBTvIulY3cwUupyelOeot8Gwk8
	dARHdQ4VOxaAThustvZiHmJ4C6+BCuA/1HZZTPOGvJdL0xGYUT/04X5dEMl4C5oP
	ofpN2YnDwm9WZ4Gn967tzwtDz/nUUju1LnAsKadOPlYy+7IsHqi6n8K2aiTGUEA4
	xUyVeJYrLbkyqBmfe8LFX9JkEUnralYFLy99hvDJLCgdoTlpu7KwuoTMV/X/4EF0
	Edv45w/zQhl875Gr/6uigQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwhhtjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:49:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486E66uU016244;
	Fri, 6 Sep 2024 14:49:05 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyj1wv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:49:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHbFpnRMH9bTZtoYz2p7vlHNetG4J2TqyroEKz+lIg0doAk9fPLGFaM20WPTeqNNcZfuyh83k3qbJx8pVpm+EySjuwfI//4PUTd++Ye7tjaFXFq0m1CeMVmQo7DCOin5UBBkLrSCDbl3wtRrK42puEc0XwP3F88E402/vUYAF6HCqEwxjR+pEX2TpmyUZ8xqjPY+RMBPqtYNJoJ+1qk4n9v04u+4Ep+vbPJIvH/u+JmPMGM00mnxUbXVxX2j+OKcC8q34uuIh5eHPXeyceWs1NGhahbQdoQ+hWuFQnhQnm+9W7P+WKFr7Dq9wr6Z0aTjqMapPjxfUes1iqovvORrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtJW+WGBSP3iXalZW4CWLxi2x2AUPQ5gAHhyPjrT9vE=;
 b=w+he26zQJSWEYAuEfAvQL2JFqGcR9E1sABz24ytEKVRhV3YyXhHvSaZK0KDBHIFWbc+5u5kHa69Yf+ziEihJaX0Fnd5KD06sIlBnHFSokbbU0oyIxVOqI/pkz1QchCH2FWvN1ZwRTDZ/8n4n99Tswi9i+Cy8xRmTW6Y8RN+RMjJ+6JJXP6Uze9Xs5fgM9JUBWtM05uP7bLeqQbZ1Apuewj1AyctNEf4f4GYKrK16QyD64HW+oZIFS1BT7TeQ4bhUtc6g+l28moics346Ow9c6azgg6cHuDdk1fqvJfIGEkSepGSrv6d30iOp/Rko0YlIfX+XcKwJRj+hAWLPUuvO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtJW+WGBSP3iXalZW4CWLxi2x2AUPQ5gAHhyPjrT9vE=;
 b=iB6KL9FYiBdNT2ufZ9g8hKggfFb+4LKH+KFIR/CSnkxaqqsdZCtlejsPqiIHjAoFg8iMtN3dSexmM6xAy6S2yQHGj6YrKZhghsedzbRuGsmHItvri0YKMDwKJzeigoIt/XtlYTVtYve9MPcxiTGsp/MPkUEh+NfHl75k6fgojZE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Fri, 6 Sep
 2024 14:49:03 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:49:02 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt
	<rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu
	<mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa
	<olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v9 0/4] Generate address range data for built-in modules
Thread-Topic: [PATCH v9 0/4] Generate address range data for built-in modules
Thread-Index: AQHbAGtj0mATKhjpMEu/MzxVwWakH7JK1uFO
Date: Fri, 6 Sep 2024 14:49:02 +0000
Message-ID:
 <SN7PR10MB62875C07F605FF00B9C01F79C29E2@SN7PR10MB6287.namprd10.prod.outlook.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6287:EE_|DS0PR10MB6752:EE_
x-ms-office365-filtering-correlation-id: 7fcb09c2-5c31-48cc-0b61-08dcce830c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OWHTMx1CReKIos6X6dKBEwOHkNc5+qAWQqByxcNhjro6HdCKJ0QSjCmSQxCU?=
 =?us-ascii?Q?Wmi3aKKUGo4gZ1PEqzLaiGW4AlR8GcQoH7H/Kf3jos3wkOLF/X3CeWBPYcJm?=
 =?us-ascii?Q?HCk3yGxNp0GKPKnqUiGI7hESarBaCt38wUoCLXTRJcglxuUC7nKIxAOlPO1a?=
 =?us-ascii?Q?qvGk2fOZZ0yqm1qtrl6C38H5BHzHsZF1ySmfEi39AAzk7GC9jHmafdjsBz/V?=
 =?us-ascii?Q?I8KDsTUrJlu9T7hJsr4AmCLU9uDArCdhSga1H6WrApugoKNZdAAqztZy+IqB?=
 =?us-ascii?Q?XF5G8R1KvQ62F2qeKKsJ1uYD8ubzr8RuKQFxOSCRUSWH6sAHV9V0L53J8/An?=
 =?us-ascii?Q?F6smhhqB0DxgLZ6x5mHCcyu5glR1fpioGXrHOn5IEhk9bdLSY34tm7ZEbxDw?=
 =?us-ascii?Q?9pK5D7DzgO6Gk8fGggckbTwdhxgWtyaQPL+8gObk3nBi6vJ812Dp9txGMGB9?=
 =?us-ascii?Q?7E1N6O4fK3XILiLI+dC/JllrvXhimhZe0c7X9iDI4YPz4OAKYhCP8zHkgbTJ?=
 =?us-ascii?Q?olZeeZTriCN3nOoVXHKO9AtmV62Q5ib49Q1dDYz4CAXAE+DW0DcJr9i5upTl?=
 =?us-ascii?Q?ur12ZGOzMij4rLV878R9ExJaW0QXEzbQTK9nXlVKsnLi8XQLEEpuiII2cTtP?=
 =?us-ascii?Q?lRUtA81qZO+/pXQUaUjH37ebdDyhkNJake6/Q1DMB9SML61n6bMqvJtiN/QR?=
 =?us-ascii?Q?Gys7Oj+J7tivUqbuka5pnqFxeohGS/aw+lfwp/msOOaT9hSNyYGALiJzQ64b?=
 =?us-ascii?Q?o1G/eqxIL3Pc0hFerAbeAgAMEBxp8LyyCKUU9H55CHdYdyBFFnOI9PaDGYG1?=
 =?us-ascii?Q?GrPHs6enFJni8H8oCs3IKqohF9cEVIlF83zfgTJD4ncIsy0i/yteXixhWfaE?=
 =?us-ascii?Q?VTvLtXHwxuHis0CTzacevHajEfGnCa0CA0OyRQsXT/nJr+a5lTQpS1ISbaGY?=
 =?us-ascii?Q?qWiCFn1kZAT/xCGEjlThWo/gCVyiUj7RSgfGpzlq3mdxt3l2sUWbm2viOBUX?=
 =?us-ascii?Q?fdP4zUPGXMJ0VYKKsLN2Sd8/fMrrktHF+mMjkdxlmoQvneqMhTm2hGanJXoZ?=
 =?us-ascii?Q?dRs3lNnS5JmbTPelovmghPAu/x38VYdkMu5QZf8+ta8mmZpQlDMYz9DoZfVC?=
 =?us-ascii?Q?0+x1m1jqjkiKSJ2yGe+AyfVhGN4ZvJ7xYttEFjkJBsvUb2CGQ2UtjiTgG00g?=
 =?us-ascii?Q?lmz5ijavxejU9sS+PMqxLiBkSoXYi2GPkV6Ry2Pjqk2z6s0+z+qSAAo6oXUA?=
 =?us-ascii?Q?pCVJd6J3IzmSDeB2rw70pCU1wW9LlXvx8leyAK2ga6FLFgyi2vOf2ZEFQGpP?=
 =?us-ascii?Q?QX9/r4XLgEiHTZ6/L2oIYDLyKuaLnTZ7MbMDu0Ge2ZV0K0F6QTS2xR+hI1SA?=
 =?us-ascii?Q?rg/VjaBB+Sd8c4w7bZhSztMr+9MgDFllkVMcNX9zK7ItXzD3hg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g0XmHKHyDSdYILjs80dVZvFdZiJ8jgxpE3RwtKJEW//W73LzUwB8FwEg1Ecr?=
 =?us-ascii?Q?i7YFumLK/Gm7R5zbbWM3KiTmebjrKNntFSDoV7Z/Iy5yxPVJSNXBDCK8RY9t?=
 =?us-ascii?Q?kbfNauFXTHJ6HldMjx69tPp1MwUUYNotC7y6w5D693FgjtFTeZ2YiIcxQ+EX?=
 =?us-ascii?Q?odV5L+7ONgQBB16xfmlhupP+gjXyog2IOKh8byLBBgxrVJHGXm8ibZjviNT/?=
 =?us-ascii?Q?nBGH4oF9++SH3IQerJqrnvpMgRsdIaax2Zg2J5eZ6oVjAtPlUrJuNVmZlK1u?=
 =?us-ascii?Q?vlgXENEywyUbOc4hczQxnYVMDgzKhiH8D0kT5AD/WHL3MLxk5tN/0sv5hwyJ?=
 =?us-ascii?Q?dpx8wuN4I72w6v901+a2BD1HBJZgVhFT2bNlo/lIfQuE3qXLoBtjQhGZOddg?=
 =?us-ascii?Q?adjICpA/Pg63AEd63ZTkxbHjv8lhx1X8JFU6NPvzzxU4wuHbSz9fplBuqcSW?=
 =?us-ascii?Q?btbW/It4MofVgyOoVOQt+iGI87nJa2jIT7Vo9tuMZXbDepDKxBt87584OnHs?=
 =?us-ascii?Q?vqowiqW0dO/DFMWnzhj9ndkNHCSf6IQ7L+l4BNekO9Q8aM8lvhcCxkE+npu1?=
 =?us-ascii?Q?udOjXgHhYYor++8qs7EFGR6j9IHBKyTPrECOzNw2TxkKLOj6/U9BWk96b/bv?=
 =?us-ascii?Q?ZCMxyqsMGUCtCNoOO7vIHuQLi9KGD5r0VQGasQ9MiQNyEAbKbFg1ruSIrEPb?=
 =?us-ascii?Q?++BVtB6DtNuuBLWKvBpcDcPd61Itc8AQCjtM+BeR2+gmSLwnWWmymMJGHpYp?=
 =?us-ascii?Q?FPsJK5YeaLJUiRRUhgy1Cv8Qh8jVhLRuuQeIObqK92VlqW8laGCLCmCA0874?=
 =?us-ascii?Q?8PX+TJhYQCaDqiPn8DVTc90sSP8G9Civb0XHKRsHCObr+RCahtJzJUQ8hsrj?=
 =?us-ascii?Q?p5UHcnOkFLoL+OrJkW/Dw0eJHbHjt5g87i60RfDlws/dFT8lB3wCnJrkPO7c?=
 =?us-ascii?Q?zInAG4IpZMMvKZm1he48f/VkMH3aPEA4o/1558sRWQZ2gFaoZuOiRiITjD98?=
 =?us-ascii?Q?BmkdaaJaRurA3FY5C3gdUu7JMBjkbFXsN7PPNvcmY+QEoqmrvDNrbct85TyL?=
 =?us-ascii?Q?2PKT8Hln7J4mP6mqMj/4EtBekijJISi5wYRESGKyBgHqU6pS8MuKDFZc1L9q?=
 =?us-ascii?Q?R3yiyWME4xy2ou60TUjRIIfpdKRCHCS+SrCPIECwHPAnTLmoH7Wowj8V2ZOH?=
 =?us-ascii?Q?WhswjN/HsEnDVGH83Zw2pYaESpItHUTGUYpVn2i/rFxhkMSnuUPzGHjC0lvH?=
 =?us-ascii?Q?FY7DR8bNcv8MKzhXobkuzR6I4D5G/WSHd9a7ol+esOhB8nm0kYisr30rqz8z?=
 =?us-ascii?Q?Vz9F72pBdhXkQ5cMBEZqc3OufTT1X4vbWcaQ69U3FWPSBneJfAfBf1REcmjq?=
 =?us-ascii?Q?bpsUoHrvoF0CojHRZitlAzm3HS172logpvOIhiBRrZZHXoigV26F/5EcwsuD?=
 =?us-ascii?Q?9CfalIP2+pv0e4FT5p1z9oynZh64yE8ADnVI1kOf6cVgRblouSAzA782q1az?=
 =?us-ascii?Q?+/4xnzWml6gQdJ0vXZJHWmt9lRzfeceYPRVDUroaeQwaokO+rcEqCgxX0L6M?=
 =?us-ascii?Q?LGxENrxrrPVxoiIC61cc3ep3XgkJ6rwhBWdTQhzXByTTzWbjt+AZNMl8+qCn?=
 =?us-ascii?Q?DQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vC/58err91cwSI0fiQvPKFtiZq1tdZcB/nhrqaIvm9ptndvnvV8AYLrxhhHN8ixZjfiFs2lGmCIRlQ3kUGIxYTMZqYqkeGkx0Y6iMHg77PrSS52C1Ej5SyQRc7m/IDMlnxIRjOLc1J0gbngYlF28RfwR6y3hHHJ+55d5Yw9h6tbnWooG1Z18gihfSCsbLAJY2clGRhPHsFVRes3V9RUelLc5SuyiKGWxhzz79j1v2Jl5JNTAO0vDGRki6xPt6xmbK31pUKNFoGuCZkBMjEy5/MLGssZ1Ht3rMtUTMUgpqFm5/ktDaMyaY5ZHiPSjdz55rY+VGe1rfUfwgep8Q24R0zZuthuCB+mhNylLdY2VUQ5PcSseeY9eEDYrWIlZW7DD1HhQD6o9lhkmuLrZ+1cd9+qwF+X3q1BV/h40dFW1wr0mElBlzperukVei7KO5+A8IyjfeVmuN8vwY8849j1E1EfqSqu+O6ltMy+vWTZhf/HxgX/6YtokV9ig9TPerK5oKdDxRm6qR5kPmWG5KA7cBvz4YHOvXQaqj1wKfjArYbVvKt/ZuF2Xgrf/6cJl+lLYJDXJjS3sIZTZ4riNDhKERBOP4HkmhelK31LW7Gs9nDg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcb09c2-5c31-48cc-0b61-08dcce830c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 14:49:02.5321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdBWr1+hPse1HZhkTrrXkXDmbMzTO4KSJb9/rm/1sOLy5KvoZQuYe4HvSNlo04vST0eCssi8Jzl/HYGicVHZ3SqHDdQUkI55WB1pC+9LLYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409060109
X-Proofpoint-ORIG-GUID: kSIxLhSgTyutnhMqbgnHByF3zQzNwLRQ
X-Proofpoint-GUID: kSIxLhSgTyutnhMqbgnHByF3zQzNwLRQ

Woops, forgot to update the subject line of the 0/4... it *is* v10.

Sorry about that.

________________________________________
From: Kris Van Hees <kris.van.hees@oracle.com>
Sent: Friday, September 6, 2024 10:45 AM
To: Kris Van Hees; linux-kernel@vger.kernel.org; linux-kbuild@vger.kernel.o=
rg; linux-modules@vger.kernel.org; linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada; Steven Rostedt; Luis Chamberlain; Masami Hiramatsu; Ni=
ck Desaulniers; Jiri Olsa; Elena Zannoni
Subject: [PATCH v9 0/4] Generate address range data for built-in modules

At build time, create the file modules.builtin.ranges that will hold
address range data of the built-in modules that can be used by tracers.

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v9:
 - Reverted support for optional 4th arg to generator script.
 - Reverted support for optional 6th arg to verifier script.
 - Added modules.builtin.ranges ad vmlinux.o.map to CLEAN_FILES.
 - Fixed support for sparc64.
 - Fixed support for LLVM's lld linker map format.
 - Updated error message when .*.cmd.o cannot be read by verifier script.
 - Added syntax output for verifier script when not enough args are given.
 - Return 1 from verifier if verification fails.

Changes since v8:
 - Fixed some typos.
 - Added support for built-in Rust modules.
 - Added optional 4th arg to generator to specify kernel build directory.

Changes since v7:
 - Remove extra close(fn) in scripts.
 - Make CONFIG_BUILTIN_MODULE_RANGES depend on !LTO.

Changes since v6:
 - Applied Masahiro Yamada's patches for kconfig, makefile, and scripts.

Changes since v5:
 - More improved commit descriptions to explain the why and how.
 - Removed unnecessary compatibility info from option description.
 - Added optional 6th arg to verifier to specify kernel build directory.
 - Report error and exit from verifier if .*.o.cmd files cannot be read.

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=3Dy
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=3Dy

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++=
++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
--
2.42.0


