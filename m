Return-Path: <linux-kbuild+bounces-1828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F278C348A
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D7B21537
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CFB4D9EF;
	Sat, 11 May 2024 22:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wdjn+eOL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XhzDRXaE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDE1E515;
	Sat, 11 May 2024 22:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467361; cv=fail; b=D5ouWmTg3JBE1Sh64VX8N+S6MrNsM3wkEAjo8E8/ZsfISvygrYOw6j0KzAECbYNfHM6FpHexipXxR6x2D+QP3aO19/Opmopf7KxWh1bFw3syFwqmaMICmKK5hNtKwSQgHCh9Glk2w1Vhfuuo4eKb8s9zQNVDHS2FR1dnet5xSew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467361; c=relaxed/simple;
	bh=eqBwIYqJUXENU8wTRHwbVRahwLv/XKgYUQGYdb4HQo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bhrXehqQV6f+eeRLJdyQtRLAVgHa29GjUtZWNqlag5DxPYfGZNbQC+fSnmUFGn/Vbf28EF1M9itjH6L1ns62gtEB/HksrUh3CtdZB1KDUcrAeTMrrXAvqDODEXrM3DQHrUXAwv7V2pN41H477gmHpcEpFJbIfECtg6M2xLL2nuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wdjn+eOL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XhzDRXaE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMJAk6029217;
	Sat, 11 May 2024 22:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=uFZaErPgcp+DbdJU7ug4c8Job03DkjNOMFwF8gz4aLA=;
 b=Wdjn+eOL3m9Xl1fpkYanc9xtb0l8rUiHB0vPkEUx4ZsiO0KQlySMxp+ltz4JpGhDAB3B
 siMz1+jMftYRGUCQ5QQV6N8LA4F8JWAZkDu2EScAQKAJQOOt42ZMlc20wYpGPaMNM7NX
 mtVwO6Ib2/oMlTkLQMmZ0FCGGexD6hxjS6v4YAQOjhCHek9iSsZkmrUjAKLA5FIjqe+v
 af0wi+/RwTRqQByCY8GT8l4dkNd05E0fsf2ZFCcxZiVg1hgZ5IIEctvnmZg9R1a8BWgg
 iQqEoksqB7ZaqGyPijXQvbabj5tpgckRwMg6ZwiFXQVaxXjj/MAsCMBvbala3dj7cLxD pQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y20qd0p5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:42:33 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BH3uDo029550;
	Sat, 11 May 2024 22:42:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44hfy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqG7iUVMvS03svn8tBiEXyeb6HZnwaLUpfC41vxVQwLzcm7fMq6G2WbhVopYtWC5GNk11E3Jb+suJJ0xLfl9NQG4FcYN0M5ObSqG+MhE1VeYl0doFsdHEX9/Fdcp4P8aUWAV4jkCbSRxTx5HDWPBp7gzpoLinwcy7TAGFJJU3QIxmO9802K2aCeWy9yUEW2V+ketO1O4m7BZSvCQgjynWUPtGsJJl/cL5pAARu0zSx/Fo41M4YJx/rz2/DRetyzF8rpfOU7uSlqYk7d+rBn2r08QGtWZGMxERNu9x1Lw33cgC+GyNyBYdmCatTaCzH4NSUpr/wh+T6zCFO1DSjTsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFZaErPgcp+DbdJU7ug4c8Job03DkjNOMFwF8gz4aLA=;
 b=nQY3sDP6olfSGcUw8uGpVVG22bcD4tM8B/3axsVI8OcSsn5ZSSXxDKg6kCAfCAjwZrROeJmCj2L+s/RArcuBkuV4fwh7v4gPaxTFlYcM2HDeikeS2vTIu3ceGGHyNkX4J723ceev79RvD5l0Vi3bCQCV/rM+E5/ObjljsRc/qVdp4wcspJn5VFDsnpsxONqAkdUK2z+Fv19KSaGo1gjCvR2k7jdpwkUu8tZaUXymtpuZUZQ/E3jrE/MYfpd7lWDqX45cvL3ulmv0kd54wPWNXbhNZ0uuh4oT9YmqaqWqN1Qjxs0vlgMDNDLM/wSC5qHvULsdAe+z5a4yLta5ULNJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFZaErPgcp+DbdJU7ug4c8Job03DkjNOMFwF8gz4aLA=;
 b=XhzDRXaEs16rzRqq8SmBLnN1FcY27ij6Egdor3kix4Ykw9fkK8S5v+/HdJ+rdjokYNuEr4xUP3k3EBzTXSyPS/zI5TkqPXyvbx4T30bgDUw3j6I6EMOx0qHRCB2iMUz8zViIud6PUKhGcmM0BVtC0gT0DDjaepwaRSKW9lHZNfU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:42:30 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:42:29 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 2/6] trace: add CONFIG_BUILTIN_MODULE_RANGES option
