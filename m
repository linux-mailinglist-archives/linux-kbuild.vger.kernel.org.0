Return-Path: <linux-kbuild+bounces-1826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77448C3483
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2041B1C21248
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B125405E6;
	Sat, 11 May 2024 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AKBUp4Hl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="af6IbFI+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4661740BF5;
	Sat, 11 May 2024 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467337; cv=fail; b=R8L5yApD4rMI8BmJgsGgnrdn0nyE6ZLdksQCwjoAhjYcMSwEzoLO7mGTCq7ShqCa3vQ9J80BVI34vwMR0cS6fg6q2ovQHi0H6UF85e1z4yu+iYmJtXSmhriHcfJFc+C6DYNEJr8yVnm4/ZFXIh0W8Nu94NVKpGxfJIatCeDzY9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467337; c=relaxed/simple;
	bh=dOYArRarqYueLAXqGvXK89lq/WZASxUg7A+hdrDbS2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TRTD9S4pZks+saNrX6dLlZdrYBwDZ97xcq8E9HxTA2PBfHJAQvMbO9CEp6suSmFvaS+BwxM+SFRcwjrM4+kGWvW3thHsTIqAc52rIXL9XcUdqU6+lDowa1qjpoIIPr8kD0dyHsk7Jjep7xnpLbRfUQOUnifXYWLKJ84jPQRMMbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AKBUp4Hl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=af6IbFI+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMf5Z3028700;
	Sat, 11 May 2024 22:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=biPwrc8xFkVMaWyEuzwqQ4cfiE/DQAdIJH0qVCZcelQ=;
 b=AKBUp4HlRCN6FdS7a4jPRNrHS/R8OrzelL4l5VncnZ7g+BuML5m6OU0BqwRT8VW7o7vt
 eRtbhv71gW6NTDT/xJHELA+cPUETwZd8V6MS+y0qYNGSkbM/o57B0tW6d0CGSVVAEtEa
 yKFuHtH04OKNBS0o7+40Otu+FUMgyy6XHLxyHG9iX2b7661fieRO1asw6FpzDXM/qIj5
 8uOKd96X/g1evVBGfcXPiUspRpsuAogK7ur9y7hT6mwG479RzVirVvccnPT1Yx+iFD39
 X6x67leEWF0VT2DipRFE1OQiCXFXtTToEUi9WD+OvBcTRAYPezZnwZZn7+EQdpV/WmXj fQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2hjeg03f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:41:21 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BGpU4v031282;
	Sat, 11 May 2024 22:41:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44heqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al+zJCWi7xhnztr10gzNpR7tWi4F/S2BhG83AGBRevpugi8qhChqFAbMty73TZpTLvCZjMo+p8wzcHZ8aQ3sNJ1xXKEBBSWwtBoDHXK25MgpTnBAimHgAbiqIZjw8bbcP/4c6xGEfkWCMpe1MmhjKX6utU5Hu2CTg8J9q00Z6YDXhoUFjr5f1OMiEMT7fo1P/c0ev5pcFKCoKyv5COcNchy/NzGwY4/dWrqm4/H0WZg+XTWLm3eeXVYgumy48gil/vZr6ftYrGK//OtJNV23jgPYu1T6X52/jdkLNrkAei7h1at6dnoN3mkWUgkOFR6wxqF5LgHbDZHNtX7pS/oUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biPwrc8xFkVMaWyEuzwqQ4cfiE/DQAdIJH0qVCZcelQ=;
 b=eiuInvWTwFCZBa9ugFT3R34HYKblnYPlPqTgpCsxVLHe003Hs4jh2EXYYze07muxu5QUAph8hWiphkyFIqZBje9ONWAyJAndiqj83gBvcnSzGjv1BQHYSxqU8T4fXwKrQK7CyMLRYfNE0mIvP1SxaAWs4ZAJ3dnuknHk89IuTMtQpUdL3s6I3y7XHCjL9EuQMgqqshlbs2h8bmUwrfjZuwxODr139tuniDz9a3+EeTKoPYr8abmfNCZOxqKJDfPTx4eZabXnhI7lMd1xBlI9Lxh4v+rzPjO2ZxeItMVaQ+IhDB2Jk9DGfoh3ZVZs/Vp48ZuD0kqrSHPO+q7AT/HOMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biPwrc8xFkVMaWyEuzwqQ4cfiE/DQAdIJH0qVCZcelQ=;
 b=af6IbFI+l8ylf8ANSSD3soS7eYflcHLed0bkA4hE66qJU/PxsGoV1RBN70SAXLPjnTnukcblexc6deUtTlyw7/wqRl8hdCBWOYxIPxijIA3IvvsQMXAvwMy1nv31lmqT8qFbqmNzhAkRF0d/25rJLiaA+3pyDZoHd3be0U0PyFM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:41:17 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:41:17 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 0/6] Generate address range data for built-in modules
