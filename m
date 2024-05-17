Return-Path: <linux-kbuild+bounces-1876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B28C8063
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C361C20D69
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4324CC2D6;
	Fri, 17 May 2024 04:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BFnF4wCO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gQUapfV9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E85410A13;
	Fri, 17 May 2024 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920202; cv=fail; b=DHOaeJ/t/77x8JlwLLRo4fHbx1BHo40armQ82vx2wfiXuWH4rBaz3TWl9EhzsJquaQRhBTxClLcb+ShqY6cpMwoJV0eGs6yw55l9X33bta8O7ThW5Dw4Vde1GL6WxoifKRwv23pdGA85V97mzYEeWTnTihEl1L2M4+1lZyvO0TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920202; c=relaxed/simple;
	bh=zhbQW+LxXPbTcLdn9hPTHHSjQcl4AlU135ddDCpB1cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZm3PAuvVKjDr+ePhJqGECKMFL3ldQ70W4V3K2RqstFfpETmMDS3KJF+bVPMG3TGhjz1yCwnma/wnrE76e72qYvnzIcfgi6oWPdRCj0bC/RhPSxNqjTj/2V38qu1qzVTZ4n7MpM1Pn5Cyjh9l7WmcecEbWv3xgIeSl5akj/4N6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BFnF4wCO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gQUapfV9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4TSZG014527;
	Fri, 17 May 2024 04:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=QJRG+KC/9BUbjtkDUFMm/o8JJ/Thq20RyMzWK1Di0BE=;
 b=BFnF4wCOMCLP+Gwx5MtrwtmGaI/s6ghCt70PFNGtmxXeDc/mEflBE+9XUIJO8Z0EY7+9
 +ut4Gm3ZtbbFuMmLa+ono4Zz4cmcEnKBFRtIAHwtCytYcUMq9AM++6wp8uK9X9JpVKda
 SFzzDg31EZThSlH9oLA/3ncDExBp32xsemnnV4zzppOevLO2ZCONS0eqXjZt/CCGwqi7
 Ft2N8FpQRCxUBBq8079+zgLk5fGMHP4kr9u3ZdwEfPO2eEygsyrdbyFLWFqqdYe04Wve
 mFCCP7XFPeh+X3xRtQEt4CmiBeeTIdL8EO6qpLSgmjYB4xhxg3uc4obuKW/Z9dxGdj11 pw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx38qpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:29:51 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H3V5YB019247;
	Fri, 17 May 2024 04:29:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y3r88n89f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+YimvkMr7iv2R8jNO8OKsDmVRoDhJLzd3un6C1QwrwcWFDkCT+1dqt3PPIUNRR6RDqHyp3gB4UhiQQ1Ml32C3fbs5XD2Y/X7edh8xoeI+qjYX+UT2ynbKWV2wbmRDufYBCmsuwugAzGKxEdoz/1UJC5v4gcQOu/eJJyiUsHbaVRKlAmKPSfETRVVktxzuQXiUYmwqXF7FsBW4skTB2BsnS5ClEfbSB7pN3Fm+zOMpY5VjQJXvZuKPpLuIbATdQvo8rZ5nPbLWWosRKhSnhOrDBdxdFrnLaRuElTg96jqAb5Hh8teErCC5Ftfp/DaW7n1OuGOCcaNE0DfknMnhlfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJRG+KC/9BUbjtkDUFMm/o8JJ/Thq20RyMzWK1Di0BE=;
 b=XPafMlaSpy55FdayH0E7QNlB5fHIM6gzR/nlGN854UYkmEThzcpatXfb4AbHor6KHEA9c43ay8L8QmB+yUGUGE92KYqDkxSYDgFyibopUfPchmVE8dx7a0WwheuCA8REyLsm0pp+QsONlyFCGbBcVI62l6v5hWMv3r9U/uVIfDOLIYM8G7hb3wEcsFq8+MdLCD7ywxDpAa/me2XOBABYOJNgHDCzTZJWbwpn/pcWzO4X3ux598OfRgy6t/S7pdvb50D2tJjyVZkSzHqsG6hN69cs7Q5ljYj+XjZS4GXkC5fvPxdAkO/giqw6ZplgzlWF/h9tA6DU1QHdh9G/SaQTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJRG+KC/9BUbjtkDUFMm/o8JJ/Thq20RyMzWK1Di0BE=;
 b=gQUapfV9PHhoRo4hUpIuFA2rMofWCezw/uHOQombh+9VXQEGdc7H5+HDbJ4AMOqwKVy90XjIZTTEOZ9GJfAsc/N1FVeW9wSrLOLRkKfKIx8ViCoD9mG/8aeLN27HcpaQ8mOr01Pvc5JUNB08oWPKaZLdcet7or7bQBuwT9kDC4c=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:29:49 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:29:49 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 1/6] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Fri, 17 May 2024 00:28:34 -0400