Date: Sat, 11 May 2024 18:40:31 -0400
Message-ID: <20240511224035.27775-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:208:32a::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d394da-f3fa-4554-57fc-08dc720ba38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lq5j4z2bq9fTte1YLxlDdBeu8JKXaJhDQ+wqCkmbLsBpMlX5mbix1tPkWgZQ?=
 =?us-ascii?Q?J4ewkehbAFN9shkTLHU9QIxllG4GqIW5xTELs5CjCfoTzD6p5KfrNyCYnyRe?=
 =?us-ascii?Q?KSQ2MVNr6cgkNjVDMPwQrX6AM1r4OKFa2TBghAjjrENo23eLo3I99ppaVkTb?=
 =?us-ascii?Q?PpsG0wfIwr3m5o5dzVENyMTXIBNTW+cLPRWz/rHKUMDVKmfN4wbN6Ww8xvrw?=
 =?us-ascii?Q?DRqLuwrRDNi/Io6wk1b6WjE0HXXF0l43lKoBaRUdcHuZIDrIoXhRQHHE64AA?=
 =?us-ascii?Q?CZEWPGFs7EniUzrsMwxfN5gnLGmjzzZW6GxwSTQHGA+m5ep2aPg2Gtbg07XH?=
 =?us-ascii?Q?IertF3WZFTuNhCdI9Vr8t2nNgy37B66E7V3feecqwi6mLDBVMp+mQ/2zyDhG?=
 =?us-ascii?Q?tanJmiv81xKfWZAOIWHXKjySQV4TcmFcRSO0NgFHZVzdFgl9RhNjZxnTr5z2?=
 =?us-ascii?Q?skuYVqcpjk7Fm4jBOaG++25NsIovff6RCk8MU5b6I0U5F7AAPB9ycK0T72XF?=
 =?us-ascii?Q?YmadF85Q4pAJ/BPo8xHn8I3JuovykdyiV7CqzJvdyDDOEWoXX4/BILgqilE5?=
 =?us-ascii?Q?n3P4Z37MwVw7FsPGYrkQl4gotmnJogBW4pTyWf9/qJLce+i5Uyh8SbTpQ5wz?=
 =?us-ascii?Q?B7GYcqurRfzZvxUMZkNQSBe5DI0lqzYiqg3ZX5E8+ZJQKR2OWkH9jn34dlts?=
 =?us-ascii?Q?O194TrjXMtSrEMbMs4OuL2axMLPUcirVSSagsEizjmrBg8BiDIiJA6En0Ut2?=
 =?us-ascii?Q?LN6YKBC/P7mos3HawWWMf/Fhw0aNfek5yc9vFjON/EWIbyiKDp24vx5if8xk?=
 =?us-ascii?Q?rUVELpte+61wRcHpayOKd2sqedu4qK51md7OTrg0g1PnG3pP9mN7L+90U+Ue?=
 =?us-ascii?Q?Dp7qz0S9l6WxyToSzx/SF6xhEotX3hUn/NtRHPx/pGB0ngY4nvAIPwD6cWz0?=
 =?us-ascii?Q?wbbvWg7itg5dv/4CdYPI5zY3WFDEU9Gb4NDbyZ4We0H42YtiGoLggtyTpxHW?=
 =?us-ascii?Q?CsgMqLI7o1pkusCVm+eisJRvcmdbhCk3wGBeTrqQrmt3TglLUnOqnEeOln/0?=
 =?us-ascii?Q?rqkrAOzTWvVNngoqBG7GY4l3p9WILZF7PQ8plvN2zNvoRQnkvS0WymDhN2UA?=
 =?us-ascii?Q?yC4JbxK8gQgOxrNWndg8wVFYrYyfTLakC3pK/VxxtH8KZMrNIR+9GboUIFPu?=
 =?us-ascii?Q?hCz7fttSmNDYYacNWB8TLXnQ+PUAHgJg6sfBdBBD0A1mqcBEuLVG9fzaOp/0?=
 =?us-ascii?Q?StlMhyFrNK7cYm2+gKsn0/NJ4bx7MFgc9GR1xDUtHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bhuMvpzeyi/e+pFCr4IdMGsYXpvhVdjpXX2Tu+c9jnUfuGjWhdoUeVqxxeEq?=
 =?us-ascii?Q?013KyqRQxThlK5NPs7caw3iUG9IprXZ0CVtifXZoVEKh8xbxJZ3llicX3aiZ?=
 =?us-ascii?Q?//9WYvAV6YRAxoaWmFFLXy/yCWYpLiljFVQnCCPnplc4N0qHcs8OJjyNBXX3?=
 =?us-ascii?Q?3nRxO9IETjYTN7pVj5N95Ki0F50gTnVEzISU0JZR7yVYVLBVR4+H40Dqz5b7?=
 =?us-ascii?Q?opaJ70Kpj5YT4HB/Klc41qSB2W8jPxLAl34w27v2bz5OrqLhBCb3hlXK3vEG?=
 =?us-ascii?Q?J13Qek1MbFpiZMUCH2ckGAxnONzFOtVnvbERF+78fgFBp16LlXNagiIiW1Xy?=
 =?us-ascii?Q?QKNeFFnHQgweQH90adYzAsD74VJIQ3jnOutND3AAn+sCnG/MaAR9MyVMbpXo?=
 =?us-ascii?Q?K5iiX+r6kRt0b4tKrVByPmzBMsD1DIYnUAWxIwNAWUiB/2LK0CZZLgFwzNW7?=
 =?us-ascii?Q?+nTN7tTeI11WW30ABHckT8TPkWptxSA+tezZCfVsSqF7xy7LOp0ATiqLzgHD?=
 =?us-ascii?Q?TwZ8/OyXqlnIvdxsP+Kp4bMs2qwDk129TGHnX44VOGWXc8poPPm5xNjOAA5q?=
 =?us-ascii?Q?T+zAuq/IzLf31RFT8r1H2fX+fpGRN3D2XonfieqvpCB7MqadnmHchTQuHMfE?=
 =?us-ascii?Q?0BU3XsX/Ho/hAqub9mBeqhd+/rXmaFLn154hXPPrr/3/MQhfhEkFl4YxETY3?=
 =?us-ascii?Q?KXzjYkBFPiDYVDi4WIAiT4Eov4OtHZ0xCyre9g6UzVkHww4g5gwangya5kIv?=
 =?us-ascii?Q?H8wzC5I4YJmRMwJjjUEHpvB1exUs9FBofpq1ruAW6jF2rginuEyURTklURds?=
 =?us-ascii?Q?zfb5M3ZGcGTArujp4VmS0nxvKadMy28pDA2XeVVSE9Ll1c6xsw7aVYCSYUX9?=
 =?us-ascii?Q?GJoj9sOwGaRpvOmLoLVqI5/oLSZ3gVFctYdgEXW8OzxI2K9wU6q87g1dG7/k?=
 =?us-ascii?Q?9cOB2EiXbtquxsWxctZELTnIt4Qm2BcKvbyhyBAH8Jv9ixjQ099CnlAR/TzJ?=
 =?us-ascii?Q?gHwCTrpyUoQidyBm5zzjVfC1i6n9LxLnrD3dspnxsS3WkywcnD4KQlM+KgeO?=
 =?us-ascii?Q?gRWUc9hbzbXMOKEbeNIWaJEIrXmX7tx8MR+/akW8LNio+CEFabG01KKuFr2a?=
 =?us-ascii?Q?96HNTxT7AeioaHGFs57SYF35DNEKBcJ2jOUMDdDGIeqKTvEJYN+FdyDKEbnT?=
 =?us-ascii?Q?vV85wsJaYD9h9NCjumHFKMfxMR9V6OlJwIlGseOdlaGtTefOHneXlM2Q0Cb2?=
 =?us-ascii?Q?XGeGBPLCKhgjetLeAtt8rvRibDzus4B+qblJn0Trz/QuoUDQo7NZnZRgI4id?=
 =?us-ascii?Q?ryZvf69GUaEiNsMzw20qK8ELOGROb89QT/wZix8ZntRGyZ11RMFVtBOUAgNL?=
 =?us-ascii?Q?wRBHrD+zr2HuSecdGsLfbr/zMApfTJhIpZraSg31mHte/fd8zGktFco0AFo+?=
 =?us-ascii?Q?6mOx26D3GTje1N+U3YWuMGQm4SEJza4zp8cUDKoUN1rb0Et6ckA12mtOBzZK?=
 =?us-ascii?Q?gxazlj6mO3xxTmqr5BQDQA/ET0DG1xM1luYQiEWO4nHuTPOifBN7LXEVJ65K?=
 =?us-ascii?Q?DLB0f4fe+MOSvp4BmiFsTcnXyBZ7hIUQ7209lK1PbsMEJeD9HJkPxbUtOFiG?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/81NdOgZUoLc083KZoZU35YWaebDXCWosimZIRP3eCwu1lLKFNlk1D8+4cjwimwqBjf7axIsJqb6YDScBDToejFbVZvvdzlzOfrwUSnHnHf/1sK5CyucGmbzfkYQOQ9L2TQHnoOnWw5gjjHdyRjAkVulqyXVwMV+i5RWJlr/l4N8n55ZYwo8gqWZyT6pzKXq4bWdHR/ddQ4RXxRbgJREHiNLAt5YKBYfk15YywPn7/vUCmFgN26Z1hlLYtqyIseEZSL3o+U5gCxbqpBbfNIIw//D7X+Bcg3HIdBhfD7U5vfZaFQO4Q4H8gz/u0NjR9OXNHDhRWkUc3F0bXnQ8FjzFfu9+zH0M5lsQ5ga0BEM82aAJ1nPNIGXc8IHGLj/8in+MEUF2vTVLk0I6RJpVTC1OM5Uccyx0y1I4YQsLNV4h6rwxob6GHiKQMC89yHuQCLrBo8JzJ2P8WcDVRPm/MrFSpWUKzBtvi1/CSxf6GLKq4HgpPQkPShRvW5BDX0tmHbVI/8DTR/0jcOBeXDwW/kYmVrv3wbzB/pM52WAiT6pGzZjLjUlZ33+y5sZ/v0KFGK0mgsYDTOoHOYGFT9B8BumfIvIaFD8+C79s35ZODXkq/c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d394da-f3fa-4554-57fc-08dc720ba38c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:42:29.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AhAvQLA5lRreL5QA2PJOomDX5hjJyriQbcMfvYdGL1uJvmqtYvFRfP95/T+UHfIgro8mdNkKPM7YRGPGgOm8d+ZbVgk3AV0MP17V4GaB2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405110171
X-Proofpoint-GUID: aNU--I9ghyjQYWSvjxwp7JzPJzc1G45A
X-Proofpoint-ORIG-GUID: aNU--I9ghyjQYWSvjxwp7JzPJzc1G45A

The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
is generated for kernel modules that are built into the kernel image.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
---
 kernel/trace/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 47345bf1d4a9f..839a56e971cc0 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -188,6 +188,23 @@ menuconfig FTRACE
 
 if FTRACE
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	select VMLINUX_MAP
+	help
+	  When modules are built into the kernel, there will be no module name
+	  associated with its symbols in /proc/kallsyms.  Tracers may want to
+	  identify symbols by module name and symbol name regardless of whether
+	  the module is configured as loadable or not.
+
+	  This option generates modules.builtin.ranges in the build tree with
+	  offset ranges (per ELF section) for the module(s) they belong to.
+	  It also records an anchor symbol to determine the load address of the
+	  section.
+
+	  It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
+	  address-modification options.
+
 config BOOTTIME_TRACING
 	bool "Boot-time Tracing support"
 	depends on TRACING
-- 
2.43.0


