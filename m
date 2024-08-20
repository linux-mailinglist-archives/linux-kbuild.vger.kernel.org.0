Return-Path: <linux-kbuild+bounces-3115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BEB958BA4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178EC1C2203C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 15:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACE2194094;
	Tue, 20 Aug 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WbKEBKFa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tauTFp4n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9B20B20;
	Tue, 20 Aug 2024 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724169113; cv=fail; b=niNKLivMA4G3Rd+N2qr1YNuOPkXrajjch+VcsPbOseIRCCpHiiaY+NWSxtpFrSvUNuL7UGvpZECQvtoMULIVre4TBGW0OJbVD+9k9/5y/XJfGLgF0v1TLOM4oKoNk3OH+lqtQt1UHR8ZsBoRgwA5aL5R/ciEAXDu8REhVvHIABc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724169113; c=relaxed/simple;
	bh=wXlHNarGPXFFOATKB44OCdWIJIgm/PwINPfSVDBKjIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OndVuYn6t34UTlsZq4KzWb5oYXizzGVhPNgqK92G4HKdjHoCPp9v2tXoc+0N0v6tZ8B47sPSye8SInvtAQW7z8E/E74FRJj3aTBRh+uxVuYutuF6jK0WuGpd5dwo0Dk6aJqZAx5+qT/KJdyZES5sWDUQngQfUgAjnk5pxMJ3+Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WbKEBKFa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tauTFp4n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KEqAtb028069;
	Tue, 20 Aug 2024 15:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=OA37HO0VNGUip3N
	AivunuZkm/MyhrVhlTPMJC9yFVLM=; b=WbKEBKFa+bodyY8v8OWTo8UI9Cw5boX
	KxYUStgCc+l14NjzkC6iJHNvrWJToMBNyDpF5HUz9aduHcVVdIQOuiyBCBbZ+9ac
	sAPFOYSgD1a4rjzuZQlV78m0lp/S82/lNw7KmHmlwhuH8bmF1EuyyWfWai5NpisE
	QxgAvOgrgT3q7arl5hGHe/7cbrMgDn4Zh0VdhxwZg7U6qxW5VvtRfxj/xHL/ZV3N
	+BbFMOWq1t/fsspGrVxI+fJMAmICtriN7o1fM71FtuelUXgXQN1+PxAcfgTZbii7
	c2ERLHVCWT2GkBg6kZ41ruCOn3dr1YcD+AFAXUcf4emiROZ0fvfC6KA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dnjhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 15:51:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47KEdo5M020543;
	Tue, 20 Aug 2024 15:51:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414v0hq7gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 15:51:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVVzjr3xA7TPDvjAS7iq/burHas5+nELxkyamrbe1bi2K1q+P8s1pe/lOsbVQCxBGsN6nBEd3SHqoAVZ/7BqEDlsV7/7boIvXVaLUiTY5C6WBGBtWOda7bmo1C9ND6QtzC5vZxSzqmVJtro7/o19AEWaNnAadEL8NTZaSzuCcnxqxgdYgTqDy9Mi0ZJNTFoshSLIaPOHO52lIh1vg3lcDfUHiX0PYatfFagQXplHFkTLwURtnDKZfuu4VTktd9Nvex0v1JkLzLptHMagdmBI3zAFQ9dTipsmH9DXJwgE2YuybwwM5Qds3bI9tbbkZ9e7ZQK738PHFgNtQynbMOwHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OA37HO0VNGUip3NAivunuZkm/MyhrVhlTPMJC9yFVLM=;
 b=LRhDy1Gct4Y6bqoAZ2/Pg22ALYvGTA3EvMk0b0ulHPLKXy/0hDbictCixng+UmyiNQFCT4TeEtsYWsJvODQeewyo+avD8f4TolEW/wGsSARHG/KDAtoiZFeK5m2tEfBLcGAjAD/UlXXAd5LGvFNVQHDrnH1zYE0HKKMxeZd+2d3YKrlbkXoM3xZnWTyObGuI9ryVP6HQYAEnqLAYLZUuosO/ccUfGablakjl+iv3IxEHnV6Vp8GSU4zSNYoxSDVmlDRhuhhYQWcEEBRHS6lCD5NiivZO3AvhkoUSfYdkwWN/EqX9SjmZ3oj66/aUIG3vzIAUUuNkdhBMlDeARTlboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA37HO0VNGUip3NAivunuZkm/MyhrVhlTPMJC9yFVLM=;
 b=tauTFp4nnm7OlkMs9/4dht5hwNFftRgbRKXrR00PyqfU/eZF9ey2CUAJy3Ke71FLMtyYPfY4NoTjV2jIHsZEn/WJxiaek+RhFrAMep/SMbVegiZqDCQT64c2Iz+QXBf/8unDpodkn6Ckbs9Ge6L1DqgrpXznoikuJMO1p65jNcI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV8PR10MB7965.namprd10.prod.outlook.com (2603:10b6:408:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 15:51:35 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Tue, 20 Aug 2024
 15:51:35 +0000
Date: Tue, 20 Aug 2024 11:51:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v6 3/4] scripts: add verifier script for builtin module
 range data
