Return-Path: <linux-kbuild+bounces-6491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43BA7DE43
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 14:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB563AE27A
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 12:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D4624FC1F;
	Mon,  7 Apr 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b+V70gz6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o2EOgmUX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936624EF6E;
	Mon,  7 Apr 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030245; cv=fail; b=KdKfGwHxno0PhzcKxc4OZnBdHK6RftYn6Sng9rz5gwiwwc8ilrFrTj4TYup0a2yGbo8adOfKAQlGpBMCsjI+CBo37GnDqq3nUygsI6+EeckIlNBvv1A7irE7lLf7IgZaHCdIv0ZyvpCdsP2Ei+/YZIkwu6jpnHyVf1dxNjFovGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030245; c=relaxed/simple;
	bh=nMjZaPynAZ1JKANCF4slQ3vf5qoLdnUrYrQGdbRzElA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=au7SslbqRWnjItFzJPg3zGktetdGhs7OypIWUp57CBnUpzc/Xlrq+OZuYP7ShuCEOeflasu8usSoFtp9nH3walzgwzHDHWnUalhw6KVGuvlKj5xSU2ZvHIwCv9BANyUc+QWsEwgUBIxIXuPCAwxXvEpuV9tvDrxP0RghZ9FZLCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b+V70gz6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o2EOgmUX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y1tG027564;
	Mon, 7 Apr 2025 12:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=pYA6HlMv2+35CzDg4gJQHrYa5lpBixT6gVWFleFrQW8=; b=
	b+V70gz6G7D0mUbqoKMp0LkfPDGV9bWedooQ6Rv9XGSIAngZagCgacpSddXeXYnW
	4A3Fefbn2SRLzcad8wBl3IJzpFUv1snuuk1EmYQczvHpXwkUyNQ6x/D3MF3o7i1l
	fuG6NEb9eZDEf5Fe867EKB27sMoEYEYKQ5Bfge8mh98qrGYIMfZmQAlaQuJtTeKz
	dv3Ka5ab2YqoGVKSz8ELVKDrrdx+Mqs6C2U1A6KkQu5EJCBeurM3el9oU7iYwN6x
	ffCJIwprKwkN54cXmP9OwNAr/JVc7xDIpMSZKIVKXNDxbuhmJHNODahe+i8NTEfO
	iMJl0Lhdc+54PuekklEfPg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxctfxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 12:50:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537BBaK9017610;
	Mon, 7 Apr 2025 12:50:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty7qenx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 12:50:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzkALAZGXDJsvNjvXhNmN+5XRTVFOdnhZdjztrospMO2MxZdScrsmlWTfX48iIiGuxh3B49QjOU0ecWEVrCjHbm9wHee2UGaq8eiPPdUCdxQLvc878rVisoHgXVHCWK/pxTJgW+4MM4faZhUWeIToS676TtpHq1u1663OkfLwT831moj6kYOBgv31Ft3+LKLT0vA2TxAFw7mZ9eem84VZ1Sg1Wr30hSBtORULFLFIL6SKtd5MeScq5s/EcMLEnoMblGnLnzU7gw+LCRMR3kcV9TwXRlwP1Qa2Ko48wmFuIeRIYiY4E4FT2XpbN57M4eZp3w0W5lBrsNw5GL8bm+rpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYA6HlMv2+35CzDg4gJQHrYa5lpBixT6gVWFleFrQW8=;
 b=cRz9SOitw5kHE/7K1VpEgCfl7/Xaq2akAG+wEC7EKHoR5PPT8OjIEV+r9vV5pUxETFRhvFPlvkm48JC6YjlRP67GEOZEC9waKV72ihmBEft7x2/smoiHW/9jIym1BCyDZdPIb23I1+dMquh6PEDfoqSiMaEDh8r27ZqBQPiIXgjTI4Hle6Ms3oMFbtI3L34uPxGWEYbj/6/ATkfxkiUB2mb9iHygrmf7qpj94Ed3kj29WGewCqVTOcLOSjp3qfSXlTSrDMuWrAOKXvv2RVAo4cl4kvUBlVah+l6xRENTHNhKDHateNc1UWxQCFlFxV7k6OZ+S8MOeQWzk/v8Rjl5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYA6HlMv2+35CzDg4gJQHrYa5lpBixT6gVWFleFrQW8=;
 b=o2EOgmUXEUSPU5hqC0ZYkO2gCuXNyoPz3gdR38L7g45MFsGE6aSXKsJQ40RW8ZZW0pjAUWtjvu3YQ8shznfC5ybebfgenrG2DL5OB/fEiBGizZ7HzViuBaifz/TbMfglxYC/Nc99W8AtInqPbcNN0hKt2ZPl+9SUHyMvVvDFYv8=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SN7PR10MB6498.namprd10.prod.outlook.com (2603:10b6:806:2a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.49; Mon, 7 Apr
 2025 12:50:21 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 12:50:21 +0000
Message-ID: <7b0bd9be-c3ef-40d4-9465-92f3e69a07d1@oracle.com>
Date: Mon, 7 Apr 2025 13:50:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and BTF
 on X86
To: Sam James <sam@gentoo.org>, dwarves@vger.kernel.org
Cc: da.gomez@samsung.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        masahiroy@kernel.org, mcgrof@kernel.org, paolo.pisati@canonical.com,
        petr.pavlu@suse.com, samitolvanen@google.com,
        Matthias Schwarzott <zzam@gentoo.org>
References: <87o6x8idk1.fsf@gentoo.org>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <87o6x8idk1.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::29) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SN7PR10MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: b3491da4-709e-4c68-eb6c-08dd75d2c1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2RrbXhEa1Z4YlBSSnFiT0FWSHpwUE5MUWpIYU9wNzlSWXBYYkErZ1JOYVRI?=
 =?utf-8?B?eWl3SnB3U3R0SDNuckx5cHZtUVE0Mktnd0dGUWQ5WENibVFWTXFjSExsQWV2?=
 =?utf-8?B?MWp6YkNVWldaMVJoMk5RdFBUQ0FjdzJDSTJxcVAvbWZ6TnpUa2ZqZUlRc3Mr?=
 =?utf-8?B?L3RPSzJFVDV0aVBJbGR4ZDI3VmVSU284YXJER213N0xsZ251Mk9sSWtzd2Fv?=
 =?utf-8?B?ZkhMZ2F1N2tOU0FTc0R6bnNyRlc0cko3YU9MRWx2QlVMTWhIVG8zc21vdDhR?=
 =?utf-8?B?ZStPZFV1Rnh2NHZKNFlHVWhuUnlrNzRlcE1XQmJMQXN2YTN3RmttL2Z2ZGU3?=
 =?utf-8?B?a2NCaHJ1cFRZQU5GYmlKdURiYlp0clVJcU1pTlpXTEJlZW5hcTZrckh4Qm8v?=
 =?utf-8?B?bE9oMlgrcTMvcFdlOTgzcXlSMUxYTXcycFBaTWNCckRpQVRtNjFhY1ExV0tB?=
 =?utf-8?B?YVU5V3BEMTJuUHdlVkRldXNyT3V3N1RCLzhleFA4UVVxL3R6Q0p4cnJNWmpN?=
 =?utf-8?B?cDl2TWJqZkM3MW9WMHJPQ2JBM3BlYVFBcGdLWkdIeER2N0YvejlNSXBqVTJO?=
 =?utf-8?B?NjNqdVJFNitlU1hpd2xxd2oybVVPRmFiTHBHSWJ2dm9DTC90ODFJWlA1OE9t?=
 =?utf-8?B?OEMyQkZiR0lVQVZJUk1wWm9EVGVnTGhZekhtM1F0NkpPSVlISkNrZVczejhR?=
 =?utf-8?B?WHYrNzZrZzZHVE5NbklLbndMazFhcWlOKzZralZUcm13OFlOV2tIN1pBK3E3?=
 =?utf-8?B?eXlkQThFWHEvUXd2ZUFrbmI3SHN0eThtMHdMQXhEcEJBOUZJMHZpcUU4SS9P?=
 =?utf-8?B?WDZDOStoSjdOMENYaG9laDdLclgzb0d0QzJMenQreUJqcVZTcUdNK3F1RVdB?=
 =?utf-8?B?RTBhNFlKQk9JR1NWWHRyNU5OQ3VGd3NuRkR5L2pJM3NteWNLQjlEWlo2eDhI?=
 =?utf-8?B?bnNUWDNLOTM1NHhuT3JYKzBEZDZ0cUhSeUd0VEFwaFpscERKTG0rTFFBaFJH?=
 =?utf-8?B?eW5vMWdkWERsclpUQVZ3Tk80Uld3bVVzb0lMUjVDeG9YY0ZEQnpHVkJpTENn?=
 =?utf-8?B?ektsRWhPcXlFUWFYVlhIdnZIWWhLK2dlSFRWTjNLR2tKT3preGFCR0QyNmEy?=
 =?utf-8?B?MWxCK0VMbUxXbXBhdm9uMkhZMXB5dlFFWDdnVVVZQktwOFE2YTRtaTJadFc2?=
 =?utf-8?B?cVNWaGVzZkhqdWxiWWV4T3hUMXdXenorK3I1RWQyMjlhcXpabWI4aTVIMDdy?=
 =?utf-8?B?b3k5cVNoN01VeExNRHlHMHlqcm5WaVJyV1hyVGF5NHVBYUlNTllhaVE0TWtI?=
 =?utf-8?B?eUpvQWxjZlcxUXo5RmU2QlJEb0E2Ylo5SFFXR1BtaGNTZVVObXBUOGtMa2hl?=
 =?utf-8?B?NWpJTVdBTE5BbmxTbFJ6dFRUVkNyVXVMYkhNT2lLUXlHWk84cGRXZGdEalNF?=
 =?utf-8?B?RmJNaTFsL0lxaUp0MjNad2VzRjFEU2I4ZUJhT2U1TE1Eay9XdVgvTkJqbUth?=
 =?utf-8?B?a0dMUllqZDR2NWdsOEIydzl6RVU0YVFTVVBRUEVhOFJVZmxsQjRpUjFFRmxR?=
 =?utf-8?B?bTZlUTNlTUxqTHVMaklJWG5FNUVIRnRRdXIvY0lUakhVby85a01IU3lkS0xQ?=
 =?utf-8?B?TnQ2LzRMbk9QTnFNb3pWdWl5bjVXS0l3TXFiSFZoNmNKWTJzREpzblUzYm9a?=
 =?utf-8?B?M0ZjRmpjZ3Iwdkh1Q3JWemtHMWd1Vlk5UVZmV3NtSUpCeFdKMlVWT29TY0JZ?=
 =?utf-8?B?Y1lKQ1lLU2p1K3ZlVFhZWGRyazh0ZTZVVklkQnVmMDhVRXQxSitCMkdDa3U4?=
 =?utf-8?B?WWlLNlFTK2lFRXlGcVBOTW5CUWpGQnZvOXcxZjJ0Tm9aaVI1b2pLQ2k1U0ZY?=
 =?utf-8?B?amErSTFTRTYvUGQrYUQrb2cxR205SldDMEZKNEtaNG5HUXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEttdGhOckFMbGhYaVZod0Vzak1uaEZ1b1UvMzJpQURGRG5vMi8wczRnejVP?=
 =?utf-8?B?M1FlaXBVVUVKVHp6TXFTUHhGQm9DOHRCYUVab3h3VGFFWGpzT3ZuZDBkWm9R?=
 =?utf-8?B?d1NET1ZuZXlVODdONUJudXBueDhSVEtyOHgvNk1YZC9HbGNJSW5pWCs3WXVZ?=
 =?utf-8?B?SXJVZ2FSbEw5NE41TzF3WHdZSTJHSDg0dXJqUnZmRHREL3NjblhyQVl2dHNV?=
 =?utf-8?B?ZlZzYVY4cXBPQkdtZjZxRGsyTTFRT3lxeHEvbDZQeUJMcktRSlFmS0ZBUlN5?=
 =?utf-8?B?aUdZS0RheDBRclc4ZXlaWFNOSitGUXdPaHNKRVJQMFZZMVZVeWExME9yUVpI?=
 =?utf-8?B?U0x3aUJ0MEtQNjc5aXFoaC80RW9jQk0wMVVGUkVlcDNJd2MzSjJodnZVUmxa?=
 =?utf-8?B?OHFaRDZYUS9NOStVVGxqYlYyOXBwSlZtQWdBTUkwWFVraVl2N2M0MWtEWU5Q?=
 =?utf-8?B?WWxEU1RkZERsSTI1N2kxOGdIUCtQY2xxcGd0d29oMy9QSitKNzZFUmpJclZn?=
 =?utf-8?B?b3Flc3QvNXFCSCt3NE1ReWIwZW5hZ050amtxenJ2MjdpRENXclNOc3FVaVpr?=
 =?utf-8?B?RUpnZFBkUnZ6ZlZKKzB2OFhCVHpjRFNxMnJENm1QSkl0eTcyNVF0QmlNeTlW?=
 =?utf-8?B?SEVwOFdLeFoyUE5jOHpBNHpoZFlzT2JrT3FHQlp6ZFpqT21iVmdsRzMydDIr?=
 =?utf-8?B?Y3IvcVkvc1VYWDROZWhKcVJnQWVTdVZYZmdQbEp5ZFNmaFh5Y1lvbVhVdUx6?=
 =?utf-8?B?UzhrUXhEUXJuSVNQTnlydUlqcGsvRVd4NktxNXkzaEVEZ0RCaXZxQzFEU1I0?=
 =?utf-8?B?dGxOajdoWVRZUUxQZitpMTRwNmJCdUhPczV6RXczNUlCc0JVcFZaV3JydnQ5?=
 =?utf-8?B?TGtFK084NWM3V085NEg2TlpNcXVMemwvbU10cWsvV015VDFORXFyL0RuZmZw?=
 =?utf-8?B?V2lVRXc2Zk43eEJXbWU4cEp0TW5kRmFwMVA0a0VyVGFjTE5idUdad3RCY1RF?=
 =?utf-8?B?N3gvK2N2N2dCYzJkOWVKQTB1Nng1RzI1V2hmSWppN252RkhKaU1Sclc5N1NU?=
 =?utf-8?B?Smx5WE5mcVVZUU91UUVhellta0FZa2NuaU1Qb0FldkhRRWVINXM4TXFrMDlq?=
 =?utf-8?B?dWdFbFNiU2xJbUU4QUNFV3RYWDZWWklpZEM5S0RQUk5RdTVEOTd2OWZXMVA2?=
 =?utf-8?B?bFcxN2RuSGhrekYzTk5QRnRtOTB2a21EUmNTYXh4SEpyYVdQcjJyb1BrQUl4?=
 =?utf-8?B?YkJjZmJ3SUVQU2IwNjhDRnRVdGpMelZaRmdiTmN5ZWkxRThNS01Cb3FzdEZO?=
 =?utf-8?B?cmdRTGIxRkMwQXZ5L2NRc1U0OEdTZUZUQnNYcysxN0F6N1NhYjVqNHcxdG1t?=
 =?utf-8?B?ODUxYjJzbTBLT1VkWVZUQ2tjYWlvVVJEZlZDOEVGT0Z1TzJEWkFGamd6VXQz?=
 =?utf-8?B?amRmV0dtQ1owWVplT1NJbGVlaXpKY21hcXRvUDFvOGhVYi9QNXYyTHlsMXUx?=
 =?utf-8?B?TlBLK1lYaVptYkdMMS9sdGxSOU53WVdacDdESENpNGF4NWF3eVp2aHY2eGtG?=
 =?utf-8?B?bGh4Y1BZbnZwVXZSQXRjK0VBRDRPUHRxd0FtMjNudzA0TEp3WDcySFYwTHdX?=
 =?utf-8?B?Q09LRGpJek94OTFObnJtdkNVZjcveDF4Wk9temUzZG9WM215REtEdzVIRDhC?=
 =?utf-8?B?ekJLY1ZwWjEzZitWbGFIQ3NhWUgzYWZ4Z2dhQ2lOZ1Fxc3c2OW5mbXg0cUxm?=
 =?utf-8?B?eXB5N1YwbmNiSjdwRUhXaW5Gc3RUZXRsSkU0NUtrWGs1d1FmOVdpMElpSjhQ?=
 =?utf-8?B?VGY3cXYwVW9Qbm5KWFRxREZWR1c5Q2tPNmc3d1hiYzZ6WWQ0b0d0bEcwcnRW?=
 =?utf-8?B?dnFPeTNKWVpraUw3MlN2aEFjYlVuczBMV1V5enRvaG8wUUVqRzJTRUFJWXQ5?=
 =?utf-8?B?TTVEVTlNc3V0Zm90WXQySWxnbHpDRkpySFBEVzJsd1JySndSTDBHVTkwTHhi?=
 =?utf-8?B?UitaNTdCSm80c01NWi9BYzUvUjAvTUZGYVFhVVIyWmJwOFBBS3plaWI4Vld3?=
 =?utf-8?B?Q2VscUk2cjBWclFDbHY1RFEwamFYY1dPb3hTTHNmRHFQc0RlM1Q4UzFjNUdS?=
 =?utf-8?Q?75UR79LgT0PNlVOcTy4Eh7kCE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cA54xpc8yVXXTpIqLn+q+K5byoHGlFqvm9NcFGKoyXGhXcfhgl/Vj3n8Qe1XzXAFmUZQNj4Q3OFON7pWnnARC00c6YCq5KF7Tokj8/U6t+xsvKX1pCFoqkGEAL61TVyZ47bMPGnLGnLTmgYUIcvGRMYaJdrq2ICoPyclbiOyFeCT2rB3NSI06Y9i3uVRlzAqJodrnFosYD87B9op3bitO4VhrlGYm/aYS09+fegWsD3OKrA+wjorrsKtr2xxJCdsOd1HwG6ZASD7ttv3tIpxM7eu9CJ1YRdEVfRapR4tvaBcXTDUqT5J5bqNNhP92iSJvNDmtHfiq4ewCPfsXdf92Il9joBHcLezRsVKM2zuHYGHOLTA8/ORZN9szOmymNZo0nj+ZZcErhAknaaWWrmo52LKuf+tu/lxznehnVBTGsP4E3ooiINNacOQzTjwupVzH1+eQ4y9m94cRRGnsR96Y1TswPexXQuJCSVIAbV5Xj3mQb6TRuAG+1KISX2PJzxwJ9MQeMy2lPIqDLDEf+baIU0dT8hEVI8o38oObi3HYE0ia5QW5RLrIWJxpGrTx0WH69AJ0KzHjq1XWIqpXQ5YYEkoUiOjL5zfVlLbFmZZelU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3491da4-709e-4c68-eb6c-08dd75d2c1f4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 12:50:21.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNsuuowibpOc/R6rhPCasxmYWt4JbzneH8Xmc3z/KxFfHu6sneNPS16c2JP4Qu+r9IU43OJphm22OeEhOLmdBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070090
X-Proofpoint-GUID: y1IQdaxs79pVS3PDdoqqaMoNnU5hYgxN
X-Proofpoint-ORIG-GUID: y1IQdaxs79pVS3PDdoqqaMoNnU5hYgxN

On 07/04/2025 09:25, Sam James wrote:
> [with regard to
> https://lore.kernel.org/linux-kbuild/20250320232757.2283956-2-samitolvanen@google.com/]
> 
> Would it be possible to have a new release with that fix, to avoid
> distros all having to cherrypick the fix commit?
> 
> Thanks in advance,
> sam
> 

We're planning to release 1.30 shortly to follow the recent 6.14 kernel
release - hopefully this week, or perhaps early next week if any bugs
are discovered during final testing.

If folks can help by testing the next branch of

https://git.kernel.org/pub/scm/devel/pahole/pahole.git

...prior to that, that would be great. Thanks!

Alan

