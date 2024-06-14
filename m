Return-Path: <linux-kbuild+bounces-2128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B490913D
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 19:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207291C2029C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 17:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614FC1A01C2;
	Fri, 14 Jun 2024 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="om71gJYa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y8ukbbR5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0D197540;
	Fri, 14 Jun 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385434; cv=fail; b=fwWhtLpDm/q6PgEnW47EjRLB+iq46IKKVwh2SRqiytlXyAxRn0xRFHe5sctmQrC7CHQ+yCaubBDN/sSVLhiLNIXBqnCZp08xIVjb91iDWkeolL1OWFqvCT2Lx/hjFVIgy47nYgso999nA8txJUW/hfX5H/WOkWJyIWWE+HXa7FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385434; c=relaxed/simple;
	bh=QuS6WMnSSlL4Il3oYMHeHFThcVFKJSY0JzlJXykTIyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J3AUuEeKUpI09y1P9rG6GYSpYmpKUGzaDSeSlFQmAmz9iks7mlezWSeuQFIaY2PQs60qLqZmhwnSnyS12tmBaE+33VhH23eh9k7saUXQU7yBgL9CK2wyVIUcnnQqW//rlAkW/In67E3ks5XOuePGIIdI2NsooL8R6n1luBpNbls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=om71gJYa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y8ukbbR5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDGw24007171;
	Fri, 14 Jun 2024 17:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=AiRDg7YNI4oMlVkXR84xXsK2YP+xq0+cqswv/87H5ig=; b=
	om71gJYajzUauqWeMhABdxewLnSrl1VXyX+DDyo761rMpMqnlLawfB0Ze7BF5jv9
	K4Wl8swov5gBTlQ0P36IgwJ7nXGm2FEynNYtVoxO5RT6TTtMXMmhNw7y6nrc+a+A
	2B1S862pLcr8WFxBbUoRrgp8+IPIOfRwWWxrZsiouRtr3057/tASG3PYknDKco2e
	ciFZFIzQ/zgWXm9W8j2Os6SrWcDzBHT45KrMq3jDwD9Ug9a9CoFE35y1Xz5k2d86
	ed8ftpEaVHo+FzANDEuSWoH9znVYLY/ajHR9ojcsKKPVglg0MIuwpoEA8XL4C4Kn
	K7h67PttvRvmu+9IOZFLaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh19c3yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:17:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EG0WOW020600;
	Fri, 14 Jun 2024 17:17:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yncb06yvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cucvfSX+IwZVq0ybv8sq4CXml3KqaU80WuaWZOOY7SeMe0ImuM3UyW2HmJt7RKS+cj/LSf+Pcluqxsl4E5zfE044oZyrw2aM3yCL9MIaTJ9JVSDXn9fjrvsj2bX8pDFmARIe8No+bdWIZs5qAH4XsKuGJ5h6IJ81JaPXoK2/ED47SWJesnYvhO8hOPd9PsCyo4prm//ZifN23+myni+6WuAMDd/vtOVenYdmHw/2qOd3bdHEaYP2WMmnfnqgsYG/uEuk5C0RASr9ua33r1VurfdzX2rRZqTwnA9VkoMpnumKEibtTqM8nCHLLXrB1OqAAoBQVn98FYBb2Ri4R81HzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiRDg7YNI4oMlVkXR84xXsK2YP+xq0+cqswv/87H5ig=;
 b=hqMW40q1AEWnnU5x0XC/lSCXSkXztIDywqiXKtNyZk+EWggs9ci6dk/AbcazWS1eH4wW0GxF6E0j0A3AIP0MqiaBdUkXtrQ5VeQnr2zCC4w+bGwmAP3t2CHWibWuWKwtPvNIp5EMZRfYsMXe03UH+l0nwGACFAN2p68B1JifpCJOGMjoKvjm1rQhbNI6GVQnfDGyLFZ8uy83m7Ay9ZVHAiaMIpGYUF9vr2DH2OxMEKLmGnz7vXpsFbsKhqO+madkr4q7vJAcKpwzXIBUEBAZFNqtQGTmNODmullcfsW9/+ztP8QcvrSR1OZMCAApWHnIYgFDNNtbdU3hKCI1X1l/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiRDg7YNI4oMlVkXR84xXsK2YP+xq0+cqswv/87H5ig=;
 b=Y8ukbbR5orqjnttCaSTbCJCC8+lpQ68yaqwJlVWKDuVWK5vZmIQr52HLtKA2iBgD0E3yTIn0WVOhQx3P/J54xO/30zdlS5kzsrxh6gQ74Z8JzwNRb5b7mTto/d8ZJIqXYFVA4BI+vY9WXnue3MBIZg90eaKdAmRLmiGDryAXGd8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 17:17:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 17:17:01 +0000
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
Subject: [PATCH v4 3/3] module: add install target for modules.builtin.ranges
Date: Fri, 14 Jun 2024 13:14:28 -0400
Message-ID: <20240614171428.968174-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240614171428.968174-1-kris.van.hees@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c276b3e-1b91-4760-8956-08dc8c95ce1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DgYs6cJ/73+KLioDKE5XyvnSb9dajkEC4ELrcYaLlbgUCXF9ZzV5ALWeO29M?=
 =?us-ascii?Q?aeikYKUgTOmgf7axp/X1gFDx3YqTyS9xPwADyis5DZv5q0MxnqSi8ivcz9nw?=
 =?us-ascii?Q?eo9V3VOt/r1YV4unpODdNQaFqAjQmOmY/sZ6ZLw9V2ASVUZtN4S4WicvA/Za?=
 =?us-ascii?Q?stAzHAtOCZVajnHGf2lZd43hIBDgdiofO5T6BTnSUdyi47wiHxVC4pJbvTG9?=
 =?us-ascii?Q?Lbfz/wGWPgyUw13VP9E6pIHGnKoveTtJhC83zAMwsUt0pqD/NR6EfI7z4Rry?=
 =?us-ascii?Q?oHpbU+yUgLxUO0k7KSg6PFzVtE9vOScmIPjBjdNgEKU5TUgtvy2QG5ZB0JBE?=
 =?us-ascii?Q?6I48b88t6lZUB5ESqu/HZGF6xY1s8HR9sZnqWeGzxVSxpvxSspg8QECMUvPX?=
 =?us-ascii?Q?FCgT2T5vue75KmuMSSlsms/pb7hMZjyBhunxfAQQI4r1fJL0MIkxmj4P2AOK?=
 =?us-ascii?Q?gg6z0DQS4zAG8ezmFfDKFvk4tTy6uZeO9k1O8lHJwYdmj4BjcyNmqxMv8dLx?=
 =?us-ascii?Q?TtV10KVg2bi6Tb07hVqw66SrJN9d4O/t9VhHZ34ltuS42urXP5AzM57nc+vu?=
 =?us-ascii?Q?MMOCqnaQTxr0C5sIoqT3z9awtO7Tp0SPSXhLTVAAYSFxlNzLCKgURzsXdOEL?=
 =?us-ascii?Q?i2xtLi3WCf3kAaBSVOs9+S9h1JYo9yOwHYnoMHVEqxg+ILbZ9n5/lTu9PI8U?=
 =?us-ascii?Q?xQGQ2uiA1AD3ybFD4oc/keq3wmk2wXQm7rXHigK08uuC7bHLYkOFa8r9RWQE?=
 =?us-ascii?Q?ObGQGPtLac5MvAGkZi0xdNylFWO9Yk2ipFMNGkYDfzNxCJr5XFJ0kA4l+irY?=
 =?us-ascii?Q?7ymL2IXIrYe+rJFcL8y6jte/GL0UKd3xjnLQWqTiICI/2sAlmOh5Setr37WV?=
 =?us-ascii?Q?0rKiK486KAjbcvgVshAYVgWnglhYpZ7w3byK96Nuho+f9FP2Cc5N/k3tUPMQ?=
 =?us-ascii?Q?cONmT2rfq1WJTHWIQ/nIwzSdbl0KPkx1EYxUsBSdrSmme2Dfw6wjIrq0YcjA?=
 =?us-ascii?Q?EvSOsnBgfnVWkEj9ic9ExNWhRFlDvmuFOAJF4H1i2pz0YmZR5NaRla2Xvkkb?=
 =?us-ascii?Q?/6onhpsGRbSQOl+bajeZAiNf2yavfN/cUsNI1GYtcfbZg8bWH7kz3WKYTQ9Y?=
 =?us-ascii?Q?tIetGLsaf00g6hKQ5IsEMglgSVbGHOnf+YzXOpDHrO+ejEt3G7wbP6+drq3d?=
 =?us-ascii?Q?PvYE7nWkKCE4pz3Khwly5g5O+kmInFMIitQGmHDsvK9qBhQJ/ZowGjBeqdFx?=
 =?us-ascii?Q?N7HSJnJSA67Ci3Ko7t4/adL8gnVEUbKuAewjRn4K0EHAL++2EgrjnT+FdS8/?=
 =?us-ascii?Q?XyidP2KXaSDd9kGhX1ExnLGK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q3rVf7tXsNR/CdTWSn5UeNEhTXYT/c41H1EjFvi8XhpNpTBPi0m4WjcwTqiX?=
 =?us-ascii?Q?D08jRZZFUkhpmuYONRJvflBqijSlKR2UHwRo+r1navB5yeYs2/reutfblxQt?=
 =?us-ascii?Q?1AvA3oJsetmhfLUegxLhpaUI5Z4BFcLaRGqoK2MN3yl9MbwMX8CjalF0I6CX?=
 =?us-ascii?Q?XP7NPosfALwrNmOgQmU7JCfMse/CSzaE7laEEDaKLe9EemXHG3iJLnLYL69r?=
 =?us-ascii?Q?3+IJjsL6mhotTrfr1Q9HmIpZ/PAK9uQupuaxLEitT0Se4IbwXJhJrYntXrp6?=
 =?us-ascii?Q?bOuKshc2g5GuEpBvy8fZhZaDekd9OxBHhAVQ8Mbca9+N3NfVXE9+Cf35ddOQ?=
 =?us-ascii?Q?1PSb3j5+UIMMCgpafp6SRuZtZ0oUflC/N3NYYWa37j540vPCCl+ANqPHKjVx?=
 =?us-ascii?Q?eSG0oXiBO8hDYXfQJzv3SUfuXpPDuAU7xGL7I0kbePQAHE/4CTaVeRW3PkC8?=
 =?us-ascii?Q?f0TLdHMjT8Lv3W21hOoAvi1kG5bf4OZ3TCoaLLqgwt22GBum/sJNTcgFb+An?=
 =?us-ascii?Q?hAehJdE3pzEi9tRRvN4ek1uXXB5vvGPxBY+bBpyKcra7hStbjg0bIQlhLj5Q?=
 =?us-ascii?Q?DEODTt625u7wZ2uXGWtKM2KaWIJ1C38ek+gDQUPpYbAahmyGmVxOX1eZYiby?=
 =?us-ascii?Q?oOUXkJn4WT4goBdh5olbxQXalkqb5tRhFPDppjZmne/+sSRMEw8KavqZP3bO?=
 =?us-ascii?Q?z9ZRVu1PlWG6D/28VDONWF/cxFNkXPZQHhWp1mHTL+wuhMNsSdZmdV7iOjkM?=
 =?us-ascii?Q?ofNjfTmEytVEEVkMWvQkhucRYFUrWOM4iztcX1XeWXCMSNcOznEddAFvg6pU?=
 =?us-ascii?Q?exNcIFpY6MGrk9aZ00HVo5V2IqjaM0VyyXOve3MnhEEA9gsZIRLKZOVmLaK9?=
 =?us-ascii?Q?fAf51wMdVdq7AZn0e0sasg6MZielsNkrrtRibx6ky8Q40Jjl4fNsG1nLVjBC?=
 =?us-ascii?Q?NnK22qp9sT3WwWsspP5HmdEVOVWDHkrGRzA8pYIKAHhjmUyDumecw7NA476d?=
 =?us-ascii?Q?oXoKjYJMHEEe6xss/p0IkqEraOi4L1Wg9fsQBpBMd0b1elZWj/+/y4g3FAuH?=
 =?us-ascii?Q?dXoRFOt654da6PecrGrzOYGFQBuhvI6m8GBQ6bry06sE4Mb8c32jHGS6sLKv?=
 =?us-ascii?Q?3sUtg+zksQM8nhyHqkc+ffojJ6UrQLjAJnlUZJ6KEMF2ydsUhyHrRgwFWoS3?=
 =?us-ascii?Q?jAgZjG32HjlrQZ+tGOce/t923JfmRoZNSgL3WNo+w4mRlbw5Cnny1KwKHrBp?=
 =?us-ascii?Q?+HBl4KWNPpbdYfDuxQQlnYOabwJShzS8iG//KgVG5WbYkp3N0jJL/1sOzx06?=
 =?us-ascii?Q?/LVkyDtonw4MJehmwNK6XZM+Vy4txG5Y+ILBEr6+ZixDwpHrcHbocYDMjtfs?=
 =?us-ascii?Q?kqOF1M71SE2U18P/mmIigrh7vwd0M4lNpYaXd8t7Kp3MiwAdjm+nsKb9yNm4?=
 =?us-ascii?Q?801jwj8TRGlvyGnC7KsNfACI+bDs+nEhNbekGW7L/nBfOovHXTOLtrCsEznE?=
 =?us-ascii?Q?BW8woBe+T8Npw0TNklMPYK3oME59fMW7hisgMWSJ9fPXeUA+F6u2x5JZQmeZ?=
 =?us-ascii?Q?UQAcqOMCG+OaZKfim68tm+uA80t09X2ZI249cj6aRqYjVE64SkbjXJezKPEm?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+dDwP8ptQzkppY15NxVabOuDY3e42RhtXP4wmReaDtCQCZfyxTqF9bzRdqdhNa26nwCZaGniJuGXKEtkMOwfzz5M8L9HUumc9Qf84uwRn4qL21stiZxQQ0fyqh9CTQnhikp1IUe9VNZl/fNi4frZLNXmhCd6pJfrM9YlQRJvyJek2rXAsJKYzMd/lhu1XbVnPnQmO1spQRRc7gksWq15IHeqwbTxvbPuy/INKFwqKVVz6eW34+m+Leb8olEABJbmjb3F4lqXhupme/60FzSuzhmalZXRHgt8SMfNxgtvDXb8B78c6iZY8jThs3d0fDXhVHbrDUI6brfysoWtreumAsKS25Yy5LjxA4Y8ZxmogHeYtuAC2ZqvkCLBQGBzhKKwxlKXgXoC6gZ6fcEgk2YD9Q0+ogHbHbedIRbVeH/sGa+YHTjMnfY6iaV13/BCtsgSkzid98lMVRiM8tmu5gmfRAe6jL87+/nK05WZXTvt17Zxnbw0TiB1G38hNc8QO7ExIRgfaAwgJhAB8uFtn/fJ+QJrVcZOhsmP6icamFhRljE/n4JEWG1/NgjuJReTQqTiVtStOOvrinBIshYf5bkzOsoFkrYLMZXzOF6LSiwo9GA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c276b3e-1b91-4760-8956-08dc8c95ce1d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 17:17:01.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu9KFrUo5RgW0Igmp6lyWOffCzIUK+7aFM5oQ9o92/lhK4FDBAMg6QmfD7LXxwoSGDSOEQXlGQXihe12cdcEJPdruXli2KmKF9/JkAKoIww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140118
X-Proofpoint-GUID: l3YaTr6CDcep0jLCGi63rtYayDKUysdl
X-Proofpoint-ORIG-GUID: l3YaTr6CDcep0jLCGi63rtYayDKUysdl

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
2.45.1


