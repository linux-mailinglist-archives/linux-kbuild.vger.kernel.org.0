Return-Path: <linux-kbuild+bounces-3194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8295DB16
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E49D1C217D2
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8172AE8E;
	Sat, 24 Aug 2024 03:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aUgU1hqq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P8bzU7BT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75382AF18;
	Sat, 24 Aug 2024 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470709; cv=fail; b=OPeeT5Va7J9FA0qEsEq0IIpolIkvB/JxMxuu3ZFvrToRZAY0K4R/b7OMmpxCP7P9eGXbtXLxxXThcfBVm+artSlM/IbctmsNlggL8WFMbt8KSSvc9fogifnX+GvIOEtHhga1O8d8jlMfVIAyMuQ4klACunsEfePjrExLg1HyIds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470709; c=relaxed/simple;
	bh=0OdkizaOcPpyrmW8BlNTOekl8wfYw8dp4a/Iirh1+kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PiVmmKXgrqVHBxCN2RkMnFO90Ctv3Iu0F4SBJWTMtVXzLC4H7lPo06h0LIMUpoTwI1oG18mappIEFrob/efrCT9/Ix9kUXwWc+kC/IjKx1uMwpJGljFAcfO1M735SZhMRjahKm3iklLNYUF4G9koxiHmV4gutw3AQ3MrzN8BuEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aUgU1hqq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P8bzU7BT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3OKC5006169;
	Sat, 24 Aug 2024 03:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=YJKfyIHeypDRiYqgA4HNCJTHdVhwpK8RzW5QhllD+7k=; b=
	aUgU1hqqtEpfeQ2A5Pg/5KqnIQj6EhapKdL2PBOYp+n9CqAbhDk3eHOWdnF/mIMd
	G7pd9eR50jD/SoMqgJrKixmo7AMDf1IIeFnlx0kRW04Vr2hx9eWeGS7W4esdaisx
	XJ0yC2fbKqUsZwmqxiYWxKL0ML/CQ9orRASeFXk+APnSYdmUhVENesuun310aFBG
	afopxUOyGHwn0PTaQiTX8mhKR7xr9Hi+M0nMki5WZabBzJ0qYVoqV3I5C0h9cEQp
	TZf5ei2nsRKWOiaFwEgvV1M7151qIt0VE9YRJExmX+l+WtgM/sdpfQCihfw6nCEz
	dYHIrcWLTbvOo6vXQgeKQQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177jc809h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47O2H5XA027814;
	Sat, 24 Aug 2024 03:38:17 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4176kgh9s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4fc8cmqnF09WQrB+YdqJLGrb6g6leZCof7Ba2gB7JeEj7o9RklOn3pT1bFjzQ/X+6Xk9Zynr1uenb+kFi75+jI2rjLLbXF0KVcbkMZTHaiCDEu/sAThVbW3cKdzF1vnye0OD+Yc+SDw9DCPr8yt6vdlNP8wnBf2nqDYsRsd5OacIWg3fIPwqcis0jpOd8WNzXG5GUzGQfiKjTwQ+F1Q/6ICwKKMEscW5JJjjNdPH8gPwqZoGHAkwAP8DFLjEtcIzW5Xj+vaStlFbLL0EN+FsqQfEo9PQ8fXVcH++WqTEIhwhDyFy084UmjpHxKl40nyMs9FM0xX2vuc3/TkhS5TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJKfyIHeypDRiYqgA4HNCJTHdVhwpK8RzW5QhllD+7k=;
 b=LbSukpzt0/JRzH05D6A45nAbsVIHF/IaXaSzk7tz7f6xV7h5zo8JJUYMDAdoDxmdVRx1aDC5/6A8+kHXRdo/slAXi4rRA+YmhrJ9o/s0DJGwhMgUBobo8xD1WK3XagsehHrkUf8FipDwDxClpHiFH6HS6oOT1RpZIZYTZizV/8iRLsid4kBLEEAejX1G4Chn1NMSc5Qbq8AWaBZXbt8xwuc+8bTbsE6JaH6SUe7+NOQdN7+hyufbNbDEVUeLddzIBsEtLB5e3Hlw/fxGRCeWmsnb3EF4f3tfuqAk87XmDq14dP63hjq23efYz/sdTPWTOKBmYB6WITXzW20FH0I70A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJKfyIHeypDRiYqgA4HNCJTHdVhwpK8RzW5QhllD+7k=;
 b=P8bzU7BTqsdyCGfE88MS79QE0c/5j6NrqCqRBymoJjUEXUgP4yL0LkbHRojAYoGhxm9LPvujFt4DsklFD86mvAoC2UjEVzneQRTYbxiOvg3mUaUG65dPaE5AK1+8GM5ZL62FRUBq9vfbM7iUHKM4Edh4jTEFl5yk1bCDIVs2ISk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Sat, 24 Aug
 2024 03:38:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.011; Sat, 24 Aug 2024
 03:38:15 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v9 2/4] kbuild: generate offset range data for builtin modules
