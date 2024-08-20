Return-Path: <linux-kbuild+bounces-3118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B7958CE3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F951C21EAF
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126B5196D9D;
	Tue, 20 Aug 2024 17:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NwhUgsGU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q3OzLZFh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92F018C92C;
	Tue, 20 Aug 2024 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724173924; cv=fail; b=V+/MD4A37xUVaZhLUtRZgRuWyPyf2NLIsjdQg545nEfA39fx0LYl0VBjVhk8Y+HtgtgYNW4X/4ZwzkIv+QKyzb19nOzd4yTmiosRTJGl9HDEkQ99Hybjgje6MNTsnTumnZ8uV570R8jZd9GGW7ELxqcpYPwacYaUWxhC5EQu0ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724173924; c=relaxed/simple;
	bh=5q4d79WkNKyzKqyIRkhE0sQUz4/urhyzGxBGisHGnzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAsHGf1mZYniayEKRuvYNtFp0u3f+BL+Y0V/LmMLXN0JK1sev7c3eo2iLcPaD6+QO/8bWkHkLIO50okAuI+WgF3OVNfRINo1lMFzR6Dhnxq4D0RusLIYbiuKcFqUrFwSWVK9WS2QY+p4ls5Aw0zJqnI/SnzXxKGPKCSFnAkfkyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NwhUgsGU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q3OzLZFh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KF9rXe027297;
	Tue, 20 Aug 2024 17:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=wRFJLKVL6ltDWnJOcYofm0SS3Fkt61EWmaaebPIeFms=; b=
	NwhUgsGUkfO3CkSO3lwfwjHnR8q3rQutdrWwy2SoS0AW5oU4eDvTSiCUVHkuduIt
	5uKbbT3K+ozS3bxQnGnIx7Al8Q8JgVyS0S1kO7Ds7H8hQtZrPPcztcbW2DqGq+Wb
	vTmWKwYNr9xAK9DwnpcgCrJ5euT401emrTB4GyU0yxtXl7psLq8Ea42N8+SoM7K3
	uf2MLBnHmGGoO5N+Nt5ZiktqNVpMIV/X4idgepVh2mJ19DCBfE4YwELv2oYU70LK
	Xu7CTImJeA41OMoTs5JHbeeGxCaqLzzj+GRyngAUREI3IMfdxXw1Us81ZmMlwiLm
	o0calgs/NdNO1mIb4Y/S4A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gdp50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 17:11:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47KH2uJW016853;
	Tue, 20 Aug 2024 17:11:50 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414x6gug4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 17:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjIueLU81QTqOn4nl2nZwm+QF//vqAKNZppSeuEV6MOcoL6Djq6DQLBA69RkmkCdsFpWZcIG9I6V04K4S09+6eR4yROUXw1glMdjMC/TqWkEsbwBn9mj05d26/TJjbQIvCRXYq0xePdTbp89q1A0qZ/DlGH0nyQ31s3g6K8DOMGXNAB59jq+NcSHSCj1Du1dRJvmnqemZyVxlTB1U96zOd9r927Pf9X1q8Z0ArvJT/WX/s09+rsCX7+XbwSzeH7vsY7khMc/v/799X3AKtJ6//YDU7rBDXTFHY1Bok7Wo71TRTwQ5BSAmpJehiC2Z23tOaDSlxdRT0xJ1C3Kg+hqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRFJLKVL6ltDWnJOcYofm0SS3Fkt61EWmaaebPIeFms=;
 b=syZOBH21dWqtsR9rUcC/YZn5OGI35KaVNjgwS63mMlcllB4rm7JQE3wjc+NLBAVKwqdczKhqeVswn9YCPjv/QDj+0McEo3pMa3GYv1243KJiO/mqbarweVgnszOUF/HKThkdVuwI62ea9eB7ZHHpWso0u4VoLfKqWl9XrkkzNmKJRYcmbwFH1KDK+zk3bsT6VYNnOZwW+t55TmtJaf9pAR5Lo88ImNJco96LXFsrprbitcwq5iA2ri+p81fJk9Q2rQ8JfC39KWanfCnEyMtlMfEOKzt/8tPRkC8l6uKWbO7OcCRB/DFedFybpVAqdIM1UcKKTnne2hqotSRA26U6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRFJLKVL6ltDWnJOcYofm0SS3Fkt61EWmaaebPIeFms=;
 b=Q3OzLZFhXoh70B/qqsE3XyysiKCe8DWPOFgHZjWRbuBxW/Avn0sAeEQ1xo59wI/bXNQIiJoV73C9X6Ez/69ooW1UraLc0GEuA8VH5sAww15bah/TYAK9ZHfXfXz8L+LtIZXni8b75XI0MjdGt/M78Ji9ChbgBi6WS699OQG95IE=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA2PR10MB4636.namprd10.prod.outlook.com (2603:10b6:806:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 17:10:47 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.7897.010; Tue, 20 Aug 2024
 17:10:47 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
        linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/1] Documentation: kbuild: explicitly document missing prompt
