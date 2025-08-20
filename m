Return-Path: <linux-kbuild+bounces-8541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A2B2D192
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 03:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FCB516C485
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 01:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA8970823;
	Wed, 20 Aug 2025 01:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ga5nbxls";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hZTllE7+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD424A047;
	Wed, 20 Aug 2025 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755654754; cv=fail; b=dX33ycXj84EUne0Xud9TFK15TqocmcViCjC/MPclIw7Mef08W5SKshHZ3p0OVTYJSKCBoFTCTEf4syZf3nC6XmDvAin+O4zJ2ED+L15MHUbsgD3fkx72rfeELYeOYBOjH8BMdOs42Gun0ui3I99ha2TdbZFV/G+gyn4bHc/hn6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755654754; c=relaxed/simple;
	bh=xtrUfUw/uk5AelNfOGxq2XWvy7YWZF4yZN0+wOIuY6c=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=Phz3X3YtuyqVubIvgZrnjDSGJ6wEROKtmjY9GPaDu7ZXYb0UdIOvFa494ZZ96hO45h9VbKBsMnXvj5CXKbSHVp0zmEgtLqrodWiEkaf/FQqA7ulwTGyU6cuIii1ejfc55NoebF7FGLiLE6Yai9/BEpE5Hvtt4xGr9khOYCsuk/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ga5nbxls; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hZTllE7+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JLBq3k005456;
	Wed, 20 Aug 2025 01:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MQSrQCC5Y6NYVMFobN
	sEMgUKF0Y8L0eMNURgSzFJfMs=; b=ga5nbxlsSM8RY6itNccKp4r4O/Q7FfoTUt
	Q/8lsqptfi0BMVzj0+XQgZeIOYWyW3c05fVpbUD1BPyk5DTeLnSkYPMwCPetJZiC
	gX30thOq2BoTmkEXvEnTux151yRinC2EhXJhTCxIxOKJf9Rcz9zsz1+yvdqBurGK
	Y5/zCV4rHt4J9eNL3gOjJfR0ForcRtVofeXoRLjKQhY1y9oSBP6i6/U8bOO4FSh4
	ohX1Ydglad4UMTc3TJBfPe+GVl43k4ma6BmfmGTQpJxdEtgk6QzG0avRecoGiDq5
	Nd5aYUGiR4fcoEMmy+QB3NcgM1RO2aSvxjdgqhSiTgtxgApZL0XQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0w2897y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Aug 2025 01:52:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57JNrbGT025452;
	Wed, 20 Aug 2025 01:52:20 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48my40kc7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Aug 2025 01:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhTUZLupA/ZldjiNIzIwMNFw7JDbWqNu4IBeCIvWOyRFyvymQB587SMVg4tZm5xb1kdNWWk3/CXTsoGmMxRS8wyw7Df+JNrYDsMypWkHgZ0bsptEQaFUJAW45DWtr6t9RghAyouLtuVT/HKYRPxXsRdinOD1k0YrPF88hlZTWPTlxjRhej9nFH6pBb6VmEOrRpLOBbvLFrlu1i3wdDYciTCT12OUMeLSgVWn5OfZ+ipMCotnZwuY7ueGkrqH1CQRfd3+YBfj8rVqMuioJ3Q3XEb2oEEkZeA6weWrhmQPrxOPq57hMbCSBkZ6poA1+J7MR1NRO0uz478IdqFY3ebUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQSrQCC5Y6NYVMFobNsEMgUKF0Y8L0eMNURgSzFJfMs=;
 b=ep9mifAukXDFH97vd1sSQe2DGcDr/dgQ2choyryyXeHrrbhakjEnPygrLddbonkjRt7jXEpy5+utHn91fE0K7WJNmuWt8QXbaLwMGZVF8Xfzsvar/G6JZabbMWO5RIi3MPcCsRfYrlasiqk+5ZR8VDGNEHioHV3rmL9sjJvK8pBMsjHjwudvNQ9xhsozG4pQoZFHX4nqgoXNmqyFp4gLxNSz9fD5XES3GgE+Ht2TYA8MwQbzKwvMnx7FcQdJzJE3BbahSIFZ3mwdQN6VTcXClKtOEsCml8wf1whnIrn3q7dPTBaZ0Tt8ShjUi9bsWaEWdRJjDnk9pICDf7cvdY7d7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQSrQCC5Y6NYVMFobNsEMgUKF0Y8L0eMNURgSzFJfMs=;
 b=hZTllE7+2E3CtuN+qiFuVEFvKla8yifisRLyqt6WXxI0gNyZ3UHrtIT3LUwfGFzH92BNLjnn4cRPpPYWkPfnuf5GVam43bL4DM7AqA9fn9INmtA14CQjL0EPKzhqhYBYFtvzMqaiJmzxRxN/baSHBROHPdhP9dveOEWMR4W81Ew=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by PH0PR10MB5845.namprd10.prod.outlook.com (2603:10b6:510:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 01:52:16 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014; Wed, 20 Aug 2025
 01:52:15 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alexey Gladkov
 <legion@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Masahiro
 Yamada <masahiroy@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>,
        Luis
 Chamberlain <mcgrof@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Khalid
 Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org,
        James
 Bottomley <James.Bottomley@hansenpartnership.com>,
        Arnd Bergmann
 <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250819071817.GA1540193@ax162> (Nathan Chancellor's message of
	"Tue, 19 Aug 2025 00:18:17 -0700")
Organization: Oracle Corporation
Message-ID: <yq18qjeyd4a.fsf@ca-mkp.ca.oracle.com>
References: <cover.1755170493.git.legion@kernel.org>
	<93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
	<yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
	<20250819071817.GA1540193@ax162>
Date: Tue, 19 Aug 2025 21:52:10 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|PH0PR10MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 2544a390-ed3d-4b9f-3f9e-08dddf8c2ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N6Xe/lmxFLy4gZqH9tN7ok+fKH35T8upDwffquQxyDPRZIe1ND1kVPi5rcr6?=
 =?us-ascii?Q?n7YoxXHUc9FKC5r8To9vuisLT5CmGOD5Fveau1/3EevPx2CCdDq37CALb2Iq?=
 =?us-ascii?Q?h0BjirEaC+iKMvAatPznW25JG2Urz0/ZZ7uaakRrYFB6rPPSQRJBMHk9XQHA?=
 =?us-ascii?Q?I51Em8HXgO1SPh8HDzx9qgJHSsl/hm/eINzSPndY7vKsMy2RoeGixeOpyg4N?=
 =?us-ascii?Q?1ICaeQb99TNun5TNB1V57ZaMejQkkiDLd18w9Y86Fz/yekPFhuiQWJO+7ufh?=
 =?us-ascii?Q?dBn7F5XnIy+pPFe4A7ThMKdgwcA7gpWChf5BwCZhtYa6AnMuoCrhzTvmqcET?=
 =?us-ascii?Q?IZSotWHvkkW5kkXXWPEY7ZKtqRklU3S+qLihm2T1eRgO1En4Dt5KCFjq7qOu?=
 =?us-ascii?Q?1x5keTrjzS6N2McG23UZYcV7RR43tqHseWbJIXLrLOyoXQNKpZQDU16tY66u?=
 =?us-ascii?Q?wkULTaaPmyvwBDmN99gfFyktyfKB9NZCnjCA6eBiqwvompDXZYz9qcd7Q3WT?=
 =?us-ascii?Q?ehxDqG/1fmQTJ83LKpcQcgSyHzmQOvtfN2OvuQpGvtoBMB2zRxiHUjz6Tn+9?=
 =?us-ascii?Q?jevJej+ktRN0Ua/gmI9UB+ucCt0xAZF/02T1S1SvH56KM08vFungDtsTczJx?=
 =?us-ascii?Q?omMNT1+tIZ5ULmhc5qmaFFPpjZEyDBgege5hiW6RHD/Fi7MgmcxgxT5rob6W?=
 =?us-ascii?Q?R52nGwdhiqFI0JDDbP/lBdHVSTP+H0QA3j9JbtvqNbc6TEiIwRtXfgyLZIlM?=
 =?us-ascii?Q?BSQK3sqRQkt9IOBj702tQNqUxP4mhs57UKFs2sjLvxUYUqQzZPF8TYvGMX/e?=
 =?us-ascii?Q?1Lznfwha3/MavMqMRACCNole0vbNKtz3z1FeD3aRUKlY072k8PPtaAFYpSGI?=
 =?us-ascii?Q?CN88iB2uZfVFWV835C0EvwkMJLoF6GQIozHXn/ZWLFRA+O8Q7UWQxkA9swes?=
 =?us-ascii?Q?j3snmA60+kIP9+RZGNBgqAD+JpsEn/FdRR4n9OubRKKiTyeMW3YWi5zKaJ/e?=
 =?us-ascii?Q?/+z6ZrRYpFMe8nm7s4gjpstVB/2xdgXJNy2ArJ7KLIK01f+cwJb27Kw1aX8z?=
 =?us-ascii?Q?q76dwKNiDbYXWVtD3Hf36Mty33Ba9t/CkQd36f6ZoRD5JhEtnM55eBvgtGD9?=
 =?us-ascii?Q?06g9KRoZKuoj0hy0pQnLbq1hbWti2p8x1nwPLj24oweDVylx6Ph8fDuTIhiL?=
 =?us-ascii?Q?GJCxKGZLUT9APgImje/wFcuk22iZrANqQFbhO5jGZjDh9HQ3aQ/ypdGwuW1S?=
 =?us-ascii?Q?xwimSyBEHpoRY4sZ3xaDGF4mLXnrlF41nDIKNdUJbYJWjX9yjqYkrGitI7qU?=
 =?us-ascii?Q?h6XjoLqjlvORds/RyO2Xmvke0cBGYc932ji6l94DaNPuKA8SgUN89T0hduUR?=
 =?us-ascii?Q?aOzrhP8v4T1V0AFcl6kC+lEa/e6pldUr3JYJB5q90bgUkDzQEvZ3pvhWBiPT?=
 =?us-ascii?Q?hNG/I37ZfpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?apL9mgye3j3FmKEMpJ3Mbe0SOvRGrogTnqJUIJRAmcgGjAtMmFTDe//Bz97p?=
 =?us-ascii?Q?IPVZguKkY4pgTLoBdlAmRf6T4lHTjYhmBGvT1zsJt0nUi33RXvjoUjNE6Qan?=
 =?us-ascii?Q?3bearo+8/1eoeNjBUWPFm9h1oqMMZLLmg8cOmRH8Z2m+sfY3/g2k2L7F4xqM?=
 =?us-ascii?Q?Qc2KKk2IAuI9gb9MDM4i28bwor7RKZPVvg5vFWDZAETwJCeo+692bVL8EXLN?=
 =?us-ascii?Q?eZ68xLsAi68aSuihvuhDHXDoLV45AgFyjrGrM0JWbFXFiRmDf0oe7/4XNkL7?=
 =?us-ascii?Q?+7LmYgUJmvHqLOTCFQ2H52a7u0OWvF9fyGk52jrmFPT7ycgcsDj80L4BtZdo?=
 =?us-ascii?Q?DfqBPXU4kRLJi1s/TR3srYLOTtSWIEBUSAzCM4fMoSvxikHbsCDLEEnKZMJ0?=
 =?us-ascii?Q?Zt0CN+LSH1lhHaIhbbKweVilRVGZP30S4gtcShjDCJNgaHdnLYtMfcD6gdcc?=
 =?us-ascii?Q?Wy52TrWjbT+lvah99dlafiphkGUKZBB0hRZ9XSV5mgx8udvA/ZFEr54+BYHh?=
 =?us-ascii?Q?7ju80B/XQ6vrpzi78BAN431b7OEgLx6bLudgs4qOyFft+ttKVFmlGvNjdMd9?=
 =?us-ascii?Q?Wj/WlpioCb43fqodahAGXQC3t4t7tCpiY4wWoRmnKT/aSTXtM2LniX2CfWtB?=
 =?us-ascii?Q?xhPskopnm6HzwLGxo0ryxz2mgxDGUYPff9xe1NBtEhD9PnDmYjGrnHODmPPF?=
 =?us-ascii?Q?yCoQOSa6JTsJfVixKsq9IgfG4Vb3mtfdjBtNX9Dz2QxJmk8LmpcoGznnzBNy?=
 =?us-ascii?Q?o7XxLEcgojLim0Dp0uhScq0ZIqWZmFTM9sUephf6ro440/4CRdWfpJRg101q?=
 =?us-ascii?Q?lxxVCJTt54KBes9pd4Cj69459YWTwHXwMAXYmu2Bljvg6KWQAZVbqL8HtStv?=
 =?us-ascii?Q?GD4uuAVgUjxUN2t7yRsV0aaxVhgZRdTKHVy6jJLZlEWLTCxQAYjwPf95ZjOI?=
 =?us-ascii?Q?NDz3OYiNl0ErZWb9aDjPJcO5r1A4H+hIKW84chEMYgH87N/CbmVa65ih0nYL?=
 =?us-ascii?Q?daeKmtKq10GkrslXlcOfI8jv89YAXzI3fd8rmKUQZIJf2xoTKbhfKVm2jR3c?=
 =?us-ascii?Q?qe5tGeDCBWgAGgw9Uq/Bre3qxJUemnOkK50rTRLhOHS9Z6u+eXc+jremDPGD?=
 =?us-ascii?Q?WeTWUJcdqPQK7YQ2XIrvBL8/zggJe9dXwqWX7c9WomiA3eTbZIXsKMUdnynL?=
 =?us-ascii?Q?dlATEew6E6kYxlFMSWT5MBRUz6urpT4zrHGtjBh1RwB1gso9M859TrGgKS2P?=
 =?us-ascii?Q?In0wVg0Bu6NZE9eCu+zl5jVowCOoVhhiwjChz6ztGGJaIpfWcxVE72/+gR6m?=
 =?us-ascii?Q?wM4BnX9Vt+VumhMknw6hcw4PHpn2qPKPTY4rYGiP1GgODKzgLZS01MlciDbq?=
 =?us-ascii?Q?l61NAdmnW9eTgU+A4OBkZfas42cGrTZAYB79VCd6p+lc6b3+DxPIPWlJOcFb?=
 =?us-ascii?Q?mPmYTNwzjPFCjz+n8+PYZeblQni8mLElKTsB1eJqTnf0I2UOvglNW8DkqhTh?=
 =?us-ascii?Q?w/nK7Is/pyO6aGY6vgWxNfvHTeHDs05q99v2zhUBtsLhjGSjcwF5XiuCdfXI?=
 =?us-ascii?Q?O4i0rS+4yRQwDIVk+Qj2+4wVhTtapmCDNF/ky04PC7VfQfAuDISA/Tk1uqKL?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IXwAFsW0io44ePIIkDT8hhX9LQ5284T4hWQEdG5mVPrJRuXwO7UVPMJlLFsCp3Zdl0J1iNNgTQec44l5TJFcpcnOv4V83aobfYl9B88RHOY0qJZB7fZH5uMpvDQVynBw6FZ4P/vqD5Lk5ssVQ3QKN+SzeFcpRVZY2WOTK4P3mu8vkSGrHB8+8Il43VPYJ2t92S26dhmBjYurRmbkx7Uc1jIGNV1mQrO1CnPqyvopMSZSusg5Yc++FcpdAZZdMSYZXRBTgLdNoFM210xFFtKD5kw4G28iYZQNLMV5MqGTMSnLtylOd//yaBY55wQxt4JOhhB3d+7yGgyGxc15Dc6NQDVY1BlkTTMJhHMcM3IN7Q0EY4CLQW2mIaa5p437LQ73/9aFL1ZwtivP/eHKOmpui7RAhGmiyaLtF/xSZLewcx0/dDELvEWu67lqhUr2c+ZiWPUmPcjgCkF8xuyuJy75WQ9H0UXrDqm4EtFo3G13vBHbh40myOyIjK4ObxnfFNECL3yHUpqZHsna8ZUVmehvrFxck8ei5oV4ah5HiddrHkNGeG6mdd7iRPML94S1Htua1aUwIoOOl49BDf3CjJ3HTSRwER3E5Sw9aR8l+XmZdjk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2544a390-ed3d-4b9f-3f9e-08dddf8c2ecf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 01:52:15.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYujTlzyBxoEuEvHTXZbsNj5dApKh/O7dr1trNIce3Mb9c9ktm19TaOV7KjeTrc0rEUnvD54Bi8afBmRBC8vOz7NdYHWRz7bBIZ5HSSqd+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508200013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfXxDBEAQH1WfJK
 Y4ICSgZRepUJlq2of1bG74T9Vy9Nry5t0FDMM+SsXI4S1+yyNWC8IJ6V9lS+8xeF4uEAN6pwH5d
 cgcMfLRfaPcqNffyk8SPVj/ygJhCbRUkVGvVSDXtDyVa75YTXyVhutiIN72qdv4Al5mWIUahpiD
 whP0NTJTLt3dWzse4MBpZ0OvvIynUIxDRrBVPlYtKF2AQQ7ZHzD26I5sL7GiBVFss1RiTWTQTVp
 BwZnDZH4QYmG2ONzGQEMmc3Q50xZYma4VRCkIHYeyD7UK7dvgcyCTbkDSEPZWYqdSgcwtdGe8AN
 Yheeiteml2g2tmDMmm67ueLnTDmVpCotKadmOu0DrZwlRIV2IIcoYI++bKO7N6vHs/+MX0OHITd
 ZLCDJ+mQIbME3dYBcjid4bD1F0j6L3irkFTthJs54wAa1e0g18g=
X-Proofpoint-ORIG-GUID: JuPu55ZXh8jMIiZfoNNL6xEPdFlkGv-0
X-Proofpoint-GUID: JuPu55ZXh8jMIiZfoNNL6xEPdFlkGv-0
X-Authority-Analysis: v=2.4 cv=GoIbOk1C c=1 sm=1 tr=0 ts=68a52a54 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=IPHRGFckGet11bu6E8sA:9 cc=ntf
 awl=host:12070


Hi Nathan!

>> Applied to 6.18/scsi-staging, thanks!
>
> I think I will need this change to apply patch 7 [1] to kbuild-next
> without any issues [2]. If there is little risk of conflict, could I
> take it with your Ack?

Sure, no problem. Dropped the patch from my tree.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen

