Return-Path: <linux-kbuild+bounces-12791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIsNC0eT32n5WAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12791-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:31:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB7404CF2
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B04306EB72
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 13:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEE53AEF5F;
	Wed, 15 Apr 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f47luFx4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HPwdh8iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEF3ACA61;
	Wed, 15 Apr 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259832; cv=fail; b=Ak0vEwDxw+LOPmhcz2nXFE6XkEZiMhQOv6GBwE1Ldy+Tv5tCsUNFhHQT86EuRGipdWVTDlxDbv/QlNcfPCuU2srPVhptc7SHoKebJBO41uTaGWEVWgwIvRj3m1KQD8Hsw5O8KeSrYup4V/3DXv3rSiTYx6QZETc8PGPTTc4xCQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259832; c=relaxed/simple;
	bh=kDaREbN6qagrJuOoDmMBc+Xdqwl1n2zfDNu5OjhcTbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DVQ/pPEBjbFwJJU0jMohyuiVqaLKk7GJgD4XztrcFSHgwSkYG7nG9d+dN8oS9OFkH5CplYqIVK16Ym3beBoWJjDKBm2wL61+ZGFrbVkvi5unl63+QCLO86lVEh3tjQ4Jk55e5OSc6Bt9yTKF4WFYw58oCht/Xo3FD3og6bsEMX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f47luFx4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HPwdh8iz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FCfWxX819236;
	Wed, 15 Apr 2026 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=l/tT9DYaK51y8f63mkyaStp3qxegsWK4JIGici4GRmw=; b=
	f47luFx40GbKNn3sWqEEsRmIPjgzS9F3uLA1GXEzSGxTb+O641bafli7quJfDMRv
	T4zVhfZyzw5n+qFQehqKxhRTCKRo5Knj1Qj498ZizTRJOboxGOHF1lFSzpzQVfbX
	gJRHb1PhKcSCymLcWWq68zqhP7m3Oft/MKngLS36cAZb3neTFah+WzIZ/dq1m1cc
	gHUIGgg+7OUc5gq2M4zw8ftcdEv+mY8MGEzy2uWa7qdUdEqxVoKKj37o/tZNzP/d
	3pLOJdvjfIsfrl3UPE+ZwukILFBYe9afZH52zp+TpAPCvuBx3Ogcw/TYF4bvqhv0
	tx4t0SgpVl2qEkxM+g9wqQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qn5b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 13:29:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63FDOKKX012824;
	Wed, 15 Apr 2026 13:29:56 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dhyk083m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 13:29:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIzmlYcwhjd0ji3OLhtYIe6IyN7U5qJbDVIcDLKZNtitheF2EpddPmOUaWO6XOjsySUxeKspY7WhfoWKq+P1Jk3EmVcM0+/YLNfR0lp4vu72yo2leGWe6JELbFNpic8Dhqcs3NNd6M83m5FGuz1lh/Ks0HagzxCMNNy4sGeNFT8vp8gVFfBgt/hGtFGgPFx1O22FuAitsQxty1zUO7KPzXdmGYKXqjgtfCKpLEH4V4wN9Xvdvd8XgINVMB8IKjR6pS05v/wI2T5W3zEEHVuskq7RYdxDYZ3l7EAWk8U83Ugxl98e39bN6AtM0Zg2R1AejCMTRBwbIoZnh0vI+OvBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/tT9DYaK51y8f63mkyaStp3qxegsWK4JIGici4GRmw=;
 b=Hr7Hra66P7AC/4b3leyw5b3Eh3kO3kG2LdNjdQ11KiHPEi/V4OAkZ44W0p2cpnEUW0Y2M3F4xXEcFG6595nYq8XsVc9flagU0+1tzlP9q6vb96yqEcY6TFK3iXNicvvia3ZHq3HWOXEVdErYLyHZQUUsqFRS4ceerWLjFst7tQ9VRLqyDLrLK2W5v1QHA33rha1abH5eX7coHdMtB2SUkFazyxtcLgtyvNl5aH1c10fKrMP9rXqlTXOEsHgp+vXae3HciAd/MhaMN8JAYvCYFLn/IaLMrjN3KqfWgLpbCj1ozdh7MSLQFiRXCsMHqlaPcdFzlCrhddiKdDePVa1z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/tT9DYaK51y8f63mkyaStp3qxegsWK4JIGici4GRmw=;
 b=HPwdh8izIa5JdS0frJju4/Eq3tHWrFKNBvzKkN00Bgp8BmrZbODYs3H274ONgx6PxhoMab3QuGSqf2chjVA3AFf8FEonREktlrqVi7LP5S/CAZg065GeIwJ11AymDyQn2ciSmtMPWIOGdV/db1fMPBPugYOqBHc04rY64sceRTQ=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by IA3PR10MB8441.namprd10.prod.outlook.com (2603:10b6:208:581::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 13:29:48 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:29:48 +0000
Message-ID: <0b958862-538b-477d-adb2-c36516217bc7@oracle.com>
Date: Wed, 15 Apr 2026 14:29:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Nicolas Schier <nsc@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Daniel Gomez <da.gomez@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Aaron Tomlin <atomlin@atomlin.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, linux-modules@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20260410131343.2519532-1-petr.pavlu@suse.com>
 <20260414203418.GA1022044@ax162>
 <CAADnVQKnWftcW0gk8HgFPLXuBf81+mqHMMds3fRmXHgOrRE-1g@mail.gmail.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <CAADnVQKnWftcW0gk8HgFPLXuBf81+mqHMMds3fRmXHgOrRE-1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|IA3PR10MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 27041d9e-4636-4353-2a50-08de9af310e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qcGWG+5CHkLRECnlqJSTCO4P15jH00jvZioPrxaEYqUTPk8xaCawJzZZ8Z/fo4Rl2Vyf3P+dA2mmNZ6BVDC2r0NXbKbPq6oEUsEe3zi/590xnam2TP0J7ildbBqHlFXKe+EtLWzCKg34eGt4yoanB97t+ThdWsBX7qmSnkkJuL3pq1w2E3BoVFTasglJylEnPhRl+2wUxNTfc3VTc0hvHBX9ik4Cl0afjoQotfHa7u+1ne6kOYOXsvFWJfDB+iU8CdeIx4J1S11dBJeGImVgjP+F53AlWahnrK5fzAp+JKa4Fw+vzz6G6azTNKttiswKbDMVECZqP2OGx++RtY1Wm/NvlAm7mQSdfzznls1AxNx06FsxR+2oTVT/At2zJ96UePbgrXe2VxH2P7eyzOYj0Ls8gS34iI/dDHPUgjKsgWcTWwaQijXODyX4cDBZpHmymd2pVoRMxKjmavCT6ds2iYA/30l7AsUDwxsgwc7MFwqozt/MgcrwQbaGWudtMYl8sOt4d5YIrkOFzRXfNt9yIZ38eBwRzLeumxkdrl0R/e9ulV5zT6lisSmqTcCRmpwd3SmYWyvUJRdlxYC6G0DhvF+N0tVNLMIng9ivJ+uqk3bOzyYQh+J8dhlP5fzgivY6f9CAnE8yhJO7tQjKZgXs8MZFnVVfYnkc5dE0fqfz78Vum64GyT9FS364vy7XTLisIqzKMVdJRBrnzWhnoDzdkdviewxqPp7L2H/Mvdz5tHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3Z1UzNsOXhyc0ZvUzl6a3Y2aEk1VjRDTUlOaDlySzliS2xwQkN4bzM2dkpi?=
 =?utf-8?B?Y3QwSHVjbzFSdmpiYTlyVkZCeWprMG1qc0dFak04eUZKS0JwTnd0TXRGVUF5?=
 =?utf-8?B?Z1l0TUw2QmxPYjdTQjBZbGFlRkpvSnlVRFI1elMzbnZ4dDl5Z3BNVEpqVEV3?=
 =?utf-8?B?MjMvL3YrNFF0cS9sVzJsSmhETXVDMHBlR1kydUN6U2s3bHh4TzRBZ1ZKcVV2?=
 =?utf-8?B?d3VWcUdsWkQxcVZGOGt0ZlRHOGxIU3ZqUzdieG14MW5SWlJMNkp5MFZSZzFz?=
 =?utf-8?B?eGtqeFlmSkE3UXA0YUNDbDJ0T2VQckIwVXN2U3Q5eWl1Sm1yaTFvWkU2M0VQ?=
 =?utf-8?B?RXU5Sk1CeVdFWjVGNzdSRnV6Q3BVUXhKQjdmYmZaNVV0RUlvelBFcmxNSHRa?=
 =?utf-8?B?TmwvTVNWditqeGhBWlQ0VFB0SHk2ZzV4c1VKb3FyUGNsQnNKaVBvaGd0OTFi?=
 =?utf-8?B?RVdyZlgrLy9uL3Z1VTFiOTd5TnVQc1RIb3VKSjBlRmlnbUllU2VVdjFJNGtY?=
 =?utf-8?B?Y2VLZGdqREpqUFdsZGZGdkZPelZQSnJJcVd5UGttdWpXNzUyUU9iVGNQaGVw?=
 =?utf-8?B?Nk9kR1hqMWZFM090OFZDc0xLOTZrek9pc0dzcXZCUEROWkVDK0R0ZWdFM01B?=
 =?utf-8?B?ZU5UdnZ3UEhZN2tvUFlNMUNab2s2clJNNmtYRWZhVlBoVG5ld0RXYjhBWEpx?=
 =?utf-8?B?NWgvbFR0WjNGQlhidDFqT2VCNVQwaG10T1JCTjhGTjNmWXdsQzNmUlZadXNK?=
 =?utf-8?B?VmN0dTZ6ZEpDNGR0UTZmME1MZEFKS3dXaitCN1JoY2J3ZVdlcFdXVElrUlhi?=
 =?utf-8?B?TTdvVzM1WnFnaFBaNDArUnBrRFV4cVkzVlBWdkRsME1EaVpkU05kbHdYNnZO?=
 =?utf-8?B?dkFPaURmTGZTcGs1ZHd2cXdYOWxWR3FpRTdHWk82VkJwb3NWUFNKQThBMVNN?=
 =?utf-8?B?dlBRRXd6djhFNncrVFkrUmgrWTd4SHE0TllpZWk1bmxjYVVWaU5BY1BOMmJ3?=
 =?utf-8?B?NXZCbklGLzZqN3hONXdzM3o5TERYZzVUd0ZoQms1RnFyd3BtSlg5Q2J2ZWNC?=
 =?utf-8?B?NVhkRlFrc0VTMCs2ZFh3QnZnams2SVphNWoza0dWaGIzbm9MRWlmQm9JNnIz?=
 =?utf-8?B?L1FkMTVNcGdYL29wRzVCTGxneWJ2NUxZSHZFc3pkOTBLVTR4YlpwOFBKYU9y?=
 =?utf-8?B?cWo2OEdCeEpqbDBUN1BncDJsWTFvWWlYYXpiR2p2WUkyK3NGdzdXNklsOVlH?=
 =?utf-8?B?ak9RaTM4SHBjWXY1OGR3dEMyUXZtSWZxT2hZelJFQ1VLSW0zc1VNNkxRc0xl?=
 =?utf-8?B?TzRPdk1tSTZleFo1RG5CNVFoakh6NTlodHk1WkRCeHRqM1J2dE9GY2E1ZmY0?=
 =?utf-8?B?RWwrN2duaGdMVGI0R2cydm0zNG9BMGxLeEJFQkxXY0tqSTh0cG5hOEpZYTJS?=
 =?utf-8?B?b2VULzZoL29hZ1IrbkhYazFWMVZOQldzK3YrVjZMRzBpTVJzcVprNjNQNmE1?=
 =?utf-8?B?dFA5ZnB0RE45Vm9lc1lHVDBwNDB1NGtobndoZHE0VGt0SkF0bEROelJ2bGRl?=
 =?utf-8?B?b0RIWTlhZ244bTZ3WFZJOCtrQ004T1NXNEYrVGc2YXI0T0U1dThVRmZiM0p5?=
 =?utf-8?B?MHl2UlFCNGF2c29uR3Y2Nlc3dVVqQzhFRjM5V0FiNEgvYWE3NjE4TTRXbTVh?=
 =?utf-8?B?bVZFbURmS3c1UnY3ckxNaW1wTUF5MDdCcFVrSkxwVkdycVhmQ2pWeldkSUdy?=
 =?utf-8?B?QXozOWY1RVJOSlNmRUtXNG90dTNyRU1tNFpudGk3UWNPV2g2Tmk2TVN6T1Va?=
 =?utf-8?B?bllZRDNEUmptWnZYaXhHZUZHWjdjUnlBRkoxYVl4TGU5WGJRcVVrM2RoNVJ3?=
 =?utf-8?B?OEpNTkM0YU5sdjVCNUhKWHBZM0NiUzRXeU5zakVBQmlDVDZnUWpVcTAyVGpU?=
 =?utf-8?B?alpGeFJCdzk4Tk5odFdjUkdWTjduV3gyREsxMnpjZ2xsN0hkQVFMa0Ntc1lz?=
 =?utf-8?B?akVRRTYwN21sQU9lRHJtVUNqcmVvTjZtamhYZy9wMTRsdk5BTWczOTJDQkdJ?=
 =?utf-8?B?UmluWHdZU0tsUEx3K3orMXZ6bHdneHhDY0hGMFo1NlVucS9PaDZCRHQzYkRi?=
 =?utf-8?B?Q0c0T1pHa2RYbTRKSkFqUUpoMnVBYndLbjJ6MkE3WlBWT3VJcDYwcE5JR25s?=
 =?utf-8?B?L1JwbDZMUEc2d0NVYkp2SEJPTEVGRll6OXEwQ2tDVnEzZXFZZkJHRGJROUNJ?=
 =?utf-8?B?Rkt1b0svZk53c3VtRzFrL1FIQVExTHZrT3VJeGt6SGdqbjBiNXRUZGNoS0Zi?=
 =?utf-8?B?T1NxMUNhdUtyWjNXZDFWMzIyK2VaaFA4TFcvREhJenZ0enZSL1FNZz09?=
X-Exchange-RoutingPolicyChecked:
	ibSz5Oxld5Df1xRPu0BCUkr4BOjz2KojVDbwz6bLqXMh11pgXwDFbUmLNBOVYAdzfe3JrD1kCloY/3LaQ6LmOWWtaL57CjGTl4mG3E5RaneuyuWOGJEts3egBBheT+J+zI8W/oDoc+px4RCs5DdlhP9xfq/SaT0lku8GRWY4ED22/if/psuPzxP0gReUpf80jGn1qO22b+rjEytA8v2OvQeXog5BRwk2pK44bt0igi7ynZARLoGlsNqeJ2kQw9yXTnQWamvQ32C4+c5zOTt2BZtTPEL/qiBqhorH2IE5YBJCyp8/4bQpOVzpDEyZqDRDROS2dAiHRgWi8xB0UQDuyA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X8+TC2dYguS84ahte0Kx6WA3NcxqwG/AQYPSUbkq0bedDJ1zgsZ/ALOerzvx4YKGD10OIhPDKSuJi4I2et6r1vnakW4sTAVV6AtistG/Tvw1WKdXh30O3vzmr/PbplX4Y3HutcIOXTldWlZDLFGtR5vQsrpKftJBTViZcgOuQlQ82DWsvvv7wFAclyKxPQvfpcAL0vNLb2q9TrzN0wDycyd/rSYhskvkoNC7PASaJcD6KXIIDFDzHO2PzjsIGE7JOdeZ/As191O631OU82T8DJiypIx7vdcIJuRD/m/RWYbF9ZdjP5uQKC3DMAp547cWf+DltTU5KZhuY3HbhwFYUGHB7HJiPTsGtGri59a2vUWwL/dQcXbtwQl32DzmEDXhbT3eVrDmIV/XcJeMdqdJr+6bQGN2UeSRn7aj8B9WCDB82+Y2HOK7RDHqXN/NjkMb5en4hv8fg+pT39uY+AG7UcExCG+eomesGEWrsGewFo9QE5uefZQ+p1isYUT8FW3jmAAI796W2HcJC0YEJX4PmIfZz0Dah5ArffDagFPMcITLJbyEfsHoWiuayiRzKvXKTo2EileX+iTnXnBV+7KmiD6JRqvoXtluOj9NCoxk9aA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27041d9e-4636-4353-2a50-08de9af310e7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:29:48.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf8yMSE+1xQY/1y8NJmSwXt0wqmI4w3XfFTrV8P8+tVQYhKcCWmqyXZWbY/dT5sjzRwHi0ZMB2KKXJ7BaLo5oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604070000 definitions=main-2604150125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNSBTYWx0ZWRfXxeJ36ilGHnb8
 64Y4/u6k08pmFioeLyGl8O2A6lRelimQ/2KknxzJKwQB7IV4H2ARGfHbkohbL2QkckeXb/3euyi
 FmynsaPwLcPA0e3ZoNbzgzaTMt4ZnFYK92qvqdpQ7jVqGUn36hEsV0/UjHdRMMGcCQekyhTS7l+
 GoWfMCCDhRt7ch1o62SPNijCp8QRLeEhydH4hl8ZSWOzEZBV5Wfmw8REeG2kRIAn44noHQVVrj4
 xum68qK6bFSDOhJXVWEi5vPbbkBkosFn2Oc2k7NsxfAH7hlvtIWINCFAY24aszFaQCYKqTfaIHk
 /i5AeVdCoPM0iWOEisRkyoM0RjnLyNVABNxmWHLnMQZx2OJOR0I5OJC7hiqRsISF5C0WAv0dDiF
 Fl7IQ7NMfmOPtAIvm95YLYrzJXABoQCA051UI3Frezt+7iHueNgPmJaMCtWeWBwEN/PQQh0++57
 NuAPmURBQkEeE5KHvtQ==
X-Authority-Analysis: v=2.4 cv=Lo6iDHdc c=1 sm=1 tr=0 ts=69df92d5 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=6wOSnnYFCLDzy1M3ElcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: TIOb6h73q4TLVj7EJfxRVDDQ3k5hTHvQ
X-Proofpoint-ORIG-GUID: TIOb6h73q4TLVj7EJfxRVDDQ3k5hTHvQ
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12791-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email,oracle.com:email,oracle.com:dkim,oracle.com:mid,oracle.onmicrosoft.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,iogearbox.net,linux.dev,gmail.com,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alan.maguire@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C8EB7404CF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 15/04/2026 06:14, Alexei Starovoitov wrote:
> On Tue, Apr 14, 2026 at 1:34 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Fri, Apr 10, 2026 at 03:13:29PM +0200, Petr Pavlu wrote:
>>> Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
>>> and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
>>> to enable generation of split BTF for kernel modules. This change required
>>> the %.ko Makefile rule to additionally depend on vmlinux, which is used as
>>> a base for deduplication. The regular ld_ko_o command executed by the rule
>>> was then modified to be skipped if only vmlinux changes. This was done by
>>> introducing a new if_changed_except command and updating the original call
>>> to '+$(call if_changed_except,ld_ko_o,vmlinux)'.
>>>
>>> Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
>>> in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
>>> from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
>>> previous logic to skip relinking modules if only vmlinux changes. The issue
>>> is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
>>> prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
>>> retains the raw './vmlinux'. As a result, if_changed_except doesn't
>>> correctly filter out vmlinux. Consequently, with
>>> CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
>>> changes.
>>>
>>> It is possible to fix this Makefile issue. However, having the %.ko rule
>>> update the resulting file in place without starting from the original
>>> inputs is rather fragile. The logic is harder to debug if something breaks
>>> during a subsequent .ko update because the old input is lost due to the
>>> overwrite. Additionally, it requires that the BTF processing is idempotent.
>>> For example, sorting id+flags BTF_SET8 pairs in .BTF_ids by resolve_btfids
>>> currently doesn't have this property.
>>>
>>> One option is to split the %.ko target into two rules: the first for
>>> partial linking and the second one for generating the BTF data. However,
>>> this approach runs into an issue with requiring additional intermediate
>>> files, which increases the size of the build directory. On my system, when
>>> using a large distribution config with ~5500 modules, the size of the build
>>> directory with debuginfo enabled is already ~25 GB, with .ko files
>>> occupying ~8 GB. Duplicating these .ko files doesn't seem practical.
>>>
>>> Measuring the speed of the %.ko processing shows that the link step is
>>> actually relatively fast. It takes about 20% of the overall rule time,
>>> while the BTF processing accounts for 80%. Moreover, skipping the link part
>>> becomes relevant only during local development. In such cases, developers
>>> typically use configs that enable a limited number of modules, so having
>>> the %.ko rule slightly slower doesn't significantly impact the total
>>> rebuild time. This is supported by the fact that no one has complained
>>> about this optimization being broken for the past two years.
>>>
>>> Therefore, remove the logic that prevents module relinking when only
>>> vmlinux changes and simplify Makefile.modfinal.
>>>
>>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>>
>> If the BPF folks want to take this since it deals with BTF:
>>
>> Acked-by: Nathan Chancellor <nathan@kernel.org>
>>
>> Otherwise, either Nicolas can take this for 7.1 or I will pick it up for
>> 7.2 when 7.1-rc1 is out.
> 
> Alan, Ihor,
> 
> As resident btf gen experts, Please take a look.

Tried it out with full build, rebuild, module-only (M=) build etc. All work
well so feel free to add

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Tested-by: Alan Maguire <alan.maguire@oracle.com>

