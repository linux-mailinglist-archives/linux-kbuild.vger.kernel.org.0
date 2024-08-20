Return-Path: <linux-kbuild+bounces-3117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A81E958CD0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C649E281FBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CEF40870;
	Tue, 20 Aug 2024 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CuApNQAX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zbSe8Ohi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210821BDC8;
	Tue, 20 Aug 2024 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724173842; cv=fail; b=KmZ4TvCXMkkFP+vqEYFMnetX81AuVw2w3dd0lH2+2Gd+Fwf2poElujSSBgIwRM6nIgy5m5US37kxIbgutfaR4CwqTHRrYPU0KuTWOk5+cigQ1XtzDTn+ANB4pDCnSsIRPWp+2BjB6UIVD82nj3FAVORnxGCmBM/UVFwZN6x8KvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724173842; c=relaxed/simple;
	bh=eG3e2AHVgR13OZAIm8dY3cj+a6hNRT/pakDw3xAXl+M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uxE/X8JS2fhZsgFXJLS2zQjFiOgcptkz4qGvMU5SgAdsbNKGm13cQddkayhmkdola3Kd7feksPERInXVqCd2caP3LslwlCs2QdO49ffRPng8wzR2GuXs8SWWivDNEN6Pik0ZchwS41mCldV1fiV5Y0YtvRc7Ubl+OdyytEU9CLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CuApNQAX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zbSe8Ohi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KFBYXr030474;
	Tue, 20 Aug 2024 17:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=corp-2023-11-20; bh=J
	J+m7iru5WoiUou3+ysKURV8nzOS2F17np15wwr5L7A=; b=CuApNQAXOLUPz2OhW
	Hs5LGg00p8SOtFzhh2APJv9LdGA1Stiq9xIJqGUbEfpV31/V2VGQZUwS5HASw+sy
	/Q0qILgoMK809iEy5xDOuSP7eudbtpVFU1EfkHhLtaVQewUUeJXfOySGDYL9uYys
	kniAROxYzL0HrpmuUubRLthglhJ1C6RiqmmaFV2obusECt8DScbuT684FVA9Co2i
	pwcd0TX0k5APltQ9E3QF1qmc2A/zDJkibHMemv/sZ5NCIwjn4U2NuAICBxJQgWFi
	Hv4IIDujATfNIRtpQ0SlCtOqkEL45eGm4Z7+Gt1mZ5ZqSqljoRH3tOZeEWj9VkEE
	uaMkw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m45dn2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 17:10:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47KG4Hwf024164;
	Tue, 20 Aug 2024 17:10:26 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414xbejv8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 17:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8G4Xrlowg/tvwahALPG1TRCtSuyrnWrxohaNftER51HIAgL12O+4c8yMJhBynDAQBuTdTwpMTLW1ISkqvInqcKRyu9NuEJRAnkjKzd58ltMEr9aUOYp4oK04iUpItwQpGoAvPxyv7cTxxsi41yQ54ycJU5FASgWtHSvRPAq9irnQdtophMas7tO3XyjhsZ8m4cMBih9ThgyKPR1oyxCy+T11pp+tvblCmvwXYKrVQaBk+zyZVZ8b3V6vfeS07XegWp4DBdhXq5RWc6gB69h6HsnfVqQqA2LxeS2fCOX0HNsU1mc8bODqfnGnZCZghT/09oFf0cUTAzkdiNYvB7Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ+m7iru5WoiUou3+ysKURV8nzOS2F17np15wwr5L7A=;
 b=rf7d8QnG6jGJa8t9gTazPZhfZWT/cGu2tXNbMZWvCSpXSlr8c0zb4KZaKnLPYNZn8iDaOryPaVIPQ46jMoaLCvx/DYa916x2ZclQWdC1Tc/mDTvjnNQVQd4w/h+4I3I/IEvyvSNHWysY4O//5gSo3TQJ5QPuqVJxfYdsSY06k13KOa/VttwyuEfgXMfmoENCtLFisFUatB9BBFeKXySa/8J6e61jpH9jk29sqhYLyZWKsY3Q8aeh7z6Eg9sYvPc4U6NQ+UzV3zQLLQBd7YvFxjDaUhDYj9eXEY//3lbJMIiEwasfjfJCVlfcfA0KiKDuwiaruzoJBvCnwLIyyVIOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ+m7iru5WoiUou3+ysKURV8nzOS2F17np15wwr5L7A=;
 b=zbSe8OhiVgNZq7eZlxfmHnbiPnzb9X0mut3lZ7Es6Saa+smdRduO+dp1Oka/EjDzKWtRBfqIgXNYGS1Ot/Dm0kjgKw92PJ5uxQyIbjAkIxZ7zXkvkygAcHh738HnflgyuXNPnJx1wgZt7YDysLMLRaL0lnrkphUy35CIeZgpFyA=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA2PR10MB4636.namprd10.prod.outlook.com (2603:10b6:806:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 17:10:24 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.7897.010; Tue, 20 Aug 2024
 17:10:24 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
        linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 0/1] Documentation: kbuild: explicitly document missing prompt
