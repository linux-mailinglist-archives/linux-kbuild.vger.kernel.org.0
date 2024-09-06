Return-Path: <linux-kbuild+bounces-3432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3096F734
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5436A1C21ABA
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260D41CF2A4;
	Fri,  6 Sep 2024 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GHjU9oWS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qEDErtN8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206B1CC8B7;
	Fri,  6 Sep 2024 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633928; cv=fail; b=qQ+ux8+Fqe8KBU3Htmtu/mCmH/lnh2qwOsgWyMJI3CdbErO/zc2dd9pA2EhaE9HvJX/jaarsgDEe1wfaSCHmPBfuMNIQjr1MLqFhKHvmgOzKhvCINiSoGWf8wS/vJxD5T3UKVNfdOs102pGbmRmxr0OumaFSngE+ZmhA7l6OEr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633928; c=relaxed/simple;
	bh=fzp3yipErKLyNtS5ULnYl9tgoeHeDLSBQeP8HTdsGCs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kTtMPHABAGpHMlDL0O40aeNcSED7Px0mlSVMFk3FX9ds2zI5wx+OPHC4y87ey4hznxGXEn2EdEkOWWAwTs1SGLzQ9DxoLvPneRpIuh+4fJdnUGPBK4DYzrg7/5ghedadU0p4/6s9jSTDRBIUbeQsCAVQJwn7Nae24LN/lPsROh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GHjU9oWS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qEDErtN8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486DP0Xo029127;
	Fri, 6 Sep 2024 14:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=hNYylSuhYj5p29
	N9pTO3RhS1fuxyUpvyC2iLqCVwreA=; b=GHjU9oWSDryPjsyc1UmnpuslU5rBWm
	fktLYZ3UnFTGWILQvr5NrXJTWNPQgNigpd/iTDi4Y/BPrCnuz1FKaI2zyrctgBk4
	DWvYtF5B60bYP7WbU4Hf1T+FF216HoMobJnNNTwGLgUM4VN9AI82aFb48tUiFmkR
	xRbSBtggN/VCkZ3eAzw7vnMmKA+LF/zpf/0tAzTT08+YF7teRcguL2rpY+U1tExD
	wM2FCHmUa8nV+YRxFoBUqo5D5IxeKnaz5SE6Ff0CQqfZo/5n8rzMPJHx3ZozAwLV
	47udnFN5xhfqMvYTrHBSPKz3omjyoZg+YxMnCy38V8OM8o910nyeVO2A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwk9t3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486EEueq036950;
	Fri, 6 Sep 2024 14:45:19 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyg194x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bb1aDtjijr+JABf2FfZtaDDIEVD4DK0+dq8ZHQ/BMShJEBDCxc+y4YmNUZBxSfA5TW7zSWqhE3u4SuY5qDJYQ7pB0dBF/j6ixp+piWbdEb9SH/H46QYYY1J6Re5xbvx/aDzyXFOeF2/Sl2W2fvLWnybfEaxCMkMsiZNmI8NzHupZymrt5ClGW/YfO9rZbG2D2AaDNIf0TkWyvih73109MBTbjM6XkNW0R0nMopw3k/1i7PVlawY8uqTUO+5wCAbqIVnsK+dh78WgKgx6KFugdM8i8aJ2wCcnqz5guigHpjz4aM8n09Dy0RJ8yWsjPGfJKqkfA1m3jJmXv+QX08g2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNYylSuhYj5p29N9pTO3RhS1fuxyUpvyC2iLqCVwreA=;
 b=nzpSsZi+M8KiBKN883DaVoVRCP2sJQKsaMkSxbYhHe8ZOsT+SpBXaAlI2S7j92xTiXtWdgXWA0+Ep5JHryBIOoDkv4itMcipgTlDPSf1p2yGsHPZNzIbJ7a4JwyykFSy3lNbULgZ0quavYeZQ75KVJsZbGLXdHDe6J8XQe6PupOjEpdBj6GBzWWnhTWS2LUH+ZeXC1YmLBlQx29qJCxAQWR347KpsQKi2yB3FFAs2FRetM2aSKfwRVECp0NIUradCdA+Bll/A5fiXHsajaPHLMz/vbFDen6NeZjeKpy7SUQ/2fhMWcUkaXSKDGzRCN+wkBbdyg6wsTEk0GatKduTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNYylSuhYj5p29N9pTO3RhS1fuxyUpvyC2iLqCVwreA=;
 b=qEDErtN8Sqxe2zwyqR8TqsF8lhSQyPPwCvsUrONEAfMJbIqXSNKZeGOJ0SFBheLDQA3koxqtVmSjBWPfMYm0jYjb9UMTyHnMok6uh6b+xdHtVyqZBFk6MgkUagWGC9ivjRMZju61NDG8/gwxOBUlnkSkxPsaojpceR5JBGKB9kg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Fri, 6 Sep
 2024 14:45:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:45:16 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v9 0/4] Generate address range data for built-in modules