Message-ID: <ZsS7gxmiOLFsK+1y@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
 <20240815150339.1564769-4-kris.van.hees@oracle.com>
 <CAK7LNASjR=1S_H+r=QEX5DbkQ4MJ4-MMtB-UQWAvCeSbhbMOqA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASjR=1S_H+r=QEX5DbkQ4MJ4-MMtB-UQWAvCeSbhbMOqA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV8PR10MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2f36d4-afa2-4a58-7358-08dcc12ff866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/0J1pScVU0GixzUbSf3IG4a8N+54hLi3ksykJMpwmHLFGqPKpvF7N67e9BTh?=
 =?us-ascii?Q?vyUL9YxnSM78CUK8akiE40r0krXqKQ5yxmQnd8z3k9qqUb2LBU1TZQzjAlw7?=
 =?us-ascii?Q?G2mbXA5NtYNTd3QRd80zXQO+1lbvd5rPZ8me7HhsAVgL/4/8TlEcTGKE1tCx?=
 =?us-ascii?Q?7+7dnVcdTmuYWzemnvHqV9isX5gwrA8A8nhodaLAw2yd02VgEOMXEdE5+AIM?=
 =?us-ascii?Q?DDqH0Nt0/1CNP7isc5UQAZQYyYtEzI5or2Ev2SmjOccVGEDvyLIxubZVRKw3?=
 =?us-ascii?Q?DWx0DWxin42Z+yOLMYp/K7YFpd4Tb7a8XAah2wd0fdVegRgohZ2COBsBJXf3?=
 =?us-ascii?Q?mOIlzsl+wXilNBol4McybF3XwM2zb2faavsvv/UETaD8eiYZWVYA/e5ZfG6b?=
 =?us-ascii?Q?ht+y48m3/fFCkgOQ0NI87UCr/k9h8RDTybCZAAgg9bNHmzxW5yqrQTdjNOG/?=
 =?us-ascii?Q?BZHexoj6bY/aIIJVS40GbsIPDS4cAXMbKgnV3DfFJ3eNCg/f4YnrhXdMemLp?=
 =?us-ascii?Q?6K0t1bn9wkG3hzEIAevgTZTL9djiVni/OhVG63zoq96/ITqtYiA6EEBn5y0F?=
 =?us-ascii?Q?Lby6OCPUaB/D34WXfEGDlZWQZ3/OEOsoN2ufcymF1ENqf/5xYwQVHYjf1IMB?=
 =?us-ascii?Q?yr08qHGDCblVqdmR5xfwUfJtbrf2TGQGAlGa3bjya3NCINrx6qZbCpDhEnKd?=
 =?us-ascii?Q?QsZmxF7lvSr8Ovd2O0ipQ7kPHXzUm2XVa+sGfe7SacN9hLOfYDB1Ccv5sw8A?=
 =?us-ascii?Q?KZfg3NTeq34ATdD3OH2DS3wEomDwqRz2Yg0PYjRVynXAqQSA/w57Wx7PjIL2?=
 =?us-ascii?Q?i5gI/1bN5FFZwIw2miXBXyM91/Xq5gUs4F7NyxW3VwD0uTz+Us5yy2aOX3Uz?=
 =?us-ascii?Q?QyUjItcKILzomuRUjf8zM0roDHVgx++r2Hwi/xTRriJi9zRhItYUQsXluxtU?=
 =?us-ascii?Q?aV7Qt9u8Hr3NzyvbsCcQGOnT/T7NYj7Xpmsy8yQRRR9R8npRs67T3K4oJeQF?=
 =?us-ascii?Q?7mi/vOA6MSi3xQsNZurw0KZ1/SrLQr2yqLFZXsc4dBGHvVdlQQiTBsCjnqw6?=
 =?us-ascii?Q?h4OzUJmJNmh6Q4sA0lILTrgg9pASF/5UNlGT8HuA1HvpDFeOTimzsvyO2T/S?=
 =?us-ascii?Q?2hi32a+xkoYAnQSFlgrOIEU+mnKwKr+8ccowxmPa32S5cxdJJF37mGvNX0j5?=
 =?us-ascii?Q?wBYNA04rP6DDQIpkSaDBIpGAaPOZ9q26bKN/jgpkOogOQSisreEYi4IhMMlW?=
 =?us-ascii?Q?BAqpl2Is0Ajck0doJQa4fNyXb6aG4DJ0SA8xwR7j8qqOBJVfWiVTvaVYIIj4?=
 =?us-ascii?Q?l5XnENm7nQBpzdQlrDMs7MJNmfQS2j3qRnl6PoZ9OqsoPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V2h45RUwxbC/CgdWZBrI1mVs1gWOZRSOqgCo6IK7xukjcHXBrzFq3IUoZYUe?=
 =?us-ascii?Q?V2QwZ1votuTkffElY/NTg+5J/5FjJlNuSdSPms/JXJznGwqzLCwd4sHtYJwX?=
 =?us-ascii?Q?U9quHP04oH2FfTp7lVv2ITB71ccT3czqD759fZ+1yzyu6YS61h4OJUSUeNRY?=
 =?us-ascii?Q?AGSYy3L4sLdj6fVF1EgynRTtSicj0b1erU1XCyExoUlMCy5RIBoL5QGGNwGt?=
 =?us-ascii?Q?BX1jO2/dYkvb35L2aFCoAC8vWVtvQe9k83AHAoAKQYN+H6El681Hb418ELc3?=
 =?us-ascii?Q?qx2lcDXWNA3sJm55bP08sMrWuZU6KI10C/9+suzojvkSbJqzCpIIiaJhRUVN?=
 =?us-ascii?Q?mWIJeVU1piNahlbroc+sBYIB/SkK2vOex56JX9NEuWPnjKY8Z1hgHb+38w4O?=
 =?us-ascii?Q?1p8N1gH2miWkkfCB3qjD9sKAciffRO62Bjm4mLnXQsoGIetph23kF0dX+IwO?=
 =?us-ascii?Q?fWLxbn/8E20s7EWFMFiNVYJKinby/8LmJiM9dK7SURuvGhFvjvnIRK5LWQsK?=
 =?us-ascii?Q?KkK8YIyLnqNuKDJPn8yjzpMY0s+byoUjsQxhhHL5IYbWc8fz1Fe0z08DQsEn?=
 =?us-ascii?Q?EHeMUb/qP9qEFM4CkEZ32ga1lYr+A2Mn/WvOYT/dbbsOUA0R8DEeYA294boI?=
 =?us-ascii?Q?+Inc3B/xmJe8OiJ1IqpSvqUgaoeAgmq4WmMQwWxxLVUhfxe1rUrhaBTn7zAv?=
 =?us-ascii?Q?OQsQwdCLPPFNZlsSLurI58ZBwYRj09OiJSiy7Ct1RnZ1RgZX5HEdksCf/wVS?=
 =?us-ascii?Q?+Kpn0QenC5WgM37wdVsoycnu8OHwJp17/klylGGyPjj9aRiA+2F9tQ6GzCNt?=
 =?us-ascii?Q?l6LycYBf9ERjbRq3EAk9i4tnK/u83qO4xlDDHVwN/WefHDOP97rlJeCaQFJL?=
 =?us-ascii?Q?G51Qew6VNIA+96NJSu8xsE5mYZ6WtCvzpqCvQCrBieBbSRgmBMxu3BoF0pvn?=
 =?us-ascii?Q?1o3+WVDKk7YfGHO6NPbY4ihKfo6rX3evejx5QUB3pZkYlq7XXsqGGg1/mn6F?=
 =?us-ascii?Q?r76+tHH4IErSGUud7QZEj/bGQtQviStPRUme+DgKkz0b4//joEgv10q0D98q?=
 =?us-ascii?Q?TV27VR7fSFOM9Pf2yfeqDCvAeW6uQVWlFx2HTpPyDsAGE7WIlfbpaYXRmWNg?=
 =?us-ascii?Q?OON/nTfSwouTDU4ypbC7sL+quSRp80R1O0ZmwOAF09EKituvTOdonLO0knDM?=
 =?us-ascii?Q?VBcBI5RdnsftLJIs1UGBLyVB5mCf89GVnGasDbzVHbDoff/TzPTrbGvdD03R?=
 =?us-ascii?Q?DkKN129Lugeuc/DJ7pHbEZ3GqMAQNe02ZwiP2ScKNXqJVtfyc7+z0GOstVoX?=
 =?us-ascii?Q?ABW5MwChN7T0/eBJ5a7oZ5cSdUWr8MFNF5OMynR5koKE4zPDbszmxp+gWcgG?=
 =?us-ascii?Q?4Vvw11zhtGzAH+1Zm2qx0WAEmz5liRxAFmvww1/DY4PY32Kz+rV8dk+Cvug+?=
 =?us-ascii?Q?DS1LJcKx8EMh1pzEp/hV+xnZfVH95wst4QELjfuNtL4wJBGzWxlBVlp1xyPo?=
 =?us-ascii?Q?cqedyXMCp2e7EtJSI94jMy2O5cZoZPoAHkJmOwXjhML0bDJ7EZvtMwV9WdYU?=
 =?us-ascii?Q?3/A4RHslLcmZNHfMdPVAte4HAh1e5NykDjPA2+Iem47dDguKTZWq1BdtzDgw?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SD/k5RNpnGVH0bDhNF63Yhvtvar2zIWPRHN6A2NpxMcm03l2MEHGP4yeqmbjsVMhTtS67YqEx+4sZenq3+YIQBzyatO2bsxoSTde+OFehcQ7WNaJyb99mH//GCEmYrJazQgeCj62o9u7GLB8IdeAAARvK4MNtwRxn4vu4b934nMJyt+/2eB0Bqfl3Xt7DIWxeVvv9CfXuOTLa5T1zDpTBJ2OWhb4vFScAuiQKqMbCDvVCQqwFHwZiirwGSbOudFFhLgD9qyYe43w9qP6kc+0JF4LABc02casMoY4NPCAvh6aFpUe+MZW8fnAGOsXeOz726H8G6n6AxUIz/SCMR4BRWMnQwmIohB5hn0m17SZaX5vGNyVDaVLnvpkVBibnZpoDSO2xPI+xtUhDBLL4EgtFMtgyqEbjIJYMORV10svw11M04kT2lSxa3euESkZ7UPFmGfW7l8r02wUiXGtTkeh4eG8Nbwt4gfD3O93qWa9JUCyvPrLod0ltd4hqSrxcGNB+kgkxzFJQPOKttayswRLpWggkN/sJRhT1zdU2cREgw5pXZsAIjaGlf0Ja+3XTZn9yIAfEL+D0RbpqKSJQSwASagBV7iSNaG0A72R7o6st34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2f36d4-afa2-4a58-7358-08dcc12ff866
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:51:35.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKzjFjaLf/G6RobtO004+W2vfFLPMxGQBx5K6YrAWtVSUNYD+6sSd/3b643iISvNDkruYsCYOlprqkOoEb8R+VaQbqrWYXbrN6Hu9/dqgdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7965
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408200117
X-Proofpoint-ORIG-GUID: G2j1MqtZCnSKfT0pSZUkbOWqBUUhKC7B
X-Proofpoint-GUID: G2j1MqtZCnSKfT0pSZUkbOWqBUUhKC7B