Date: Fri, 23 Aug 2024 23:37:55 -0400
Message-ID: <20240824033757.52005-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240824033757.52005-1-kris.van.hees@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 1435128e-ab7c-4a4c-27e6-08dcc3ee2fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VZP4KZ4jk5kAASJXgxx0AWZrsw6yJcO95AuOb3tytP5VTe+weWzg4UBJq0pZ?=
 =?us-ascii?Q?JWNkbr2gMzF/imbnh4quR1totItw6evupAJX01Walgzhf//JBDIXQ5yRWdE9?=
 =?us-ascii?Q?h2Qbs1VuEdBiZkcoI4QU+8TRoCwwexxzU2WzPyeFMmD3hNoMn5sISwQoyAEO?=
 =?us-ascii?Q?ltRdl0ftPBtfdMq6hsmXAajLFPT08suuHTRU5L09HDCfm98x6lgyRA1Ua5xf?=
 =?us-ascii?Q?MWccYwtzSqUAkpnYbWg4zX/4W97JhC0XxpEL3PlArz9lBX6BGj2kVCa2YyWH?=
 =?us-ascii?Q?5N1fDJJ9CqUcCJCfmfW8gwpZiF2QmgqV/1mSvY1CYOE3S9s8x3T5H/teJmJR?=
 =?us-ascii?Q?fjyLgz5PvU7cB6SUFAYHHLUhfiuVoEjIL+Y/aI3xJa6K+oReQ+Vp5hqQ87sQ?=
 =?us-ascii?Q?MH1O/N9kQflLNRVKmOaj6pthazp/zo6Gw1BIEiFAm+f/6cG/x7i/fjzN6Pm8?=
 =?us-ascii?Q?KOEFVtFbaB0lTTMSpfpgRDYGDpNeGJ4YNp61FBXHhzlsc2LlBUqXpThozBgm?=
 =?us-ascii?Q?2vDioxuNkf/bmiBJf3izUmtAJ51G0n3dBuAglQ+I8uf7/iD8omUDa19szsPL?=
 =?us-ascii?Q?XkbDxWAHI2iIYdDRcrsT5bhi0RhxgAqMx6d6XRg/Gou/T1DhJF3gkjXNUgVW?=
 =?us-ascii?Q?cTgIkBX4NWWvtvvDXBGatCdulgQQB1sB5sXNVUQMlnh8uGsObJX+JX6Xq4B6?=
 =?us-ascii?Q?o7+2QPU0z+EsWxBprS4BCyvft0rn229eTTMSI1HxzQOeQW10SZlHrLTYkx39?=
 =?us-ascii?Q?PQpC+s2wqO3v5swYs1cOTQ6ZsWbXqn3Dua6vJ6sfxgF3TrM61z0kIdjwSRDB?=
 =?us-ascii?Q?20qfUmxOWjboEWhIf7h3UDp1uG6fJnyRa73MCtIBQM0mX0J4+Mi1bpGeK2jV?=
 =?us-ascii?Q?FeoOtuyJiL3u+eUJA7frAOWZ0fD1P7EL2TijDo1eTjWvPViRRKX59Eg5Z2Gb?=
 =?us-ascii?Q?9dGx7p0AJGoqMMHsdj/PJJED2X+SOUYiXwa2+/z7lpLyp37SVjj2eV9+zQlZ?=
 =?us-ascii?Q?g4VUDOzgUBnJ4gCGmlegZtaW1+v0u6iKXs7ZJkX8O0VuxSKB0+7L/gX54cz+?=
 =?us-ascii?Q?PKRhJ1wV01U3+XE7xIQVMCVjv1ZYdQ9mlwibB61MtkvSPWBJ663P9Qs8iVPm?=
 =?us-ascii?Q?kWNUwlfvXo1jHcO0fBAIEayat9abOLSteaJIFf5Qa91Jf6Fqnxig2TMKLhqH?=
 =?us-ascii?Q?X9bd+L/NR3r3X6pAUvGRIRmSsrueudongQ47Zs0sAs7Az1f2gaQCWEN6imYV?=
 =?us-ascii?Q?m1TTJsdtzmjhNElNJDsczFvPRvB9X1QwlwNA4ACxK9vQ/t/gZPKpZVsQYped?=
 =?us-ascii?Q?3tY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9HrlxLlUXDHJI1LpJUzS1tgYiGZTOmJVGArV434Q8+DbMh1uWp0MvNZJXPt?=
 =?us-ascii?Q?wmLQiyFQpB1LeTnZnHYEY0SCUXtPTDIdikr2VCp109uWd9He4EK2dZwPOB0N?=
 =?us-ascii?Q?20YtP/2GwQmgnPIIqq7LpLCYa8kJYDBRrWr8Ng785mwGWVSIMmhwx0m9a8Yj?=
 =?us-ascii?Q?5qySUlITeMqB2z0M7rXSY+ayw5RyT25hBrOM/r7F+b/KauBVXoKDPYaJpJ9W?=
 =?us-ascii?Q?h++Hfh4AFqmJfmJQw+egOU0iUUGegyLv55TAXgg8MleRKSfPBDAZQmoM2YSd?=
 =?us-ascii?Q?VqBIcoHG3NIayz1J/6sYc+TZDzZdUrYq6/Q/iOHwEIpb+r7brUAR4j9hpM2+?=
 =?us-ascii?Q?Zjz3HxbjdOZSPkGcGS6R1XwfiUZKaO4dnorYfd7M78RfWhekqyS+bYn8g2Gn?=
 =?us-ascii?Q?I5j7RpWhVx5MUhXaK07DN/m8jzKA3hKs0W3f0iweMNAjjtSYOBHIwQTIGoLE?=
 =?us-ascii?Q?xKZO3tPjKe+j8CnRmXRSy513s22JuAOd8AdzxD4mPywdsVh9/LzjzyyaA2WD?=
 =?us-ascii?Q?kH4p5l9e6EBHNKWKz10JDX0+1WWhe9q+7ESggl8zrc7/C14n3e4gt20tnXO3?=
 =?us-ascii?Q?w8fDOjAli3YyV0nhzuDXMsQ7y5v+VBxCMSDNW0ANWmQNWIX+sStKSD+K3Yog?=
 =?us-ascii?Q?SMo4F4vInkiD3vxYJrhtidfJ2XpF8WYZNRZ/8GD6Wr09UiSzWxWpVzTAoE3P?=
 =?us-ascii?Q?NAcriv75r9HYrIHd903avA/nlhZRkFuAQoGBG9LbrVKCt0kmC8E3sndN9YXY?=
 =?us-ascii?Q?fEklEOIxpZKyOH8ss9eQXC7SmVFtGYY1MVdSUulfWUD/lHJvsZEc0o8g9bMc?=
 =?us-ascii?Q?f07znc42P7LpHYM7rbve9X/OEJjXCkAMIQ+r7JWbm23jLIjdNVuH+t8S+kX+?=
 =?us-ascii?Q?ywRKg3cMc+c4D9jpiF3jveI9tID+Q6h/JsFsaAOTT+M2uXbaC1ET4YJo8PBV?=
 =?us-ascii?Q?ypUhpzjhzIGOqmI8b4ebOhZR0cQvL1ICRbOBWrkh2DavPSiualZAXtWb+FBo?=
 =?us-ascii?Q?2cth5+7BjDxRtg5hA7CUMDRghf/AGEtac7W6mDfrUoj8q5Vx4sOBDPiNv1gl?=
 =?us-ascii?Q?O7IMPDpm1eOtOHoDPxidzQN/UJnmUS737oFlckXlXb/4PinLmVpedy9ct9Tn?=
 =?us-ascii?Q?DQpQghX6bNgO/lfBgbg/g1QhHw1NxRqdLg+joCznjyQ3ngUOnWW18GGP+Ogz?=
 =?us-ascii?Q?YlWNofY6il8JBEXlofpkR5NFneYShp3zMCLkAQ3Pgf1t1EAtJlOiYdqyIdXX?=
 =?us-ascii?Q?y0S4RDXvsD/f4hJZL2Ql+1T0EucZol7uCR2fHiFJdT2tJcG0vB8QJ3O7krYU?=
 =?us-ascii?Q?fxsHoxgw67vrdujui79hKmzwPLLszKRLFnnLGu/TEcjcPuuAxB5VHmopOVSS?=
 =?us-ascii?Q?0nxpqoVPZprXZnPUf2qc6Z8ukqW/TmS1Uc7oD8cvR7bLHk3NQp4NLkwAYF1Z?=
 =?us-ascii?Q?tZiKQ5wNEMuAoSJQNcYVuxUMAx3Ykg4wTemUGfWCDHjSiGfq5hg6o7uGcnvc?=
 =?us-ascii?Q?NoWyxbHJEGvgSPS1L5ZUsuexi1khxXz7g1wpYf16VwooAAbYF79Rhh51NZfL?=
 =?us-ascii?Q?wiWxw2rIHqAr0S1JVh67o7zOfpccFciHPVQlrLRAUFLyvT7dZkFhOk7n03NZ?=
 =?us-ascii?Q?b/vtJv3wivpE5uCIEGi2SXs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x39N8OCqwnSY2SHaUwD0bjYAEPh4VtMIvVZ93iCv0wigH/PAzAFG7Fxx+ZHnWZGSAXcGZHYV9Y9vQ8wMvBdmMwKJCvQGctywCg2sKqDzsApd07v2ZOuqCvYsMxEgi6IrLmDA82n0MzAFJcCxOoSV/8cwBrv5JI3Gr9zouUqz4zBNqK9pr4OwpmjxBHtCmLZ61lcKoebGjiZ9mqTv33+96XKlQyyNfI0MiDdv44X4UO01HA7OkQeGzFY4VqYlo1Q+Hk2eI4DnSRlAepaiGutI+c9p0xTs466af8D4O9gTLvSYQGIHTxalWzQmSsPIkJO3DUFr1QK8jZ4Xgmuh+6wL1VtqTtZ1sIQHYhyVmYOggQwU8qqC0CqDOaiaPzQfBWGevTNtR/6vCCOplWdB9L2OGBAPQPhFTg7OLeKzrBzJt+yEpB8AEDR9fldT0B9in4ir7ZsznovQIFFKD008VvsCUmoJK51Nt7g9FYhN0h0pll1EQuh59Hp6vppAuxArsE9kW4HzgmaZDEq8IpgVnKBttJxfcCcGQy35eHLEai/XrT2PNScJ6Labp3fx0WBkuY99iG4HasH4wXX/jofrjhoSgcEwJPrtojZWvvQiG1nQbh8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1435128e-ab7c-4a4c-27e6-08dcc3ee2fa5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 03:38:14.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnCTRVrgS/s67qp7+jLE6zNPDcr1CEqjpcchcsWI2o6ldI/gQNOmY0altakgQ4ulyL/8aJ2//yq7AQgkhIkfr0ztFBJ3DKsW7CbUGIt8Q8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240019