Date: Sat, 11 May 2024 18:40:29 -0400
Message-ID: <20240511224035.27775-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:208:23c::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: db3b2e8e-630d-44aa-29f1-08dc720b78eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q31gGJKv7hTOMuufkHNSmSqNr1i5qwI5RL5ai0yRmx41F/JsJXJu+2BmnBhk?=
 =?us-ascii?Q?+z42SjQNFr7S2nam0XOxeLQbsgbTVUwO02B8SiYN4LoSI2vTGKw0BWWbTIFI?=
 =?us-ascii?Q?TDn4HpLe611H2ZNxTMff6UQN9e/a7nk1dG2bNQ5z4xNYvn1lseRzUnXYqWJa?=
 =?us-ascii?Q?Xpvp9u3JwMYKFJkzSScc1Ek9LenflQVXPI4/IiBXJrfYGvEhkFDaODMyFGso?=
 =?us-ascii?Q?XjudANWstoOzYZzpdyiALD+yNZygL6tRNesmtDT520PL45Jb0vtVxqucG8qk?=
 =?us-ascii?Q?YJfzzvQOvjlK+ZaB1Crm9dVB1g5b455pfyH4gUmnjyLDktms9/aevX7nvdWP?=
 =?us-ascii?Q?yBP9oT0mLwzf24DrCsd9a4DjhVsDzlN+U1Jp+vBhyv9//Ct+NKdRU9sqydce?=
 =?us-ascii?Q?DtXUg4vdkFD8S9Q0ZLmLMymaehzzaZkHNBgZgzBON12Q2VNpNAXeUTjAxMqS?=
 =?us-ascii?Q?sNeF5AkmNzHVPIgh3WpVAfAl2sbUbX+4IeVGeCCwAiWv/ph87flkvkbNgXeP?=
 =?us-ascii?Q?DYPb5EnyZIpqg7rwRvuzMQ80F2q1/cNvXvW7HwENL6K7tbryaVynTfa7lGZR?=
 =?us-ascii?Q?/hXEU+ZKJDAkfzhn9C4ZuPKpY4gfA9vzLDnAO5qRcZem+WBnDqCI/Czwu6/H?=
 =?us-ascii?Q?i9pxk3yCGTI1OeDyLvqbIqymfRpDOAzAPlE/X0jpOdACR54IflSz+YhQS9Ms?=
 =?us-ascii?Q?9wxzDGECcUcFz8QNItgwCjbwre6A7xdlYkwQEtAGIO0yUsBgrjwSdsWptQ8G?=
 =?us-ascii?Q?usnnryEvb2bv7Ci1wz4uJHUBzq2hhEfm9dU85F2nvOABe9JVzRF3KcB6e/pM?=
 =?us-ascii?Q?U6AjZhkVeYrAvsMmBxpYITbhig0XvnFbyTHvlzbtI9v865q0OkytV57LocQL?=
 =?us-ascii?Q?xBE1PcQGOufV3buNn84/KHeYmpkPXN3eBL+2/hZV/ZXxDP0wytm8eB3VOrWp?=
 =?us-ascii?Q?URPQEpGjY+wCQqa/uRffz1hY5iOyryU5ThzSo9FDq2AMthI1q6fjCYA2z10P?=
 =?us-ascii?Q?W3Dvr9CElgyUhG7HLqZkVFD/EDaz8ywd2d4kBF+ByfDz4hkQwacl0TwSkYax?=
 =?us-ascii?Q?R+Go+nqXhxAKG1oohyHdDHXSOKqlviW3LVOviLKNzROP/1sTZ3NXi8TjLsiA?=
 =?us-ascii?Q?ptNnmH/uo8Fz8C4yfRDNWP+6xfmGGVERU3vT77lOLH6HlXyjj8T6v+KwxGBI?=
 =?us-ascii?Q?43ZQLuIdiJrzevrPpVyZaLCy2j+wFemxaTixGLYc4Slh2+hegUOirJY+tO6T?=
 =?us-ascii?Q?38vfKGN7vvwBBAlx1SZfk3lmAWqKtuCkCiF2V69DmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oEE3HYbeDhTt7ZjUaWYqRl3wDCFWmaZUP99rLc+hLMDBwxm2NBlGPzHdjshD?=
 =?us-ascii?Q?Hc3+AVA6IiEqScdtBU0dLcxY6T9tgEkHmC8nw0fsI7HhrGVjry3GCexpazBP?=
 =?us-ascii?Q?VoUDbQLz14bErT9c9mWzJm1BOfNDfB4qKfJv2eO1aFxxm/GveWiubECubLzd?=
 =?us-ascii?Q?7eLiLQg9Pt6YvUzP5GynmCz2sZasMRRUeKdKQ0naOen6cV/UaLP9QMWzoMWA?=
 =?us-ascii?Q?NaTEHs7l/ZL3i73eLhf8m5sez4PIAROjaXxir8pD1hGs0S3NrKpIQFe/tYrO?=
 =?us-ascii?Q?SIVIMI/a1QULS2wRX904pb44Idxw8z88++/2cpRAZhriyxtATyaBW4N39N2c?=
 =?us-ascii?Q?D7T2Jd5ov2YUyPNVwfm7hisNGH6By+SgZg0F8V9qjJ1WU6FUikOcXC9RZSMs?=
 =?us-ascii?Q?P0DgjYnx/9lsBEb5uO1k3Q7rgXdl0pYRbUqZKaVP5imdK7om5ktAKN9H34eN?=
 =?us-ascii?Q?sqNnfJ/LSU/o4Veh1aVMQq7cHdrXB3+awnG4JG1l2VIdJdq32Br/8Gz6cafk?=
 =?us-ascii?Q?kERf76336YHVPPGeg83nMBaMxyISkhTZHjItzd7va27ekcgiT+w1h4SQ+/aL?=
 =?us-ascii?Q?c9l+S+Wiuh0LcajA4FhQQLx8HVygybWbaB2bhExMbVD5hHRSEoMB1NYEw7jg?=
 =?us-ascii?Q?4C51dbw0YUtdgIXuTp/0pK4w1mML8vDXjM3nDMJYrSQlFTQ5ry0Ocp8x7oV2?=
 =?us-ascii?Q?VlqLYJomXvK0pPvCEdLekwHVXpTSYhi1wv189IUAwz5Kk//vGeeny/Qjd3GF?=
 =?us-ascii?Q?MjbiUwbpDu0objQqaGdT/HJJAH/DEXXYd8ouxh7d3Znr+7DR3WG29ATSibb5?=
 =?us-ascii?Q?NN+0Q+apkw0YgtUIphGpE3CP14vzrumKJMhmK5YE6xm6pDKHx6lgU9XrijOR?=
 =?us-ascii?Q?yihHjOk6/6EJMN5iOGNXucxbCyIugskH6IGH0UA1DPSIztPfjTKmk+4lQSD3?=
 =?us-ascii?Q?dXVqxiVfbxxahTOns6EXqLh7SYwhpRcjFwFWku9v6i2FDNMjds51G+zjRnRf?=
 =?us-ascii?Q?J3fE9PMlnnKjbb9T0I5xjDL5WsPYXTO0ZqbZcSSpg5oJFxJJwNKZoxx78rJO?=
 =?us-ascii?Q?IQC6UEGdfDdD7d2PhMvUnDwx5oorV8NKkx2Iw7IrnbYdiSYQ26XHOszQRFwu?=
 =?us-ascii?Q?G8YLRsr0BAcqR4YwsmNr69Qh2J3TTOCKqHzBSU6a3JsO4xPpuHBaL7ADXws/?=
 =?us-ascii?Q?1RaN4lkGnrFGsyQG6JBc2UGdtoHb1/JR1BZ67i8Jviy9tGnskczxl7t/U7dR?=
 =?us-ascii?Q?InLWBlJ5FH5vRWbX5mKDtFJWMe98kuD2C7GzMcUQQ6kEQN3tbmir6u8ryd72?=
 =?us-ascii?Q?ykZLaUrD3dB0GghWMI6T2WwhBp85ZntDMMaXjQq9f7Cu7ykB9GzXwhmFDvcG?=
 =?us-ascii?Q?q6ZbjZvz8Kt94hyKu+5v3/bF+aU0R2CJbD3tLjUUZTmgQoRENuh0jeLhb+rO?=
 =?us-ascii?Q?cp3CcxRymRn1jc7i1I+LfVvwhsE/21kXt1m8cAzlUuEj+Qdf8lZ1oL6MbYuZ?=
 =?us-ascii?Q?5/ZnAlPMU4V5EmczXX9HgExp33JbS98VjaLrPvgz7RcoYqiKMQ3C6rMqpxrN?=
 =?us-ascii?Q?OhA0rOUZNLETWBpkR/IlJJV19g9N/j4PauVfsisBrd2EFx0rJ521zEZhEgr2?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XEMO6zTZPX5ZodirH87HquMhC2/ANb2weGPldOdSA3GHv048lK1iH7qmoJoOjn36nUFNch1Fj4Sm5OdpnVSlIOw9wup2apnbtHfrCt3VQCp2RS3hqow/MVVD+000DNxiNoh7RPKs6lkcr+EAHYtxDoonYX1+qmF3Dq0OPWMoKmq4H8qHjgGoyVbBKKsPpXaaVhJ/l8UtFaKMeZropti3DVHSsL4RzUcXr3q93e53s8MvfCCHlompqeZEwUeFfVLqELIXQyLKz50muL+BsGDXxp71LUB8IY9LN8HSUjey9cG7wCcCHwrtg/O3B+jei+idkR101qXEfnwWPuw0eeCuoqdNSViQ58lzY67YCcQ2lzfZ5dtPA5R4W90gaMB1hVIq8fx+RoB7h4uxMvnMd3wgKMVXmiNE8zeuien5H7X5Cbywn4hrhPLaf779XyTzrtCbEDWZowLIIZP+wjeg2yEHHnjxRkB9bCyE+RqnlF/AAV6YVPosk5F2uqXpgzI9EWp0HGWet/azRgwuZZRNeE+9JflZ+4Z6uH6SznQtHvupTWxfTpaqHHXZ8Ga7YLplvwNL/7U7c8hNgVyRJhDp4YQZPSFSQZJHNw4rCPVBMHBmDxM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3b2e8e-630d-44aa-29f1-08dc720b78eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:41:17.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +X1T1OfzIziAltqFLtSHGqOsma5D+fRCjzr3YgzCllLpsYefxs463l/rH74hY5FIAHpxpxHtUDze22msvrtB200PbbH2gTnfPjVh54YQaQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405110171
X-Proofpoint-GUID: 77_nOWvCApU5DkrqUM0Wi-5lurJTH5Bm
X-Proofpoint-ORIG-GUID: 77_nOWvCApU5DkrqUM0Wi-5lurJTH5Bm

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

This patch series is baaed on Luis Chamberlain's patch to generate
modules.builtin.objs, associating built-in modules with their object
files.  Using this data, vmlinux.o.map and vmlinux.map can be parsed in
a single pass to generate a modules.buitin.ranges file with offset range
information (relative to the base address of the associated section) for
built-in modules.  The file gets installed along with the other
modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB.

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.42.0