On Sun, Aug 18, 2024 at 03:40:36PM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 12:04???AM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > The modules.builtin.ranges offset range data for builtin modules is
> > generated at compile time based on the list of built-in modules and
> > the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
> > to determine whether a symbol at a particular address belongs to
> > module code that was configured to be compiled into the kernel proper
> > as a built-in module (rather than as a standalone module).
> >
> > This patch adds a script that uses the generated modules.builtin.ranges
> > data to annotate the symbols in the System.map with module names if
> > their address falls within a range that belongs to one or more built-in
> > modules.
> >
> > It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
> > verify the annotation:
> >
> >   - For each top-level section:
> >      - For each object in the section:
> >         - Determine whether the object is part of a built-in module
> >           (using modules.builtin and the .*.cmd file used to compile
> >            the object as suggested in [0])
> >         - For each symbol in that object, verify that the built-in
> >           module association (or lack thereof) matches the annotation
> >           given to the symbol.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > ---
> >     Changes since v5:
> >      - Added optional 6th argument to specify kernel build directory.
> >      - Report error and exit if .*.o.cmd files cannot be read.
> >
> >     Changes since v4:
> >      - New patch in the series
> > ---
> >  scripts/verify_builtin_ranges.awk | 365 ++++++++++++++++++++++++++++++
> >  1 file changed, 365 insertions(+)
> >  create mode 100755 scripts/verify_builtin_ranges.awk
> >
> > diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..b82cf0a0fbeb
> > --- /dev/null
> > +++ b/scripts/verify_builtin_ranges.awk
> > @@ -0,0 +1,365 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# verify_builtin_ranges.awk: Verify address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> > +#                                 modules.builtin vmlinux.map vmlinux.o.map \
> > +#                                 [ <build-dir> ]
> > +#
> > +
> > +# Return the module name(s) (if any) associated with the given object.
> > +#
> > +# If we have seen this object before, return information from the cache.
> > +# Otherwise, retrieve it from the corresponding .cmd file.
> > +#
> > +function get_module_info(fn, mod, obj, mfn, s) {
> > +       if (fn in omod)
> > +               return omod[fn];
> > +
> > +       if (match(fn, /\/[^/]+$/) == 0)
> > +               return "";
> > +
> > +       obj = fn;
> > +       mod = "";
> > +       mfn = "";
> > +       fn = kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > +       if (getline s <fn == 1) {
> > +               if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> > +                       mfn = substr(s, RSTART + 16, RLENGTH - 16);
> > +                       gsub(/['"]/, "", mfn);
> > +
> > +                       mod = mfn;
> > +                       gsub(/([^/ ]*\/)+/, "", mod);
> > +                       gsub(/-/, "_", mod);
> > +               }
> > +       } else {
> > +               print "ERROR: Failed to read: " fn "\n\n" \
> > +                     "  Invalid kernel build directory (" kdir ")\n" \
> > +                     "  or its content does not match " ARGV[1] >"/dev/stderr";
> > +               close(fn);
> > +               total = 0;
> > +               exit(1);
> > +       }
> > +       close(fn);
> > +
> > +       # A single module (common case) also reflects objects that are not part
> > +       # of a module.  Some of those objects have names that are also a module
> > +       # name (e.g. core).  We check the associated module file name, and if
> > +       # they do not match, the object is not part of a module.
> > +       if (mod !~ / /) {
> > +               if (!(mod in mods))
> > +                       return "";
> > +               if (mods[mod] != mfn)
> > +                       return "";
> > +       }
> > +
> > +       # At this point, mod is a single (valid) module name, or a list of
> > +       # module names (that do not need validation).
> > +       omod[obj] = mod;
> > +       close(fn);
> > +
> > +       return mod;
> > +}
> >
> 
> 
> 
> This code is copy-paste from scripts/generate_builtin_ranges.awk
> So, my comments in 2/4 can apply to this patch, too.

Yes, and I will apply the same changes to the verifier script.

> Instead of adding a separate script,
> we could add a "verify mode" option.
> 
> 
>  scripts/generate_builtin_ranges.awk --verify ...
> 
> 
> But, I do not know how much cleaner it will become.
> 
> I am not good at reviewing AWK code, but this
> is how you go.

I think that adding the verifier functionality into the generator script would
make things more complex.  The nature of AWK is that it works best in terms of
a liner walk of the content of the files it is given as input.  Since the
generator and verifier scripts have different inputs (and especially since the
first couple of files that they need to process first differ), the script would
become more complex.  The fact that different actions are taken on the same
input records between the generator and verifier also complicates matters.
And keeping them separate makes it easier to optimize the scripts.

> If this script were written in Python,
> it would be easy and readable to
> split logically-related code chunks into functions,
> as follows:
> 
> 
> def parse_module_builtin():
>     ...
> 
> 
> def parse_vmlinux_map_lld():
>     ...
> 
> 
> def parse_vmlinux_map_bfd():
>     ...
> 
> 
> def parse_vmlinux_o_map():
>     ...

I am much better with AWK than with Python, so I went with AWK.  This is a
task it is remarkably well suited for given that a simple linear read through
the files accomplishes almost everything that is needed.  Thank you for bearing
with me on doing this with AWK.

	Kris