X-Proofpoint-GUID: hMR8oqHZbFptMWymPuQQLpldLkggyuOX
X-Proofpoint-ORIG-GUID: hMR8oqHZbFptMWymPuQQLpldLkggyuOX

Create file module.builtin.ranges that can be used to find where
built-in modules are located by their addresses. This will be useful for
tracing tools to find what functions are for various built-in modules.

The offset range data for builtin modules is generated using:
 - modules.builtin: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section
 - .*.cmd: build cmd file with KBUILD_MODFILE

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 00b9f080-00ba011a intel_skl_int3472_discrete
.text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
.text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
...
.data 00000000-00000000 = _sdata
.data 0000f020-0000f680 amd_uncore

For each ELF section, it lists the offset of the first symbol.  This can
be used to determine the base address of the section at runtime.

Next, it lists (in strict ascending order) offset ranges in that section
that cover the symbols of one or more builtin modules.  Multiple ranges
can apply to a single module, and ranges can be shared between modules.

The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
is generated for kernel modules that are built into the kernel image.

How it works:

 1. The modules.builtin file is parsed to obtain a list of built-in
    module names and their associated object names (the .ko file that
    the module would be in if it were a loadable module, hereafter
    referred to as <kmodfile>).  This object name can be used to
    identify objects in the kernel compile because any C or assembler
    code that ends up into a built-in module will have the option
    -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
    can be found in the .<obj>.cmd file in the kernel build tree.

    If an object is part of multiple modules, they will all be listed
    in the KBUILD_MODFILE option argument.

    This allows us to conclusively determine whether an object in the
    kernel build belong to any modules, and which.

 2. The vmlinux.map is parsed next to determine the base address of each
    top level section so that all addresses into the section can be
    turned into offsets.  This makes it possible to handle sections
    getting loaded at different addresses at system boot.

    We also determine an 'anchor' symbol at the beginning of each
    section to make it possible to calculate the true base address of
    a section at runtime (i.e. symbol address - symbol offset).

    We collect start addresses of sections that are included in the top
    level section.  This is used when vmlinux is linked using vmlinux.o,
    because in that case, we need to look at the vmlinux.o linker map to
    know what object a symbol is found in.

    And finally, we process each symbol that is listed in vmlinux.map
    (or vmlinux.o.map) based on the following structure:

    vmlinux linked from vmlinux.a:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

    vmlinux linked from vmlinux.o:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            vmlinux.o         -- need to use vmlinux.o.map
              <symbol>        -- ignored
              ...

      vmlinux.o.map:
        <section>
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

 3. As sections, objects, and symbols are processed, offset ranges are
    constructed in a straight-forward way:

      - If the symbol belongs to one or more built-in modules:
          - If we were working on the same module(s), extend the range
            to include this object
          - If we were working on another module(s), close that range,
            and start the new one
      - If the symbol does not belong to any built-in modules:
          - If we were working on a module(s) range, close that range

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
    Changes since v8:
     - Added support for built-in Rust modules.
     - Added optional 4th argument to specify kernel build directory.
    
    Changes since v7:
     - Removed extra close(fn).
     - Make CONFIG_BUILTIN_MODULE_RANGES depend on !lTO.
    
    Changes since v6:
     - Applied Masahiro Yamada's suggestions (Kconfig, makefile, script).
    
    Changes since v5:
     - Removed unnecessary compatibility info from option description.
    
    Changes since v4:
     - Improved commit description to explain the why and how.
     - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
     - Improved comments in generate_builtin_ranges.awk
     - Improved logic in generate_builtin_ranges.awk to handle incorrect
       object size information in linker maps
    
    Changes since v3:
     - Consolidated patches 2 through 5 into a single patch
     - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
     - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
     - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
     - Support LLVM (lld) compiles in generate_builtin_ranges.awk
     - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
    
    Changes since v2:
     - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
     - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
     - Switched from using modules.builtin.objs to parsing .*.cmd files
     - Parse data from .*.cmd in generate_builtin_ranges.awk
     - Use $(real-prereqs) rather than $(filter-out ...)
