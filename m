Return-Path: <linux-kbuild+bounces-2127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C3909159
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 19:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C799DB294DE
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 17:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0CF19EEBD;
	Fri, 14 Jun 2024 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LRqACV3m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MKRXKoUV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C0383;
	Fri, 14 Jun 2024 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385402; cv=fail; b=M/3K6c87QLjeYhne6PRQDeL1FUzojZksI4lhzQtE5JuSyfz6yoTSLYTLsfScusqUtla0U9oVCS82VlExOW9QOy3xdioBazcfnsfwQC+B+EHTNsXwdwFQ3IKhX0yvGDgQornTlAOR1y3Sktv4KUtAG8HDb6XKP7ws2W1hRM95664=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385402; c=relaxed/simple;
	bh=Utgr38imGpwpT9ufQTMg6tfqVcyUskQiq9UbSAVLI48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JdfUWsip6sVlG44FpgKFtJ6lCMUKk46ZJtzjhVIe7BWxgF65clEW9VzPP0v/uShQBFpLrIu1HXgQSK7TWjsIProYxbrsWix1FSemWuTeUbxWaTcOWMn/Ej5Fydto8XVhUTSlgEt1ecOBIZzGDdD48eMH2UEDYiR32k/Pv+9+OvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LRqACV3m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MKRXKoUV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDH0k4026816;
	Fri, 14 Jun 2024 17:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=vqOAfKb3q5jjYNFvje6um5TzGHxrkJM1lWMDV3Tiz/k=; b=
	LRqACV3mqhhBBrlt9OOMippiWBGBhtNpJsrgK+VsPo/ahITs9oBaQ7HMdGS0njCD
	diKNJyI1PTgEERmXMU/T/RbQGQ5sWCZsNZAN6VMdG60ttgaaszk/TsrksA8HZQgz
	qFa2kxJl/BSojw+L10lHi9oYKIoFVsUPSDFroMGtSt2+Hv5wCdiufKdraP+q+IW2
	UIB3I/O58tG2jdNiaOhVA5XAktY9WJO/KzacYeQ5y1jNMNVNq3DcMIYOXVOp86ny
	mRMvv2f1fkqQiCx5VxId5d358xTGViKjoh+y/UvHEQJidTeoRqv4WmyBoXpxP3JP
	TyGj+4kvZfCcep9tGGqIkw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhajc6u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:16:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EGarMr012576;
	Fri, 14 Jun 2024 17:16:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ynca2ssvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOma2PgWLUTxzHwy2gsorf4pv6wpoJwHu3zhWveqHx+qoSENg4x3PH90pbsIZJOL99pNhQPlxvxUy3wruKAnq0n2RQmwUkS2ukNO4vzXoOeRwFe4bA/PYLhCeOAqDQPJMvqUryGyWfAcMpK5lSgW9ZRWRfZ0T/ymuT2QwKyrtOF6dwmukO4myB4pK4SYoS+NBkvBpGKzpk9hWvW4s0oRxExtyjQmZuJfYFC/FCtS7VxZJCehBhi2ubHIqjBPNfpRipKB6SvlAFn9EWwI457DMZ+6H6HPYzx9QbfW0rh150CkwS+688y5wT1LHqgHSAutENU8anOV4hOXuEupasSJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqOAfKb3q5jjYNFvje6um5TzGHxrkJM1lWMDV3Tiz/k=;
 b=SpPl6uy/umpXljQvoq/uaS/3K82QOBAZt+hkd5vXkVtWvGDIn8wdzRheN0TFJGbCjrIn1/miFhkPNFt0tgiZckjviIv18QUXckvRLhUxfeM/Lz94kfSLc8jorYqucBX0qeI5oMLbka5M+cOycBtI4OKmWDwDqOpBn5gxhriH+Q1uKmd9eBgQRQPEgZDO9jkNvUgL4kOxOArZDuYnTwAVSwvH7BcMfpfSOlkpfBLT73n4+0cnNwjcgy2vRwSk+9+xjgT1TTipsLim7Wx98bGrwtBO1mkU5zN8Thb4w7rw3TUrLl2X1YlNU50/e6rcZ1DlqXBsFAy3Tecuu0sivzbDew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqOAfKb3q5jjYNFvje6um5TzGHxrkJM1lWMDV3Tiz/k=;
 b=MKRXKoUV9IA+bnZS2INKym1R0N10r/E+ymWQ2E+IOj64UeZ7xw7QISFe/uVIjm+51WjIKA3uKwJqUKtgSQm3h36LrW564QfH5QUIFVGhfdZX+EN0W4e3nC3+G3cWjEwD/MlB1/hrNnuwb9NjASXwDOFf5dPdYc/H4GPKL55mciQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 17:16:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 17:16:27 +0000
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
Subject: [PATCH v4 2/3] kbuild, kconfig: generate offset range data for builtin modules
Date: Fri, 14 Jun 2024 13:14:27 -0400
Message-ID: <20240614171428.968174-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240614171428.968174-1-kris.van.hees@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: eecffa2a-91f3-43dc-2c02-08dc8c95b9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k1Ee1H1icE2N1Xcrqn+xrwv6wD5XNZi7U95iNlEiaEVgFpYfgwQFfC+HNkxd?=
 =?us-ascii?Q?LlFOAil7Yu/HtCk5merAoeoF+/SCKlkCY0k/cjhLvfjJ9uuQcdgl7rYUmTNU?=
 =?us-ascii?Q?zxnlSrarnQUut3IG+ClShYp0m6uMy7E20fmWeddjUW1LoPY66rzMWfCpmePA?=
 =?us-ascii?Q?twN72/5127lOin2hIfP3eJb4bMqKsJV1VqNrGkWW2GpqrrhbGX4YlwwlI700?=
 =?us-ascii?Q?1uwz6zt/Tz4JyAfGDKyMbbJVAQ/yzAmDVZeE0nifXst/oA+qj2aVJC5IWDpq?=
 =?us-ascii?Q?i6StQpn/gWyQtqAot/jFJLFM+i607jxiH0LOEv9EETfy0SJxZkwwCUlrnroz?=
 =?us-ascii?Q?fuVOs9JsDDAB4scdf9EXNuaORhsvF7pf52jBspvv27v+W4G9SIgYz8vKg2my?=
 =?us-ascii?Q?xcROncJXJM4wRS7CquzAbbj4jnl9jKJOZuHlH2wHhSD7ZDY9jSQJS9BTHRyy?=
 =?us-ascii?Q?IPyI6k03Ou41piqhlN5Xgb/FzQ0IKKs2KC08fbJx06I/PgWbgxhcwMFC2KeE?=
 =?us-ascii?Q?xqB53mq4GvjZd3nwpb9YX1vVzpgrczm2qqsHIhoPlGhac3n4R4LZvVmFELSX?=
 =?us-ascii?Q?DCJlsovZnV9iKPMgzIu3pIaj+xwDdemoDpDLdCUOAcxj/Cwkdxw/DTHclRyA?=
 =?us-ascii?Q?loxjisP9To4tlcMbTYDqTwUbmlt6VIT9ZnaikgwCRypEEHRQXJS1hSBgETYO?=
 =?us-ascii?Q?lS9efeliwamKW4nc7bLxhBxrEVE2MwxSMl4DNsIeBer7jEfF4UECYbIRC7py?=
 =?us-ascii?Q?3XhU3FeSuJvUxXTzQz0rQqDGDEImO9HJXOXedzG9UT9vm1432jBRzbjcpfPp?=
 =?us-ascii?Q?W4DFcDc1tWec7VGd/KjTygfX+E2A/QEV9R9FV2l+/wyCbOcShw8CWe+5XG1m?=
 =?us-ascii?Q?+HF1xPhnt5W2jnSqfyUZNOV8jomuNQbG9QW2RB3NFT9r6SLqmCG6K+cEtzrh?=
 =?us-ascii?Q?0buw7IKy6JLNX9xqsAvg29JbVfVCSo6B+gPLabqvXfRzLoq/4sl+86H0WCZ3?=
 =?us-ascii?Q?Ye9JEwJJnbvZqwwz5lSR92r2d+5mSmGecYSZdx+MUNmbMxO7AZjxYAfQxPF4?=
 =?us-ascii?Q?rb+2orMvxShHcjiUDWn+IfbNUloMC5WeZRlBFbsXLZI1R72RobjUO6vsWvd4?=
 =?us-ascii?Q?22wbY+bomm1wn9zrmVJLa91oGYVt1lgx9VlXBPJzc91JZsD1ParXJ34Oep3R?=
 =?us-ascii?Q?XPG3NPmGy4iZdRMvG6EXUm2beDNjsp15eBf8vS4sUH0hBTSnkzj8kQtaf4Te?=
 =?us-ascii?Q?7XSllJj/8bYGbCocdNA7KNyt8OB4IyqGzIRN2Ty79Ax4V/A7+p/1cd6iIorC?=
 =?us-ascii?Q?AmqphdHKmw7+7jbaq7MpXM4+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vy4Mcr3Y/NtUa6b5sHv7cIKHo94TGOprkKbW3sCOcI0oB/36wAEIboX6jU1s?=
 =?us-ascii?Q?L5dqmuQ5Jmc3sB7opph5hJts5E5NVOoG/C1LoA7bIY9TT7OlLrPouWtioPYi?=
 =?us-ascii?Q?Qnem8EzGlONul5kr2LfSneYDDRIZMtzzDW8JHNDfIcLMg7S1TjggJXoSoKzA?=
 =?us-ascii?Q?0mvbC7iF8/IqTSvx+H4tbN90zt8VUv4YXQSHTdBV+rhEqj/WGrMLWNNkVJ6m?=
 =?us-ascii?Q?MMKnpzMmR0SPKzH7LYrrQCD6LSvxUnFikfUSykfcHejBV9dIMQRaUvGKMQJu?=
 =?us-ascii?Q?0Dqysl+UIeI5keatBJ4MBaertL8FbPrkAYZGzJM5CSrcer92E9Tvs+tSeOSm?=
 =?us-ascii?Q?RY3QEIhFpJCA9eiAVkL3xpyed1x3Mgphi6psnXwL/OO03mpXmINnbUzNe3MO?=
 =?us-ascii?Q?OPIm+NALiW7D/wB3QQi/N0mCPS3AGVQIigoJ2IbYCBuhfB6dYbW+P3M4VuP5?=
 =?us-ascii?Q?ydmWM0dEk1Ao5Sa+ZwPeny9PzPqmOYeEbQcQn838oTCbgnJl5bs4HjPe5iuY?=
 =?us-ascii?Q?1X0voVHg4Kb2QI/exJ+K8et/KWLTwqQFuV0H/Zvl5dqaczjsbP+8y8443cfN?=
 =?us-ascii?Q?ny09akktzAn7Q66wPkgHvwKSFOiGblb44fy8O0wKN4jTwIZ4irN29cUkTXhq?=
 =?us-ascii?Q?ImhcTuuez1LCy5bgHZuO4lpOxTgThe+k4snRe64/cM10sBI4RbO9E+lsIXfD?=
 =?us-ascii?Q?fbADhGXGHBFv6QX/hUl2s53Q1hoKm9Z1u4c8exG7CuvPkQTnqxKjgaixvHP2?=
 =?us-ascii?Q?VshhRJaCDTkN959jC5TU9FnK4qS7jm0VPgIaZLxF5Cv4xC5PYpHmzdthFM1J?=
 =?us-ascii?Q?0EqfIajpPajxtyZ4gpYXi1smKbkU7mF0ih+74HR2djqVo8Dc8eo39OXTRT2J?=
 =?us-ascii?Q?9zIz76pJ/zZRwZwYRGPp56TTkaOfhwYY3GEqyUkWqRwlk2/7CxiRA0wp+P6L?=
 =?us-ascii?Q?YefrXaCHWaN6F2DDyac75G8hwNlH2r6Bu/FijXiQY3OsCZw5yMYRldCPVoIq?=
 =?us-ascii?Q?2peCcxO5wOqnxGSkctGrbRJsr/MYk6TXrvEOb6fV/b0yIw7kMijWzhXmoWwZ?=
 =?us-ascii?Q?Y+oV21Bf8OBQ7a7ADt2KDSLRNztR6kQd+sAUkFS0u2+s25DGbajXQxgDe/5V?=
 =?us-ascii?Q?Sg3DUEPz6dQtcEjKaiI/lwZG9ZDP3x9MuagXn7eKnLMvE9ZW9P1gxHebNljK?=
 =?us-ascii?Q?Nq/w5EUBL/kWNte387G7FohCuepau58xKlCUtXwCSHZnf2kFtPDztc7LfIuV?=
 =?us-ascii?Q?OHfUbcQeFGbSY5z+LkNu2GEtNcKJe0RrEqeNcaeIeGS15slGyNbfMvtp9g86?=
 =?us-ascii?Q?x8OPfB9VQFpso+OWucxcm29uafhEh5XvhBvc5zaK9wy/WrrFlC+pGpdKpmnO?=
 =?us-ascii?Q?0QoUBJkyGogzWMq/Y0NKTq4TfvzlZuv0QWmTbeoMdJH7QXUT7iLjEggfuxjE?=
 =?us-ascii?Q?iv3agsaidqCR3Nl3LIH/D09s5brymgdos87e2ApNdTYBSLcY42eLlMzJSPBj?=
 =?us-ascii?Q?Lr/VfnnaKxI8/qItf5Fs0vQkI4wcKNJfqsVzNZgYjhz7DL+7XjHk9fEAdD58?=
 =?us-ascii?Q?MlKYmucaF+MEWA418OZZseOHDp5hYSc/Km+1fuZ8YtL6XDhMV14jBndF+cWq?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LEEHKomQNH6ssKvrMdfmKIKMsdXh30RrUqnAV3gsyNkF1vg+18BZ+6Q15py04F002/j9TJmvo7U27JZHWm4ctbTrlfiZIH3oaR4sQzeshVf/dnEaLqtS5RtKUVJSeVAPDkG2Lc5r6nP60aQV5bdUlOlQpinV6guMOJvDyoE5/Jo9Vc4TKsffM1e1S4onycA/JH9ybD7NjlS7N4LFBgUTDaJBpJ/OSHvqUUAqQHjhnDWI7QHseCc9GztK8HxbRaTdKXI4d4ADYvZ6wcwbNLV1HROVYba+iUzX9hKOK5vRp3Yy6aHKoG9Gs1cVjmkUNAwXLXuFRm+tDbduWhlGxnHI8BxUy2ilyFiHGMWj7C2mSdv8SdBYmVzJUdPrbK759DNexFwiEZ5mk8nHuBi+hufDxQqKBXzvVAeUZoyxwV1FvW8NHbDWqiawjXrym674treKkxzQdj/VBkyapc0eQl/SCrsKfERiHIxWN50Oo1Mr6uGHwAzgHsTuzb0A3/tT1QZY1zjKi6XZzRLwoVCwrYVYaDiOowfJsCx5X3hYqAZanS6MOE0NLUegB2KYf1psAulwNGRX/LUsMDxEt6XDxM1W7K9h8FEAmX3pz9cXug6CFxU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eecffa2a-91f3-43dc-2c02-08dc8c95b9a6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 17:16:27.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wy4AmxVkmIaqfREsOkHzUunjbRfJh3iDBd0zvbXOQUVAgECZBQAEzJKMdnzKHlBd3GOBywRI+MJxgaekZCb7OGZPOv2EmzXetlWtaZxQHbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140118
