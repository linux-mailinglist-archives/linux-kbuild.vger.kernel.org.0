Return-Path: <linux-kbuild+bounces-3131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC2959077
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 00:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2EB1F23441
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 22:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A211C7B88;
	Tue, 20 Aug 2024 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aRdND8Xj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g2ksFevd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B61C7B7D;
	Tue, 20 Aug 2024 22:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724192873; cv=fail; b=QldscODSrdE5tPeAGsXUvGAHoAUJB4GYUyjUF3qJVcOv/lYL8xOuO4yu5gGXeGajMu0z5PEQqvNwrjx1b7bDfp/V+8HGjgbkxzv0AY4o0AQ0VbMB+FzupccR0Q+kxYv9WysxW27CnmphFMn74DnihfQHK+K2FAK6N3bYZpEYLwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724192873; c=relaxed/simple;
	bh=UmNmDJXrHFrxeOoATjI7ZS06eLfcdXIwjQOUpdAduPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=UTuEQJNsMnHdB5S4ku5yDTk6ues9NDmNs3uaMl+nL3xOIAqgmtvGcOAcyRLsYGSCdfy3p+HiUETPha536dRlk2YV8Rk0fkwGfjc5p3+FOW6jlcABOCk3d3KsDmBEArkRg6PeVhcLu+etREx6OkbJPHdM0oedJCoTkf42turBN00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aRdND8Xj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g2ksFevd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KMBcvH004982;
	Tue, 20 Aug 2024 22:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=qG6a41je6CoUIZ
	GNIRbg+cDNN7cf0yBi2v6DRaDgGZE=; b=aRdND8XjtC8/YeFIyl3gAeeGuUuhBn
	9sAbJFcLm+0P8Adu4r9kr36yRKOlxfxPJ5eUiQpcMmTLI4uEKgmAK8qC0Urhj0Kt
	Ttyofcrr5stdcaOkfGpI8mxa4MFmjaPjbDaWWI2/Jos5EuZ6JLZmsKf3wGI9RTWL
	xlCJxEo/Yok11668pLTXy9JOesYYIDI4BsbRFD/sORQMJbTssnQpxzIPgtoJ3G4o
	d1/3n9hPRTrm3xxxneJR7U9QtHnXTXjS+lS2BupnzLx05MLk2ejT+UpjEvYv7/+r
	8wRiOcWD9mmMEpUv5owEdlrRLedcoosRg1USJ7DekYO11n+4m4ujWPSA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m67e5yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 22:26:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47KLdAex020115;
	Tue, 20 Aug 2024 22:26:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41538e1954-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 22:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSOT6mVpu2SgwE4JsX8iKOlyz32/9Tu0lBYkzQaXnhtUxXsc4vZ9h2yaSaA7ZLbb5bUpsU+w3Ge0UE1ZVVzyv9fefcvKh2v5QHbvWOLm+ulVt1WqWTKJXu//gUhkACztYF+bmitq2I3wZkRuAHb9U4k/feWKxSzr4it8yHteZ9ivjvibW1vPMtd+ssae0Iwx3daaX7679uLiZs4tQNDwMOn8k26a++YTb6gezYl9IIPhcQwlfmaMlJyRcwE1DAc8fnlX7UX73aeg1eI2vYnFNrUvpnOut9t6kChCCFj1+YWJrml/tSmblP9E5bfLIdB4grUxEkjqXlCWU85Ivzr80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG6a41je6CoUIZGNIRbg+cDNN7cf0yBi2v6DRaDgGZE=;
 b=AMhLFK0sz0bP2sfmP+PCJVBdOpUVz7ON02qgpNN6eH7dJZx/j52MLgeHZWkhJPWp4OdqN/jlp/l8T30mdCeSZ3+3V6t+NG5UBig6E5fAG8JKX9JPRBuKuBubED6Q+8+fqnnLitswkG5UVYZP21XeLtEs825LUEPzLzcZ+blROZt7OsLtBjX8OAiStymNVrTwfVGhrKvfPaIFV00CygeDqIECn7axv5Vmt2kOTIxQzDj5vtf7tVRmsms7P6Qbi6aAoOmQaxPCn6vcfuiK0BvIa1Omj/kSZD8JLTo1SSuXtngorFqIzeUx4AFVOdVLPVuH61SRyi6EfdWiluVvnwuSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG6a41je6CoUIZGNIRbg+cDNN7cf0yBi2v6DRaDgGZE=;
 b=g2ksFevduuFiCTM7PvYauwi9mgdfp9fe49W2MZ0xFdsmYGn+gKdKczF96jHVfhV/0Uj6XmR0Qjb7IRvu5aV8k8P4tnSWZonoDJJYuqP1bza6gl6xQ9vWX3ZhuF1PpHxJwfyizgUCM0w0EKmjGwbiFZ+m+jtsDHpjCv7utxGYzKU=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA1PR10MB7199.namprd10.prod.outlook.com (2603:10b6:208:3f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 22:25:42 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.7897.010; Tue, 20 Aug 2024
 22:25:42 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 1/1] Documentation: kbuild: explicitly document missing
 prompt