Date: Tue, 20 Aug 2024 10:09:45 -0700
Message-ID: <20240820171000.1656021-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.43.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:208:530::9) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA2PR10MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 717667b7-eef6-44a4-d923-08dcc13afab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3VNOC9jM1NyN0hSa01zaWlKelN0d2UyVEk0Z29aeTB1dG93YTBQZjYvSkdq?=
 =?utf-8?B?ZWpDeXNjL1dBcVJTU0FqZzgxS09SRVY0cDZ3MFNQYzJTWTVmRmdaRnEzWVpO?=
 =?utf-8?B?QURiWDQvSlcvbDczWFhOV0h0aTFyZnJGMUdoZ2V3MS9mZzdWWXJSclFpeE01?=
 =?utf-8?B?ZWhJd0ZHeFI4NWpkOXVhMXh6Q1pEM0MvdVRyNWFwWUhrQWtXNGdUV1NXV1V1?=
 =?utf-8?B?SHZ1V2Z0NUY5YVFEV2VweVZKTTdGK2VmTFpZNStTWDhKaklGbnJuUnF0Wmlu?=
 =?utf-8?B?WndNaXVKTVRVcjN3WnUwMmtvcHp6NWVHT0hJTnNiR1FMckQ0UWVlamJDMVAy?=
 =?utf-8?B?UXdjT3JiWU0yYk5oZlhKRmV2aUYwd1dxMEFXTXRPY1NsL2taUW5rck41c3Zo?=
 =?utf-8?B?TEZIVjYzemgrZHp6Wk1NMGpXcnRmbG9Zd3pLYWs2OFpHVVlHN0pvN1E0b1JG?=
 =?utf-8?B?Mlp2YTIvenZoNzR2cEg0T1RWa1RNVDIrVG1sWVM3MjZ2QmlDSW95MVlwVnNT?=
 =?utf-8?B?M2NKcEhGbDFiZXU1cnBLOWRubmFmbmZETEJEcW1DcW0zc0NrRTJ0K1l3S0gr?=
 =?utf-8?B?eUtEaGRKN0NDUm40cTBCRXBxUk8vNlg4emVpNCtqTHk2MzBrTWplRVN5eFdL?=
 =?utf-8?B?cmkxNjJNYS9Rcm5ZS2dZcjlzdUt4MUVWNkp3a1I1NVpiS1BGL0RxdGFrd1Bs?=
 =?utf-8?B?ampFM1daMXR4ZFoxVUM3SkF3dlNiVzFIV2tDaG4xWlFRa2tvZFEyc3J5Y25h?=
 =?utf-8?B?MXAxVXFwTk9makxRWk5xSjNNaWRpY1hrbmtCODZIRmJ0VytCbWtBUmY2b0dh?=
 =?utf-8?B?VkI5dXBwZFhIMng0c1h5My85d3k3VUVraDVJalVjOWg3ZzFMRkphYnVRMmR6?=
 =?utf-8?B?TmpNS0E3NHRWZlU2eVR0T0I0UjBNdjFnVXlzWEFLcy9KdHRBVmF3UXR2MEVE?=
 =?utf-8?B?WGNUVENwMkNqUUFiOEpGQnd1YWsrNjU2K0Z3Vm0xaTBuclNld2Q1VE1acDNn?=
 =?utf-8?B?dFlmSys0eHpyMmdJQTc1YzFCNVZ6ekJJYjRrMHhkS2hSbmhPVGc0UkI3akF3?=
 =?utf-8?B?aUdPT21OM082VnRKYVNFYitLU2lNcU1lSWpob3FNT0s4MnBCa1EyV09HRTVq?=
 =?utf-8?B?eW9yR3RGN2xnUXZ5emFCb3RJd05qcnAvKzFNbUlneDJXbTdyVkdHbUhzeFQz?=
 =?utf-8?B?emNCeDR5TXJCMDZZVWNXaTV3d2ZScFhTTmFOczZCOFJvdTZUNUV4bytiWTVh?=
 =?utf-8?B?a1NOcXpDbE5DYis3OGxGMzJRYXVMUEJTWHFoOGdxdmhMRVVia0dmVG1rbkJW?=
 =?utf-8?B?UjMyZmI1MkYrNWsrTVNuZ292Mm1TNnJZTlZNdzlOYkZYOG41Nk8zQWpDSjh4?=
 =?utf-8?B?Z1BKalp1MHFqTGNzWFJYcHBBdVYwOUxYUm43WFZ4ZThWT0xDcGZNb1Q0bTRn?=
 =?utf-8?B?d3BzSWZ6cmVHbWN2cHdLUTdtSjBSQ1EvNG1rTXhDSm1UNEM5OTZTVzBIZFRQ?=
 =?utf-8?B?VWJESTVyRkNuQ3R3OXhqenp3QktxNFlaNzRZdGtaOXNySnpiaGVjQTMxUmgx?=
 =?utf-8?B?Yngva2FmM1huZHBqNytYd1pPemdoTGNaOHhlS2RqOGFqdkNEUnc3bU9XR1kr?=
 =?utf-8?B?ZlFXS05YUkU0VEcwMHFYZ3J2UXRmMkFnUnFWZkYwYW9VTFQza1BmMis2TkUr?=
 =?utf-8?B?TWdiVDBPQkVCbE0vRlVOOVYwVUkvancwZlUwSndHZ1lyNzUzbTZMM3lWNk9Q?=
 =?utf-8?B?NGlKM2lvYVNkV21Ld1UvT3FDWXpWSFNTUlIwaTVjNWVBSDhyci9aRGlKb1dD?=
 =?utf-8?B?QWdCb3VoUWh1RmpoVWU2QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXEwMWszUEtiWVlEN1hBVXhBT0luR1p1SVYwYTF6MHJBbGVNQWhlN1VBZFVQ?=
 =?utf-8?B?TmthdDRIUVMxeHBFOEFCOXZnV3Zob2Y5R1VBTDBsaWtuTHZxMGhjWURqSDhq?=
 =?utf-8?B?NTVGUUhvL1ZpbUVzSG5kTXBCYTB1dlhrZ1ozVHJORTJFd3B4YmlIR0pseGg1?=
 =?utf-8?B?Si92WEx1dVQvcllhaTJUMVJVUWxwRkFyUW9RUGltYkdBMHh1T0ZWamk3OEc2?=
 =?utf-8?B?OTZTd2owM3dPM1YzaDM1ZnlEcXJjZWtJRjlzd29DL0xZTFRDT2xLT0pxSEUy?=
 =?utf-8?B?Z2ZxMUF6cVhVS3hFa0FnTGZFR2grdm8vNmpkVkN1VWxGR0VWSFBoTGRzVE52?=
 =?utf-8?B?eFVsWVR4UWtaOEcxdXNnWThHUXIrcEhpYUtZT1pHaTR2QmFwaG92VGhsdjJ4?=
 =?utf-8?B?Z2JpVCtyVlpNRGhwU2UxVEpPdC9WOVJ6cVBYRVltQ21OS3luM25qMkNUd0Rv?=
 =?utf-8?B?QmVuNWoxejZIZWUvWmRrdUdESzh6MGxBLzY3bmZNVlVMRytMMTBHVkwxSlNM?=
 =?utf-8?B?Wmd2d1oxTUVwWWJwS3JJVXpScVZrMTBiVFJTS3AyWmhKYWt2R25GblJjbEh5?=
 =?utf-8?B?d3NiR05WV3VRRFkrbDI4M1Q5eHBSbi9yZFloVmEyQ1FGUWNjTEJ1bFVieU9s?=
 =?utf-8?B?OXFJc3RlaGZzYXFVQ203clJlZnlWU1hvekZOQlZEM1RIZVcvVzNDZ3dnSC9h?=
 =?utf-8?B?d0ZzNm02VkpxeDBwQ1huZzY5TzhLNG10Q3hZalVYK2pHa0V4Y0N4MmNSOWFY?=
 =?utf-8?B?RFg5U3ZHTklwNXM5UW1MR1hqcTFIMWx3VHppbHUvTHEwbVh6RzN0bWJXVkZN?=
 =?utf-8?B?a3pXVnJzeFVQNEUyTHdOaVNNODQ0eVhyNmFHdEVXd3RHWVVUUldmQW8yNFZi?=
 =?utf-8?B?N1JEb2hJWGFlN3UzNWRveklhelhyZ1BTYWN4MFV6cmh1OXZDc1NWV1lnV283?=
 =?utf-8?B?UGtud0JQUnFlUjYwZkdQaWJlWm94MkpNQndrREpud3hBdnM1VmY3dGFDOFU3?=
 =?utf-8?B?YXBoVUxIRWJCV2NYLzd5ODd1NVJzc29sTUpVYW4veFB3RnNZRWUydmZ4QmRO?=
 =?utf-8?B?dWhCOUZ0NVEyY2Zwc090ci93bVdvTkZhYzErTktjT0haL1BMNm96enRRSGM3?=
 =?utf-8?B?QzFubkNOajM5RnIzR05qVXF2Q3R3amlHTllzK24xbU4rNnJYQUd6YmNxajlr?=
 =?utf-8?B?Y2xRdU9ieEVtVGVPQjNOVUcvS2taRklKd0V6YkJ6dlExdlF1U05Zb1ZXczdF?=
 =?utf-8?B?M0xoTVFIMmc4cW1jZDlqSS9NME8vZHduVlgvMVg4WTNQMUY1WHUyVVh3YzVq?=
 =?utf-8?B?T0l1LzFLbGNGTE9oYXNoQzlyOTZmQzB6U2xHM2loSlNCN1dZY1M5WnZVSmJQ?=
 =?utf-8?B?Tk1qUHMwSU1LT3UzNUo2RmhFZ0RyNjRXRHZuVVl3THhHWjdiWWplODBybFUx?=
 =?utf-8?B?eWNxRUU4bFBpY1dvaHgyeVNKUHRrWitiSW5TYzI3SWdMZHlnOFJMRWFsVzVh?=
 =?utf-8?B?cDJYK2xSSHE0V0ZtV3MvbmVQY1c2NDhpTG5IMzBQZElqYjMwUVA0Y1ZIVWJO?=
 =?utf-8?B?UUdIODYyYWc0WGowNVVKR3ZGaDdJQnk3T21RTCtEcVluOU9VTm5TVC90ejgy?=
 =?utf-8?B?RlVaTzZvcGkyV0xIWEZYOHJRalYydmZFQ3dUMWpXYmlyWWRPaWRoTS9sK0NK?=
 =?utf-8?B?cCthMnRkNE1EWlVNUU01ZWxSQnhWQXNBdnkwMlk0R0pTRUk5ZmxtejlGeUM0?=
 =?utf-8?B?Sk5XU005M0Q1aHVvRUo3SFBSSzNFOXh4TGpuaW1sb3lpM2dFallFRXlsYkVE?=
 =?utf-8?B?U0todC82d0Y0SUNwK05YUS9OZG5sVDg3dFRUT0owZGVjYlZFWUo0UnVNQUcx?=
 =?utf-8?B?RVdqUkc1S0dxYTFxRGs4citrTUY2VGtYS1ZrNFpGV0V2WXFrSyt1dS9wait1?=
 =?utf-8?B?UFNJdDcwT2pPRjVlQldMV1NkNGh5RUpnMjdhRGJWL0JWQXJFYTgxRkRrWmFp?=
 =?utf-8?B?am5xZXpLK2J1MkVzS2ZrR0hjM1BFRXBHUEtVWTEwQWN6dWNES1huNDN5Tmtx?=
 =?utf-8?B?aHdoOTFIZjJqME5jUWE2Ym1PeTc4Y1FCU1R4Ly9oRklLelViL3hJSHo5RW41?=
 =?utf-8?B?TVYzOWxrVXFOaW5vVUlGVnF4TUdxR1RUdG5vT2JNd0JqckYzU1F6bmQra09z?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fuT+g0mGvtyjp9hz50vuVODLZ/jApAPeANKAx4F/h1v9WWTMM9kCP2avzrBK5uM09LjA7DcieqB4qpXAiBD6AhxDN1B+M2dBfaT0PZ32wbITFql0rsjmdR5bBsPewqK4cigxGWs1ugKTNZJNFD/3cg6gHvWbHhA5C0z6k3Hr34kYM1mE9HlwG1cg64yIvymIDFHdMvty900BDn+3Khu8uDSubhP3Ku+1+dkJgfOy4kOjiGOunTVP97XUMp0c3fNkrbk/vLsDy2NRWz9raJWjaaDoIJHvr4FFh4bZs/AWpHTuWmEMHyDiCoKDKCGlmGMkMQJlpjyH/zpUIUIe1eRDAB1jhRqxUi/3mGJBALKeduuk2KbS6mU4yJEicR6XJ+8vGpyEvetjKk/e8TQ1xpXsfKsT/wPUXdbgJNrJB9Q0y99U8GeB2upP9BsRTmhBrgxX+FjB7gepOCTzJ4KKqpTFmVEjxjcRwN669KN72nTnybxVpH5qkpbRMyAYF2NH3Whml4yMmCmagTGzuEuzg67OAkJ6nS3/RHQvD3ffQwzok9M70hV8vO6nr8V6MOe0MgjQZ27f85HeDxtmOsysu2idJEcm63DYCZnSQHqPNOhs3Q0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717667b7-eef6-44a4-d923-08dcc13afab5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:10:23.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESpuKzXUUWTfGz55xiH7N3q4O5fcSJ3hjAJwF0a+Fb+A2OuQ1PLE8N6wY4OcZrKEO5cB5shYOfzuyc+CA/mLI3Zr+e4H4sphhsHpwB6WCok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_12,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408200128