---
 Documentation/process/changes.rst   |   7 +
 lib/Kconfig.debug                   |  15 +
 scripts/Makefile.vmlinux            |  18 +
 scripts/Makefile.vmlinux_o          |   3 +
 scripts/generate_builtin_ranges.awk | 516 ++++++++++++++++++++++++++++
 5 files changed, 559 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 3fc63f27c226..00f1ed7c59c3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
 Python (optional)      3.5.x            python3 --version
+GNU AWK (optional)     5.1.0            gawk --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+GNU AWK
+-------
+
+GNU AWK is needed if you want kernel builds to generate address range data for
+builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
+
 System utilities
 ****************
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a30c03a66172..5e2f30921cb2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -571,6 +571,21 @@ config VMLINUX_MAP
 	  pieces of code get eliminated with
 	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	depends on !LTO
+	depends on VMLINUX_MAP
+	help
+	 When modules are built into the kernel, there will be no module name
+	 associated with its symbols in /proc/kallsyms.  Tracers may want to
+	 identify symbols by module name and symbol name regardless of whether
+	 the module is configured as loadable or not.
+
+	 This option generates modules.builtin.ranges in the build tree with
+	 offset ranges (per ELF section) for the module(s) they belong to.
+	 It also records an anchor symbol to determine the load address of the
+	 section.
+
 config DEBUG_FORCE_WEAK_PER_CPU
 	bool "Force weak per-cpu definitions"
 	depends on DEBUG_KERNEL
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..7e8b703799c8 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -33,6 +33,24 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+# module.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = $(real-prereqs) > $@
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
+			modules.builtin vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+
+vmlinux.map: vmlinux
+	@:
+
+endif
+
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce6..252505505e0e 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
 
+vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
+
 quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
 	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
+	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
new file mode 100755
index 000000000000..51ae0458ffbd
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,516 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# generate_builtin_ranges.awk: Generate address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
+#		vmlinux.o.map [ <build-dir> ] > modules.builtin.ranges
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	fn = kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mod = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mod);
+		} else if (match(s, /RUST_MODFILE=[^ ]+/) > 0)
+			mod = substr(s, RSTART + 13, RLENGTH - 13);
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+
+	return mod;
+}
+
+# Update the ranges entry for the given module 'mod' in section 'osect'.
+#
+# We use a modified absolute start address (soff + base) as index because we
+# may need to insert an anchor record later that must be at the start of the
+# section data, and the first module may very well start at the same address.
+# So, we use (addr << 1) + 1 to allow a possible anchor record to be placed at
+# (addr << 1).  This is safe because the index is only used to sort the entries
+# before writing them out.
+#
+function update_entry(osect, mod, soff, eoff, sect, idx) {
+	sect = sect_in[osect];
+	idx = (soff + sect_base[osect]) * 2 + 1;
+	entries[idx] = sprintf("%s %08x-%08x %s", sect, soff, eoff, mod);
+	count[sect]++;
+}
+
+# Determine the kernel build directory to use (default is .).
+#
+BEGIN {
+	if (ARGC > 4) {
+		kdir = ARGV[ARGC - 1];
+		ARGV[ARGC - 1] = "";
+	} else
+		kdir = ".";
+}
+
+# (1) Build a lookup map of built-in module names.
+#
+# The first file argument is used as input (modules.builtin).
+#
+# Lines will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we record the object name "crypto/lzo-rle".
+#
+ARGIND == 1 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mods[$1] = 1;
+	next;
+}
+
+# (2) Collect address information for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+#
+# We collect the base address of the section in order to convert all addresses
+# in the section into offset values.
+#
+# We collect the address of the anchor (or first symbol in the section if there
+# is no explicit anchor) to allow users of the range data to calculate address
+# ranges based on the actual load address of the section in the running kernel.
+#
+# We collect the start address of any sub-section (section included in the top
+# level section being processed).  This is needed when the final linking was
+# done using vmlinux.a because then the list of objects contained in each
+# section is to be obtained from vmlinux.o.map.  The offset of the sub-section
+# is recorded here, to be used as an addend when processing vmlinux.o.map
+# later.
+#
+
+# Both GNU ld and LLVM lld linker map format are supported by converting LLVM
+# lld linker map records into equivalent GNU ld linker map records.
+#
+# The first record of the vmlinux.map file provides enough information to know
+# which format we are dealing with.
+#
+ARGIND == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	if (dbg)
+		printf "NOTE: %s uses LLVM lld linker map format\n", FILENAME >"/dev/stderr";
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+# lld: ffffffff82c00000          2c00000   2493c0  8192 .data
+#  ->
+# ld:  .data           0xffffffff82c00000   0x2493c0 load address 0x0000000002c00000
+#
+ARGIND == 2 && map_is_lld && NF == 5 && /[0-9] [^ ]+$/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an anchor record from lld format to ld format.
+#
+# lld: ffffffff81000000          1000000        0     1         _text = .
+#  ->
+# ld:                  0xffffffff81000000                _text = .
+#
+ARGIND == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
+	$0 = "  0x"$1 " " $5 " = .";
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+# lld:            11480            11480     1f07    16         vmlinux.a(arch/x86/events/amd/uncore.o):(.text)
+#  ->
+# ld:   .text          0x0000000000011480     0x1f07 arch/x86/events/amd/uncore.o
+#
+ARGIND == 2 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/ vmlinux\.a\(/, " ");
+	sub(/:\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+# We only care about these while processing a section for which no anchor has
+# been determined yet.
+#
+# lld: ffffffff82a859a4          2a859a4        0     1                 btf_ksym_iter_id
+#  ->
+# ld:                  0xffffffff82a859a4                btf_ksym_iter_id
+#
+ARGIND == 2 && map_is_lld && sect && !anchor && NF == 5 && $5 ~ /^[_A-Za-z][_A-Za-z0-9]*$/ {
+	$0 = "  0x"$1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND == 2 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# (LD) Section records with just the section name at the start of the line
+#      need to have the next line pulled in to determine whether it is a
+#      loadable section.  If it is, the next line will contains a hex value
+#      as first and second items.
+#
+ARGIND == 2 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	if ($1 !~ /^0x/ || $2 !~ /^0x/)
+		next;
+
+	$0 = s " " $0;
+}
+
+# (LD) Object records with just the section name denote records with a long
+#      section name for which the remainder of the record can be found on the
+#      next line.
+#
+# (This is also needed for vmlinux.o.map, when used.)
+#
+ARGIND >= 2 && !map_is_lld && NF == 1 && /^ [^ \*]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Beginning a new section - done with the previous one (if any).
+#
+ARGIND == 2 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Process a loadable section (we only care about .-sections).
+#
+# Record the section name and its base address.
+# We also record the raw (non-stripped) address of the section because it can
+# be used to identify an anchor record.
+#
+# Note:
+# Since some AWK implementations cannot handle large integers, we strip off the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.  The portion
+# to strip off is stored in addr_prefix as a regexp, so further clauses can
+# perform a simple substitution to do the address stripping.
+#
+ARGIND == 2 && /^\./ {
+	# Explicitly ignore a few sections that are not relevant here.
+	if ($1 ~ /^\.orc_/ || $1 ~ /_sites$/ || $1 ~ /\.percpu/)
+		next;
+
+	# Sections with a 0-address can be ignored as well.
+	if ($2 ~ /^0x0+$/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	base = $2;
+	sub(addr_prefix, "0x", base);
+	base = strtonum(base);
+	sect = $1;
+	anchor = 0;
+	sect_base[sect] = base;
+	sect_size[sect] = strtonum($3);
+
+	if (dbg)
+		printf "[%s] BASE   %016x\n", sect, base >"/dev/stderr";
+
+	next;
+}
+
+# If we are not in a section we care about, we ignore the record.
+#
+ARGIND == 2 && !sect {
+	next;
+}
+
+# Record the first anchor symbol for the current section.
+#
+# An anchor record for the section bears the same raw address as the section
+# record.
+#
+ARGIND == 2 && !anchor && NF == 4 && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", sect, 0, 0, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s (.)\n", sect, 0, $2 >"/dev/stderr";
+
+	next;
+}
+
+# If no anchor record was found for the current section, use the first symbol
+# in the section as anchor.
+#
+ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
+	addr = $1;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr) - base;
+	anchor = sprintf("%s %08x-%08x = %s", sect, addr, addr, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s\n", sect, addr, $2 >"/dev/stderr";
+
+	next;
+}
+
+# The first occurrence of a section name in an object record establishes the
+# addend (often 0) for that section.  This information is needed to handle
+# sections that get combined in the final linking of vmlinux (e.g. .head.text
+# getting included at the start of .text).
+#
+# If the section does not have a base yet, use the base of the encapsulating
+# section.
+#
+ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
+	if (!($1 in sect_base)) {
+		sect_base[$1] = base;
+
+		if (dbg)
+			printf "[%s] BASE   %016x\n", $1, base >"/dev/stderr";
+	}
+
+	addr = $2;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr);
+	sect_addend[$1] = addr - sect_base[$1];
+	sect_in[$1] = sect;
+
+	if (dbg)
+		printf "[%s] ADDEND %016x - %016x = %016x\n",  $1, addr, base, sect_addend[$1] >"/dev/stderr";
+
+	# If the object is vmlinux.o then we will need vmlinux.o.map to get the
+	# actual offsets of objects.
+	if ($4 == "vmlinux.o")
+		need_o_map = 1;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+# If the final link was done using the actual objects, vmlinux.map contains all
+# the information we need (see section (3a)).
+# If linking was done using vmlinux.a as intermediary, we will need to process
+# vmlinux.o.map (see section (3b)).
+
+# (3a) Determine offset range info using vmlinux.map.
+#
+# Since we are already processing vmlinux.map, the top level section that is
+# being processed is already known.  If we do not have a base address for it,
+# we do not need to process records for it.
+#
+# Given the object name, we determine the module(s) (if any) that the current
+# object is associated with.
+#
+# If we were already processing objects for a (list of) module(s):
+#  - If the current object belongs to the same module(s), update the range data
+#    to include the current object.
+#  - Otherwise, ensure that the end offset of the range is valid.
+#
+# If the current object does not belong to a built-in module, ignore it.
+#
+# If it does, we add a new built-in module offset range record.
+#
+ARGIND == 2 && !need_o_map && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	if (!(sect in sect_base))
+		next;
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) - sect_base[sect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = $1;
+	update_entry($1, mod, soff, mod_eoff);
+
+	next;
+}
+
+# If we do not need to parse the vmlinux.o.map file, we are done.
+#
+ARGIND == 3 && !need_o_map {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND == 3 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+
+	sect = $6;
+	if (!(sect in sect_addend))
+		next;
+
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "sect " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (3b) Determine offset range info using vmlinux.o.map.
+#
+# If we do not know an addend for the object's section, we are interested in
+# anything within that section.
+#
+# Determine the top-level section that the object's section was included in
+# during the final link.  This is the section name offset range data will be
+# associated with for this object.
+#
+# The remainder of the processing of the current object record follows the
+# procedure outlined in (3a).
+#
+ARGIND == 3 && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	osect = $1;
+	if (!(osect in sect_addend))
+		next;
+
+	# We need to work with the main section.
+	sect = sect_in[osect];
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) + sect_addend[osect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = osect;
+	update_entry(osect, mod, soff, mod_eoff);
+
+	next;
+}
+
+# (4) Generate the output.
+#
+# Anchor records are added for each section that contains offset range data
+# records.  They are added at an adjusted section base address (base << 1) to
+# ensure they come first in the second records (see update_entry() above for
+# more information).
+#
+# All entries are sorted by (adjusted) address to ensure that the output can be
+# parsed in strict ascending address order.
+#
+END {
+	for (sect in count) {
+		if (sect in sect_anchor)
+			entries[sect_base[sect] * 2] = sect_anchor[sect];
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.45.2


