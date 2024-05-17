Return-Path: <linux-kbuild+bounces-1877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C18C806C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 124F6B21953
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC3EC127;
	Fri, 17 May 2024 04:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DdAceTl4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zcsu+jEm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B28387;
	Fri, 17 May 2024 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920236; cv=fail; b=NAulgZJZI8EDPoFhNj1ryuu3pCBRdUUdDqJmi5dn+9htxTkG6Nu0X5nKuxS9P+//VeCazQLwkfzzGEfUrTrCjCqrpc2TJR79NEDTPzyIJ/kd1WlB0YlDMhJt82bGXMPZL7Ok9CFzrRAzBQinwMujI03qj7AXf3tRnt/N6GFJXxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920236; c=relaxed/simple;
	bh=AJPLxIgTQN5MeH34haX3Bwm+ESrZC371/+OYntIkwrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3nCc+iOXa28PsMtZLTi0B1moF4PrNZN17DF+0hfwiYN/18rUrDIiM16zFevlNZEufnHQu3oBfH3YBumcUFh6Of9qEwso1J738y4GkbLRjKvTK0oejk5AqGX3bLSoLgGn5I1WVPIlrTXcU85yu5PWLvfOtwtfw6J0LUS1k3oRPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DdAceTl4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zcsu+jEm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4TcMq030559;
	Fri, 17 May 2024 04:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=yTfNWkHczGxqHgBXFduxFRIOW5/085LatbuwWZD6VyI=;
 b=DdAceTl4hnDaE0RPUk9C91IgjSJS/6D7NKn9RpYMjIY+ICxjDgEPZjsrfISKwo2UXGuG
 mX40dPHb7YKVpW7aHGW2uP+1Ssxz1or8ktmqP/QULiGlaenoRqp8H+mOs6jQPsXFm9vT
 ATO+APnmGI6RUtqxNSmsyJpTXCqpxd5u7PimaWgX7Ag3CJfVhVfoK7vErgJFWr88XHw5
 TrwDCqUZYmIwg6UsglZ/ooqiLgEWyUba+JY1rUis47J3U73WCSCPF+4GkkK8UyOrrVCE
 NF1nvN8mwGvLY36rVj33M2FPrM/hVBivZlFeuuExpYarX+RRwp3jENwNNIbZRYHj0GMb DQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3t4ry2vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:30:26 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H11bLr005992;
	Fri, 17 May 2024 04:30:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y4b3nf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMaLy+cUlPHk1UVMH0y7Wlr4a6GlImjh6GoFbXYzI0CbjqhcEo0uGdFy4hXXQZgbrydckwWX/yCwsvo5REFwteNSw1vkBN0lO55Y9pBGoFWZmf87HlI5YpAWBdCj6A9B9iHoKSHpyqlrI55aRvp9Jvwfo5I77Nqyc0lv2aQqpX+lu+s6CR+Yi+4hjRD1RwJeBOXAPvsjfDHNdDLRzh3qsjCILAKle12J5z4H75+cjf4yr6Pfm7V84H8P9owyAsua+KQsE8wbvFVckvbZoyqd5O4DzPEsZPqb/95TLZ779zybr+z9K4qpAJ7ceRj4H2BfH7ew6TtXh10j/R8Yl2Rc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTfNWkHczGxqHgBXFduxFRIOW5/085LatbuwWZD6VyI=;
 b=Wqr2XPC+fw5rRpSpv57JvjiISNqa00tgrbsC+zFaxSMlTdmSLRwHgtNmkffsrJoFBdsjOqOGTVKRo2+FY9j3XyP0wg9OT4+CT9PpzIQqh2j6rnMU2LvoBrvYByUOVqonK2PM6+UGNO8TuDDKi2jj1075nCBdhwliNGczd9SFrVGIiSoapFQzCfMAOLhRG1GUu7Z5RYV1shdm/Rpa5oIBHSy09IwhrFnWzBTURb5JolS5dBHWFj+lDfkEh5aMlhClQVq9WngkOOinFclwlLkhlTBJn4QESEadUxSqMK65Wak5jILFwdm0IPLAPhEdyALMbD428DJtZSRC8ZbRjkFjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTfNWkHczGxqHgBXFduxFRIOW5/085LatbuwWZD6VyI=;
 b=zcsu+jEm9ObOWH5/TZPbV4X36+y9AKDkKueYpAwm3Ywav3rfE1nNQNlLq8OsFrJbRKUiygJDvrS5+vmi7tD9r6seTBeMjWQh5WdPfHtfYl3XhUSe8MXn28L01NL7i/U12O2PbJQN+CW/iDUgPfZLk0hkdDLhLuKSHg+DLRQOWcE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:30:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:30:23 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 2/6] trace: add CONFIG_BUILTIN_MODULE_RANGES option