X-Proofpoint-ORIG-GUID: 4eYLwodDbdjBhRU-UDlTU-E34WIdFxdE
X-Proofpoint-GUID: 4eYLwodDbdjBhRU-UDlTU-E34WIdFxdE

Hi folks,

Recently I was trying to build a kernel with the following options:

CONFIG_KALLSYMS_ABSOLUTE_PERCPU=n
CONFIG_KALLSYMS_BASE_RELATIVE=n

They are defined in init/Kconfig like so:

config KALLSYMS_ABSOLUTE_PERCPU
	bool
	depends on KALLSYMS
	default X86_64 && SMP

config KALLSYMS_BASE_RELATIVE
	bool
	depends on KALLSYMS
	default y

I was banging my head against the wall trying to understand why I couldn't edit
these with any kconfig tool (e.g. make xconfig) and why my edits to the .config
file were getting overwritten. A coworker finally explained to me that the
reason was that the config options did not have a prompt, and so they are not
user configurable. This is a really subtle behavior that was not obvious to me
from the documentation. Though now I understand it, I can see why it's used
widely.

For example, KALLSYMS_ABSOLUTE_PERCPU has no prompt and is only set when
X86_64 && SMP, because it is a trick that allows percpu variables to be encoded
while still only using 32 bits to encode each address. This approach requires
treating the 32-bit value as signed, which limits the range of addresses that
could be encoded in other situations for other architectures, so it is
implemented as a config option that is selected only where necessary: very
clever.

Since this is real behavior that's used for real purposes, let's document it
here. I could only find oblique references in the document regarding config
entries without prompts:

- Describing the "visible" keyword: "It is similar to a conditional “prompt”
  attribute for individual menu entries."  This implies preexisting knowledge
  about prompts that was never explained.

- Describing the select keyword: "In general use select only for non-visible
  symbols (no prompts anywhere) and for symbols with no dependencies." This does
  spell out that symbols become invisible without prompts, but it's in an
  unrelated spot where a reader wouldn't expect to find it. It also isn't clear
  that "invisible" symbols can't even be altered by tweaking ".config".

- Describing the default keyword: "If an input prompt is visible the default
  value is presented to the user and can be overridden by him." This doesn't
  state anything about a missing prompt, though maybe it invites the reader to
  assume the inverse, if a prompt is not set, the value cannot be overridden.

Thanks,
Stephen

Stephen Brennan (1):
  Documentation: kbuild: explicitly document missing prompt

 Documentation/kbuild/kconfig-language.rst | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.5