X-Proofpoint-GUID: iGAKSNPpeB2a5OeXJvAKCMLZ3bIQEaE7
X-Proofpoint-ORIG-GUID: iGAKSNPpeB2a5OeXJvAKCMLZ3bIQEaE7

The offset range data for builtin modules is generated using:
 - modules.builtin: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section
 - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 008e6660-008e9630 snd_soc_wcd_mbhc
.text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
.text 008ea610-008ea780 snd_soc_wcd9335
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

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
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
 lib/Kconfig.debug                   |  19 ++
 scripts/Makefile.vmlinux            |  16 ++
 scripts/Makefile.vmlinux_o          |   3 +
 scripts/generate_builtin_ranges.awk | 284 ++++++++++++++++++++++++++++
 4 files changed, 322 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 291185f54ee4..03fddad67d59 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -571,6 +571,25 @@ config VMLINUX_MAP
 	  pieces of code get eliminated with
 	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	depends on !LTO_CLANG_FULL
+	depends on !LTO_CLANG_THIN
+	select VMLINUX_MAP
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
+	 It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
+	 address-modification options.
+
 config DEBUG_FORCE_WEAK_PER_CPU
 	bool "Force weak per-cpu definitions"
 	depends on DEBUG_KERNEL
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index c9f3e03124d7..5fd1f272ccde 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -36,6 +36,22 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+# module.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = \
+	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > $@
+
+vmlinux.map: vmlinux
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
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
index 000000000000..ba7a5dcef284
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,284 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# generate_builtin_ranges.awk: Generate address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
+#		vmlinux.o.map > modules.builtin.ranges
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, mfn, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	mfn = "";
+	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mfn = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mfn);
+
+			mod = mfn;
+			gsub(/([^/ ]*\/)+/, "", mod);
+			gsub(/-/, "_", mod);
+		}
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			return "";
+		if (mods[mod] != mfn)
+			return "";
+	}
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+	close(fn);
+
+	return mod;
+}
+
+FNR == 1 {
+	FC++;
+}
+
+# (1) Build a lookup map of built-in module names.
+#
+# The first file argument is used as input (modules.builtin).
+#
+# Lines will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we derive the built-in module name from this as "lzo_rle" and associate
+# it with object name "crypto/lzo-rle".
+#
+FC == 1 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mod = $1;
+	sub(/([^/]*\/)+/, "", mod);		# mod = basename($1)
+	gsub(/-/, "_", mod);			# Convert - to _
+
+	mods[mod] = $1;
+	next;
+}
+
+# (2) Determine the load address for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+#
+# Since some AWK implementations cannot handle large integers, we strip of the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.
+#
+
+# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
+#
+FC == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+FC == 2 && map_is_lld && NF == 5 && /[0-9] \./ {
+	$0 = $5 " 0x"$1 " dummy";
+}
+
+# (LLD) Convert an anchor record from lld format to ld format.
+#
+FC == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
+	$0 = "0x"$1 " " $5 " = " $7;
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+FC == 2 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+FC == 2 && /^\./ && NF > 2 {
+	if (type)
+		delete sect_addend[type];
+
+	if ($1 ~ /\.percpu/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	sub(addr_prefix, "0x", $2);
+	base = strtonum($2);
+	type = $1;
+	tpat = "^ \\"type"[\\. ]";
+	anchor = 0;
+	sect_base[type] = base;
+
+	next;
+}
+
+!type {
+	next;
+}
+
+# (3) We need to determine the base address of the section so that ranges can
+# be expressed based on offsets from the base address.  This accommodates the
+# kernel sections getting loaded at different addresses than what is recorded
+# in vmlinux.map.
+#
+# At runtime, we will need to determine the base address of each section we are
+# interested in.  We do that by recording the offset of the first symbol in the
+# section.  Once we know the address of this symbol in the running kernel, we
+# can calculate the base address of the section.
+#
+# If possible, we use an explicit anchor symbol (sym = .) listed at the base
+# address (offset 0).
+#
+# If there is no such symbol, we record the first symbol in the section along
+# with its offset.
+#
+# We also determine the offset of the first member in the section in case the
+# final linking inserts some content between the start of the section and the
+# first member.  I.e. in that case, vmlinux.map will list the first member at
+# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We record
+# the addend so we can apply it when processing vmlinux.o.map (next).
+#
+FC == 2 && !anchor && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", type, 0, 0, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <= 4 {
+	sub(addr_prefix, "0x", $1);
+	addr = strtonum($1) - base;
+	anchor = sprintf("%s %08x-%08x = %s", type, addr, addr, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && /^ \./ && NF == 1 {
+	# If the section name is long, the remainder of the entry is found on
+	# the next line.
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+FC == 2 && base && $0 ~ tpat && NF == 4 {
+	# If the first object is vmlinux.o then we need vmlinux.o.map to get
+	# the offsets of the actual objects.  That is valid because in this
+	# case the vmlinux.o is linked into vmlinux verbatim (per section).
+	if ($4 == "vmlinux.o")
+		need_o_map = 1;
+
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2);
+	sect_addend[type] = addr - base;
+
+	if (anchor)
+		base = 0;
+	if (need_o_map)
+		type = 0;
+
+	next;
+}
+
+FC == 2 && !need_o_map && $0 ~ tpat && NF == 4 {
+	if ($1 ~ /\.percpu/ || !(type in sect_addend))
+		next;
+
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2) - sect_base[type];
+
+	mod = get_module_info($4);
+	if (mod == mod_name)
+		next;
+
+	if (mod_name) {
+		idx = mod_start + sect_base[type];
+		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
+		count[type]++;
+	}
+
+	mod_name = mod;
+	mod_start = addr;
+
+	next;
+}
+
+# If we do not need to parse the vmlinux.o.map file, we are done.
+FC == 3 && !need_o_map {
+	exit;
+}
+
+# (4) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+FC == 3 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+
+	type = $6;
+	if (!(type in sect_addend))
+		next;
+
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "type " 0x"$1 " 0x"$3 " " $5;
+}
+
+FC == 3 && /^ \./ && NF == 4 && $3 != "0x0" {
+	type = $1;
+	if (!(type in sect_addend))
+		next;
+
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2) + sect_addend[type];
+
+	mod = get_module_info($4);
+	if (mod == mod_name)
+		next;
+
+	if (mod_name) {
+		idx = mod_start + sect_base[type] + sect_addend[type];
+		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
+		count[type]++;
+	}
+
+	mod_name = mod;
+	mod_start = addr;
+}
+
+END {
+	for (type in count) {
+		if (type in sect_anchor)
+			entries[sect_base[type]] = sect_anchor[type];
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.45.1


