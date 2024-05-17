Return-Path: <linux-kbuild+bounces-1878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8868C806E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0481F217AC
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736A5387;
	Fri, 17 May 2024 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dz2FNP67";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S/bqWw9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A3210A09;
	Fri, 17 May 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920270; cv=fail; b=stQV7sVB7bhxfObjoBTCUd6So4J+HztF3FYG+pU3y6KOw3xFmPQDqgYBGhJpr7X5F2hO2khLBz+/48oYpnsmlv44ia+sA2ZYhVPja4w5xu3wQ5wjoHwTzY4AeCuxWvWGdQto8RuRKJYTfkW8rlt35Ja1hITNmP2UwIiIkvif+BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920270; c=relaxed/simple;
	bh=PF8KAMO12xORTEuVE3LCCb7LyEcfTXXyrOAlcdV+uQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hObr4KwllACAGK7Apdf/Vmp6ef2odjeQmSkcKABdI87IN3B3KfbliLa44hlf0gRlrfnqd6kuvkD7OlVE5+p98WblZF38Ns+tvZfNTH1UbuUM3Bo7ZqDOEZrCNDuGRdZkOyItDnH5OYee6tvwyVBBlXQoUPfQE6doGAtn7OFPIx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dz2FNP67; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S/bqWw9l; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4TCsN014422;
	Fri, 17 May 2024 04:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=ib3MDikKq3DvNAhkylOqy77h+bPn//m0TTLuq4bDFi8=;
 b=dz2FNP67fgdZWO+kk+LjxDtiqA071ekh5sSqSO/SxjppqXBdowNAMbyL/u5DqC/zRLV3
 DMQegNzpXrhsoHKfe5LMR5UQC8Y+UVXONQsRQZ37kQuL53Va4N/b3k9YgEglIc6MkOfr
 JHcg+RCcLyPJHPPg7IXsw3WIoMGP2EChZK7qIaNsPAMexJrZhxBK8YVQWnquo1jXeCXq
 ZApFR3X4DSkuGpi1+BQrrDBKMAsos1WDSE7JIaRfrmwBXMojq05oxmHkyoNdOb5ps3BV
 1FJyN+/Etuxg4HDgv+sb12bMNv2FWG00QYQEWqA9xCVJfEDM4rvJ2Jg0rdXQ1IAnLPlY kA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx38qrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:31:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4GYR6019138;
	Fri, 17 May 2024 04:31:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y3r88n9sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri/NBIk49izLQ2xNrxm1gIK3YGXeXAOWFXH6UvK/AMpVP0zJvAK3sR0qF02xjvGh7olR9ZyNIxUuvIwAtcM0l4/m/UqiI/mz46oyFTaiFbyDYGm5QcLxg2sKlUzTXIOXOZy6nfT20Yld3zON/fNq1qC7Xx3pJ9EkVPNYIFlCjsvXC5UktaARojOpUKx0DLOy/PvX5Y1hCV/pNK0FBoCDVhFN/1g7q4ECPQN7ugyN+wYj2Gj0zVrMEY0lISXjssZBw25vQHXazJqKsMYpIsEYPawW1av7qnuT/Rl/AwU5Ez/rvR3J3AL0HUmfO1XBF3hgij0/8oqG7Y322WaW8GRxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib3MDikKq3DvNAhkylOqy77h+bPn//m0TTLuq4bDFi8=;
 b=G151v8xwz/HTdfxudf2zjjS6D6hhlSR+AtstsQ2A7/Xxnx6SqX0bW32MK1qyfAY8LsRJSsxVg9XYb22ub8ivY5mQ4RDXBbMbsZFwwKuY2pxizRNDrni+y08xpFZeNhW2kmXjCmunFpGbuSlB0IPKU3lbnkLRXP+71yuWjPYPjC0HO9gormU9q7dmAxhtqJ8jy07S3dwlHYOHt2kWlRd+avdj7hh3zSLchkcB2MSMwLrBFabZs8yp/YwcSPc8XvOKyko77Sq3jUn+kB15CIsGjk3wntdNHqDO/oyV7lpVXqL82f6LTQPWxcXIPMIXB0iwtr/8nwrwXnWe7KHYwZYzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib3MDikKq3DvNAhkylOqy77h+bPn//m0TTLuq4bDFi8=;
 b=S/bqWw9lgqStmTDfgw66ssQDP2rEpPAb5I8cR4q6g6Yms8VSmOQnebfzm7ASebD2caPFFn6efROdpPp2C6yr/wilZZAN5AseHHzyR7GaPhDuRfiZcA6e+mwkPAB0gG1N+vW9WXWE2mqC9gx1MEbHKbKCS3J5Mb2aqw2TimxmOwc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:30:58 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:30:58 +0000
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
Subject: [PATCH v3 3/6] kbuild: generate a linker map for vmlinux.o
Date: Fri, 17 May 2024 00:28:36 -0400
Message-ID: <20240517042839.544650-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0034.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::47) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f78322-3578-43d5-dea8-08dc762a2631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YFG2fpGLSy/IkSONJJRh9zuU1MNMFMSrrfailDID+xXiM/fYYQvMuNexht9B?=
 =?us-ascii?Q?tHxYOQvWeXBen/7nqrp+VM/B//4CVdk+32by4afaRYsNjFzFdQDLJQP6/S2N?=
 =?us-ascii?Q?xCApcbU6+4XsZnaZ/RntqqO1kwSSEcxsn0jGy46T0xllCY7YqzREIeGogFmV?=
 =?us-ascii?Q?IcL3oAS/UVBpU1vSPHVsfvp7IpWPlRy/22fN4acMcT533/sm3URXahYFZ3L2?=
 =?us-ascii?Q?0BftB4HLQOWDnTXrBHD6qzS/LLjUQ3IaFFIWpQK6EzZhAqxbT9f4ygnJJ8Sp?=
 =?us-ascii?Q?/rNYOG9OUwqBwAX96U5gMHn8T+2vPFKCgpQwp7VwF6DLNU/pojg+cFqrzTMn?=
 =?us-ascii?Q?rzxWtgBj8QduRbaMlpsiNzuqbbLU83GDmKT7W6JICQ53VhuvYELgXomrRtQq?=
 =?us-ascii?Q?WB27NREpQg5mJFxl3NhCMTm9DH6zLkczXNFxcYf7mD2ku2idyhL3kCLgflNh?=
 =?us-ascii?Q?NXVqpih01ryJJjj7RHQklVAs/4y883q9WYxDR5FyZZm/jYGak/xn3jG7wfBI?=
 =?us-ascii?Q?2qbqqbF4uCJPf/QByAtC0dK4yvIWokDXMlI+l/P1EXVlgCEeXPmUnLkd8iUK?=
 =?us-ascii?Q?xagQm7F2ZvwiIqLxmYHWHSvAf9sonRvjvwQqNAb1kbOeF6riBxy9iGKzKHhE?=
 =?us-ascii?Q?qM7hNRACnZ25zA188a6VWju+UQ4IcBGI07d8kDdIlfVq4FBiJLZ3t+jABslH?=
 =?us-ascii?Q?ExCi3/6LA3CAoA6jJK+k7Yd3D5ShE7oo0s1FGPEhfnx8Vos7KPPOQkQMjigC?=
 =?us-ascii?Q?A+80q/jOoAEPxYHSjDnWVKL9ZV2pxo74WVmq3Mw3XqDufegz5az88MbLZ+M1?=
 =?us-ascii?Q?CaIlvjsflBc7b9RvwXF0khfTFIoKlD1FOnrKp2sDzaw7nwHbZfJMU44b2NJ3?=
 =?us-ascii?Q?ORMytRJCCvBzCCV8+aMb19xXiLcR68bHZ0d/ak1naxc/T/Q66p4OOL3N1WAt?=
 =?us-ascii?Q?9mhc6FBtqxJ4fSVCshr8/yayqghVxS+M2bBOppMumoNA4PJMkX2spTdRDxPQ?=
 =?us-ascii?Q?mDd0WC735Pwp4qk2UKPxQa4eu0uXhuphLrvwGEs2xMvZOxQwysML2BqhpP5I?=
 =?us-ascii?Q?C0XWNDyWFd4WUDvvI2Fp2msXI5NFKaF+Der+USrt9CHg9WYnZhCYuz7giud5?=
 =?us-ascii?Q?z4fPCYFnmogc/IlJ0cepYMBQNOCfqcnw6wJ7bNVlsiuJt81V1GgxPGsvaqcO?=
 =?us-ascii?Q?H4QF1S+5Mk6hBoFysHMW6cgU0EPYJqeuRjej4Wd1dnfZdkiCj4hUlCTZ3bFg?=
 =?us-ascii?Q?w4fh5CHv8RJbg8eygO0Oc+hnjdQQB8lY04Grikzcbg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GvRpr/0Rhdz08ysNZjteCEglfeIqY0vIlDG+mw+K0PPAKujgjVazGMOePU01?=
 =?us-ascii?Q?EppaKlGmT58KWcTgHLkq1wXfQKkH8lRgVcXMxlt12k8WgtxCPPjus89yjpgC?=
 =?us-ascii?Q?/jd7b1w/BUlBrnin0jspmofbWD+hqLCpKv95ehinscKglHFWIH3rtWNM4pHr?=
 =?us-ascii?Q?DEJ0Q9sNRCN9ZaYTQSx35VvskOXDEGejN6KF+h5OO3UKmk3PE2qmX8YZR5mi?=
 =?us-ascii?Q?9TAjnB7R8Vge01HbsLq34u5vhJSi8W8/bkiBSsfmgzvGO2od5a5dPAz9G6Dy?=
 =?us-ascii?Q?mXstELz7xMkwq5cRBCBtOPsx93IW5bFnuxAEG0E2plHcVbKxhI28g+h/kJA9?=
 =?us-ascii?Q?Q0wNcgyCDuqPSme/KYr5z5ByaTLPNI2LYoF/82n1Gdq16Aa6ID4Lwmbb+xu4?=
 =?us-ascii?Q?cZkOhW47ZkFgapYCj54pWS25+qyIZGmscumvuwqq8tRDPJxsIp0Df0Zpk3Bp?=
 =?us-ascii?Q?DpOtIpJhxnqiBUQXQC3vQQ28Whn1ac4n89Lb8rfz29QwIbZBOYiJY4aFBt4c?=
 =?us-ascii?Q?k5AVrqMt+favPN7F2u+u1sGtZQFitoZE2bSaM7vItqpN3seZLpYcGFDLhNlH?=
 =?us-ascii?Q?Wjo8LR2dbvdmb1snfv4cIuSXbmZEwPerLkv+vUbZpteRgA2XHof3NcYPZdwY?=
 =?us-ascii?Q?wvvfYpWDNGqJjbDoFfHKIJ3FLKOWcBUwPbMe+3VG3DlCsX3F+LuFXWxBa1zH?=
 =?us-ascii?Q?0KHKjiQ3PeRJwbmzX4UZhgPQtLw3qm/7nifuTXjMmt4HmZl0bPm2Agw7e1fG?=
 =?us-ascii?Q?rgkZSDQZnreNNeQeNzte4nMphQioLSWDhe+sy+2LpbNrECd3+QOtqxt9QgQx?=
 =?us-ascii?Q?sZGza0EdsL3o9jdU4/RdHgt8drukUcxztta+k/UK9byXET/GISUZPR7g+iuf?=
 =?us-ascii?Q?lfjzEu/FZ6L99foipFE9IEkHFfagjJzfjSeCud0QH6LGIaKTVRT3xKQohUZi?=
 =?us-ascii?Q?Ic8SB8sSUBn/TmhvlVN6fez+6osP53QwnbprQ8xMeM3BRuZc9r5GqDXCcvsB?=
 =?us-ascii?Q?+cLYsps+eOkgPaZfZ6xnQ4YsGIjiP21znE+F2OxoZQMT+udoqcCPxIffoMt0?=
 =?us-ascii?Q?q50Qyz5ANZ9v3RfqwPTs6iLPKA6qCA06kJZNS4PQQL7UWb020LUmaa9a7EGc?=
 =?us-ascii?Q?IUxMUCnk2qCjfAj0VZcJOFSkAExSFzgL67fuBGe7Ah5H8uMAN2lbaLrapde6?=
 =?us-ascii?Q?xDMLX6Gcnq1dTrmsDjjbWRkJS3fO78GW/1I5Iv3QgBwv5JkWk3jTgQx7aZcG?=
 =?us-ascii?Q?K6XiQhI3K9FqVopNNVRWrMC9a64GhuwwSYj7U+XuwKvF2CqLuw032kmmJ+MR?=
 =?us-ascii?Q?2hyYg1cDB52sA33OOwYccsmzXWaaqU2I8IqCghjq1MclsdzupgC8WzsQuc7T?=
 =?us-ascii?Q?iDDCgKGf840SLdiGPLyvqgZ1/wRYuWidYsb/sjh24MzouBOADdiO756GKWZ8?=
 =?us-ascii?Q?abVNAgHa/Oi9vzmI4ROwARk5T0mzE7G2u4xv5be9EKtDjGZK3VfVh3YvpPWm?=
 =?us-ascii?Q?J6QR9EeRkf3LEYJTfq9OXcrQsbx1O9lxOv2H4WV+PtM/l9OxVMeqnqfYiPSo?=
 =?us-ascii?Q?4K5krFbaeDTUu+PHHEP8TCujNabTP058c85cPM/oPNw7nZ9oauI+KnhFHfvW?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uSY3Rse68Clt8m91S72n7SivZUqF6hheH5EGUjuAAo068Nrr0KDJDyWrveXy22X8M1gDAFfQv7TkNzontF9PBybrFyx3ovb58VRXSmJVxk8+PMcYJwIJETKuy+Jk/zx5SftVVeMfbs0kt+loA1YokFqay9YPHyA3F97CN3qeDQuKAreNTfNJB7l6pU4L1YTUqA0AAn/RFhIgmqazvPWx5w9BmVzElrn7IQHCV4ItsRqM/pZUkhd1LVBvJpJ6Vu+XlBaOX5bIagTEYVX4mwRI+flkdUy27b8GCEa7QNGpjqKPSbsvIpEpCbs+1cNK1h5Wgc0sFin1zbLQsuBD+FvDRzg8Zy/H13ARs90TdcHH5IihZLUTZANDviZQ4Rp9Vj2TVhZDU0bo1m22MCCbQOwigPxPPigR2cAPS4wvGk5i9S6bxxuxHyicgi8yQZE3cqEmsYWWhVD2Xa7p8inLpjVoAcfZy97RlaVxTKMiOXrvGsplNgkD0OmB/9o4MfeczA3DwxlYImS3U/t4IXpldw4Lpo7uMXJbboqMfPPC5wnuxs6K2yXzQYZJh9a4zpjWPgx2zBCgFHcTy1NioJgTpiNpRGBt7PCOuNwU4foJ52JKHG8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f78322-3578-43d5-dea8-08dc762a2631
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:30:58.2683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZvydVS3onoWyhsdnMtH/GvpnmX4/RjXZLIV6549tS41z6yEL8/mu8Xwmy+GTx5h2FG0yOreFaR/N9ZDSJf5w6vAOqrhGONxcwh50QDSwFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170034
X-Proofpoint-GUID: 2_zLRI6okwyv6_Q1R-6TpbOPDgc6dKq9
X-Proofpoint-ORIG-GUID: 2_zLRI6okwyv6_Q1R-6TpbOPDgc6dKq9

When CONFIG_BUILTIN_MODULE_RANGES is set, a linker map for vmlinux.o needs
to be generated.  The generation of offset range data for builtin modules
depends on that linker map to know what offsets in an ELF section belong
to an object file for a particular builtin module.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 scripts/Makefile.vmlinux_o | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce68..252505505e0e3 100644
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
-- 
2.43.0


