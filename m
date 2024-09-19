Return-Path: <linux-kbuild+bounces-3638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158997CEA6
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 23:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34379284B4A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 21:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C073043AA1;
	Thu, 19 Sep 2024 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A7Bw3rEO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LFgq28R7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E252B9B8;
	Thu, 19 Sep 2024 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726779735; cv=fail; b=labz6Q+FmFLbbBV2EG1UseoYUgfZEyh3DlHHa7Doby6cxPnR3RhBB66j5HiG8zHqXgAoApkbQZ9g0KsMLuFTBN7lU69TWXcfFQtAia3G9Go2ekIxpZhAUCXQhFTwk5Lby1CllzZ4YePR1invG6vfGW1zGFYhtbKgVcBwjPQ9/iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726779735; c=relaxed/simple;
	bh=lw6hmGSg5BwRwCIrwbciQ64D1wIdj3jk5g98klh3A7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HIAMKWKnZ9c5XWyUs/SbeQ7zCPt5yYN3DtaMis0ACpUsH03VdfzKNYrHzeLTC95Qie1ghKCusinBTwG8Mpv0cwasfXoFuBHA9MWWKdVywW3rCelOGGa5ZCWBlPmzHYAUj7lnQ54yDnkqyt/R1/o9GYMEhTnFkdMNSGUWzVZp+ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A7Bw3rEO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LFgq28R7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JL1P5T001610;
	Thu, 19 Sep 2024 21:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=dBKemdJUVSQUh3nwWudUnwqly5qAWOgUQqxopQEwXIY=; b=
	A7Bw3rEO0iU+PvKSFw9JSplrgmbNpOtrhmiosInu/Hd6XF6wnw5aSNC4eusRz0y2
	4uUAkuHjUSRg7idbW8ONTSpgfrFg2XSNtTYvP/n3T9ZaP0Rf7bc+XfYmGTKdT6FM
	1uF/Risa9/9IcJCdfj5jyjPm8ZOXlJXRduwTMUls5JRL/u3JqgGIs5uetkpVZ+dK
	PeW4qCfGpdn1hMpnJKgLTwOOqX3jnfTLTgftxSvEv10/LeT48LzTs+w8kiLDxqhQ
	UA5muGWVecnd7+mPYlwVjrTN4WydnuUDPcXQki6vooH/XvkPiDbrlNjMl2jhTMPn
	7ivSe5aNi7fZ9QdGNLnwxw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rx53cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Sep 2024 21:01:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJnW12008105;
	Thu, 19 Sep 2024 21:01:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyffdfnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Sep 2024 21:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exA4b6xI/sjtc0FrBIa57mb0ek+7HhOoZWE9njvVsFAJ0x1fmJ8A0bsbcjQomgIG3VWYBZE/oMjAx1KmTNk4jiCVMVbnxGRnQR3PThn0pCzk9tegjida77ISSY9PZ3VlWYSjtTzJGmDnN7IqqaaCKHEWAS/Z63G7znzx6af1rsXB59Nsu3nn7kLE3Y7dqqK5yNGgkV1Rf2veUsnrhOfiLuQcDXWiCumyDqbDsvl3PWbMBlhdV3fiUco1qJyBr2a6wy3FfA+C5P8s9cen3TB/H9w76LQnksOEdjKBDyp+1RFkE7v+EZBX7sN68HeYWl2WOtlE7fwSVSOMpasaeyz6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBKemdJUVSQUh3nwWudUnwqly5qAWOgUQqxopQEwXIY=;
 b=AKxTAjijh0JAC2/Xn6b8lrLka0kw3QyPQUzQtfLaMhSggPRhY3k5YYtWwpz8skfprfHO806GHpjGzb+/ACLakiWV2alJ9FWOkrrR6Hq5Rn8WnFbP8k5sa2eIvYVlwGZ94QC9NaFbqVKaCXUFnfIHFTPYM8R+h9E6G6DAO9GzUxVqt0O8s1BFlvrNpGaGnJAB0LDUaVKS3QzyIN6AvHofUfCcqJ6yJzeleXfYwn+rb0VWkaSFJtVS0LZMLFQ9Sq8gWafqYHcC33z9slaOHQ4hGb/UaIDFR3Ow3V310RiKxyJ9ehlhVii5Mq9pOltmjBjL5psNbJmNkxlYRo3DcU72Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBKemdJUVSQUh3nwWudUnwqly5qAWOgUQqxopQEwXIY=;
 b=LFgq28R7AqZL9ENDExWgbHzcJFIeSNZWlK4lKKtgojZBLqWubH6ECgmhBsmzeNNA/NOHjJZ33xJV3BsyCD32DJnv6GHEUNAzGoebH+d+4I1CmtMRUqwfUttr9j1CBNj/6YiOfUUt9+apFOGEAXMBinZ9s4PphROCR++acSkG+Y0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA3PR10MB8164.namprd10.prod.outlook.com (2603:10b6:208:514::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.10; Thu, 19 Sep
 2024 21:01:54 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 21:01:54 +0000
Date: Thu, 19 Sep 2024 17:01:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <ZuyRPYFl4uDijwNg@kvh-deb-bpf.us.oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
 <20240906144506.1151789-3-kris.van.hees@oracle.com>
 <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
 <Zt9P5p6XGBp2Uwde@oracle.com>
 <CAK7LNAS53tB708sRSbCA=_2GP_sAoNYHtLzhYMV=5U-+FfcR3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS53tB708sRSbCA=_2GP_sAoNYHtLzhYMV=5U-+FfcR3Q@mail.gmail.com>
X-ClientProxiedBy: BN9P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA3PR10MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b229136-c552-48ea-c8ec-08dcd8ee4a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MCtsdTl6d3BmZ2FDNmZOY1oxdXBWSXE0NW1BMG0vWU9PK0haSHkxVFU4cy9R?=
 =?utf-8?B?cjJRdU1QRkY1VHJzdXBlZHlISjdKK3pKVjN2ZnE5Z2ZGOFc0Q3hJR2hLUXg3?=
 =?utf-8?B?bVIrRGVYM1p6enVzVk5rMTRaM21weGhoTjdES01yQkZsajlQNDNaR0h1SGV3?=
 =?utf-8?B?UWtndFA2L0N0UCtEb3hiWFlzODZLb1ZKc04rS0MrSS8rNTZDK0J5MHRxRno2?=
 =?utf-8?B?Zzl0Um1GOUp5bEF4UkFZeWNrc1lycGdWVFloNmZKNXMwNG9lVEtlM3o0Y3Ew?=
 =?utf-8?B?eDMwTzQvWjN3VkVmaDY2MTd4TWF5WHNUMVltQmFVZ3Y0VDdRUnlwcmJmVjd1?=
 =?utf-8?B?T21WaTUxRWx2NGVJeWR2SXZSeXREMWF1eVcrY3hNSmQ3ZjVsQ3hqeUdMeTgz?=
 =?utf-8?B?eTJROWRleHRyQVdZTzhoUUlWRjVlcmRnb1IyYmR5WVU3L3hzcFlVR1J0ZTRX?=
 =?utf-8?B?SG42Z2R0NzZhZ2pNWXBkVW9ucUtQUWp0Y3p2WWhmSjNaR1l2SE9Eb3prZG1m?=
 =?utf-8?B?V0RTYWo2UER4c3NUTWsvMm11SWR1clZ2VGtKaWFtbW04WHpxWEVPY21WUVpx?=
 =?utf-8?B?ZG5JUUk3SUpkMHFPVWl6MHh2VGpTTmIrU0FkS0NQUjU4THUvZ05kcXp3YjB5?=
 =?utf-8?B?bERrVmxzRmxUUWJKNndhOU1ydFpLb00zd3pQM2xOckRXTTlCY2V0MWdqZHZm?=
 =?utf-8?B?S1Vod0xmNHBXRzVnRHdCbXNFZ1N5cHQybDlNTzNXdDNlcTF0ZUpObUdseTRa?=
 =?utf-8?B?RVNRbUVQNlYzcWJvNmZhdWQ4aU5VQzJ2Zk5jMlRsNFRLYTVhYWJ5OWQrRzg1?=
 =?utf-8?B?aXRWd1R3OWhiUy8rZHFxOEF6aUpOc3p3YklHQzUvaC9oRWM0STlCRDZYakdv?=
 =?utf-8?B?U0M3VWhZSTdiV1g4K1IyVzAwc0R5dE1Ha0FqK3F6allUa09wS3JqOW9zSzcr?=
 =?utf-8?B?cU5UOXM5a0ViZCtZbXU1cUFCdi9RK0M1MkJqL2NFZTRJZFJ3eEtmTlIrWjBH?=
 =?utf-8?B?SHFWOW96Q2hCWmw0UG5kcUptcXdlZXJ4NldOVDVpdzdDT3VGV3ptK1ViVTJt?=
 =?utf-8?B?VE81R2F2MDVIKzNpajM4alN0MUM5bVVzbWpBN2pMdmFldEhOdVdZZ0s1ak9s?=
 =?utf-8?B?dWhIMVZlVGNTVUxnTE9ZMU1paTdmZlZvTlRPcjB0bXo2OUlDYWwvWklIazU3?=
 =?utf-8?B?dlF1WU9yUlpDYUp3b3RoNm1EbU81TzdaNGEyY0FSUzEvOVBBMFR3UGxGU016?=
 =?utf-8?B?TkllM1JFcklyd3lYM0RnWEM3RFJzRUZPTFlWYkNBMlpNSzVtc2VPRVAxL1dK?=
 =?utf-8?B?QitPMHhwNFJ6bjRBMDBhVFJTZlB3Q25lSngwMTYzNitBUGZOdkp6azRWTHRw?=
 =?utf-8?B?MjMvYVNKY292ZlpaVTM2UGtFaXBERjdkTFJOY0FTUEFGMS8xZXQ3NEF0aVg3?=
 =?utf-8?B?VkphNldudU1tU1d3TnEwbFZqMENBSnZjcml1ZTRhY3ZJRGV2VGlPN3RwQ28v?=
 =?utf-8?B?dzRYOHFJazlaYldFYVV1ei9JNWlacjNmOGJSNnZwcGJSSFl6MG45YjNxdHkx?=
 =?utf-8?B?Y3oreFVTTzE3TlVDMk9IazJ5MzU3ajM0MU16UHpFRTcwamxTYjA2YXFiV2xY?=
 =?utf-8?B?SjJTNWxmM3dNQ1FBVDBsTm9HK3BPSTRCNTZJOUhpMVFqSHdkUTQ5N1d6eVBu?=
 =?utf-8?B?amFSbnd6aUY0dXoveEhYZDFEaktjL2dFcklyTkRiVjBWSDZtYjdMdU50bjdx?=
 =?utf-8?B?NjJ2aUpGTVFmblBUNEduRmdVM1M0VW5lc3E4dFp1cDJmSTJvQVovbU1vOHZW?=
 =?utf-8?Q?C1vYI6LKdqn3AJfYtOKF2v+aKhHowAimKA5bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elpMang1SnBpSlZuRmNhcFZSNHFWNjBqbDlrd3cwRmNLUVdOUVhsSForNVNV?=
 =?utf-8?B?K3hGV2dnNVZDcjNydzZTSDVic2VoTjh1YTFSeml5WnVIMVpLcjZLSXdZTXpG?=
 =?utf-8?B?UldXaHpuWXpJTnJiYjJnL0J4ZE1mY2hBR3laNlU0R2dhSnVxMEduWlBadStS?=
 =?utf-8?B?NXlrOVlmN2x5MUxsTDNueFdZMnkwUmdEWkdRYS9RelVScVluMW5Md0tvaWV4?=
 =?utf-8?B?aGV4Mk5hODAxVmJldzZYa05RUE5mWWo5RnZ2YXdxYzhWVzRHN1IzVXhZRXJC?=
 =?utf-8?B?MG1YL3YzT2RpblVxMGdHckJuNlVPL1N4bUFlczhrN0ZCOWdmanlkZnhnVTcx?=
 =?utf-8?B?Zkc2Tmpzbnl1aVpueUQ3Q0l2Y2lqNWdOeDBpRDFzdHJPYkxBWW1aVHZIcHo0?=
 =?utf-8?B?MFBES0FaTDFOeEJXNXk0WVRCa3FacjJKMXBUaGhKbUEvOEh6Z1VvL2w5dWtr?=
 =?utf-8?B?bmtQcXQ1c3czNXprbFFtakFsTGg3M0lzZW14VWh6c3E2bGk0SUhEZElKZUIy?=
 =?utf-8?B?Z2lKZHhWUktGTVc4YlpNK2E5QWRMN29VV0tlZTVTdXIvOE0wZUtlT1Q0bE1Y?=
 =?utf-8?B?Tm1oYklNNHBWS3Zpd2MwNzFjeUxMNjAwR3BpOHVaNE0xNDZ3VXZyc0dURFll?=
 =?utf-8?B?T1lVdlVieFVOL3BtUlBraFc2ZGVmOTVKUFBzODBZc2xuTnZwam05ZTkycmJH?=
 =?utf-8?B?UUc5MnZlOFNTU0thSU9CZWcrTjJ5dXAxQWhyQzEwVDhtakM2c3ErVU9jMnVm?=
 =?utf-8?B?OGFPNWpzaEg1UnpKZGhyS1BIRitoYkNWQnhsNXRNSFo4bjBNMS83OGVtOUpW?=
 =?utf-8?B?ZG01TTFkSjNnTFV4ZXNiOE44dVFGN1pHVFpnU1BxTXZJZEVuRDJFZnhkRWN3?=
 =?utf-8?B?ajBDc3Evb3JkOHVTM0ZMai9LYno3R1lJRmZYOGlnRVgySUJvcHp1MDlTOURm?=
 =?utf-8?B?YnFDdkdDUzRyeHo0SXNmQUx4ODZVakhyN0FYNzBSc0pUdm1BN0lGZkpjZ2RN?=
 =?utf-8?B?aGFFRldkQ0QvY3gydXRCSUwrcEpPcjYzOCtxYzBvUmdWVGZVWXdsQk4zK08r?=
 =?utf-8?B?Q0l2MkIvb04xNERUTjNqVTlDeDVFbnV3eUhiRXluRHk3OFJQbmRHTjJmMFFM?=
 =?utf-8?B?K2pnWXRGVkFDd05MRDlzV25NbGVMN1BvVFJTNG5ka3NxSHZNSHZncWREYU9n?=
 =?utf-8?B?SDFHR05ScWpYTFk5MzBuWHVoQVpGYXVVb1NETnpxdm92NDhpTWcxdEtxcDk0?=
 =?utf-8?B?d1RXWDIveXNNVHJOeFhGSWRNcW9GbFF3L3Z5dDVzVElHbUlRWFRKYUlCTVI0?=
 =?utf-8?B?eTdkSVFmeG9IVmVhS0c5Nm5YeUU3b01JZDVUM2R0Uk9KZHRNZmdCamkwcW41?=
 =?utf-8?B?SHlTa2NnT1Q3WjBNVVo5dTR4RVBiNndEL2RSMklHZkpyWnY5RytmS005MUNU?=
 =?utf-8?B?Ylo2d1ZqMlFtUDYybm9CWE5GbVhqeW4zL2hERE8vYnNoU3o1N2RTZmJsZHRH?=
 =?utf-8?B?ZzBncHg4blI1Zm91ckZIK1JjYU5tTTBaZjFua3VMa0FXWlpaSGlKeVVjNXNX?=
 =?utf-8?B?OElsQU5LM29XQXVlSlhJamVDb1IyRjhjY2wyM2lQejZ3UTdxMFhkNjRqVStj?=
 =?utf-8?B?U2FseDBOdEF0NFhLQ3hBYWpmbldPSWRUektpYzJpaWY0dkxVMnkrK2ordFo1?=
 =?utf-8?B?eHB5MUdWSWlPQVRnSUxhbm9rRTZrN1FiYVcwYnU2SEp5aXJ1KzdFVThEQmI3?=
 =?utf-8?B?ZmNFYi8yREl1eG9lRVBvN2ZSamZvQmJDZGxucXZ0L0QyVUllMjFRYzY3RWV0?=
 =?utf-8?B?RkZUSCsvdHRldEdxNVBqRmE0MnQ3MkNFMTdjcUNqandLZWdkQ0dPaWcvVEVK?=
 =?utf-8?B?dUNHajl3QytaeFpXYUlYdkNGQjN2QmdrVG5zYWFBazBNS0kvUXdUanFDVGg4?=
 =?utf-8?B?blFhOEVhLzhPYlNNWmdFalBGUVozM1htV3JnNFlMdzhHcGo0aTZtV0JDbnVo?=
 =?utf-8?B?NjM3dHl0dFA1VC8vVnVuaVV1cG5neFVIT1VBQ09YQnE0QVZ1Q1FZSlJUTjhC?=
 =?utf-8?B?TG0xWHdETXBqM0xoY2xmeUxKaUZYWVJ2c29nNUh0QnhnOFJvek1GdGhoL0NN?=
 =?utf-8?B?OUR2eXU0TEFiN0VmV0ZVYXI0V2xHMlVJWnU4Zm5MbVpLRTRCTEp2NzVobEZD?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mPSIHlL23QcQokQWEN5rvpYK8lnYVB3URFSKBbIyu17sztfGFH+G63FhqtRRuCG5kRuHrTCpIX8JGQYcFwt/2UhIVRYewh8xHNfWqEuyiWn6aOCP1qg/SF4RE80LEdjn+5koYFNgf6TYbdK9DipdMPumqNEKfXrBS2xdcqTQzDgzD4NinC7ePWotZm7OkjnEwzVuAfeBZDYeq2Dn9AHgkXXgfFnxaO9enSJ196sr7ugCixpjci/AJrVg3haHpEz6xf6UVCl5rPxFWEwOiTP1JmRkFFAiSHW+9vh6tDWq7H7KIjg1eSrG8Fu8slVzlAx16s0XVFgLP5Vxue4CuCjdisP2RdXk+cNz0qSqf5c+VZbpjIr+fvOkY0v+z7OToKyHh08SzcrlzIj33OfKwAjOQsHBHzhm2z6hqU5JvcfgHZrrT7OsiiwrIp3rMflCsRRTsbO8TrYK7qO94oRbeF5HiZXYp3sRIQ5c+Efm4lmb2cupXMjhL11DUmcuaYaSxWFu1muSHjHC31iBPZTPj7tdRDknQxLv9m5CX9UN1hHaj94VBbEUxIdkFOkbQLaBFE1S1TDqxqxNjykUOCgxFjjnBG9RIqU3AGS2MacSGtjIh4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b229136-c552-48ea-c8ec-08dcd8ee4a49
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 21:01:54.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdyrNLhO1SKircCP29KkDeAyk15ooptoJ06obzAm/iXlWHDJYQbdZ1XT/LbolYvvcvSH2GyAuE4YdDkpbweetClGOIzbTjiy+ntCmsjYKyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_19,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190139
X-Proofpoint-GUID: YI5kh4jjl93EFxGOuKG95hEFJdGW2--s
X-Proofpoint-ORIG-GUID: YI5kh4jjl93EFxGOuKG95hEFJdGW2--s

On Thu, Sep 19, 2024 at 11:28:44PM +0900, Masahiro Yamada wrote:
> Hi Kris,
> 
> 
> 
> On Tue, Sep 10, 2024 at 4:43 AM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > On Sun, Sep 08, 2024 at 11:50:51AM +0900, Masahiro Yamada wrote:
> > > On Fri, Sep 6, 2024 at 11:45???PM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> > > >
> > > > Create file module.builtin.ranges that can be used to find where
> > > > built-in modules are located by their addresses. This will be useful for
> > > > tracing tools to find what functions are for various built-in modules.
> > > >
> > > > The offset range data for builtin modules is generated using:
> > > >  - modules.builtin: associates object files with module names
> > > >  - vmlinux.map: provides load order of sections and offset of first member
> > > >     per section
> > > >  - vmlinux.o.map: provides offset of object file content per section
> > > >  - .*.cmd: build cmd file with KBUILD_MODFILE
> > > >
> > > > The generated data will look like:
> > > >
> > > > .text 00000000-00000000 = _text
> > > > .text 0000baf0-0000cb10 amd_uncore
> > > > .text 0009bd10-0009c8e0 iosf_mbi
> > > > ...
> > > > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> > > > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> > > > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> > > > ...
> > > > .data 00000000-00000000 = _sdata
> > > > .data 0000f020-0000f680 amd_uncore
> > > >
> > > > For each ELF section, it lists the offset of the first symbol.  This can
> > > > be used to determine the base address of the section at runtime.
> > > >
> > > > Next, it lists (in strict ascending order) offset ranges in that section
> > > > that cover the symbols of one or more builtin modules.  Multiple ranges
> > > > can apply to a single module, and ranges can be shared between modules.
> > > >
> > > > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> > > > is generated for kernel modules that are built into the kernel image.
> > > >
> > > > How it works:
> > > >
> > > >  1. The modules.builtin file is parsed to obtain a list of built-in
> > > >     module names and their associated object names (the .ko file that
> > > >     the module would be in if it were a loadable module, hereafter
> > > >     referred to as <kmodfile>).  This object name can be used to
> > > >     identify objects in the kernel compile because any C or assembler
> > > >     code that ends up into a built-in module will have the option
> > > >     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> > > >     can be found in the .<obj>.cmd file in the kernel build tree.
> > > >
> > > >     If an object is part of multiple modules, they will all be listed
> > > >     in the KBUILD_MODFILE option argument.
> > > >
> > > >     This allows us to conclusively determine whether an object in the
> > > >     kernel build belong to any modules, and which.
> > > >
> > > >  2. The vmlinux.map is parsed next to determine the base address of each
> > > >     top level section so that all addresses into the section can be
> > > >     turned into offsets.  This makes it possible to handle sections
> > > >     getting loaded at different addresses at system boot.
> > > >
> > > >     We also determine an 'anchor' symbol at the beginning of each
> > > >     section to make it possible to calculate the true base address of
> > > >     a section at runtime (i.e. symbol address - symbol offset).
> > > >
> > > >     We collect start addresses of sections that are included in the top
> > > >     level section.  This is used when vmlinux is linked using vmlinux.o,
> > > >     because in that case, we need to look at the vmlinux.o linker map to
> > > >     know what object a symbol is found in.
> > > >
> > > >     And finally, we process each symbol that is listed in vmlinux.map
> > > >     (or vmlinux.o.map) based on the following structure:
> > > >
> > > >     vmlinux linked from vmlinux.a:
> > > >
> > > >       vmlinux.map:
> > > >         <top level section>
> > > >           <included section>  -- might be same as top level section)
> > > >             <object>          -- built-in association known
> > > >               <symbol>        -- belongs to module(s) object belongs to
> > > >               ...
> > > >
> > > >     vmlinux linked from vmlinux.o:
> > > >
> > > >       vmlinux.map:
> > > >         <top level section>
> > > >           <included section>  -- might be same as top level section)
> > > >             vmlinux.o         -- need to use vmlinux.o.map
> > > >               <symbol>        -- ignored
> > > >               ...
> > > >
> > > >       vmlinux.o.map:
> > > >         <section>
> > > >             <object>          -- built-in association known
> > > >               <symbol>        -- belongs to module(s) object belongs to
> > > >               ...
> > > >
> > > >  3. As sections, objects, and symbols are processed, offset ranges are
> > > >     constructed in a straight-forward way:
> > > >
> > > >       - If the symbol belongs to one or more built-in modules:
> > > >           - If we were working on the same module(s), extend the range
> > > >             to include this object
> > > >           - If we were working on another module(s), close that range,
> > > >             and start the new one
> > > >       - If the symbol does not belong to any built-in modules:
> > > >           - If we were working on a module(s) range, close that range
> > > >
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > > > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > > > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > > > Tested-by: Sam James <sam@gentoo.org>
> > > > ---
> > >
> > >
> > > If v10 is the final version, I offer to locally squash the following:
> >
> > Thanks!  That would be great!  v10 is indeed the final version (see bwlow).
> >
> > > diff --git a/.gitignore b/.gitignore
> > > index c06a3ef6d6c6..625bf59ad845 100644
> > > --- a/.gitignore
> > > +++ b/.gitignore
> > > @@ -69,6 +69,7 @@ modules.order
> > >  /Module.markers
> > >  /modules.builtin
> > >  /modules.builtin.modinfo
> > > +/modules.builtin.ranges
> > >  /modules.nsdeps
> > >
> > >  #
> > > diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> > > index 3c399f132e2d..a867aea95c40 100644
> > > --- a/Documentation/dontdiff
> > > +++ b/Documentation/dontdiff
> > > @@ -180,6 +180,7 @@ modpost
> > >  modules-only.symvers
> > >  modules.builtin
> > >  modules.builtin.modinfo
> > > +modules.builtin.ranges
> > >  modules.nsdeps
> > >  modules.order
> > >  modversions.h*
> >
> > > If Sami reports more errors and you end up with v11,
> > > please remember to fold it.
> >
> > Sami confirmed v10 [0].  Can you squash his reviewed-by and tested-by as well?
> >
> > Thanks for all the help!
> >
> >         Kris
> >
> > [0] https://lore.kernel.org/lkml/20240909191801.GA398180@google.com/
> 
> 
> 
> 
> 
> Can you please add a small explanation to
> Documentation/kbuild/kbuild.rst ?
> 
> 
> It documents modules.order, modules.builtin, modules.builtin.modinfo.
> 
> Having modules.builtin.ranges there will keep the consistency.
> 
> 
> 
> You do not need to re-submit the entire patch.
> 
> If you provide a diff in a few days,
> I will locally squash it.

Thank you for offering to locally squash the diff.

	Kris


diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 9c8d1d046ea5..142be0c74761 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -22,6 +22,11 @@ modules.builtin.modinfo
 This file contains modinfo from all modules that are built into the kernel.
 Unlike modinfo of a separate module, all fields are prefixed with module name.
 
+modules.builtin.ranges
+----------------------
+This file contains address offset ranges (per ELF section) for all modules
+that are built into the kernel.  Together with System.map, it can be used
+to associate module names with symbols.
 
 Environment variables
 =====================