In-Reply-To: <20240820221528.GC2335251@thelio-3990X>
References: <20240820171000.1656021-1-stephen.s.brennan@oracle.com>
 <20240820171000.1656021-2-stephen.s.brennan@oracle.com>
 <20240820221528.GC2335251@thelio-3990X>
Date: Tue, 20 Aug 2024 15:25:21 -0700
Message-ID: <87h6beq1bi.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::20) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA1PR10MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba29924-fb26-4801-dc8e-08dcc16706f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vRD+mp9/xcZq+tHrFrR3r5fmAOVR/WD9OQf4WWPOqv0cq7kLYSlY7kYu2XdN?=
 =?us-ascii?Q?ZyNr4hSLiXpbs2+evxFizzFrP4OMuNuMG3CAMHg/2hqMQkEuv58RpXHufa+u?=
 =?us-ascii?Q?TPVfn7R11pWeM6WK4qA2boThqPI8MqFJcXKTfYub5qbQCzm4w9I4+XAYepv8?=
 =?us-ascii?Q?1socSVuZyUGjFramankmDiGHOJLUu3ZRqmVK841EKYD+jbvOVxBNucoyuW7B?=
 =?us-ascii?Q?KEzqKcXmTVGhQU3BS075cKnxvgmffmYJnNub0DmXx8FWdhz2yR7e/Az5iIEX?=
 =?us-ascii?Q?bZDLzh/ekJ87qJcod+kV70EpDaqGCBKvf7bpULNvF/0zE5B3DcVhGPeoO3A1?=
 =?us-ascii?Q?l8HAZrp0zqA17Yae0JjZUH+fybOB1wF8vgtLvb5lay04sNLK0nFiZbgLiDbP?=
 =?us-ascii?Q?0oa3LkRuIaWHUag0a35/na+Pbb/Bpo1H08NyQyVKDPh6e8OPo+IxX3AmeLv4?=
 =?us-ascii?Q?plGLQ9CqDIg5tYyJ9/dTNZcg/kz+tnZYD/+4PX3f3s1RRfiWDqcL4+wClLUS?=
 =?us-ascii?Q?WOCgtaAj8t3cdMycKxf0Oik/N+b156+Vv8zpSFb3LqBCrwETrFc+7sIjOWHD?=
 =?us-ascii?Q?h/7R4jIOKMD2fGijnB244VE9y3V/qugMHq6arCp3OsB/oG3wzb3y6QmCnE34?=
 =?us-ascii?Q?yZqnqTVa+UpfgoXJC5LBUQa8IcR2VzLZqDLkHN20EYjUbOU1cuoJFbEAiNY9?=
 =?us-ascii?Q?samLhCj4KSkC+yY6BCEciKAGmEBiXyQRu8CtMxKyt7IQNnbRUqaip961jJ6w?=
 =?us-ascii?Q?ZW387rYKhJZ8qFCG/wKSFZCzqPSkOMaPsf/8S6q4IanpH54qQ0S9qcLBFs2a?=
 =?us-ascii?Q?wdvjwJNdENfUE+Z4G/YKFjUjbB6pU2JC+lHs9SX+4n98trtj+tJhSqZCTZud?=
 =?us-ascii?Q?5n24L237IXvz9U/XRIIKcjIsDPlq4AIuA6DXaADB03RJJIM+PLknr625jZji?=
 =?us-ascii?Q?9cYEQpPTP6Z723beLMi7UWrnWv4j3aCgwiugvd+ENdEuS0YDeBnYxc7oCIQE?=
 =?us-ascii?Q?3Lp9mgG0R5O43uevCQMis4+3J38Mkh/nZNnGtpWl70fdgBDX+X2XKVonoJot?=
 =?us-ascii?Q?/k/kJ14eM5Xw6dghoO2oxqxTjezGD8h70AzPlpjQl7bE2ikCcshNHmY7/Vl5?=
 =?us-ascii?Q?zaz0lI2jMpxOV8iWC/CCkVq5XqBJyMobR+IIJD5P6u/qdQXMztj55GRUL6G3?=
 =?us-ascii?Q?gaM8Ts7G16a3AfwF4SRJTka38FDGNLge1mgL5jhCgFGR9x/Qgg9EIFfrev+9?=
 =?us-ascii?Q?ER7qliFVIBNE126OjarOSJD2oj/FoVPlpsTXVc3hA96gRcsYPd53ePPG1o3R?=
 =?us-ascii?Q?AxFABGEti5sy3KL6j6ZGaIeSLG8ZAi1JjuvkMj9GM3wTiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qqcJ2jjKmZd32NbnAFLwSjXJTGr6ULknWD7KJ4C21lG0g5hWVohsLnuxGToM?=
 =?us-ascii?Q?yJAS9oLFxMx4iQPy+3xwD9fVCv7DvoGA+J0j4yYU/7ZJjnZhGTwyE1xPVHJ/?=
 =?us-ascii?Q?I/dwaI11//8ifXE+syF6c0ougMaeZadhVO1KYwHM8VYNUp0vKr0OHgggncQ8?=
 =?us-ascii?Q?2rJttPaGs3pJhDsIDy+FDBj+k1zK5M2FJUKBuJu7z498gbbaf/SGAb37JX8v?=
 =?us-ascii?Q?mmkBdXnahHC+1jQQUysfCAPcXF1/WgIbRZEPyAdrvAs7DqcqpNe/dwoxlYa1?=
 =?us-ascii?Q?R6s7rBkWPSn6MlTK556EfXNlq4YEU7T0rJHt5aj3GwOlhG3eQn8GC6viFEsN?=
 =?us-ascii?Q?DoM2+cb8gNl6qOswrtpwdgbXIINiClfqa0jIRbkJB56Sykzp2x5IpMAxyRHp?=
 =?us-ascii?Q?rkkfH8/pyjDAAf/VG7H7KkqxJt38aVgHk3G6ywfsUGgUyrVypqW7yPoZ1ire?=
 =?us-ascii?Q?MaQ1s+7ynKpvVc4RgeFXPpfwMwzHlMScMxdPuzGM+h9DOs9Pz+omJOy0SdMC?=
 =?us-ascii?Q?OHx8Q38OkeUjFLr6ARitZF4sZFQA+aTi3JvfinWq5hdn/sFyytwKW1WKzsZ0?=
 =?us-ascii?Q?iuw74nQdz2FkjIRugLUohf0m1sZqcUW7RFGVaCiAXJsiTjfxtm50aDg504wt?=
 =?us-ascii?Q?VgnDIN1OUwbKjN3pCchqoFBTCOOD6MurcefmTXyWYOeFyiSUBJ2KHVUApTCH?=
 =?us-ascii?Q?GESerGJ45QLOJ39P0ZbOLFtLZFtJ4inGvwvfs+N2ZklGm9nPT/unI0+3ZxAD?=
 =?us-ascii?Q?uINCuvuKxnineUOB1f54XfERiBg8pjzsagjuIb3riDhmOhOZuDmeET0psjhb?=
 =?us-ascii?Q?utKPHnEg/VNvPqzCfj3DdIbqCxEnOJH1bo6CnnCqbKlSkoPA9Lnw6IGC8GG2?=
 =?us-ascii?Q?kRDrmRQAhZPvYkUh3g7BXJ8DiXpM/7yvd7Qa3wMNTb6T+RVzQEwn3p5Ncor5?=
 =?us-ascii?Q?Hvi6c3YFV8W4F0zR+x2n7L3cZ1VEHfIq3rE6jQf+WV96UxHCbrVVMpnY5v94?=
 =?us-ascii?Q?siVl6SwDxwAghsDAzis6ejtxGeFRvSL3t5iG/CB/PS0iNApdPXR1T6tQg+fi?=
 =?us-ascii?Q?Jba8uHv/WSv2CPpzsn0FZhKOySKsA365D1D5D3dvAVfAQEZrQGb2TUkTaQIg?=
 =?us-ascii?Q?r22ZNMRRHXzjhUsnF9l1Ha6FmXGYaiKTIx6hqTQG4N8GVpHqqnkNEic9ZdOa?=
 =?us-ascii?Q?6KLvCYKPKiWTaKYM9BWDoGUMHOd5P/KDHPAJmPtiR2zrMByU7+dHmGsEui0l?=
 =?us-ascii?Q?aQpxB7Lkeq3nEkkd5P+8zhXeJYPdIKLLlG7xpFVfUH6odmReswI0WE37TTIo?=
 =?us-ascii?Q?/pL4+7vR3a5dMx17IeLSh66IC0mwqMJcmDniZzD4VkzmMkW4WQH1CYyHLNmg?=
 =?us-ascii?Q?mVIQOFeu3Ivu5y6VtqqJmAyWcz0hq6U9lnsj+hStedQMAUk5brQOeNkK6Dx5?=
 =?us-ascii?Q?MMOCzTzEC0KJcuWbh6dzenWgnC+n0Dc9VXVWiPpiGy5D7b6bylIEkCJQYwZx?=
 =?us-ascii?Q?ECyx2X8YEdSShRlr0Wqlep47n8m8DAIzXRd46miegs2+7I5qCMKlhuRuePz2?=
 =?us-ascii?Q?j+A5lykYOCMj4RyOXh5sf/mJzYKBs6a+pgMIJeD9LEX/9Z+mmZsllloOjcp1?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ypgFdp6P1JbIoQNjmURkpSvi5uEcXXENBV77bv4RMbWW6mwPrAndlrUuJquNG3t2FHpfFEolem7GVM8i5d66NLritzdpaMvPSXp8K0W7OW8MLiw5g7l/Gm/N0BLcFq/Jhn/iWYGOT7BGUGnmXM2hEpKqM+XiE6ZRzSoUbpngmSIZmHj0vcJiSx6aJx1LeuPIssJ/vweyHVtCdBnsYZtWb0zHezMfxQbi7agyC8/EAXPVhCcr5tEpU4DqISQjTeKJLXbrSTsZoxh2Ltt44Nsa9l09snSOArxKJRgXDrq4jgpwgB8miyjDkHuDzxpVZ0LKdO7f7N6ahe6YQsF2GkMrGV1+IVoxTtQejWlLt9FwA7LP+JyjD7WCc2sEY2W3x7KwQRuJCuzWjUqhzfYvyy69lTdqaoAMk7EyNE3DbVLnAMid6ruKHlvSAdk1i5eBrbaOO/K2p8yWtDkHHQldaxch4bkEc8lcLLxEktDh1mg3eupkadEQTOxvs8T3yorMaxVP4+mxqdZ038dGYjYH158Lo6PM7Pg13NcMzNtNAfDWdJnu9Ca9alGa9ruTLSdwRMRYa25jT0dSRAPeiXJrYZ3NttnxCM5p2kAaEm5FKKG6Mmw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba29924-fb26-4801-dc8e-08dcc16706f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 22:25:42.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK6fdilACGmKYTjGe9pANA6CdzaZYFuSlc30BM+vNWbRptjk8odzZD8fF5AgT841o1rr424SE/IkTuMNvED2+vzL5vqjmArsdp6BY11RqhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408200164