Date: Fri, 17 May 2024 00:28:35 -0400
Message-ID: <20240517042839.544650-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0050.prod.exchangelabs.com
 (2603:10b6:208:25::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbd9ec9-026f-4ec3-403e-08dc762a119c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lrDQuP8mXZFOk4Al60ART/Izdcd6RpqmP+q/LOQu7fNnKjdFsVQ7kw4gQSwm?=
 =?us-ascii?Q?XCLtHnDBfJFahgkEt50nh31vsqHH4JBWoqVyCgvC4/BRlckoPp8CFKkQhW+D?=
 =?us-ascii?Q?tuP9zMjVkuNvU9Rvt/B2v1KiWcGSk3diFdJKgKyXidjGBWirGdtSCwkijbkE?=
 =?us-ascii?Q?i6HUYmXZBn04rclPahrl1s/zDssWCrQIZBe7Ucrpeudz70o5YI7f+Y6MECGB?=
 =?us-ascii?Q?RHhatpYv/476mDHkbCziiqdWSSN8nJFk0j2xzK0La7kVVBRlPdwfa6/1bxq+?=
 =?us-ascii?Q?/GDaTO4Drk0bUHRN5c2uMsQXJVD5e/16pl76u0lfPZiaxbpVzXnqCA46zoSl?=
 =?us-ascii?Q?boOJ0m54eRFaGMfcsJMvvy4GeGSVkyemj+rZHCcPa8PLroxDyFhrzfRhmhZV?=
 =?us-ascii?Q?LQIt/ryZ5Ew5pxD/KvxSg/VPQHcV02KPbVOOTXDs/6c7CeV6P3iHwym0jBs4?=
 =?us-ascii?Q?N6RK0cU5arkDot2Br1o3W075qhTVr3OO9DcVm8JaEYrmyKpB/q0jIGeVR91t?=
 =?us-ascii?Q?QqXXGreJdGNwCr5G/HlwR7GnogSH4XrRooRKWcWmg0yUVYebdcjJhs6JIeqs?=
 =?us-ascii?Q?XaC7Db01vqfzjG85bo/nfYIklb6PvXH/7o6TfLVvIp4mTNqgHdBIhcM6beah?=
 =?us-ascii?Q?AIKyTfgsL2BKf6WPZQj53HBKV0+gvUGrQ2ypoA5YI+jpw+RWf4FBRieY2Id0?=
 =?us-ascii?Q?v/u6JhUpS7P2PINqwnmR5CfW8beLFIgwo3sNPsAUxWkbqnb1fyybn3KKNZ1c?=
 =?us-ascii?Q?hhTEb+i3EKUqd9GzKtghZNWoJ8BbCHzFywXVEkvIVSZehpSfWQyherwz+uu/?=
 =?us-ascii?Q?XyDHc+4KFxuwX1k8mLSQEMJ9k2hsPmqegFxwDd1BRCRf3sJ+Io+FqmUrib5F?=
 =?us-ascii?Q?cIhLP9ozHLs8Mp4rRZuiXPVUzVYVAJrpdyXaTSCxDcTvJ4woB9afVvLwQPsf?=
 =?us-ascii?Q?sFBd1r7sufJlUtTKrM9mU1+tzSB0lCcEEEPcSxulYvu6tt3E2M8OJN+aP6j2?=
 =?us-ascii?Q?x68IbiZo7R7uHNd1lTSCUO8/jnBrGFY/CtWB4tIaUbo+CF0QfTalbh/WJ+hR?=
 =?us-ascii?Q?y5QudDKmFpBi8LDs27JqCqY5CB25Uy4rKaohY4HrpCgGAGLmc37//PHpUGMF?=
 =?us-ascii?Q?cd7Z2T+AwiO3Pia/OIlNDxW+NvBaOuqm6IBg5k565nSKtRNg8dTQpfgzSeH+?=
 =?us-ascii?Q?zZCYmhPkau6iLCxuaQEYiyerft66gWNpu67wIJFWovt6xHM9h5X7NyFYyLok?=
 =?us-ascii?Q?e2FAgDamGvrVzK/oXNobsUFJApUA5oh5AAJ6ISShbQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kIr+dVCcJKa+kAMm2SCX6xCOKSYXKpCErLcK7cDsBYAdK76jPONkHELuONxr?=
 =?us-ascii?Q?jiMv9gqWHZkquPXQV1ucFphRx92Bcf09hYLv656py/ouiHV06onVRBATac1t?=
 =?us-ascii?Q?kMjzs4gjDrF8sJsKwzpbLT3AkLfup9b80aOao5E9gqbTq0+lH5EEXJrj304N?=
 =?us-ascii?Q?3WIMnHZUu/MSpu8BGxjI9iVD8neZmCGvcGAMOSKffVsKHaJ9FIK2esNT58rs?=
 =?us-ascii?Q?KjNCLYfMiKEzGRd71SQZ2pNkMAfvH4myu6IC8cMGzr+2i++PIbgeNHqwujbu?=
 =?us-ascii?Q?W3IDeNB3Xqb6N7gd1126shawy8CdeJc9z8yHT4pO4lQ66ddhqabWwzxZ2kvY?=
 =?us-ascii?Q?FwVJjaiyD7sA/DR6FiECye14lS41Jsl77xZYpwweVdW2UlcfhZ0zj96SPfLR?=
 =?us-ascii?Q?0B8rYGipY1AVwg16RQHnOet9iTUxrd+T278N1/7lLnkAwf9NDUtQVUpIXpCo?=
 =?us-ascii?Q?FVC9LuHHHmt83x8buMHgielNHdhCoiFntY3U3T8FjFxzm/VM2uz6dfUvNS6r?=
 =?us-ascii?Q?2Q7dHXQ0a1hBJkh5ASFvZbTEupXiMMh/grQP+Cnb5YF8kDbkMPCXGQhrFFjZ?=
 =?us-ascii?Q?dooMrRu+A/a7Mp+FrM4T3RlFYxet7Utp2TDAiEBNJ7gz7M8At3CPOByprcvm?=
 =?us-ascii?Q?NiZdvAFrCNNd+dJ7vjPVkScGsCM+lu8uJCdQZeIV5A9/Dtx/XWghVP2s7oUx?=
 =?us-ascii?Q?qVAv10+9ODlqbUdjP1PGlAUQ7kbyTTfi5k8U9zQ+bUtjWyTwY1kQ/MPnSpA1?=
 =?us-ascii?Q?p7u5IndMgt0utoD5fvBErdlleoKsxcLUhjOhAssDkLfXsVDJXRZwuKcy0+oY?=
 =?us-ascii?Q?ukJCTqWrzd0salhKziOrPUd9ZMkFPHzcaXYCYMdrOU330wxW+wU8qcPNUi2d?=
 =?us-ascii?Q?fNCHO6XtiTiiUFr0XntZyWwuFa7BR2iRRL6b4a3slQsfJMI2pA5Qp0wNNUXN?=
 =?us-ascii?Q?KrPGpRPb/eh3gT5UzVfhR+I7ab4ZaEYLMI5Gqv3MreD2e/3fiV244mekqGJC?=
 =?us-ascii?Q?8kmDCmw1qMH4rF2B17gVR78iXCdp/2yIpAZmbZqgBKM/WLkwIQILf4GICoEm?=
 =?us-ascii?Q?XV3Yr2uGsETJtjhXp0SmkAwUIUdah8oEc+Xs5YzjBfh+jum3I6HVjYmxmVZ8?=
 =?us-ascii?Q?EJK4cKrMc3rvKACnyqkI9TmgCGa5l6htIe2pLU3o8YRDoENfIhmqQ7mMpZBP?=
 =?us-ascii?Q?9Por/2K1J+3Cn0+k6gFXabALzVwNeTmafCp2Fnw5tF1BfPTyouGf+6m12XR7?=
 =?us-ascii?Q?+s1j46peMqT+dOfwqo+WjOoTa1u2LPVIVBObTE9khy/t7maWwqyUWp/TxWMX?=
 =?us-ascii?Q?3OoGbkvYBJDeJoGcZgAEZLIriS/vvRu2LYs1j+OX8GbbbbIrucgcy0+pZgDD?=
 =?us-ascii?Q?Hlg9ZcYZhSMsfNL/79/0bcv0Nb6wgduFJuOOIyv8N5cvlT+cgpW281ypaTQM?=
 =?us-ascii?Q?eLTI663rHrSrtPY99LmKk8+b9/sMkmqknLGfQFmxydUxBJ8eNvFR+4G123In?=
 =?us-ascii?Q?XOdgV0Qq61opeyWNvZ6Vl7FRJGYfv/mNIln0r8IFmNL8l5B3NtKaVsE/r5bQ?=
 =?us-ascii?Q?TxPbnDavZru+T1iYxABQlJ8Ony0bgZEbraxW5qOwr1KIWwoH0cnaJxibTKJz?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iUgkVDCpk7kohPaALGtQ26DLRIvxVc1xeQCp3tFrFslMUrr4rybsmIHjAaQeWQp4fMD0YQz/vNpODa35XCyVBGrN0in/6pfwJCIwsA3Op6fH/MdEDjtZzdUxXI5z8BaIHXpWFOvGXLUGSj1fXerLezFq3ysOlI5oBT0k3dlh1Uf2bHTvGlxn41fRZ1e1wdawiiLqCS4piQotIe0u4+l2LFqFtxDNqN1dTG5P8OzRKLZ7ni5+G4cOaS9PoAN78M2Ryu4XJc3dY8My84QDXtA7zywGsXiplnrUFDBWcJQXxM6pHbWmhHRZbhxYtNUgKoIY1TWtsryBmashj+lOQPPcGPDe/V5/WFKa5tHOZ5V0AfVyJmadej1MWqEM97ydtaeLMeCNteX5kEWYx/VO1CuoFc1vt3JPhC1oGmdZAibxsLKqsNC5tl6nbpXWQehjLm2QpJFv48jy9VzJrs/QUFZm6jnUS9t5o2iZdkKyfxDqiQMyPLeN4elI0EuJPzSiJGhPjTafqT+PsUwWn7VBPi9Qf6H2aWytL5B6zXtyH/+VeGUh85hn9wwFmELmjGxp5h3oDJLDCMwj1LCh5GAvz9Q8J7MaXxvJRTpLV5WCyp27rRg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbd9ec9-026f-4ec3-403e-08dc762a119c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:30:23.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAMy7swim3f583B/lokng5rFUfXewN6E/fYJEnztQXg7rZfVa0qWzwLijFezvcuEQvyLr9hQxE0hJfLc67ZwIr3RZ4FuKwE0UngbKT0mGZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170034
X-Proofpoint-GUID: HmUfaMK9M5JhP--qprZtob6iZDw3Pn0X
X-Proofpoint-ORIG-GUID: HmUfaMK9M5JhP--qprZtob6iZDw3Pn0X

The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
is generated for kernel modules that are built into the kernel image.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
Changes since v2:
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
---
 kernel/trace/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 47345bf1d4a9f..d0c82b4b3a61e 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -188,6 +188,24 @@ menuconfig FTRACE
 
 if FTRACE
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	depends on FTRACE
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