Date: Tue, 20 Aug 2024 10:09:46 -0700
Message-ID: <20240820171000.1656021-2-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240820171000.1656021-1-stephen.s.brennan@oracle.com>
References: <20240820171000.1656021-1-stephen.s.brennan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:408:f9::31) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA2PR10MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d519808-b751-4e6d-2c99-08dcc13b0878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4JayhI4RCWtfKSgEi2dC2wj61BRqnbQ1pAlMgOzxX35wh5JYGw8Wm0YK37zl?=
 =?us-ascii?Q?ErtmcZmyMzSkmQKxEUZ4PPrfty41sCe9xYVBAYwZsPPctQJRfg4z30EzqlOx?=
 =?us-ascii?Q?RiXtVLMe8AyobQ2BIp2WZUSuxTWlL+jw1lETPTVHQwrJ/C6/okhd0yrcK7Nb?=
 =?us-ascii?Q?6sIS/eOx1xg1kvzsOLaaN47BUU3KRI8YK5KeonfCttofHlU2IIs29+0/xgmM?=
 =?us-ascii?Q?DGCRw8tPkqoWf/Ow0ophucsfr9+FflzlofHBCLJ4z0Jb1bUYdPDhFkinn1yA?=
 =?us-ascii?Q?s/m75rrILEozJ8cofSA+tVnyk5OMnDTAZ+f84yNOXO27U36n5UUMHoHD7dGS?=
 =?us-ascii?Q?rK5EVlyFpss66bJwna+WxaJLEksmSrldZmr0vFLpQ3yobX5sUGVGq4hGKZ31?=
 =?us-ascii?Q?nTB8GS5eGdJNKvOihFEbb3NrbiU6vKqNJmVVIFl80DHt96s1exJ7YyV+ffn1?=
 =?us-ascii?Q?KpX/csG30lHtRnZqGPge4pDRkyfx+d6NvALpQMwYKro0FJIyb04tjpjxocp1?=
 =?us-ascii?Q?1xB4Y5d/zVrA7kdRsshUpQmGIjZw7lGNBK5NxmND9L7E5GW1eeHOtY/bKxH3?=
 =?us-ascii?Q?lUo/BaPaXyym7rIgdxBqhJAt+D285GYYOA4VVSwIwfgzINRNKE4jrntLx5N6?=
 =?us-ascii?Q?zNQ3RL+4NYaSkMcmxkBWmvnK/OLP1FKD9BwgFK4IHNukfJoUmut9mawH1qQD?=
 =?us-ascii?Q?YNz1Trrzx2hamGMg3EvzGrqeCr5LUcRp81xIQz25m9wMhm4fgio4iREXflBr?=
 =?us-ascii?Q?8glYmcaV/IRBYz/fyorV6PZuFKVLR1nO9qbpSYQGAUqPtGaMtIzZmrcxRPbz?=
 =?us-ascii?Q?mZnIdd7jV2NP84L3S9mYEAJcg3eqE4HSeOTmLhJ1Rh5/A3p8u1jG9GDJHYCD?=
 =?us-ascii?Q?zYdmtTOqM+BWvMOaP8L0byQ3pqz0aY07NG2E21X5Mm9hbCiP/wsct9SFSdav?=
 =?us-ascii?Q?al4nobClaSy1y8d2ddUzaxbWWU/2NXKQMAiM45UBbmfE9mTPHwUH2b4oLQrn?=
 =?us-ascii?Q?9ZdJAjLJgKzBcdXlOVQWyq3f+p4/gAjtf5j/XODryTiv6OJhurZHo+/wKTJ+?=
 =?us-ascii?Q?jdqm6xAKmv8HSzs3fyHx/ETmPCKHzUV1fqyqBMIwah3CY6ZTVHmRRxxOi6U/?=
 =?us-ascii?Q?KwVkdnrPmW3707YULCr5MYok3bXMRAguihssZTAJ9ROQBx+45fDlBRJyP5WK?=
 =?us-ascii?Q?eHRfJeHIbGeBwTuZWBObya64NaopPaPG6pJBRMrDOPTGumqzWxMMC30YrM3Q?=
 =?us-ascii?Q?gfpEeD55dBBpZOWAOZNimLFJsXF0OsEf702sWOZkSk5VZZdvIVLXy2wKpWjp?=
 =?us-ascii?Q?9RlFRAk1r7y9lWkIN9/10pzW41EiZkL46FcWdZFN3OsLRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v6HeSCkFKdJjLw5y+yHJxjBYnS4og2YWT23Y4muePgitkEjomrw/kDcVTPk2?=
 =?us-ascii?Q?FEkgfjd8FtJV1Sn80il8caQP1WPRVcNvXzWDGCczNsuD4wJMIbjWzKXQu9Vk?=
 =?us-ascii?Q?qc40I17OWJSGl3ktC49+H/7l6rds1MYVx9lgdc4n7skJsx+vW1L9ivdlZVdw?=
 =?us-ascii?Q?IOBOhivHRClUnAXkxQyt80nJf7DDpnvuwPJ0vQVMwv6JRXUDny6W8dzc9Rem?=
 =?us-ascii?Q?t2xYlNFcQXktzJEJsNun4yUL8G6n6VKKGywmCJLWuXqoN9S2g5SdIF9ED4IE?=
 =?us-ascii?Q?kLB5QkTMQSEjbxSE9HXTiVtgj1gjPXjyN7nRLTyIJIG0rvhSUDaznzvEgMgD?=
 =?us-ascii?Q?7J+VnTNzYZ78yG2GNQ7Lmvwl7kptU8HuZeOxfRIg+gB390cEdXbMb/p2lhb3?=
 =?us-ascii?Q?mo0F1Ry/IDejcKVs/nWTWORJ2UA/Q4dei68Gp45FA7BpCTqCX9TtqH+Y3xpK?=
 =?us-ascii?Q?pcY1epsZ1E/Eds2LsvcsvDv2Ymw6UP+Utep9HFMHbWx7a3Ia3YsIOG0/e3YQ?=
 =?us-ascii?Q?0G6N+lmaYu2wjK86iksQCn0Iu0uACs2e0uaiE+pzjZHAslhgcGmUHnWG6uBq?=
 =?us-ascii?Q?32yA2i066wsmppc3Y8cZ0GZ9KpTvot9ViJxXXq2YY9V6qnQQHqa5SGCVPqdf?=
 =?us-ascii?Q?w5sv/wQLWdnQSEjv9OgSV/SRh8EY6vGY+xFeaRO95oIQY0K5VK9n72tpl94x?=
 =?us-ascii?Q?EFwCixsKjqJppqcSRt/o7A3ySvF2C9KuFZdqU+7WmHYd6AafA3zo5dlypskR?=
 =?us-ascii?Q?fAwkUSxQ1kCSymXxkfyQkaT3i0Qk25IWea1MDxoGZee9BjgEvbl1yn8P0Fxi?=
 =?us-ascii?Q?6n0hth5rf77QJHgFpd2WnFkKiHAmMZgscdMaZlD7ZTkGGxATWeQc746FMRrZ?=
 =?us-ascii?Q?j9ErfuhDwoNaPc7tK8j8yWS+T67JO6W+/xMnYHiHkW90DSHZ3XxhYGio4f4M?=
 =?us-ascii?Q?qereiivQFFTKQED2WXExr1yj4bfhU8oBTyvtKCkgVo4hwvOZyicG0H46liu3?=
 =?us-ascii?Q?kf2jn1oxMg1ehp7gLmmXMXW5XMbS94XHItfQwC9k0LYkKYqf35+A18sxHG/Q?=
 =?us-ascii?Q?neIPoe3YKD1iHo2zglZZCzge0jRX6gfUy5ip35CTx/QCvLcEmeldnl2Xo3EO?=
 =?us-ascii?Q?2naN7x/CPUWq9RJEnSwN4SwtCn3yyhjtdlrKmYjzwYp/eeR/qTqNv7J6WkQe?=
 =?us-ascii?Q?f+3cAmVAM6pgdVeJGoo6HTzQCFG/Ya04wbkjayda9A8lHSRZkFsjs0e3ABXT?=
 =?us-ascii?Q?fzbEH8sscw1yKUfAAv5JfBt3MpAjjoFWQ8XL5SeyL5lGP86DTgvP6GaVfx7c?=
 =?us-ascii?Q?gbvppiWzdQuUESr7ZZNaSuIeNTdDdjg9Lpmmu5mMpSZyTLZVMB2sNtwkSN2o?=
 =?us-ascii?Q?5VLfreLDjaZaEIx7OCixWDI7BzAQKeX15qUhTrT2nNi2MMeLPfwGid8pvJyM?=
 =?us-ascii?Q?bMieR/QXRapTDvYPfetp1+7kCRXnys0pkBw9JOQm/ni5uKLHcwLJbLQp8PKA?=
 =?us-ascii?Q?7xAAJ//m4vvObUX4fwar+6t0XN9uF3UdB/+lEK0oXZnCAWmCsvo0hiNy0HGM?=
 =?us-ascii?Q?0yuH1B5kRCV8lP985xRqQCycrZEiTkPr+YGx2dvx+rCf2CirJaFn4TMFAPa6?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hbRw/I2D/0711+eM20DAa/4tQ1vKhUC4xVtecWp1heiFcE2x+pkWXxoTjbAfjM9M5O6pmkBhxp5/rVQR1nArf0dHjW6rq9iHzcOoy79WM6UNNTN2+zWCtmJF6c1UOKcP+9p1lErxOdncOjZ7RKXD9924dXwDhOy044HElv0pqujstuwRBCUKQWaQKx1zmHuII4KhqZ7+H1ft7cn4gT9SY75EJ4dWwMbcyOxV6N+Vzf/l2R5OXnhdBuXQtp+Ipief6Bl4D21Vl8MWvQ50qEnw8pD61tniBma+7+rojrr+W70S6a2OmUh/drdZ0KODf+tgKS5HoymM0kuMdtbbjxoataQyzBMfU3Cv9EC2WhXIO72twcI1YWVZxY2KmPSj/57M0cfyumsLNe5MsFpHIa7BFSg6iCXa4mYtPHyj345lvbLy0sNe9H6ogni6odwdCm+LM9jMfYeoTAv/FpkGa0OrD7QatsNM5vNHKf2lt1xTQM36YEepo8iDg0jpdbR9sRg8qn74XbBZimRykEHhIc3+2tR7Tb8tvvvXk+kjxTyrI2fBfmI724UUEyu/wcrdimof29xnqsrvid94jCktcLyOtQF04poEmGff+mfjL6PFqGc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d519808-b751-4e6d-2c99-08dcc13b0878
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:10:46.9997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsstrAPsJO0/f30ywokt4hUCpMjZHTP+2mAPheyROzG1yW3uoof8pcyTlck3lVEXIbg3kU2ozyNCcFE1bvlAnhVO0FxVNAMlIUcAdyRz9xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_12,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408200128
X-Proofpoint-ORIG-GUID: zttc0eha4xBrn4I4zDmjP9ZgyfJZR0RU
X-Proofpoint-GUID: zttc0eha4xBrn4I4zDmjP9ZgyfJZR0RU

