Return-Path: <linux-kbuild+bounces-1832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A28C349C
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B259F28177E
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE451DDEA;
	Sat, 11 May 2024 22:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IkkeYwrR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fSKfwhdl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A017BA8;
	Sat, 11 May 2024 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715468345; cv=fail; b=HtulTdT6CGoALJQ2taSNVoxz5zDnSTqcpv5CKjCpNXyLp32iLmSqa6EgJzt5QDsMc+Iobvh7p51/3kLl2TcToXPM+a/TsAcByUVqvu2matjUzOYDqncwfR5jkN7w6F6DfjEa9wKwTnDgxISDsLdXUkekZbM2riyyU4auPJ1nqjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715468345; c=relaxed/simple;
	bh=mAOEOjjZs5e1I+92Zs1egJQAr/+kaFeeHiXrknwVcrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHhUF1SSrwE1iRjHOCcuwhO06yYm/MCyIbjUo/vDiBRqe1IFbDDzUJiOMfGkqIwnC2LyP42xSvCPIX+XrwACLMnJaU67No2ivSzPC/VautxC4nKCUa8Usfa9ntU/Wpi6bCffE2YFkKmSe3c5siMzbO2y//naHW2nuz7xeWyM2Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IkkeYwrR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fSKfwhdl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMwUB9029735;
	Sat, 11 May 2024 22:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=rh08Yov6aik6CwKNcz13/k3KqUSXoBqB/kh51PrruqQ=;
 b=IkkeYwrR4CE7VQq3Yg7ZsPC5Kvzdkcp627veGE5Eq9/dTlhcS9Tz6vtOvpDXEPaMiYE6
 98QeiYYBf5QYvuhw8sCI1GrGpBMltQbz1G7iOsi8eIWgcDhXDh/UWstxv0zbMNEj8u0A
 stgMe98C0RnIJWl8Eu61RfiCaLA443p2BJA4Su9khvoXvkZ0Lw/hFbyOUXmimh+WPpFS
 1X3KMVhjdV6SPJ9I0SlAORZpzURHg9brTcdkxFE1sNGaymXPHElc3fwV/c6qmv8r6BOi
 OWZvX+d8dgpZ9e9C3dIknLDmyZMDVtpoYAcRgZ6+NmLDLEfP4fBWVJPNTmA8JQPKoQOA VA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2g38r19k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:58:57 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BM3mNS001618;
	Sat, 11 May 2024 22:44:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44h742-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:44:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR5894QdUVlJUJouyfV5yQGSCO2jXu9PUxPbEmpwYuqYiV5JcYjhsg4QJL0gcWFPuI/ByjpFAvC9ZRKfLE5UHrrvdmsr4de9ddIPDgdNo61aMzZD47C/EuF3pexOWdjjqh0CxxvwSt3fHcbCJCa6rNPwB8G2ehpBLB9QiiG/TA2esj+MWGGJ7f7EBE2vo256Zwb0jXZcptFbSShq3tsomZrEq35oCyWJLuI0jkIjffTVkjkgzAHGjxUtxGd7x2QC9QZ47V8nFfWzaM43x+BVyG+AC3aonqozjZR3FJUED+gJc5W9vv02/sMNUD8oHpO4swYu+x/6hzUhMC0DvIEEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh08Yov6aik6CwKNcz13/k3KqUSXoBqB/kh51PrruqQ=;
 b=T5MC7N7tYJBH+ANeGAGpcwYbHbS7ZEFIcqE44jxRzROG20w2llnjykfVgOagjrV+69AnFxHhAsR86L5mYTwZK/6dh50xAhdr5F6pt5raj6WN6yqBXfbnE6i8XimcThOwPBGe5c1QpywP7Tqe7rQ/4zavp5zUyfe8A9yA6u3N7p3kBJyx/AkdWeZSTcMjxWlxv8n1MrYYuPLH+pxGKjexhv1iIRLAGlmqLNbXeYOmgRvNrinXnCNicmK+sLcg4jJ/WtOk/vL71PGq3nE6AbR21aUy/KowHJPN1a6kgrSFLkPCyUBzVKD/Y9Q5iPEAsT0dYX9b6/CHf+wTWjVjSSmwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh08Yov6aik6CwKNcz13/k3KqUSXoBqB/kh51PrruqQ=;
 b=fSKfwhdlQaYtyl/xQwmTEaaoW5Jy2mh2EKhN4Hro/6Ef7ZsDvEH5iCCGzJhNhPhDn5M3WKzEiXnnuTCQQXaktinSArWTzQWIwmATRfNwiVFoZOBX5cFBLD4TtxgiligZd19ph8Apwsk2rhqlJy4zWx4qszRiwwzMGyjudjdcARc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:44:48 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:44:48 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 6/6] module: add install target for modules.builtin.ranges