X-Proofpoint-ORIG-GUID: PSZlO19nqh8_NDKenN_8zI87XM0cAVjz
X-Proofpoint-GUID: PSZlO19nqh8_NDKenN_8zI87XM0cAVjz

Nathan Chancellor <nathan@kernel.org> writes:

> Hi Stephen,
>
> On Tue, Aug 20, 2024 at 10:09:46AM -0700, Stephen Brennan wrote:
>> There are a few lines in the kbuild-language.rst document which
>> obliquely reference the behavior of config options without prompts.
>> But there is nothing in the obvious location that explicitly calls
>> out that users cannot edit config options unless they have a prompt.
>
> Sure, I think the mention of "non-visible symbols" plus "no prompts
> anywhere" in the select section is both a little cryptic to people who
> are not pretty familiar with Kconfig and slightly disjoint from the
> prompt section, so some clarification and expansion would not be a bad
> idea! I do have some suggestions for the wording below.
>
>> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> ---
>>  Documentation/kbuild/kconfig-language.rst | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
>> index 1fb3f5e6193c3..8e9306b599cd3 100644
>> --- a/Documentation/kbuild/kconfig-language.rst
>> +++ b/Documentation/kbuild/kconfig-language.rst
>> @@ -54,40 +54,43 @@ applicable everywhere (see syntax).
>>  
>>  - type definition: "bool"/"tristate"/"string"/"hex"/"int"
>>  
>>    Every config option must have a type. There are only two basic types:
>>    tristate and string; the other types are based on these two. The type
>>    definition optionally accepts an input prompt, so these two examples
>>    are equivalent::
>>  
>>  	bool "Networking support"
>>  
>>    and::
>>  
>>  	bool
>>  	prompt "Networking support"
>>  
>>  - input prompt: "prompt" <prompt> ["if" <expr>]
>>  
>>    Every menu entry can have at most one prompt, which is used to display
>>    to the user. Optionally dependencies only for this prompt can be added
>>    with "if".
>> +  If a prompt is not set, then the config option cannot be changed by the user.
>
> Would "not present" be cleared than "not set"? It might also be worth
> calling out here no prompt means a "non-visible" symbol since you
> brought up the document brings that term up and does not really tell you
> what it means.

