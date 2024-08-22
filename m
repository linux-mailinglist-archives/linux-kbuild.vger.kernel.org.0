Return-Path: <linux-kbuild+bounces-3162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5295BE20
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 20:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37FE2825AC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F951D0DC2;
	Thu, 22 Aug 2024 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LHk11Jd8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QBsSvi+v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45C1CFEC0;
	Thu, 22 Aug 2024 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350838; cv=fail; b=hhdt+e+0Y/AtlPfx3kJJPRqwFrVz2fA3BiMWBrSxwqUgqNYdJs/d5QCDVDJ3Uvszmrt00KqnMcuWLIdwF4dAoVriZh7tAaub1dwnDJn+gFkwoEx4GvWXRrcgzF0t8JYJuSQpPzBxXfaCJ0gqXdpPC3yfQmAlI4LXkyOzd3A86+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350838; c=relaxed/simple;
	bh=YrmsrHdvhN6Bi3OLDiVY61cRYA/t9f/Heq9ACtkmqXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0MsUN760xd+e2YLqmxcq9pEEyGKIYKtNkv5YSJxPa7xZi1pMBopOB6OQdKDKHfvbF7bQW4kCUsb/Dctiv10cqJLMmPZ9lQZN79FuU18C8qTrLXTEG7evQAiuOQiBBDElsnJyzQ4oQU/eK79E4Pl5YlwuZHjF4uKnsOjzBbSOQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LHk11Jd8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QBsSvi+v; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MEQVPM028678;
	Thu, 22 Aug 2024 18:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=; b=
	LHk11Jd8KYzk5JbF9gnmvN1uHRafBQmo6/ejP1bXPXOODmMQhfKil+vELMh802Qc
	jBaUy2ELCpoJs1HdL8gRftObFEj65otI363wolX8WIHXd1wBx3duROZwE+IBvoBa
	Y9ySskYvowDCP3X/TiKZTfLFSdWgY7NTmSr0jOxJ6TNeWcp0PifzFHOKrcosFfDK
	6hBXjXAn9SbaS4UNOTw7hzDA8TohinAWEGvZYF3i6wZNHGUpuEyOgWZsU9WDhL+P
	mjHnGawQxCJa1KWZb1ySRBKVprIPdvjuw7EDsGv0rHcKgd34eRKEosE/Q1SRHRhu
	+ItcceltwLiT6GHeoIdFPg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2djt2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47MIDfRI027865;
	Thu, 22 Aug 2024 18:20:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 416947mahm-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBJIsIxGV4ZZDZADK2MZJqxhu1HcBOq42dqCjeCzvlJU95F3PW5eZP4FoRxSqYaLPNjoChkBBnMBdbNAHM/iUiDOBuAZ6mAMwfL9jOFyGI/4/JIXtDNAoZQ3OJg3ueCrF0FwPJsJgeTSe/bsAwzqApQ+Z0G06eHjiuPkb+bO3op2zaib4W5W4JKTjAqvr4r2ad8TKgTUbOXZcNnTZcKQEY507t7f4p7mOl7mbfHS4mVUaSMLF7MrAFPNXcBFbXkpRCeviQOs9MDFUIulI8s3gg3JJ5xDtMILXv62t3g5j+ua9qQApcs4pK8lLEKFrYdgGkJTcElALDXWqHGsMYlV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=HRsbrsvbL9O31ni6627ctqXPCtfCmhXy15W+dOEPpyCGHDrKTXPgD878Zsf30NFp/rXtmHYvaDpQ2w/taVmaYLnwWYH9j20OvfbCEWd9gNtE3gYy+J3Em/LuULxdKv57RCtfpaJwTTeKPOksJ9nnS2FKdPej9tcO+ABYL/X/wCD23WpX5TgWq9Wheyy6HXu88uoAnnS3wgeJ9oNJU7QZTJY5WN9/Bw5LvE+hfjJIsoCO5dtaLoP1QrWYD1Pnc/F8EGJbdsxJ8FZNr/kMs4d+djxBtYgUD8xNOBI6KHPcDuXEAvEXNApr1DEDTcHQ7wbQuSghxJQ2L/Mki8BtbtxLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=QBsSvi+vkjQLeEczVgBzP4QtoJE8cOHLdMN3fy9VQqEamfPYbvzVMcb+S0vYyhc6FkcdYk86qyfd8gPdg3xQ/62XAH36RFkOWvVnGJhkDN9wJBkS7dkrnfZyd4wm/JwcmMScFX0im3aeP6CBCdftLYAdKnYEi+KUOZ4lqJi0ER4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 18:19:52 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 22 Aug 2024
 18:19:52 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v8 4/4] module: add install target for modules.builtin.ranges
