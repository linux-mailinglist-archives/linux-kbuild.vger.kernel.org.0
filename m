Return-Path: <linux-kbuild+bounces-3160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0533C95BE19
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 20:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7679B1F25B17
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243681CFEBC;
	Thu, 22 Aug 2024 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ohTfAe/4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f3C4/zor"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F2B38F9A;
	Thu, 22 Aug 2024 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350804; cv=fail; b=Ni6Gzjv9kf6lnmyUIEPqE/zMMWQhxFvTC01qdXT25nsBYU98BfnOH5/2d9eQNodItBPy8DLHBmJEk5ZuKSSUEDaSrq+pIzbVhySjfhGKdWuCrlxg2ogTxsrsKly4+nrTfiC3dt3ZLC/fQKMWBKT0bKLiQlWaLBggXJk2ami2WkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350804; c=relaxed/simple;
	bh=AMIWnPPxp35GZNBIbVfCD/YMaTN17JvGPL/D93rUAxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G5yJt7e5l8qlYY9BR6yrI25yxWwhY+u8UcLW+tZpzfaVwVafDvTm1EmGzrhHZ1A78Je3cbjsKGERjwzyJyri1t+x52H52WMTITlQeTDq8MUrXXOHqOeQv1YXJ9VEEJZkxyqx3nryF/e0dDgJZUEWvWDmpBM3JGIVyf8iz4mc8BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ohTfAe/4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f3C4/zor; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MEQV5m028668;
	Thu, 22 Aug 2024 18:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=MaBtw2Yeg4samzeg/WoTfxwItfmeN6axk475xKEGKX0=; b=
	ohTfAe/4KuIgiSh5F2Xb/qCMjFR96DI5Qp/Pbx5g9wKZi0HMtEjB0hp/8C5Tr0ls
	+UJR6Pri9Cv8Op+2g7xkQtDhDxsGPlqgak/DKWMMht2x1Zc3t0q7gCDvGbCBkcKC
	vlgug9AIIo7lBWW5/MRh/gez7AZxzHZyb9Gz+YLMgMgLLBnvQLllr5/Tt/h+Dgqn
	QcyEVh6lZ6/KMwHUkK/rfbGqXLRiV+iOSMJ5g1K66EbLgSkx+6lN0rqHBztzazmR
	w4Rclo6h8iRQE/ZiCLR8Ff6UVaMCA5lFayH82tn9//T8LdfvZzMMi+r1Hd86axU5
	eBlfuzEq0FECqvLQU1pMew==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2djt1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:19:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47MI8X2M027569;
	Thu, 22 Aug 2024 18:19:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 416947m911-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:19:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXnZV2OhOJzt22P/dZlcQicS+Uk3nm+m17k+5Qma4s6NiqgYh1Fhr4dxSVTx4hIKSPOEO0TJgQpAAN50A50gB9g5FXRvsOl/3W5Hiy6pV+DeCM9+6Q9fq43oEHsObBaxF69tHLftEcNvQaRJZkCon/Mc9ASOAtO+xbtSidQz7aOlXR2YpQZmH9fIUcg6jaP4If7k3ALbGzmEE1eLRagR2lPJu2WX61X+MLH5qBSpRm8LhVtAA+Ng7rOy6Ws5CnMwsviN6y3rGxl1AK0cjhZjEGwxqS9ErPUUQ6+ZOX5wAHMJ0mWjwpK9sImhRo2n7+eu26GkC80VBEWv+TTmtbobQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaBtw2Yeg4samzeg/WoTfxwItfmeN6axk475xKEGKX0=;
 b=Asa4xx4udta/Ixp/ba810s2KKfYf8w2oqxbdtjeamT0MGNzPw+FusViPSUJs7FexlEhI7iA4EU9CO8fWokePj+eOo5Rt9Xrl6y1HyImOo/Wke3PmUsr1r50pWcAOoMsrGYbLu8LGUlIB3xVdGZ+MCMcc9oR6z4Ic1gYov4/3Ter4qagiEXYJtk0nO4+skL/Idq9nqQBonOImWgsaVVleLex/vxS/zcFMf/UKv7WEs4r1wQxhrFpddXzJTpj0LDmOKNC+/kz2rsGOm/IA1MN25vkDXZ04zkOm6a12l89EPRzCUFBzRcadYeL7OnUVHv+pYD8gvQhlSia4Sk98FYOvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaBtw2Yeg4samzeg/WoTfxwItfmeN6axk475xKEGKX0=;
 b=f3C4/zordtoQ2mMSWHUknyTNjFGm/NYcRKUFdOEM4gt3xo7vpn2rlT7uhAU1ixFHejqafdwVCeK/8aDervua19Sde8bLErO7CaKWJVrgDoZ6K2w9rucwkdYUgpg+KEiQ+pND+lkbkNFrnPYkZkOV+7PeKCT/cWZxPonc4OUGN1A=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY5PR10MB6094.namprd10.prod.outlook.com (2603:10b6:930:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 18:19:46 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 22 Aug 2024
 18:19:46 +0000
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
Subject: [PATCH v8 0/4] Generate address range data for built-in modules
Date: Thu, 22 Aug 2024 14:19:37 -0400
Message-ID: <20240822181942.2626536-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821040700.1919317-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY5PR10MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cee136b-b5ab-45c3-ebd1-08dcc2d700d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KEon2BojBTxSbUDRCfbYmMRDzuCQrJ2CZJDKckftbCXMFBC9hMKpfVUWGRnL?=
 =?us-ascii?Q?rnnb4rV4xcljycI7kK3YYwCU6rk4Hg3c3k1KE0ngfVAahNFgKG9tP4sE6wEy?=
 =?us-ascii?Q?45QK2XEazzXsrQIrIxDoOm8MAumoZl0yBsAyp1+T8iu5HKXsr6UgY9RTpu1A?=
 =?us-ascii?Q?aAxF0bsPvZv0XUrcfhrUdedUczDXySGKxZVby2Ar7hV3bgasiawkXIsnM4vh?=
 =?us-ascii?Q?dXHcGAZa9Aai/oNn2O1EIpF6Qs8uLfOMME+EfmoEjCtDDBRHOdcc3ms2ixqE?=
 =?us-ascii?Q?DTsqDCiv9Ca/WeeANrmTvokiNt3ABwMeaP+5oph0h+pxcRbHmt4Xa6j5cr7E?=
 =?us-ascii?Q?FfjZ+L8nr+xbQuy/18mhWH9sdJWuKcY+SHFMeDqjC5j25b6jv8WOpreDrPfX?=
 =?us-ascii?Q?BqODVEuVFQkiWgFnPv5cbFXdvizB56MCU7ZnW3jc/sPNCYg+DDZ2bozdVa7n?=
 =?us-ascii?Q?3bVNe5Utatba1ErJ4JvMsWgVy3cPjxBCSFB78/6+vPZFKBe8+7wZ7KpOhJed?=
 =?us-ascii?Q?T4Upd7HE4Q99aBg/c1MpsD90f02m1B4FHCArmSE+KS4OlV0u8Q012k9wtl2k?=
 =?us-ascii?Q?akEMJdqEtmrV+3YUGSVV9KzA3VEADFvmRg6kbvihzzsjZ3Co+ZwyZG3RTxiO?=
 =?us-ascii?Q?DYkvMWsSG2VpsrZVnkttxNKSHNrvUKFYqdf0ODMdJ4VaVn1FzY7x+3o9k9/O?=
 =?us-ascii?Q?gac/f+xZlTxK6uuJ8yDTwAOCQHlcql7cO2cidmYnUn1s/gQUFoagwbsd6b94?=
 =?us-ascii?Q?nbm8kPe+30gkF3IeK4xeHWQp3vO5inMLGCvnjeUbBzaSAZE//mAHe1Puj4+g?=
 =?us-ascii?Q?pVhvGSkUmVfQ0yKi95K+1ZPJRLefsgCw1zEtcSCLN4oy/ImVyVxl27qNnqL9?=
 =?us-ascii?Q?MveOW6HPOKjoQKiB0j3Sd8eDCcyRR6QvQgUtOuUdVn2VqgqMHK6Eq5cKp1Pn?=
 =?us-ascii?Q?Pqf/PELdc7cNA/mG71XJpEN2/raaqLvqTmGs16qEe7YuVSBlUOgmfNKcSqYQ?=
 =?us-ascii?Q?kbgwv1exgpBM20fXPpco8jyuNn0sAe4QsRrMdN4hzLFrEQwKSawVAe78rJng?=
 =?us-ascii?Q?hdXpRmzZzBpYs86SRand8txAvj54Jc2uOiisDdYOU1x1nbCxWfWzzNr3lYzk?=
 =?us-ascii?Q?5R2HLP4jnIzgs4lAT+uZbJMHbvkLBEx3l+ovpHK59mUHNoXxDtW7TrgJT3I9?=
 =?us-ascii?Q?tgrXZlg3JOs/e8BbGj/EK1iI0GK3kaomL8nE4M7OD6aHBfcmV2XwoEQLKHpJ?=
 =?us-ascii?Q?Cl53x1dn06AeX1OeCytVFtVbKFHVFGdEFXGR81ZcehV6dGmOTjD9kB7L/TNs?=
 =?us-ascii?Q?0vC0jno+A6gN8F/ACArUpHiqZyTpi+Xvh98Lh6FBp9aNuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PAxDZyUDOTuLYzwjWKkuVCbA13bH23jFehhL47WFJRVhycTAME8C1rpiFpco?=
 =?us-ascii?Q?4G7uysb1ly+l/WeFNXZLYG2vud7Ugpv4lLBd+cfMWAVmv8+E6el65WhjmAWX?=
 =?us-ascii?Q?ve5Mvz+9A1gi3OPbD4p7zXBjiiqUFKfcojubgvN5RZVjkBSZxCW3PRaHPnR9?=
 =?us-ascii?Q?YxKhGNyPC2r2NIAxisTixA/wMIoQ7ZhNS/Eaqh7l+dnZNcU710kRnzssVIly?=
 =?us-ascii?Q?s9fzvdCK4CkZp3Q/93E2z/FQjAdRCHLt+dvhq6ilM9+CsAopQoseICNeU2n/?=
 =?us-ascii?Q?ITaZTvavY+H/GcrebmumtfdigKlOIesB6rlCnqxrYqLqIFFeu/uUdd8w5YCW?=
 =?us-ascii?Q?ZJ0NoIsqg5yBeeWEC0KZakf7NCRJhN9GLUAwt0yaR3g6BLJiX9VvdASz0k21?=
 =?us-ascii?Q?f5WL6ZPw6Hi4nZoGXdkdRXK43RyuMleE9mQ1JmkWUnYh4Vo2TWrZn+X7WYHb?=
 =?us-ascii?Q?eOkna912ujpLip8aM82wW9ukIbB24EYd0kKiAjawmd0b7T9evoKSGvzWVKkp?=
 =?us-ascii?Q?bNBag78d/Wp8W93vYLxDgiNk1uxIncnYybhdX748jnXiTEcxsNpEBA3X+RXS?=
 =?us-ascii?Q?WQjN0esXsEQlS2mNz85fDhHwaZtQ1qQen2j66PzJ3fN5Kd6IR0peCsJN8MPG?=
 =?us-ascii?Q?ZdKWnr4wjxBbuO5z95QSyCTYYmB8E/RnRUkHvr+usQevso4ojTCrl3m9sQ/m?=
 =?us-ascii?Q?suSEdvcy/8P12v21ffygiP06bStnmpEkgUWIlYF7VSsQkUE+eap6AIcbc0f5?=
 =?us-ascii?Q?L4gwK1ekX0i+nrCf8bFJnmJcrTCMGr3SfBbh4K3Fv5ZXXHbj7bo+itDpf3U6?=
 =?us-ascii?Q?iSVAgovinB/0pPjqyotWhj7FHT5fzaIWAAE8ywbnQrPipoXjBJcDBystYVvm?=
 =?us-ascii?Q?R5xBVPOGljFZuni4ZPdmkXVjNg/BUi6nKzM4psQTcwhVzukKrCj72xcTatqS?=
 =?us-ascii?Q?4CmrrBRG/o1MJe7gCmQmSGyvVPjDXwSWP27xtJ6LKyS64f6FAJxBl6HCnw1X?=
 =?us-ascii?Q?NSnI9GA9UsW4LmNqLrLPnF7NedPQiYDwBdHog9igcwjXsoAsSX4xWa6rX69A?=
 =?us-ascii?Q?fMNvNaxsgRy/6vMQwuwObyEIt9BuGdsQpQyfjV5oyzCkua4wZIRwEQpIGxZn?=
 =?us-ascii?Q?8Z7GoeElru6mlI+DKNBJEonNSIFpMyzZ1T+Dj3+mJcUtLrpbiMnfJsBkJ5Ta?=
 =?us-ascii?Q?g5adoqlmgC7mELHlqxRi9ASA8yXpkDjY07X73gZ3PslE/1q1E9eCRI90L0/g?=
 =?us-ascii?Q?GnbHSaiA67MGp/kw8qajjaxPwp0ThXdhTWp2z88J/uM9MHG9zfxMEomRzCTw?=
 =?us-ascii?Q?iiwgB63w86leNDFnkxAKCZv/MhJ+e66WCXP7nNnCP2gyIwjWHrZSR5OBTFZ1?=
 =?us-ascii?Q?ccJS4lMTPYM1N5Sf9cXiH4K1pz+N0E1hoNGUQlKjPm5Ut4azktM1/L88YGDk?=
 =?us-ascii?Q?RMtkONqSNBacFCoa4ztirvT3bEceFiq71bbPifHwClPodP4GU4Av4b0hpxXX?=
 =?us-ascii?Q?2uu6lIbhgavgs7e0qOzfvED6xc0YUX4g4yKkR5gQadHyfdnp76WrJY4XU2ak?=
 =?us-ascii?Q?cXJm83qr/o4P9O9uWnVn+ifc+YsENXL7TfJsH/fquT/qHuMlpV8GJMcXKTei?=
 =?us-ascii?Q?EynmRCoqnI+2aGWqcdVGMe0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OifsgjoLUqhFHzc2GmipRak6h/DmQKwazR0gEweuQD0XRcQaaZsAQMeiem3YBnXl70c8mtcFm8sKQvaCYmPPHxXfwotIJONZw4Ho51qVJRwh/3zznDZEjfBci6DThpaJQ0PBG/Aoo8fhhNYXmCNMJ6u58d/Wk4QZxkQyHKRV5htwcIo5TSXVMoF4GaXIMWWoRkrWxrV11WuKfd+u8m9e4VqYP5qaIsvoB6H0iVa5GjQYbECu3z6/2R5Sz6qFSdOniXrcmVoVVX4B3sTSDWSZRm0gohgJwFN4EPkLrY4N4Cfd1ff/oay/n447NlJZaZ1ww+bVNASfElLsxJRcTiNCwuhBhmQqBmekPnWoN/A8M6ae2QRGj/USS7w0BjiyqLAW7F2+7uAoqwXR8zMnyYrOW9TJzm0Mp0KVWg0MEOWCecwI1DvVo9lxsLxm+t1cGXdfTr442M8Tldb/GwDq/WLeSL66bOIVqg2yH/jcpJEE5GPLqEZUuXioOhhxUuaH/TPyxjx5oLVxm47GXXY3mRRjUWTk4+J/ANIuhr9YS99HXeYdzkWdjHV57a0CD5BJCGN/zNcyhHynxgE+WrEiPFFkz0ofxDftr0Qs3W+36o0Ldaw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cee136b-b5ab-45c3-ebd1-08dcc2d700d6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 18:19:46.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlxX4beMfzHgryxCBIWv2eg5YXiHyLOfc2PEpfpzX+NauBw0JrsMKnn/OgScbKRKrliOurcPLnRClkcfd7uLBEIRjWHOrTVwwIU6C1X63/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220137
X-Proofpoint-GUID: 6g8AJqpNKNoX5LMfghKp_vuD656GTCu7
X-Proofpoint-ORIG-GUID: 6g8AJqpNKNoX5LMfghKp_vuD656GTCu7

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