There are a few lines in the kbuild-language.rst document which
obliquely reference the behavior of config options without prompts.
But there is nothing in the obvious location that explicitly calls
out that users cannot edit config options unless they have a prompt.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 Documentation/kbuild/kconfig-language.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 1fb3f5e6193c3..8e9306b599cd3 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -54,40 +54,43 @@ applicable everywhere (see syntax).
 
 - type definition: "bool"/"tristate"/"string"/"hex"/"int"
 
   Every config option must have a type. There are only two basic types:
   tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
   are equivalent::
 
 	bool "Networking support"
 
   and::
 
 	bool
 	prompt "Networking support"
 
 - input prompt: "prompt" <prompt> ["if" <expr>]
 
   Every menu entry can have at most one prompt, which is used to display
   to the user. Optionally dependencies only for this prompt can be added
   with "if".
+  If a prompt is not set, then the config option cannot be changed by the user.
+  It will not appear in any menu, and even edits to ``.config`` cannot alter it.
+  It can still be set via "default" and "select" (see below).
 
 - default value: "default" <expr> ["if" <expr>]
 
   A config option can have any number of default values. If multiple
   default values are visible, only the first defined one is active.
   Default values are not limited to the menu entry where they are
   defined. This means the default can be defined somewhere else or be
   overridden by an earlier definition.
   The default value is only assigned to the config symbol if no other
   value was set by the user (via the input prompt above). If an input
   prompt is visible the default value is presented to the user and can
   be overridden by him.
   Optionally, dependencies only for this default value can be added with
   "if".
 
  The default value deliberately defaults to 'n' in order to avoid bloating the
  build. With few exceptions, new config options should not change this. The
  intent is for "make oldconfig" to add as little as possible to the config from
  release to release.
 
-- 
2.43.5