Date: Fri,  6 Sep 2024 10:45:01 -0400
Message-ID: <20240906144506.1151789-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 221eca4e-d680-453c-7473-08dcce82857f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JSOk7QIi5KDvHSvkonde5+hQPTDfMN5/tEYamSbTwfzRyWA9wi1M5mPAya9C?=
 =?us-ascii?Q?Bzzggf7hpKxRDsMCY9n1HL0DWywO2H9a3cFKWc2bNTPNr4kCIXd8jLq82sqz?=
 =?us-ascii?Q?b3HybWYjnPx74OUD2iroS0PdGXeifK2ZucVRVIB0IHOriDAznaXwtNA81j7d?=
 =?us-ascii?Q?zzwojxahMehL7K/iSl9XyBiSDh+WWzIR7MoW1MkKZzMXeUBXFWyQHIejh4G5?=
 =?us-ascii?Q?0kRVw4Wk3iQz+UxDaRc99+R8s3NVzyIvEaYN5wl0zXyqo8413I+/3o8OXmH8?=
 =?us-ascii?Q?VHRNzB/C2Z0qrYkD9Ep/wpb4B5S8rP6vhUWHelmqWo9LUQj6rpknPOXBu9DP?=
 =?us-ascii?Q?TqogNwLXZlQHQ8Q8H5ojShC9g02BSXMLc2KbWij7j3RvR54LVVpB+beEJhzd?=
 =?us-ascii?Q?9oR1670PDDp29GE3Fdkz46mlUHrCR3JVd6FBB6M8CI5owcmkCWSUa/OyKI7Q?=
 =?us-ascii?Q?trSIhJDKq2wF4sUBWAGmWj63RjYgwdl4v2YqLvt1GbyVQugpuRixvYSGYHT7?=
 =?us-ascii?Q?zEWt7L4DuBZmQPN2m78lOHmofUoR6wkUMxSieOjzNMH6xJVtzOspZTA2/UXu?=
 =?us-ascii?Q?sRdVPwga7E9pEj+3C5vOG5KHSGW5p/Q6pwVy3CnsxC4HR5UTcKjwKrTZ/Kbo?=
 =?us-ascii?Q?AclsU6bt0rCTycdom808Wd6Qu9/Pd8fDzwvLWZxK66Sqb8JLMFFZdFHQOlFj?=
 =?us-ascii?Q?7CviKxPLv+WGmQZnyP32+FyWeZQMgvfE4zJ5lPFlnxdAY6afgR7qM875cGIx?=
 =?us-ascii?Q?v1IOz478CH2yIOkOLjG4RPLX23Rlv6tGla/nU+gRONq20dM+dfOnQiGBdIwT?=
 =?us-ascii?Q?riAm5PvSnYRgiENt2HvdhnpKnk6ODcINrxxWZ24hbc2UOzo/Bf6rIv9RCubj?=
 =?us-ascii?Q?VrEudI0fIRXw3m3e78ohkAhneSYDkAW+WywN9C1SwAFlF2GYzeCiP5GB8y+B?=
 =?us-ascii?Q?oNPhSQRs7RN6chTB4dXJZMKZ2D4Hh18/CC+qOpArVpu3yom9Ms0dZ3oIiwLE?=
 =?us-ascii?Q?bRhO69Xab9JAvo2HzsyF+yzH7ICleONM+Zj59EUEJck8vqRvCnK6TL0Wblt7?=
 =?us-ascii?Q?1FgBrlB8a8sL+0DFx3xFPrpfgIuBwfHMNvmqH91YcSNHRRwSlbdvokZpFn1G?=
 =?us-ascii?Q?vdnc5b9DamZThjxlA9ke0EHYIwpF9+S6kUf1xd2J5S2ggJ7GWwNBz4bErVWt?=
 =?us-ascii?Q?InP230VTwX9GxBZgxfnPGJIYRnhhFEMszMzkcOzqdynlM4IHbW9wS2duZdo9?=
 =?us-ascii?Q?Uw/GKzh2VBzPd039ZQtpRX/1E4aR3Wkgun8sJIF/5FLkvw3GWzbUFEU2tJlY?=
 =?us-ascii?Q?MP16BCc4FuJS40Am/Z7N6+WzRHm64IIq6A/gOGergOALaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXyiRH8HtbQG2Kf0X9a+v1CcsX0odVf9ac3kQOeBSOH2dCwgzWm+XRR8BSKq?=
 =?us-ascii?Q?LkQHe1DZKQew7m6DzxSamCRvY5QWTmS0xt1Omi8WU1784biQweIYTGHRTSr+?=
 =?us-ascii?Q?X+shp/9CMWXgwrX9ZnYdb//wcl4dj/15qFVXZ4wwIrfL/Z6qS2WuxfqwkXVg?=
 =?us-ascii?Q?sEiuAUIBu2cvJ3Ea1BuqvjvardHzqQNEHiJzH4OCgG/Y2cecSpw9hQatofAR?=
 =?us-ascii?Q?ADa0voyUOUu4nJmKTGGC4fXg2BMxKJQC5wuDaboYVk3kAG58n9kNuKVliXGw?=
 =?us-ascii?Q?Ulfnf94vH6dHlQjHkQR0s5KMnAAyi8MNp8iLw5y3GvGHZDmPFiD9S3Rgpbe8?=
 =?us-ascii?Q?TlCjMQoIQpT/gYPk39u520g4YAK4x7I6p2VIwLSAyuUIJ83s5NN2wR92I/7E?=
 =?us-ascii?Q?LGqCsIoZg8kErOnKTiG1Lkf4Jk37VeMpY88haAzpSc4hanjzXk+k54v1WjfJ?=
 =?us-ascii?Q?V4g4ypL+4GbiwtyIPCuRDeuVpzGFE9Mr3maYq7SadrcPPV3CgJEaHxPRbCL+?=
 =?us-ascii?Q?rvWNgHfVV2okaCJC5guw0u7G6HvQ+5UwySDBQZMjQ19+hycYUKibcJpYWmMs?=
 =?us-ascii?Q?LgttbcZ3/nxG34Z4+eHVQik9gjuZIVCeaUwJH9YK0iEXtX7AAxbpUIYsFj2R?=
 =?us-ascii?Q?hlyjC1Y6krtr2Rjy1DEwcqh/9ZxFIP+Xvk27+b0RDM9tXJ33F1TnZJ8djWIR?=
 =?us-ascii?Q?/jrNbGPkOUWEpXPoaNIdEQFYCbAwFLgUWeGc9du+rjVbrp+7Ur+SEH8FqSDe?=
 =?us-ascii?Q?o63ITHPDPE4cfySMbS14GHkVbwBUq0W/MF4weOEEKiEuiuZ+SyRY3VXrnMXX?=
 =?us-ascii?Q?JRMtk6etgnEmOHAaFKpurgim1DAqRxs8HGpVaGeJZm/DUEIPHXE09IgJb0D+?=
 =?us-ascii?Q?dX8uznwNVoKmCLYb8xcJmuSEp2knn2XHhYCm675EQofsq71OXAI59m7Fbpk+?=
 =?us-ascii?Q?ja6ERloS/RXS+bDmVcZjw+AyE3NuhnwMX43wvZMpf0EErY1l2fNWpBggTne/?=
 =?us-ascii?Q?1CxbPvWLPOvLI2Z1oyH1oFhVaLr8oN9jThd9jsIE6sOfrGSQyCgaTxiVLV+/?=
 =?us-ascii?Q?i7rN9qGsU8olMZHE/WMfgNc1v7GjSlb7a1f6L7fdrXgx3ST4say/AzV0jjl7?=
 =?us-ascii?Q?OWX9qja31jOdi7Jj3HC9ciCTFJolR3ZRgfHpAokXOrSfIAqt5UmO0cQjPlyE?=
 =?us-ascii?Q?KJyP4bi5zX5WeBoyY5e8Ox34xpNkGU6a1lk1pcxVWMR5woknBdkanoEM73uA?=
 =?us-ascii?Q?q8YZsfrN3F6gSFNtIwm8lxtwzUtlcgIAjIiw7zLDM6ySFqMxskfBb1oR6RmH?=
 =?us-ascii?Q?BdWVwVRrXYb6s1hMpHWslWf9WWdmyZz14T+eugPXTIKYHUGkF/RiQnB/RLdO?=
 =?us-ascii?Q?gt8OKNUKqtEjBCGKrAvAIvVf1XPtEpvMPW3t0K7pYI8+sN28t4T91VsXbLx7?=
 =?us-ascii?Q?ty00zELc2dRKBCC/CgxQV5kM+noMg1fdHbwD6kPTuANmIQETNJJIiFtTpAcL?=
 =?us-ascii?Q?w5ZyuY2Y9rf0QPcYurCSdX5/CshC7qdSwa9KLLJDHw2mHWA7YkrfrY0bXPZc?=
 =?us-ascii?Q?oOpjr7TQGvnyUcu/+Pmr8AAfFBEVu0K5suomuLwzcoX/R8mboOFQ+vaOK3Ww?=
 =?us-ascii?Q?PasCZG8BpvtLadYMXYVeWSc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	olBpc/e4338OdvNvmAhY4LB+TS4nQQZisZSX0O/0fF4qKXhQdeDfwYWT4Rh1NAmYUECl8Y0H8Wz0cvCNn0+yWAFHxVvv7PuKfeYFqPLPjZbwop0Fc93xrGdDZpZsXeiLOJf8r6BrpvN2xY0/2sQkUw6y0UOLHrsDiOjayE50zGkasp6t/jVOKch6KPEA+cbzvYzdwORdTDALc1KE3GBtUbqZGMLr3Hfb5gWu+AQ60JO4g0BKMvubY9p9ukTV8z7b5wubWpuXmDC57IzNHwEI0AdgjRR5omwD1jcxvKUpN/lioNdHUpwRy1sgta/llIgsXcuwFQPT0Hyh5Q8nNfVt9seL3nDGJ8LdPCsJ8T3wP9WPVL8WdnMtDLldpSxkSJmR677+dwldcUjHwvwE06p1q4wIQn/vJV+OwPb3qDPPXw59caOCwQf+v5TyYYGGVp5Z8jRs4fPDE6QsSB39XP9NbJsCh3b1xbabeshoHJD4zp6HitdaszRHsvlP4yKJMxoBoKRZ3+/6OQug3yvu4EgbVVlOvFD05tk49hAoRORgWMtYfOjlVACgPx2vS+y1SG3V6BcZalybWiZroLE8TvWlf2vNI46gsS6jPbsI5FKXScI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221eca4e-d680-453c-7473-08dcce82857f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:45:16.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t15U5SFxvLAGX67zqRCfq5xN5q4BqlM/HiQiVfjsXlFj6+U07GZULNtQ7y+sjTTSQyBABpj1w2o2W4cEKQCpfy336CPGbKoICfUDs68dPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060108