Date: Thu, 22 Aug 2024 14:19:41 -0400
Message-ID: <20240822181942.2626536-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822181942.2626536-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae82bf2-5a6f-4c11-de05-08dcc2d7040a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qwujw4PHRIfZ8zOSevThEcwSFJf/9lqkwzVk77wmpDzdHatWud1kB7UagMMd?=
 =?us-ascii?Q?rE5QTnWXdTZkBK8pG9ENtapKKRUn2BLsVq4aeO53oZmoFeUhWlS6t0Ijdulp?=
 =?us-ascii?Q?tGDn8uWw8ozaIZWxSPPXyKLsWAnJnSflmrq8kOIvpaXozF91Ps/jbUmpBgyJ?=
 =?us-ascii?Q?kmvgwLMtHlQfYbcgZkXORqDaujwyGW/64SU7mfA3YrfqAy4JOtrzO59KGLBy?=
 =?us-ascii?Q?vEy3AK+FNu5Y4L0o8zoTQRd1WpmLFewn+RusqmzR+yE2ctWEU+VgxdkVO5iK?=
 =?us-ascii?Q?w+ld1nWuyq2FfZyezQcAxixHEWDCxRAUVkIrH0ddd2Mo/+3LsjycFCtWCXuD?=
 =?us-ascii?Q?1s3GK7vub6pYZ75BE789/XMKE7J8pOxs4GVOinfwu/cX7TtKxyN164fybf5g?=
 =?us-ascii?Q?wY6HMc4QMya+7rvac4ZbV3xQANCnl7QMT2j0aTNh7gWQphJmTxdg07DDYjpn?=
 =?us-ascii?Q?6xZSQcfybrTxCYOOKXXIvy1CRBZmkmPmaLaSVLTAu7bUKUo8z01mRP7Eh490?=
 =?us-ascii?Q?IBftMe/c4l/yAV15QrtgGjSRX/TePQ5FgzGKfooHR/q5Lk5JwMifW9u5ebzn?=
 =?us-ascii?Q?EQjWvO/teGRHGe2BzXSP+x+u2GCqZEa/Lh4xCm6mp0NsZvGMOcUzD4vCPb+K?=
 =?us-ascii?Q?Y8jC6QbSGFEZ1+pQkkU7GGDrhlQ5DksKVLLlyhX65oSN+XOeL1qVUQzx6fdI?=
 =?us-ascii?Q?clTy/DlXocgl1WZvncPCdDZ7cLkNSC6wwGp92ewQykcBoEeqPEMZL0dX/WUL?=
 =?us-ascii?Q?snAln0SNSSzIQQo/MqnpcKZMPkY5ccRx4QfPiKWGTg3/LLigqspA91AtP1g1?=
 =?us-ascii?Q?dFe8uyl51gwH5k11va4qtMEMAXY4rIIhJyDLY1ub1xO0OTWJeEYRKns6qcCP?=
 =?us-ascii?Q?TfhOAMeJ54k8MUdS9qx/0sQp4mqZIemcBUZC05QUPnGGZfnR6sVeAH1IC36K?=
 =?us-ascii?Q?2dyXyRm48v4JMiFMO2iNDsGio7nYXxHq/+JAg0hGszoan0S/gBJXXqu+DGq1?=
 =?us-ascii?Q?ruCUaWQkltVEmieYtoJJV4X3ugKXlau7Do+Eu4zqj60eqyXsJ/dfDQeqkHPs?=
 =?us-ascii?Q?CjTH1wpbnQ8Z/LvzyKY/uKGSMm100aR4vmQfFzOAjAeHBimMfq88U75ncfzj?=
 =?us-ascii?Q?t1k4+CpMRApZ194H0kXxYPTLyaw4V5mBtkGffYrqDyc9Cfd0i0/u+wxfvXG6?=
 =?us-ascii?Q?LQ8DEQrR2cWpCbdr308gBac00tjh6uuW1qPWPww1tPcSiWZ1ux2DTzS0cWEt?=
 =?us-ascii?Q?8XCuodBkX8qIKcxoH345BjKtarkJlPqZyHDjO7t33E+y0z4GxcuJFXpnh/K0?=
 =?us-ascii?Q?8uQz9lt4AH1VSjIExsJhTNbsJFLC+Nf9x9eaJeri2ZdyUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?orA4N4aA6oR7E/7T195u91Rc0xgvysPeoMmlMTLfHYnO1pqPCpS1Oa2XLBoy?=
 =?us-ascii?Q?KBZbZD2CdZ/rIN+7xsNMFHC1Y3D0NDlTpGZC9qzowj2NAecvorxIl6YFW4m/?=
 =?us-ascii?Q?PVGMRhYrjpn/On7iNHbsd7MW6pqixrjp9TBNJJOjoFpdgYddFHDJZZmPo7Su?=
 =?us-ascii?Q?Qsixf6Rt1s3bFdz5jt4lVI1ipM0sIu7BLGyryAkiCUZM6SZr4E5NYsMCe6tp?=
 =?us-ascii?Q?f0R75ZVKhtt2My/W5ru5/kxDyo05iF/gNI5bFOK4jyR2owd7+XGXGMHrGjXE?=
 =?us-ascii?Q?1H4FOuvQirTB1wUAspGQcq1LFBK12dWoj5ZH0bICFCEf+twfnYJax9rynbXo?=
 =?us-ascii?Q?8EgDmnqej7BB3EBiD0rAk+5UA/y2SO4Hq8fy60gNL00J+o6qYbw4yS0fuqzb?=
 =?us-ascii?Q?RyZqB9DfROH6eX1rSlQqPphHav2Zls4+1STY8ZayR9Virw2TFFlOcPS7xVqf?=
 =?us-ascii?Q?EmPw+rFGuYcWra5IJ2wXr5vilH9sM7CkWO+ZsJln/soHta/KaFfxuFeTWi4m?=
 =?us-ascii?Q?WZO8Gyj67h4DH2PW7IGCuOqqwyPUIkxEvR2tShC0BqhHZW38hnaBwHYKBb3N?=
 =?us-ascii?Q?OCp3/9P7xo5Wj9RiBsYVb1IZYz/4M7QCWINYwI92FvQ2+NmRAacn5y2lvbtE?=
 =?us-ascii?Q?LPJ/M3V9D3xlVlOQR8MZc1YV8x82q13Ylg+Xo0D+iLz9LtRpVSfXdozDZ8f8?=
 =?us-ascii?Q?X65uHnlV3r2e8abdXMWBoMKcQjAZnDaBlYYdEhuvN3uVQVQKKVOOtnyC+K42?=
 =?us-ascii?Q?HlqeRjLcZAbFIAgDgFwHVbHevZOWPDOLC2bL5b02HSoZQbwWlzZFZCVeseli?=
 =?us-ascii?Q?9s+CKzxj+CvVvlNQ7IwQ+0grkyGw83KCsOeXEuuyoZXwpxu/THAXb3PmyCE4?=
 =?us-ascii?Q?+qwKsBrtQBfdEhDZuegNZfdysNAVbxGRLKzutjarAHweKel8TlOeqHXWuk6n?=
 =?us-ascii?Q?450jfDxXGXr9JxOIsfvOaaS9dsMYQXewQeh1lrzonXJZlHsziBfBXxrBZ5fw?=
 =?us-ascii?Q?2Fc2H5hmdRxjO524OFEepThsns3Os+WE6z4WpkXuhgE9JmMhTZmnntBFYuDW?=
 =?us-ascii?Q?1V0npiB3DZdHeBQDc6rw+pMqNloEBo0GVc6EScB3A8hMcCqED0e0SETCWcdT?=
 =?us-ascii?Q?F7OozyxvXAbE0aXJTCKulwsxOJ0JlMB3YLXULrekHyzIG6vXeRVkvGHpteMT?=
 =?us-ascii?Q?7pUxGKe4ngYJ7Nr7HAL8YWktAZYCnVzkcNcu0t7qy2EnXFnNKjsGXVS/0j/U?=
 =?us-ascii?Q?t4dyLWQjG6TPieb2afUnKUa6+F5OoGoqA9Cjj7GTQH+ZrnKEC+e3ueXjItBt?=
 =?us-ascii?Q?xWbPQfHBZRDtu96y0WF7SXBf9l7viVKkkX5UUgawYHFd2KQKtEAyrefr75tG?=
 =?us-ascii?Q?W1zTwuBnDAbUnqWEWcVt28vS4Yytdh9eTTuxB/yusHWf2jwMoJoJEeQQjZqz?=
 =?us-ascii?Q?PYFXWsMA90cqMwElhMjsuMtzolOSrJkXlVoYSH8Dwsv6SXi5yFAcGLfTMc7e?=
 =?us-ascii?Q?ea2I7XcSzHYDc8ER44w4GRi96crHRiu7UvxWqNmjf4MDqPuRRcvQ/3zJaL9N?=
 =?us-ascii?Q?qs8fzrqD8oOLIAtlhgoQ0sQpHWylFsNq9E47mPhG1mXGfpH4XSfGcpRo9wl/?=
 =?us-ascii?Q?0ECn/Dr9f+iRRYcndu0J5uE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ao3QgCgqvMlGXvmDzsodPwf0mJQmmkG/triyk5T7p4jPExxQLh45pPc3auVxDkIBT3XVm+UvdzC6d92lNe9Jiibwc+Xqa6l9wpPYQioqlBj74q0QKX0qWXRX02m/IAOR8RfalgOGxuOHErs/ZO3D0EmNdXhx7NdGX4COdSDritsZAQnvLo8Qg45d6kWkxHJnxxy+/gSnUvuZq7ZRryVe4YhSrCsHG7uu7KYnPMpeZTu1Zqy4Yb6NhzxJc4Jm1/rX1gPfwcUVmJbXgokdWaKmSG+g9bLaGyupzJ5i7h+2pSIv4wzkf9xJXa3i/4JGDAllGXeyoFzfJ6OSFQETOb8QfjHUASs0SpSOWNJXneasRFvIr1eC4eFzBzgODgcloJnGXlz/hqVmW8cR8sV9NBfs0He3KaNysRX4OTtsuOnJLiOe+S48wYJFCMG9MYscLjKfH55YgZL4ZeKmSoZFozG9KRs1y6s8rB+RgUxV3kYDabJ+wychZxmeFvfvV5dr6c3Wu8VlqpDkXPXtr0IDq4FXR2EMFdaRwo0tGkZzkKZmEl8JIHTOuL7rMcNXtviLpaRaa2Bys1rsT/LxK7dqyFw0zDDmWIi4lKVmEIrC5/ITlzU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae82bf2-5a6f-4c11-de05-08dcc2d7040a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 18:19:52.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSMhwqr5rga2UId/bE5qm57p8c7Ap4vWcSN588LwG3nmw4BfXATjWfkYHgTecVs9SZOYQTHKTFB+AfG9Yw4N2iff+ETQyyd9/Dz3nbuTOV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220137
X-Proofpoint-GUID: fNL-lhFNyrEoq6aNrBDMvNttfBDnSGCz
X-Proofpoint-ORIG-GUID: fNL-lhFNyrEoq6aNrBDMvNttfBDnSGCz

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
    Changes since v3:
     - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y
---
 scripts/Makefile.modinst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..c38bf63a33be 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,12 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
+# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
 install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
+
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
-- 
2.45.2


