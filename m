Return-Path: <linux-kbuild+bounces-4449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0AA9B7BA0
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 14:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E652B20DB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 13:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12219E988;
	Thu, 31 Oct 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="XqETbIPJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820F19DF5F;
	Thu, 31 Oct 2024 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381205; cv=fail; b=MsvfXeFGoL5n/aTAtWvhnyzmnZPwhX5NfuxGnNZ7oOjtdrdV3BUj7pyvC4w+GPYiiaVc41SGcMGePF5ZTR0ynfIyoJuWsTa0L1wzPPBgyES974othH4MHpt8WBlDwTaOwqCMaI/+klC8/MCr2cJd6YS96+7omoy2PA4ss2ZirUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381205; c=relaxed/simple;
	bh=kopefamX5gBzf7Aka6E1RS1E/+SiU7y8OT0OAbjvU0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nl6tG1VGqkd3MBTlgRTCZISct9+YL8rh071IBOyjCkhnBebFrz397Fh0sOWMeppLaNhduBY6VTzObUK349gILp9sM+2ApcUMH5GuiwerxHLBLQ+rgts48jcDVaUzXHsgc8ZBkoJCqhuKAi4vn+tPtPhtB5WhzhKbRRpVUN9Cl+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=XqETbIPJ; arc=fail smtp.client-ip=40.107.20.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Va6Iu+MrMwmx7A+R1z1aY31z37qjnxa3pSDPxLRSxn4kSYzOLjhYWjGskzxcZt6TzN/b/fY0vgN9kmLlXJGjjAEIllgHNx3xNiK4WoaPFDfrNEnJQj1uhG7HOnUhzLp+8azqlid/JCPiBkcbtET1j8DVhP/5l3OdC3IfIJIybLnnb1Rhg+96nV+S5AyjjzuOGbdwe/WDKGVXstJBJqbxH4e0BTdRqigVco9o1+URyzEoX5gvDAmKBM58wd/l6jksL7EqthBIIcCliAdDsti56YC8oCL6jnwuqFm+bX3NOAipLHSVkSbS176LiCHx7jfmnrhhwLw7dX3nwu1+/Nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ9YvaFbLnOneOGXYKvjygN/pIfGtLnK2+zV08e8P/E=;
 b=fjz8GrhO+56yP4w1Xs3ARJeGqlsWh1eNSpzI3oHDaZmoVlJsQxQEqG1z/mv0jyhmp2QnxImw5mtHzGBfwmmpPbAb2WL+UystRaFTyv5cMdpA/unFVG6IQ51ewRSwGj6HvVEruylWpeHVI8IJNj4MP4HUaL4EJjJAvC9N+/EfCQG8ZIPXmbb0+kSJdJf6vdMjhrao3pZ1mbteGAUcIMuayijSlc0ZzqBmoUPPyeN2fs7GV6Wxe2Y3M0tcIlA9iK4FSx98NWBnn/sQimX1RrKfSMkZANJ8E75qe/oGfeU1jdR8b+KVnLNg6IVt+cgmyFnn2OgLnyfibA5FFY8dq4Otcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ9YvaFbLnOneOGXYKvjygN/pIfGtLnK2+zV08e8P/E=;
 b=XqETbIPJzD/8OrbVq3IgaGX92lxYCjsqLqFBhzk+/QsxFG2G6+THB79tw2boHrL7gAKct6LSj2oDRjeXHqisqPQyO3ibiwBy3yZvaiWr5813ZJj5s4kpuDCDh7rEl7irIleIQzxDXXCK6SynOvTOUYdFvGAuD/IwxKZ37wGrCSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1cc::9) by
 GVXP193MB2488.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:1db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Thu, 31 Oct 2024 13:26:37 +0000
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a]) by DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 13:26:37 +0000
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Rosenberger <p.rosenberger@kunbus.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
Subject: [PATCH 2/3] package: debian: add missing Depends to linux-headers
Date: Thu, 31 Oct 2024 14:26:29 +0100
Message-Id: <20241031132630.24667-3-t.boehler@kunbus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241031132630.24667-1-t.boehler@kunbus.com>
References: <20241031132630.24667-1-t.boehler@kunbus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:1cc::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAP193MB0954:EE_|GVXP193MB2488:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c0801b-b728-45fa-ea00-08dcf9afa5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|52116014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU0wb25tM2UwRGYrd0ZKRVp2bWJ2SlA5UjhvRVIwdmNxc2swWFVVdTlXaDF1?=
 =?utf-8?B?dHdnTXRGc2hJaUVnM0pMNS9maTRrVmh5ZytOZ2x6VlFtcmZYWG1SVkM0TWFP?=
 =?utf-8?B?NnQ1bG92KzVpSkpsS3JOWjAxYzVSNHcwSW1tTnhXUVhVbHBCOEgzc3FjN01a?=
 =?utf-8?B?Z2F2TXR3aWd3NmplSEtjR1lQdmdBbWJNNks4QnVhd3pKTkdKSWJLT2RtY2Ev?=
 =?utf-8?B?elJyNGJrb3VEeFZhblRQVHkxbUFGMlplTXZ4VVo2VUluTGtrcGI2TDBhRFRI?=
 =?utf-8?B?eUIvOEd5SHhEc1kxQnVucXp3MzJmZlIrV3pHV2daaEFVc21DZkJERWRSU0c4?=
 =?utf-8?B?YlZmQ0FPZzBKbG1wSVk3WEVBWXlWbWhsNFBEY2c3dXNxUjNPMjlaeDdWWmVX?=
 =?utf-8?B?WHora1dkQi83MmIwYnhVSVZKV2g2UUd5dkFRVERrdXJPT0U1TjBiMU9sTzVN?=
 =?utf-8?B?SklFcnE5bjBFOUc0VWREY2gxcUNNWSt0dGMwb3g1UERSTmVHWWhoTGJnSUs1?=
 =?utf-8?B?T1NYMzBsL0ZJNnN4R01VNHVnOWs4dXZpSU1NWEZpWHhKWm1aNEFoSGVwcks4?=
 =?utf-8?B?cDBRaCtLR1VjWnhrTzdWTXAxRGpEdENPUmRiZkw3ajFFWml1SHdFbnNnTjl0?=
 =?utf-8?B?Rkg0OWZ3N2JiY0t6RDJMaER2TDFrS1QvK1JxTnd1cjNGNDdiSDJxSjl2T1N3?=
 =?utf-8?B?cWI3bjRmVXdKQ2ttaWcvM1BvcHZTazV3Q2phNk9SNFBwd0IweVlrc3FSb0s0?=
 =?utf-8?B?cXpuQzlVRFBDQ2lGY2Vmb01kZUZ5YzJ1aE8rTnhOeU5UbmtLM3gyenBMc3BE?=
 =?utf-8?B?NlJHQU1zazNMRThRd1BvVlZIZFhSdHRvR29OYmo0MXRWOU92N2c0c25hZEVM?=
 =?utf-8?B?MHgrenFDNG5kV1FpRFNkNWRtd2YwYmR3T2h1b3dWdlNiTDNDNDNnZW5MUmpT?=
 =?utf-8?B?bG1wOHl3bGwvSXZnS0k2b2lpTjlqU1JydDAwUXdTc1o1MW5yOVZZa3h0ZWFa?=
 =?utf-8?B?ZGV6NjFVUHNzTzBIeXVyQWVsWUU1TjNyL3oxV2dQeGF1VkhEWFN4UC9JazZx?=
 =?utf-8?B?TFlMTlNXNVBSalZtczI3blcwODlhOXdabUN2Vk9zYlpqSTduSlJjdERVazhk?=
 =?utf-8?B?SzJEU25tSlY4aGN1UUpyZnZlZVFFa2U0TFVBVVdXR1pTYUtZYlZ0VVlnc1Nh?=
 =?utf-8?B?Zzh2R2w3QXVzL1VSN0hhR1NuRUxoL0lhQlFPM0R5TnUvT0lueE9kTk9RZDgy?=
 =?utf-8?B?UnppbmpEeitlUkkyRnFoUnpncDZsUlBxRjFLdjBkTTd1N0IycWFkYWFuZzZX?=
 =?utf-8?B?djF2b29BSm9sa2Y2MXR4V0dCWC9mSWx6ODd6RExOaXpROWVXUTI2WnlCSmlH?=
 =?utf-8?B?YjBHZ0dPVjBFdDFEcDUxVGxxaEtrdlFKM25NQXV4T0diZ0JQRlduVkE2VEsy?=
 =?utf-8?B?ODJMNSt0Zys0N1FybjFVSGIvb2thbWZQbGN6ZHdsL1VtemU3NWlLMy9aQjlV?=
 =?utf-8?B?SmZ2NlE2Z1ErRVVZTzV4c3V2UlZYUDdYdk1qWnhONkJiMUxFRFgraW9xbitZ?=
 =?utf-8?B?WE90U3RoamZSaDlsTzAwTjJpaWpMVVhtN0RoVTg1UXNHbFYxQzhWRHlENWZi?=
 =?utf-8?B?MFd6OWRBb1EvbXRYcndBa0JITVdubG8wUlBHRi9LWXRxbkFIK21wTHNoN2lN?=
 =?utf-8?B?ekZWZXRZQ0orTkg5cGJNY0tIZUhzMkR4Nkl1SDhGOUM0eWxOZXVoLzYzdWNr?=
 =?utf-8?Q?xHuKYHmvjaz0tFPSjNCKvd8oxf5LpI0OeoANQdq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAP193MB0954.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(52116014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1NURzFLRlBOZ3FIQVJOL1VVc2xyRVVMSW9aMU1SeGh3VnQ2Ymtac3ExNzNW?=
 =?utf-8?B?ekQ0ZTVtT0g5REJIalJpbVN0L1E4d2JSSzkzb0xhSEJWRnN3ODRJQU5TNHBO?=
 =?utf-8?B?cGx2N2Z4OTFQM2t6L05TU0VqVllRVWFwMmE1dFBtZTg4WWlhYUxTbVNaamZQ?=
 =?utf-8?B?TG50ZmZZSG5uWk8zNVB2VDVieXNRQmdrT1RsVURudVVCeXFBUW1XWkFpVURu?=
 =?utf-8?B?bFUxSkNTM0VSWGh1M3ZOeERyQ1JDK21XQ3FFaHRLRVQ2TzlMY3BqU1dqUjQz?=
 =?utf-8?B?OWJkRit3N082Vm1rekFVZStrdkdtUGpjREJaS0dmMUp0eUQ5OHFocW54TVh5?=
 =?utf-8?B?eFVZQTJlWUhpQzFEQno1aktaWVdrT3RNeGFuUzZNeHlxb24wUFBENHMwVmMy?=
 =?utf-8?B?eUNBTHkyU012cGRtZlZiYVJJajQ3cUJ5RFNhdVEzYXpqOEJ0SmRsVWlaZyty?=
 =?utf-8?B?QzdyQzEvSTVlci9NZ1NGMThFQmxSM0lBdm9BUGE2NUM3OWFFMk1qb3Z1N1Zi?=
 =?utf-8?B?NFplU1RkOGZ2MCtIdnRuL3ZvQlRZOEFyZG0zeXFKYStjc3V4U0g3bUZJbzdL?=
 =?utf-8?B?aUlqOG1xaVY2MmtVRSsrcW1wZmpUaG1WdS8rSEM2N0IzdVpINjQvNmRBWXA1?=
 =?utf-8?B?WDlXUVh6TXNzVFM2UjA3U3ljMmRmbnFpeG84b0xoSktyRndUbEhBcGNkcGov?=
 =?utf-8?B?cmM0ZUgzNkgwWlhiYWNsOFBoa2FOYWVLZXlJYXFRMHVYZzJCbWFWTkswZ2Jh?=
 =?utf-8?B?V3J5WXRFY0pKMmpvcUp2Wm1pSExEMWlIdHNQMWR0eEV0bjAvemkvZ3FXT0VZ?=
 =?utf-8?B?b29KSThRUzdhb255NFlkRk1NN28yZDYwaHRxQzM5alJDbjQyVmFJMG44QmN5?=
 =?utf-8?B?c0FpNG5qb2o4VWFMcXFDK0dKRUdaL2ZtLzF1TmZTUUxJbFlpYko0K1ZPdUJs?=
 =?utf-8?B?bm1XY3RXL3I0Q1ZpRTlaeHN5UVc2RUE5SFRUaXhGWXdOOUdlcTgrbmVvNmM3?=
 =?utf-8?B?RVJoejNPaGpUeXdpYmJ4NEM2eFBZeS9Cb3FqK2s3NFd5ekZ3eVdCc081ZWFO?=
 =?utf-8?B?YlJLODA5bEE4RHg4aFFUV0lLM1d1Vk5VRHNlR1FaN0xSRUFGNndyZytzQVRx?=
 =?utf-8?B?Qm93L2Z4ZmhEcGNVcCtkdWcxbGpvRTE0MWdJRDdsdkwyS005dTJkRkNNY1lE?=
 =?utf-8?B?L2VGdklJa0JQVmRTRWdBZUEzaksrTjdTZ3prZnEzMEZLSURMUk40UmJNTHNB?=
 =?utf-8?B?aGJZRGlpR2pJclRHajNiZG0vWlBkNVhKY0JlUCttRG5sNzEzd2pJUlEzemV6?=
 =?utf-8?B?RXB6ZWJuWVpIcDFRdlEyNDR1TVNuUHhOL2krY0R0ZFpZVXU1WU14UTk3b05n?=
 =?utf-8?B?ckNQV1REam1MOEszbXR2ck1RR0d0dXFrbmNLLzJ4U0RhblFyc0tlc2NTQjc1?=
 =?utf-8?B?TDN0ck15N2FBbEVHNjMrSTZremt2WHhsNWFka2N5U1hOakhuQVJPTEhwSDJw?=
 =?utf-8?B?YXprdE9vSDNIRVlJVElXY3ZqNE5iTjdjYnZRSTlUVXVwSUZrRzdyUTlFOVU1?=
 =?utf-8?B?dFV4ZS9HaUVmcENDRGV6T2g5czZuVTV6VnJFQVpSWjNBSi9YYU9ZNkRXdEdh?=
 =?utf-8?B?aTRUdWpVNFJ2QVMweDVicTQvWFRuTEZETWxHZnp1TWhvRHB5YWVnMnlmWnlo?=
 =?utf-8?B?UVlyTFNtNTVjNHh2blhYczgyaXdrQUkzMGIwZWdCTlVqbnNxZjFoUmRpVEFq?=
 =?utf-8?B?K3pnWmJjc1I3cGoxaExlTWRubm9vVEdnOGhIaGJmd05FZkNnTEl0RzFYSFRQ?=
 =?utf-8?B?dmJxMkswRm5RYXhWRnc3VlFNNGRSaHBrOFF2VFBXZkNYRmdCbE45NlBVVVpS?=
 =?utf-8?B?WUdieFNyblNPRjlEeE5HVjhjbkRLWlFRblZwZUh4MUtTZWxwcE8vRDBOcis2?=
 =?utf-8?B?cW0zaTZmNTZMU2xWK0MxbWtZdDQrQlExb3pTbCtjSDFXbnUxMTFYbTAvd05o?=
 =?utf-8?B?eXZ4QnhuamQ5RUNucDJzMXFBWVhEMHYvVk9PcitaQzlqM3B6MjNyMnIwSFRv?=
 =?utf-8?B?ckFoTzN0NVRUNUVBWnpNeEplZTJQbFNKeUNuNGlPL3lPSmpUbmc1cldrZmN4?=
 =?utf-8?B?NzlMYi9zOGJ6SGgweWZkc3VsZFVWbGV2bThUMDFraVgxSXV0dUtod281ZVF1?=
 =?utf-8?Q?UznWINS/tLPM39Tz6tR+U3hPU4PIg3dC3HSkH6fdKXCF?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c0801b-b728-45fa-ea00-08dcf9afa5a8
X-MS-Exchange-CrossTenant-AuthSource: DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:26:37.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpixWMHP5kYUWma3tS+6FZGwRmu5eYUFVfDp0YcbnT/CxAn6ed3VG5xucPjFKG833fEOOI60tva5D3+8SoKemw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP193MB2488

The linux-headers package is missing a dependency to libc. Lintian
complains about this as well:

    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: undeclared-elf-prerequisites (libc.so.6) [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/asn1_compiler]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: undeclared-elf-prerequisites (libc.so.6) [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/basic/fixdep]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: undeclared-elf-prerequisites (libc.so.6) [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/kallsyms]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: undeclared-elf-prerequisites (libc.so.6) [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/mod/modpost]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: undeclared-elf-prerequisites (libc.so.6) [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/sorttable]

Fix this by introducing "dh_shlibdeps" into the build process. It
calculates shared library dependencies for packages and creates a
substvar entry for them, making them usable in "debian/control" by
specifying "${shlibs:Depends}" in the "Depends" field.

"dh_shlibdeps" detects the dependency on libc for the linux-headers
package and by specifying the substvar for the linux-headers package in
"debian/control" this dependency is correctly declared and lintian won't
complain about it anymore.

Signed-off-by: Thomas Böhler <t.boehler@kunbus.com>
---
 scripts/package/debian/rules | 1 +
 scripts/package/mkdebian     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index 0c75319acae1..2a51564128ff 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -52,6 +52,7 @@ define binary
 	$(Q)dh_installchangelogs $(DH_OPTIONS)
 	$(Q)dh_compress $(DH_OPTIONS)
 	$(Q)dh_fixperms $(DH_OPTIONS)
+	$(Q)dh_shlibdeps $(DH_OPTIONS)
 	$(Q)dh_gencontrol $(DH_OPTIONS) -- -f$(call mk-files,$@)
 	$(Q)dh_md5sums $(DH_OPTIONS)
 	$(Q)dh_builddeb $(DH_OPTIONS) -- $(addprefix -Z,$(KDEB_COMPRESS))
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 10637d403777..5d96cb0d0bf8 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -224,6 +224,7 @@ cat <<EOF >> debian/control
 
 Package: linux-headers-$version
 Architecture: $debarch
+Depends: \${shlibs:Depends}
 Description: Linux kernel headers for $version on $debarch
  This package provides kernel header files for $version on $debarch
  .
-- 
2.39.2