X-Proofpoint-ORIG-GUID: Og3R602Mytp02StmkR43c0pyOi5l59in
X-Proofpoint-GUID: Og3R602Mytp02StmkR43c0pyOi5l59in

At build time, create the file modules.builtin.ranges that will hold
address range data of the built-in modules that can be used by tracers.

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

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v9:
 - Reverted support for optional 4th arg to generator script.
 - Reverted support for optional 6th arg to verifier script.
 - Added modules.builtin.ranges ad vmlinux.o.map to CLEAN_FILES.
 - Fixed support for sparc64.
 - Fixed support for LLVM's lld linker map format.
 - Updated error message when .*.cmd.o cannot be read by verifier script.
 - Added syntax output for verifier script when not enough args are given.
 - Return 1 from verifier if verification fails.

Changes since v8:
 - Fixed some typos.
 - Added support for built-in Rust modules.
 - Added optional 4th arg to generator to specify kernel build directory.

Changes since v7:
 - Remove extra close(fn) in scripts.
 - Make CONFIG_BUILTIN_MODULE_RANGES depend on !LTO.

Changes since v6:
 - Applied Masahiro Yamada's patches for kconfig, makefile, and scripts.

Changes since v5:
 - More improved commit descriptions to explain the why and how.
 - Removed unnecessary compatibility info from option description.
 - Added optional 6th arg to verifier to specify kernel build directory.
 - Report error and exit from verifier if .*.o.cmd files cannot be read.

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

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


