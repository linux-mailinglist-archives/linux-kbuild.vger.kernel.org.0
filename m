Return-Path: <linux-kbuild+bounces-8262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF09B17C4E
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 07:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFDC4E675B
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 05:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE42156228;
	Fri,  1 Aug 2025 05:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n3BoVRRP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pOR4czcu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CAA139D;
	Fri,  1 Aug 2025 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754025280; cv=fail; b=KehRoCUUXroHw0il+riFdtofagxl3AfDGOifD4TYTJRPLmAfvqLPKCBWYX0kK9JU614ksUcKeTb0V2qRKVjNTU7Jvu9Z1Gcj689oqSHiLNhkDalGERxBK80bfC59z6YSFTl7GgeGXRpvQY7we6qhrc6Z1HTZ0T/tWJSDRl4nNS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754025280; c=relaxed/simple;
	bh=YP7nchpnT/lOPfEDpvDQ6SIbi+EIrgjj5nLTnbiqeF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OnA6hnCn7zN8AlkjLfvyKTRD4o6CcYJZhi0U07fUB6xa9klTkxQOznZqhivSARXpui+Y5yIgDVxfYZdrCS6enDRXT91YZ1SLJ2zb5qUVrnW3O4SX0W9+HktbbU+CP4McD5jpQxH5St7KO5WLkWIUGwACyyFc7cceNoUY7U3kfno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n3BoVRRP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pOR4czcu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5714u6eU014669;
	Fri, 1 Aug 2025 05:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YP7nchpnT/lOPfEDpv
	DQ6SIbi+EIrgjj5nLTnbiqeF4=; b=n3BoVRRPdS9F8MfqDUe+o2RQpMKiYVF0Nt
	dDWZkYen8ec67EAHOjwaA0VpkWvppbgV57fHoNoBbhsmo9PKrlOrjian3DW62P7j
	rLlu+EGnIzCHxacuObOkrSOdziyIEmhiAiX6FsGZAkzpomXbfMGiDRJZlJSpFfMy
	lmr0mjFYJwfTP/BD1vZx0YTaLAuCNhdkkNRJjFiLJMxeoDaDa6T/3fgjWvrBnXza
	LtwAawDeMnpGi8rlKxGcDJVPWxebF+EaiCFWk7Jtll/Xerkxl+ycF/CXUlf/LBAC
	H6LN59JB5HDXGFh15OxSHZC38gC46DRc+aJQcHISyaJBzj6fbHug==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484qjwwh2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Aug 2025 05:14:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5713VVsC016740;
	Fri, 1 Aug 2025 05:14:21 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfknyxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Aug 2025 05:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvzPLykK3ySQAaS6RtamSkuqZ8QcIXBxBv747ZP5earTnXGrHT+3fclPmEqBlo24tsu44PIfNetuXdrJAYL+JcXfpqzwNwmjr/vTMSsdw91g9b45UEUY3PkHqmjX3ZLCD/S3k0Jj9C7FjrUBhFkM8EAv4lePc94pJ5phOplp5ClwSH0IDaNmzZqm6KWRGwo/+3hWOhjG1r0xefBo7auyj8hMh+swSuf5Uol/spNjR2P1X5WGKCelaJE8DBqdGZFfCbEd40VMd7MA9678j6mJ4+yAjNrK1NHnMC0b20VGcCYUndGO4FRePj1Iu5WANKquQwuuiToRUe6WdoaQlEh2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP7nchpnT/lOPfEDpvDQ6SIbi+EIrgjj5nLTnbiqeF4=;
 b=nR4pflRoBVw7DMitN69u5mUgfK6RXRbx3qYNqBlemYpTubuB88KfTX7Rtejg6J4HrSlngZGkf+alQJ2HaDTDNkd0OYmF17anYs4Nh+8MkJB1yWCGaYSDDOIug04+WE0PUvJ4RO5KlpYbtFy+/68hVW2ROChuOu2aldpcPSugFBH++FklZ7f+mr0TRYfj7iiKLsOGfnszi+hCFiticxZXaW1oLD3fi1dPLOU5WUcIOZ+eDMdlQhRNSXtNPKCYm5Hu0p/2JHNUZiqy/HWi81pP7zr+GFdiDj0uRvK7e3REdHlsngOCDEkU06VHVbjH47Kw2/tE0wkP+7thbvyLRG7fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP7nchpnT/lOPfEDpvDQ6SIbi+EIrgjj5nLTnbiqeF4=;
 b=pOR4czcuLxQSJqeUOTJ44vEu9tvrIGCobIKu/YM9qokwbra2qHq3wfbMbiCJcUY81oNELxBlXHnbmS3D4Xn6iGfA9wUIoQm55py+ZVT2fMLnkhfWGar42pBPAYdzTP2CDDYFJByKUIRa0UP5PM0pNH0I2TSLc/PQdCnlo7uqKfU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6496.namprd10.prod.outlook.com (2603:10b6:806:2b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 05:14:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 05:14:18 +0000
Date: Fri, 1 Aug 2025 06:14:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: WangYuli <wangyuli@uniontech.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, jannh@google.com, pfalcato@suse.de,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        niecheng1@uniontech.com, guanwentao@uniontech.com,
        Jun Zhan <zhanjun@uniontech.com>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
Message-ID: <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
 <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
 <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
X-ClientProxiedBy: MM0P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 1daa981f-656a-46a4-2dee-08ddd0ba4467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Aj6BIUKTy9O1WbP/ho2ITmbgXTudfUQawqvQS6vCKqLuq/XQQMIFKh/RLSb?=
 =?us-ascii?Q?ePl9DtIhob6UZyFHj9T9N9sJDqK5m0TWKToufKJiaH6b7jsWZ+VNudGtjEif?=
 =?us-ascii?Q?qDNsniQaOjeIdO3pOJmkNc8CfxkeDHYRwa58qKEpv3qt6sdKefAQllf22W/F?=
 =?us-ascii?Q?mnHkhF3M/v2NAAEx/TGo1as0/jtJX+R/DbUran6QYoH/RLHRTv9PeWGExEms?=
 =?us-ascii?Q?CAnAJWfQSpZG7KUppYuSUXUr+tmzER/DBgw2REUoyNIIFFKLA40dz20cXOFW?=
 =?us-ascii?Q?zZwx3ZTUbTTEyJlTLqk3I/rx6XIrP6KalLjSvAn9eLjCDiw1R6BH2Orp2QXm?=
 =?us-ascii?Q?Ds7O6lLLLBxsEgNnWkzks/Ytn8ME+m/RTFZVeYFv/iVuqAoL+Zv0/TPdttHM?=
 =?us-ascii?Q?QHv7lHHHzCtFO7Orxs7H77soJhhe38PujehIXLjInsuIHKMLe8K1CKxbUIOz?=
 =?us-ascii?Q?zJzOhGkBsAXmTRaJjUJepsqPDp/KpYocARg+Ty4Sudw6HUoatTVvARRUCPGn?=
 =?us-ascii?Q?wx7phHLlfUUiTDCutcZHGwk08ENS/HgqDKm8W8mrHuUY+/gY+QfYr9R605mi?=
 =?us-ascii?Q?OghWaw5QeztoVBsz4hmjRSY68zFtWRtET+g+ogFsKl2rrRVjhVru6Bk4j+1z?=
 =?us-ascii?Q?KiaJsRGCiN06cqbclrtr46EW4RBQrLDgrsdvL7Kch4qDwIqYEXoCgd/42w31?=
 =?us-ascii?Q?b05VFjjnyYp6rtzNlJEkE0isX0GMVW6QhYmblaNbq6+xee30XmlaEviEXU95?=
 =?us-ascii?Q?FuqLnfjk7JhKIdvNt83W2Qm2BraXD896kGMM8zciONQeuWwprVJ0Wk7piJvH?=
 =?us-ascii?Q?aGXQAb58F7N2eCubVVzEgtV31YyKHkHefyT3PN+/tL9h58fckKQJW3iSK0+k?=
 =?us-ascii?Q?i6isySo4G1+MWCHqm1WZ3xtH6urMgwICegpS0o9MUbJ7ypC/k2Z994LICKvA?=
 =?us-ascii?Q?ZuSwksoptRFv6AdYPiN6eJGEU10JETwMpGRCQXvWJSuZGdhPZoXL/Ugc+9hw?=
 =?us-ascii?Q?E9LrUBF3rhAwgmg3r+SZWphRNKfB0wRDHiY6wv9TFj5kXXxwFuE81+DEInl3?=
 =?us-ascii?Q?Zpwx9Hj9zSx/pPGLZ/OQb9pzq1m5ijRIiZIul1N4v9qrcX4Dui1be8Ez2AcN?=
 =?us-ascii?Q?ExyXbgjjJarsylD1fGCZdGlRpoWgJ1By8YW1VG4uLaabDHLHQIMaelk4971f?=
 =?us-ascii?Q?yRWGlGYrcThRxGlkai42ZLzFPMg+O8z+4DhzOpHDooc4RK0HsSWyQR1arOmF?=
 =?us-ascii?Q?jWQypD8WIvTYJzvbuWCJFsEiGk6ht23AuPNott71PJ7ag6Ewc5K+6uoT2Rbq?=
 =?us-ascii?Q?EKp1g4U3OHtZCeStfgik80nMtL+0t6PStspwvBSwcacMGTQI9ofuMK0SeDGO?=
 =?us-ascii?Q?vNcsZfNHIrheDQasnwo4wbRz/MM59RJqRStkXBLHSO/UyJuyEK1cxfw7W2up?=
 =?us-ascii?Q?wQ1QPfeI5Wc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wb3DM16aG65Bwhj4OK1AL3tpHz7C1QWxgtWYOpaIVJQkIZa0Y54wMCF951RH?=
 =?us-ascii?Q?EIJNo+N6XJNsCvzpXaVxzr1vK9q76l9COHwihEjOkPXdLt62D89a1QrRG4lW?=
 =?us-ascii?Q?7pRB1bbHmQKVwy9HHaj7Ts+y43QDnnfXGb5v432eOQv7NomT5WJq1VIH0e7K?=
 =?us-ascii?Q?ihHjE6OwL69hlOdry6pyOEtDzF2x21vEqwh1lTunkJIjibJnFrL+X8LyTRO9?=
 =?us-ascii?Q?IJuY2qTtEEYVyzPaJintItfBGsNdul+u/2LKWXG6XdE0vear3fBvA6xSvE7x?=
 =?us-ascii?Q?0kv2Vi7S+tkOm9NhtgXzYMM091z0MO6yZtxxoogq7Za7hjo93sUGYUnS2Tua?=
 =?us-ascii?Q?VQ2WThjdtCFKgIcTLrhwMzIQkjb4T6s4KO0qycudbBPS1zK7bLu3Q2nsD/oG?=
 =?us-ascii?Q?QslGUK4JclYvaegxN2sURyxHoucPUq+PBIDdwU49UlYekxJQHD0IQmBIo9mH?=
 =?us-ascii?Q?QMz8O3tIuKfH/74DDUNVqvzYhkfpH25/9kIiNsdMKnhEH+mG422a2MPUmikQ?=
 =?us-ascii?Q?htEox8ixRyZUS7JuSli8kIA3yBzphkrASgkRO/iY0LjXLlVwpvKk6eb6170u?=
 =?us-ascii?Q?6fAlewGd5UmZnwtqmm0T8izfQeU79YkS4TA2RnugtpX1QXbM3eypW2Q0D+pU?=
 =?us-ascii?Q?+uDlvZVinrLlVlQJVXIpF5TgvODfQVTngoXQfDO5hxsl/GnWpnmoo9LdFNc5?=
 =?us-ascii?Q?yD2NHNFy8DsqYnX9+GtuzKlM1ls1LCoigwTQZ9QBvnt9oio9q0wkLPOnfKx7?=
 =?us-ascii?Q?qbJfOULIXBUHHYNVpJqa6om/L/cbM1aT6YsMqbYAbJEyEQJ2Um+wxpCLNnTL?=
 =?us-ascii?Q?dK3FT2FqVxqdS5KqtUc6Sq9jpyoqDYZ3Bg7wjfUSfipidaUAaNO78o2ulhYK?=
 =?us-ascii?Q?QAzQvtuIhsk/GhqXIcRf2FM+2xcjg1KTfCsjfTzWBQvusl+azfItydSk82OV?=
 =?us-ascii?Q?1OFJq3t4/iVcYAz1KQf03QHwmOTMvAw/Bguv8u11ftx/BRJNpn5c5FGHDR9C?=
 =?us-ascii?Q?7DR78SLjRgHyos+Ummz4W0zvtqHuVOy2YknaJYAU4xSOuS3pwgAa3BGuXjsE?=
 =?us-ascii?Q?Mcdh0PO/CwdImqtTL5i2jslL+y3orLKc2KesLkPzi+8xg9pwLH3grf5UAm0J?=
 =?us-ascii?Q?i7z0/e5cIulg2m47KZ6gBmRk4f5eIfIUVFszqgCj5aMOCcb4DgeU7Pq2M0KI?=
 =?us-ascii?Q?Bg70hqjosWHJrjLDLllp1iq3yFxNnrFr3wJ/r0aU+97SxPJPvQ7cPNHBDvCW?=
 =?us-ascii?Q?lMTyZGguP+V2WEId05nSw88N5ySmfjYCS+/Iix750K1Y/d7Q2l0TdjAE/NUo?=
 =?us-ascii?Q?B8dTmW4yMgoR9p6cpQ6ehuskY3Ysa8BSVoeBaw1NBrpF+d7geHozn25cyQuM?=
 =?us-ascii?Q?Xgg81jejPL55KY+6igJgQXa8np4f+weEtrQ7KP/fWj61DgdsYcPCygtwvEIb?=
 =?us-ascii?Q?q598mddJ75Qqil4Rptcr+IPKs4Wx7Q4Bou2ttJVaSJOVActjiSjZTnEl/hds?=
 =?us-ascii?Q?15Luqb7JthpplRmqF1EDazWXfV4pPtl99O0olngIlK2H22G73XNIqxEUjuAo?=
 =?us-ascii?Q?/hxRGm+Q1om362OQUSEQwVEdExJMEmk1MM5a2ln0crqUqvGZY4JUhGe15w3K?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MzDCxjUFdlyIez6BlnJgjxia8QXBY21UNPei9x538bpivKyVaPdRIUeHXaAww34vFnZG1r7iDozN6yDd13NyiYmUEGN/vo41ScW68VOoaYvAkduAGOhqlMNm0C9h9C5kAZ2AySUEN3QOk3kM1FWoaCPIoQDYinZsC8ARSjruOAFzpt0eDoILamgMGzacqVraQU1JMDLdCY+5kCpVyWFfjdYpHqaHPEFBJ5A1GoH/72gGiG+gPIr6va1IkPvVuStw7TpfhIdmvsGiUStpq3wVHZzNDxXvGw4Kbh4njeWulsIlduwfUsW9LAK1G7zuOlpagd67zfXaIH4YxhViR+5mUv/91tlz/w9QzgzEgCs3huG8BY9ihVuDtzgA3rQXlOTb6yq8a8Z1+4Zz+fjAUXDM7o7yIDhrwZcmU/z3khC0mpIA67GPXgKXrgdoK9CObjBAP9X5sig0sy/Gc3GGzJdvDelE6W5DM4YunRM0irmUPiF0grX45MQnhoELmYjOVHfcsO5TQ7REvd/t20uXRgN4S3KuIWSDglgqmNBNfWGa1xaOXtpSHrMqaUXc3uUUOQzghQ+AKNUhxjoefux54LyABXiB2TWJPuaRda+ePjKguZ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1daa981f-656a-46a4-2dee-08ddd0ba4467
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 05:14:18.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxnawZ5JiyXI+RvPljZIWm97SJKvhzeq0Ee3khsLbr/cibax17rM1y1vmZXLdFreLcHD8jYISMoXdNbeIWw4kalTyEUPB26pQEkC2nEmNyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_01,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508010033
X-Authority-Analysis: v=2.4 cv=OvdPyz/t c=1 sm=1 tr=0 ts=688c4d2e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=vO4P1MGHhjqKaWfj4fIA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: M3VOuYkvP2uNxKaKfviPbQlOpf-AGu4f
X-Proofpoint-ORIG-GUID: M3VOuYkvP2uNxKaKfviPbQlOpf-AGu4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAzMiBTYWx0ZWRfX5ARpegV1CQ79
 xEOVcW76JJNJrOT5Ki9wZOEv2TKrKUwwLPYfP4NAhelFcqa89vOeNucsfKRTdqqZm+hPMX7aFSY
 kEZK0DEXpHNHzpRK8gdc4bxyxtRTVhUX8hjfT+OhY8Y+ix5xlmx3V/dzdYfnXXXWqO3j3uTIj+j
 vlxU+phwmLX0xcO72wctyMdkH9nociL2qBksdo64ZxbMw/uui9fECx18jswRYqbd6eNSdB15GEa
 k64jm7cgR8h8F63TbgRtXMkgCX69lEEtucsi2ewCvqA5Zzrn+DLCMdFMrhn8f1UDWn126/PLXPx
 qafQ+3SjpvOXCpbt97+FIQHFCUi2qMAP2n0ux/h7mwwWpMy5xJ4ncOrsGALUMgs/X3ILeTxGTVM
 8CBOqr5Z+G7Wxbub9GHu77e77+k1WbWOOAX2pvpjXkW/noaVpC2zdLOGWCgoHva7pOW0m31J

On Thu, Jul 31, 2025 at 08:13:55PM +0200, Vlastimil Babka wrote:
> >> By the way, this coding style has been a GNU C extension until the ISO C23
> >> standard. So, until the kernel's C language standard is upgraded to C23
> >> (which seems unlikely to happen anytime soon, perhaps years down the line),
> >> it actually makes sense to modify this style for a practical purpose...
> >
> > Kernel always uses the GNU C standard by convention, so we should be good,
> > but indeed I think this is the case!
>
> I think it's not "by convention" but quite explicitly by:
>
> Makefile:KBUILD_CFLAGS += -std=gnu11

I meant the kernel convention is to set a flag like this, obviously...!

>
> I think this is not automatically used by tools/ build?

Right.

>
> If you git grep gnu11, you'll find various Makefile's under tools/ adding
> that to CFLAGS. Maybe we can simply do that also with
> tools/testing/shared/shared.mk
> that's included for the vma tests.
>
> I don't have this gcc version so can't try myself if it helps.

WangYuli - could you check? If it's as simple as this, feel free to send a patch
making this change.

Thanks, Lorenzo