Date: Sat, 11 May 2024 18:40:35 -0400
Message-ID: <20240511224035.27775-7-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c302da1-6f9c-4795-7cff-08dc720bf66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fzEe7whnjjLc4ioWOh9jig3mt6sd0mndz8W6lQ3wHB22tT7fTpkkrSSD6clQ?=
 =?us-ascii?Q?jNgmoqDMALEsgm8mbtQ8nOnEXBmHXGCirl4K9oS8DJTJjHoERKta01+dhlwI?=
 =?us-ascii?Q?AjkLtx1qP/0bynM2et74R7wR6V2pllPWCLDeIHwAABjH8ACPiLh1m5+3slbr?=
 =?us-ascii?Q?s4YeOjuiIi+z7lrH9gQS1vt/YR/IW8ye3xkWpliN6AIrvKXCkOwapbIP0Ias?=
 =?us-ascii?Q?VbkkZu9XDzNIfADVNwDTop2RLkTXTupIWvfbuCfzZxCI9e38UDzIV9x0cwEN?=
 =?us-ascii?Q?k2Oj/Tq5VT4vp5CYayASM7H/pra8Ub18Gd3NTt1OjtdaFBpFlrZlT1deQpdi?=
 =?us-ascii?Q?VoPdwIkzi2znZ9/JgihAib6lVk9r9IZHcIQ2cjeAOQovvjaTfymBdz0sUqb5?=
 =?us-ascii?Q?s12V/jcBwLpwUoMazR0A1WQuVXkzuoo9whRCTPpbj/cJ05h1e3Nya1N0s3/N?=
 =?us-ascii?Q?+WU6vlU4E7sZ2A+JFiRyenqGvWDfCIeONSFcd5ktUVT+XX5WtNT88yx5TeM9?=
 =?us-ascii?Q?jdwK7QB5i3ehEQ2xBokZ5dtabQ86YGPUeOhXojYS2aT3QnNiYYvPQ/NlIS8w?=
 =?us-ascii?Q?9/XHEbqm1AioZLmgX8B0PuW/w85Zp6DXvKJzpdH4ZZtDZUE+Mf9nH27gx6I1?=
 =?us-ascii?Q?VznizyMHrzf/hzDWnGVuynhQSl0E5JS02Wzwe71Rw3AdMqTBaTl+68g28Loj?=
 =?us-ascii?Q?E7Un3C1kW8zzN06Q2szWZmckJtvEfhj4mmsz5udPq1QnbSLiTitIlEh1Jdqs?=
 =?us-ascii?Q?FnhgEhKIOTP6JANG1Vmpp0RmHW7ie0XcYC7fOPiC+7HSA8hAt4ggT44ai/tx?=
 =?us-ascii?Q?/n+RZ4/iZYp95904hZvkqcPr3YaJ7PjM/qdnaaDrpvEmjdZnnewgdrO6DSbr?=
 =?us-ascii?Q?N40Lgsgd423L6ZCzNnNewtGXrs4FrCnYTjN2X88RQ/ZvEt048qpZC0RAkIbN?=
 =?us-ascii?Q?KdCQDfUv0V/QaTsw1cjNT/GavF0f5PwfNw3I7lLOannGSuuoXuxKgA483+dD?=
 =?us-ascii?Q?5X9SzPQ6RtgMDJH/WpyY9o08Ht5rI3++8B9x1oMDY/JUVyUJ3pMQfeR9fnN1?=
 =?us-ascii?Q?CQUlRUg0IgIcuZGYpjy9nC49SQST0xZRdw1NN28hIF6T/dbsvsYEZXFHE3mz?=
 =?us-ascii?Q?beteR31JSggHCy7QIA8eXH9+LPsKxD1THfCh0IrbBcD4XQrYz5dWxzsLaYLV?=
 =?us-ascii?Q?hCLvZBw5qulQfSy9UcNGOKskAKNyU7dN+gP34bsEP2IYRgxr8uI3TMCmrcv9?=
 =?us-ascii?Q?ct6lTvorl1tz5czK+o9LVNz1Kpb/2q31AEzZR21NLA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p7wxVe1gbmvjoujxZqDescvLxEVI7Df/gT1qSst/jb0jA1EUqDbTQfcTy9Hg?=
 =?us-ascii?Q?M+iDiV59f1BooLWhjeWc+FsqA9/r9KtRttIcvUQ3eUi3Qddwhwhrh7CWGhFk?=
 =?us-ascii?Q?8g5uodZq0wGc6KmqAf5EcT4SlLrpdwCqBo67lJziNa0EY+tUtZ2jj/QRVMEn?=
 =?us-ascii?Q?fqCwYCp52Sh8Kryw+6Bcn/oZVx4Qo6bIct+CQOXPGIikZv+1jPGWTRio6eQx?=
 =?us-ascii?Q?/IZXo1aVXS/rQyaW3Vl8GKjjW8Vkk2uBXjwqi1MO7nlYFqtyK0t5dEocfc/p?=
 =?us-ascii?Q?zE8KyjOZ3aTTFSCQut/djtDTZQ1LmTO+nsBGk2rdU63mLc2lfJHLvP1m+Hbx?=
 =?us-ascii?Q?tidqBhE0/3TA2X0LHfgnFHHS3qq1XzxDR76+aeR108WjAQdQvzY/WTJOSfre?=
 =?us-ascii?Q?GHr5azoNpnEp2zT73ayTVvs1M+jmSOpTadB+ZACkyi+5PuE5/n4X1BUD/rnJ?=
 =?us-ascii?Q?N+NGR55TQ8nyP+SifX0f0xNtjRDjvpHteibobprS1Yt6hf/ZfhaAhv5AmWtn?=
 =?us-ascii?Q?7jgDei2AU3ruMSSOLoSq/yLfQSoV9C4iu1ayLU78gwHlshY53EBtI7yZZa88?=
 =?us-ascii?Q?10tPbBWBRivbi52d2R4vJ+BGPlaFF+qmrOsrPicGtUWJ+4jM8O2BHwrSyjVu?=
 =?us-ascii?Q?zX+Ub4WOuegdWbysD1VSH0piIrOmVSJtWw98CIiFv2hhx6NxdWcfSR6auJwK?=
 =?us-ascii?Q?flbdOwAliFosgu147v8hrpuGv3n73G8hhOkXXr60nvmDbkrs8IDQB/kfSmFu?=
 =?us-ascii?Q?t2ip4bjuRBPXGWUqouc0FQ+4pFiX5qVAXj8TM8JyBO7vx0X219YXL/MHS79i?=
 =?us-ascii?Q?NTneTmJbXcGkSkCkfTicg0RNMbXs3iQ8vt3kP3avy/lvWgtwPB72mxchEm3p?=
 =?us-ascii?Q?BzGnkdafCEm6DFyubrTqARwEmqCgW7kJ9PJ557P/57pPKfTh5+VcvAf5OM3g?=
 =?us-ascii?Q?ch3TcNDuIgomTJRLTYF8cSbFKfHVa05PWlyID2bbSv89tu5hfH+sCg1Eq1gD?=
 =?us-ascii?Q?zd4CChyYFiqy2tbhcmqQbPCZUkSnoKFN7IZnjFO3uWyNE4gT/CuRAY2+cvqv?=
 =?us-ascii?Q?FolqxqYOYK1mZRYus4WCMaCMhjuxISHHVTW5B+3V42uTNP2cbm34+UvCFhlp?=
 =?us-ascii?Q?BZc1t4grE+hurAmVxBJ87vnPtKuGWNEJ0UT2MXFTjuG9vosobWckCQmbjb+E?=
 =?us-ascii?Q?U3pwDPDxdByFb4Qk1yghNcfUILb6zBLyOZ5iu8Lr7WRGT/pUWQelkMOgGG02?=
 =?us-ascii?Q?mldiIX7X/wqpu3VOHtR8RLkuqynyUeHXSKmnANVSbuvqR14IfbnylBe6pLNf?=
 =?us-ascii?Q?mUC24HeF/jhhEr3crDzSSzmf49nlTd7Vu+8wi9zEH+ok3xa4nvyC+yUCk4UH?=
 =?us-ascii?Q?lixz3gjaVJ/P0atOWxoYNsqDaibzn9e1TD8ncaJhsIARNYQUAZxufRRcXbJU?=
 =?us-ascii?Q?7EgFPOR5YGXR9LYswR95KJ7VvHwwLTiWctxKWl28rNz6HeB9crXHI0v6OlHU?=
 =?us-ascii?Q?sQ65sZSJrV2+C1qSizXHekF7N07wKpat7K9DjBgOaQb62Q2bQocUhGmznbEA?=
 =?us-ascii?Q?njuH/ggD0+tG7KLrOBJnUqwPjotNbW6ahkWv949MTp0LjDhwWk8NxphVPTtM?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M4BtS9fhdmJJpdU1O9pRzKXSKhFZfrOhdr/oXmHLmoiKhgSZETWhC1tjE2yJojRnKq1gOWzlxcXqNGrD9niWqhqpcM14tbBk0Vc4jQNMLSigIKZoTyTAxUrVWD5GVvbrNoug143+Ljd9EGcVwQM0i7FopUGvHDa9+61o0J7d41v2mblyZMVroQSVHEx0cLehqimJZrjq+rjkqnt8zTLlAjZGM9xJtTFu1PRErBSJM060cwVk+t7x7UrHPWNGQP28m2KOxlr5GyjFxj7kIHQnO37Ws1EL+FCTqQw9qKVgEcbjK/DZipxXANnpXRjpsg5WNSEVb7I0eYFxWTH+zHP8FEOFCKLPgF2GJPW5baUgADukf1hELJwP/SOlKCHiW2skeeXcnlwiaeMDAO2EeTgyC/4OpUVNuZYYtXkP999jQIcKNaLiW4A0xT7yw37JV1HD2rEIROMqdvH094B98Lhkq0DGM/x8D4GZUISEBvjYAvUkgjrM5rL6vvBRKCP8WwGxa7UVs+qDzvUYHCggOCV8vkzqGl0uK21AFu4kjMTZ+iJ55Prpw+XDDs4Kk9xRz7+95k6efucvbuwRZs1NhSY3oy/cUWXv0VkL13WAKOI5f/c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c302da1-6f9c-4795-7cff-08dc720bf66e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:44:48.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSh/MThx8zYmImo+z/Lmac0rk+9/m6XKP0DbW0sejOVJTthN8tKah30i6ATtHoYJm0iREObyLWV7mWrW//0DDD18xLbyyXSGWeXXfyll3lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405110171
X-Proofpoint-ORIG-GUID: _mXa5YjPetcukH-d-cLK16xvjrp0i9mA
X-Proofpoint-GUID: _mXa5YjPetcukH-d-cLK16xvjrp0i9mA

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
---
 scripts/Makefile.modinst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index b45586aa1de49..e185dacae892a 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -36,6 +36,11 @@ install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo mod
 $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.objs): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
+install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
+
+$(MODLIB)/modules.builtin.ranges: modules.builtin.ranges FORCE
+	$(call cmd,install)
+
 endif
 
 modules := $(call read-file, $(MODORDER))
-- 
2.43.0