Message-ID: <20240517042839.544650-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0004.namprd14.prod.outlook.com
 (2603:10b6:208:23e::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: cd543ebc-361a-4edc-c278-08dc7629fce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r47Bfgb1mpR2OlpNw50mXcWBRpsiMjZVcKLQXKDi7KIosl1pe3DTM2DVln/U?=
 =?us-ascii?Q?S65dwBkw2mgbu9e02XXzqxsAWZMsK9Qh8ohXSe2ZohOtWHgwfcgisVdnocDe?=
 =?us-ascii?Q?LfRgxDSvrJGWpON/dxUFpeQTKvswFwfZQUP4/gtSlXSqxHnWfTgWKSUgQbRT?=
 =?us-ascii?Q?w60n7dTvTwDvfKwKksjNQwFoZ06doLjJPWkacguc5taEek7wb82t5BzB+8Qn?=
 =?us-ascii?Q?jBgxCXWdtmuKfu5oCidkIUQ2+ZM7e3RcWTgTwwQiiqJ18oP0dub2dIVy4m33?=
 =?us-ascii?Q?ibQOArrOZlPGcDrN3e1byc1+QmMa8qDSiJf1QGbD52dAWDwtaR7W/kd4K7Um?=
 =?us-ascii?Q?RY/AipjMP8e3IDha2dxwKiZ/aLiHJUsFFDty9l2ZZXlQbHJVWqyprVsi/JM5?=
 =?us-ascii?Q?QPZnLcYs3v0LnEK8wb/Nq5dIM7PGO6wG3DMjUIcBJJXPdTTGg4K/j62THqgu?=
 =?us-ascii?Q?dd+dHsRHC4n7DdpdMfIDdqhRbWblHZuvg6GrlhYXFYKsH9kEypYSU8daHisk?=
 =?us-ascii?Q?VyoDlQ7L+VOkUzOe00imm4qX2b1Vx+7MJY1rBb6BN1i7AwMkga9JeXlQ64re?=
 =?us-ascii?Q?07T+BGcqVSrXQFMPbyec9VbA7h5WvjN5TlAedLmOcQIkK9PqdJ4FS4/g/f/7?=
 =?us-ascii?Q?u8ASRKp3bmOOAetvPjq7xiqTOJqwXnkSmrN651AlLh5Kl+hiS8iJN5slwSiR?=
 =?us-ascii?Q?B7FNGXbrKJSq1Q0AxsERpRQzOVLZn7W7yivDFLs9U3HYTpeLhjhoBbLTw9QQ?=
 =?us-ascii?Q?o5llfaTCuCSABxAzHwdcutTGvTp2OJUucpHX+lQJWNa9qrczQvz1jhcXlHbM?=
 =?us-ascii?Q?Fasn5SDBGg3zaf5Hffy5ijUXZE/Mdu03/uvSEqIn4qBGMY2vUGPRbcbl7nLT?=
 =?us-ascii?Q?euJaSzlEg8QHugp/sn6c459ZFtXo7T7FHkp3aAUV0o4L0M9ANuR3jJmBzSqF?=
 =?us-ascii?Q?BgmqU7wrigDYcsPKN9ypd5duCHeR0Sg1vD6rvmtE3Dq3q0ldTeOqSYaXo7EL?=
 =?us-ascii?Q?ZLyfYw0QySz0o9cfybZmXWoQkE3uej6oteqE2HNmhxoZcmnAAzD/qkjnhOVF?=
 =?us-ascii?Q?NjY9Ilm7q0MrU/7ZDRGClwkDEENa6IZmyp2Zo/9+6vNPvmXOdmbTVgOSMlb+?=
 =?us-ascii?Q?wqv2XCSd5J7bx1AiXc9vRR6Ck4V8HCiS+5xKOuKxNtWfY91K5hv0S6Vx8IgO?=
 =?us-ascii?Q?PaOw3zkVnI0TzyPVCHoliibdK5/bhrztX0cQoi8AzTQmDVJz0kKx+GOSfYP9?=
 =?us-ascii?Q?ZDso34LTWtkG3ewocJh4dJnyyLDRFr1YDJq4X4GEEg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GjUUMQ9TUDaDRXLLjNV3Pu0zJguGJt9p47NHE84E/QgZF/mwRl1b5PFW2GFX?=
 =?us-ascii?Q?E6OQl9Ism+5dHgGPO2HWLP7xzCVU3NuibujqamvtDH930m2kEhgfdE3xyQbM?=
 =?us-ascii?Q?3CjDjHODzFnEgTuaE6Ybrj5BTg9KEA0gRi2TpJYUlZ0sth+SQEASm0LUfvxf?=
 =?us-ascii?Q?gT3Mj9F0BhSbaKv17fx7pLvXP3o1+HD5zXu57J+tWp5ras0abpWBGMbRwnrb?=
 =?us-ascii?Q?PjhFtZR1kxEB9UwLK9YL0sYr55G1gin4iiVaHfKzx9yjNBla10U1oNTr40ky?=
 =?us-ascii?Q?UKz2y7uKyQenoqccAB7iHFF1wmTIixvWtQ8NGXGzU1+xQPiJigWcSdx/eyMI?=
 =?us-ascii?Q?WCHuLwHkDFYsKANYdiRZYjyfTUjLkF5yHe72y5Mqnbmyt1Hi0GCykIkMbZnX?=
 =?us-ascii?Q?ymb7hwlg09owsTZ0H3YEeR8qyBq2xyb9/AXRGUmt0WSQ2CCe4ukhMEET1D7B?=
 =?us-ascii?Q?v6HHwk/1UsGGb4+uUQELqjdlQH3oKm1dwVzVo5I0G4dNIn8c3CCfSsDBClyz?=
 =?us-ascii?Q?tSY72aMG2hrmXQfQYtdKVNzdZ8xeCbBCVdtDj/ZXe/mqzgvORPQ6xPpX5ciC?=
 =?us-ascii?Q?3xpE9/7/nXG+j0GKshD/aMkJqtoUp1d3Hkpdb8gminBgWxidcr+ZfRyaLP33?=
 =?us-ascii?Q?tPMdVnbgTWbPGCgQrVN7qiHX0qvkUhYgCSPTVZYQTnV17f8Iy1S5q9nJJzVz?=
 =?us-ascii?Q?Sid0J/p8i7sgPscdZXW+A0amVy0iKEFM/QxsKb0XqLVjfYdBIUS0tZID1p+4?=
 =?us-ascii?Q?NuJTkRVTz5m4UhqTV+3sTbwz1O7h6vs6A9rJJ8tYuQGLA8CxO/haNg4nO9u6?=
 =?us-ascii?Q?A85VeqZtNM+TZFUxwTeGdZIhpMonMIrFb/U92OTtGSJWD1FwXr9Ue3GdQIwg?=
 =?us-ascii?Q?hMsPpUvGaWrWBoJ/ziHUpu2rmRoorxd/9QzJ+Tbh7Mq6sI6cAHaFfkALaI/a?=
 =?us-ascii?Q?tpNbGkjarGhWUUG+aNjqzXUjr1t17uqmERTVgEISHIL0Xb7UaJQxL4VoO3f0?=
 =?us-ascii?Q?/pgTa5i9VJVmvydjhkPkcjf4k5dS6ey2mpfNytMjzUIoeRygj14vrSCkd7wG?=
 =?us-ascii?Q?/v+1dv8s7HWRKtFGirPiqugNRqH3ZrGsjZQJTXI0LuPK/LVoXr9Oiti++HSd?=
 =?us-ascii?Q?zFGHlGekXjC+jhChHghgUdzlaaxmIuEPi/6VkbPVBoIHmvrqjoeWoCfyZL90?=
 =?us-ascii?Q?/OsfbveLOvp69uPWOXxkmiN0UDdlKb/w3mKsWyK+Jnrbfn9JcP+9ghCkaarS?=
 =?us-ascii?Q?gAkDBJ08BZtahP9+kCgZ5xH9DjNU7cVeCbRCaLvvlpwGtMSWVNU9ydjv7oPC?=
 =?us-ascii?Q?IEDlW1ORBugQN07pPoksCAv8klxjUMHmo8oSRq7r9ekKw1XrAm3EYFonW8Nt?=
 =?us-ascii?Q?IHnnCTVywS5mD+HrXBiHPPG3nQIJO7DtS/6AgltPXTVlaIUMFgL/tVaEEkYY?=
 =?us-ascii?Q?ynWIc92nETAOpUhtH2+S4UbL65vuDTpbTzyu+8M+G6fT2f88P/TCx7io8yoG?=
 =?us-ascii?Q?FnBtLEBv0g5VySBRGq25BVpIUSO82qBn0gFSMrT9IlLIKnvSAqOfkzHGB2k+?=
 =?us-ascii?Q?7RvB0d0fdYx1gJtSh287ODYSIP/QnYp9Qa0mhLLHr7IvbaAqYnztm5QyMfVz?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nK12u6uYwsCqL4dRovFkcH6V5SvO2kBqfQKoUGyHGzVEdUlwyA2a5x2JVsEA7UMt5v7WvxEqw0YG2T2dicIOh8eqdpRzF2nWbkl5UBmjbjXG2OD3cLafagSZMij1B0JUTd9H+P3VIneY7sQzMUFK+GrPBQM3KV1kOj06DzX5MY2KcYUHUo7XHUL26psv/0kunTIusw0fUpbDdTWIQnR9wrLMmE9t2T03gYquijjmYW/Ka2vrlko/V+5t1vreOmsPVlLWA0uhsxlOuYq9z90+yGhwJkN8peFWUW4qZWTp+6SH5j2sD/10fsnm0VmYCGzNPL4f0aIB5XXbdyaixr7DatEi1t69JE+eBzOy96z1FZZVgwpcWyjj9WqmkFdDqtoTsYjJTlPFLuCkg+DTVdDSkimF5JsUkKFAC+qw6lJ27bEvI5hsZ6nvcQV8XH/pkvQ83pfC1h2lv30oBZsr99A8GchgkAVsu8RSihUF5vglbYcPsTpJ7JOP7Xyfb1eWFxsAYse6rcfLzGexuZly0EMklN7x+OrfefiA0nJGWF5Fc1+SaYeDv4nue4QranHIzk5ccr2QmBzr+KKKjAAs4lLbdP88TxRKm8RxhClkZd2d6UM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd543ebc-361a-4edc-c278-08dc7629fce9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:29:48.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kviaSzCD+UdhEauziaHY8bc75Su2WO+Jyr9Z6U3+ZEiVxrbTMTOnEBcD+2fVPbTys8ukb9DNK8PxfBja6LAe1BxYNaZKIhfaZ6vNZ3HHVlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=808 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170034
X-Proofpoint-GUID: uldlBBVoi5tK_xyHURXYXVKUsbNLhixy
X-Proofpoint-ORIG-GUID: uldlBBVoi5tK_xyHURXYXVKUsbNLhixy

Module objects compiled from C source can be identified by the presence
of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
However, module objects from assembler source do not have this defines.

Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
add $(modname_flags) to a_flags (similar to c_flags).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3179747cbd2cc..a2524ffd046f4 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -234,7 +234,7 @@ modkern_rustflags =                                              \
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
@@ -244,7 +244,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 $(_a_flags) $(modkern_aflags)
+		 $(_a_flags) $(modkern_aflags) $(modname_flags)
 
 cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
-- 
2.43.0