I realized this exact issue re: "non-visible" upon re-reading the cover
letter & patch after sending, so I 100% agree.

> Perhaps something like this might be just as clear while being
> consistent with the terminology? Feel free to disagree though!
>
>   If a prompt is not present, the config option is a non-visible symbol,
>   meaning its value cannot be directly changed by the user (such as
>   altering the value in ``.config``) and the option will not appear in
>   any config menus. Its value can only be set via "default" and "select"
>   (see below).

I think this better than my suggestion :)

I'll send a v2 with that wording.

Thanks,
Stephen

>> +  It will not appear in any menu, and even edits to ``.config`` cannot alter it.
>> +  It can still be set via "default" and "select" (see below).
>>  
>>  - default value: "default" <expr> ["if" <expr>]
>>  
>>    A config option can have any number of default values. If multiple
>>    default values are visible, only the first defined one is active.
>>    Default values are not limited to the menu entry where they are
>>    defined. This means the default can be defined somewhere else or be
>>    overridden by an earlier definition.
>>    The default value is only assigned to the config symbol if no other
>>    value was set by the user (via the input prompt above). If an input
>>    prompt is visible the default value is presented to the user and can
>>    be overridden by him.
>>    Optionally, dependencies only for this default value can be added with
>>    "if".
>>  
>>   The default value deliberately defaults to 'n' in order to avoid bloating the
>>   build. With few exceptions, new config options should not change this. The
>>   intent is for "make oldconfig" to add as little as possible to the config from
>>   release to release.
>>  
>> -- 
>> 2.43.5
>> 

