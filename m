Return-Path: <linux-kbuild+bounces-3114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55D5958B95
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CCC0287560
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 15:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8D1990B5;
	Tue, 20 Aug 2024 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oJrRYWOV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pjLsvy/b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF518FDA9;
	Tue, 20 Aug 2024 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724168734; cv=fail; b=dkXpmZN6CJCczykVm6pUjE5RCa46I7rjQjrTl5aK83s7Nkn/D/4fXN1WtERfDv5Q9VRImpSXKBqLQoptczKvjzk/SFXLqYEAHA2Zrgy3gb8MDXodw1wTcQWmWJDEY2FZJIAjkBXHle3vPkqQD6aNN1rHcGP6HkFlWtrb2Dde/ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724168734; c=relaxed/simple;
	bh=gXeGOiJsaH+f/OTMrO8pYdF21vGdLR5qkP5aTPpkM/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y7hidzwZig7dcBkTEfHx6fXoJD7wzdGvUNbsv0WHnGtu1U3dD084pl8rwOxfwaE6+gj05Nq5UZ9seHbKFHtES6dDrl/6rdKZKRc7wQPwT/No70My1RLGGpyhO2SsA+JhZ4uy0TMv5FvLnwVvHBrlSBpvsXoSBb75jFpWGy/zE3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oJrRYWOV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pjLsvy/b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KFJ2fO019705;
	Tue, 20 Aug 2024 15:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=IXBtMdv8NwXltIx
	9vj5y8eurKIru6XaMTQEZN6D14bU=; b=oJrRYWOVGMgfLVIFQjSMXfy3SumnhPS
	Gp9naGexpHybG22tniyhjCZGAPihOgkSQojdLbFqwBXt+KY69dWP+5D6mCOn7y4T
	Kna2wgIi5GvgpyQymzy/sPLUwgc74Ar7KMO9Rn6oID3C2LxVZSzABxhkUPzVwxx+
	R5Qdsy3C9kuUNZPtp1xq+MnbbzS56l16hD9wrjSD9NKttt44ragFg3s5NNNVWKV6
	1FQJLmkUamTHS0n8eyHhMTo9etz9+IrIZ1GwdXYn7ogLqsE8vbDU6k9dmK9Qyrjd
	Dc8eLZpisYkKySWCrhStN2zeFCBFSAQifqb85AwNyJAzXcX/QhE8OGg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m67dbsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 15:45:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47KFcGJ3033110;
	Tue, 20 Aug 2024 15:45:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414vtbkyvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 15:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuhgSVj7s1pI2dH25GPNdkg+mAMkdzmBEZaRMS8thlJyYQRHq7SGaa1i69My2WtNi8vIIdAeR+UCJup/vIna8TekUFoIknoDGuEhSiiNn6SUaM30CBBywyqiG6urChvqUsaKDWmEpNzReZDDCeOtH2SUgE8UmhFSUzFv1S75rnibusVMjqNUO4Il9sFyySfLk8hS3WE0GgqCGeP8hfBO03/mlj+8Nfx+P7wqvXKobASNwKGsnIljXe5yrD7abJd1WuVt27DUNCXS7Lkr6y5NkjVy/6BZrZ7l9YokD53784uC0Hm47pV5qEvQx8uJbnPHOQybwIU6kcX0SaALbufd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXBtMdv8NwXltIx9vj5y8eurKIru6XaMTQEZN6D14bU=;
 b=MWCkqB4STG6VXDlrIEIQ9u2klUTj40BBbob//Z2uhlZJNO7nBpWzpqg0d32ra2fvzfQ4IyulBM4Pqln6bruguJlog+f2bxBkNKtVuLZ2VtKzMC7GJA8lfXy0vsH5TzJ1v3ICvj1rhAsII9tGM6/pSMA3qXn6GpDIO0GCLzaP71oqaJLPfsolaj50+VGjRr6tNNiRiIFMF5/Au//hK/L3zEcX8dHXLBRj96oJ06kvp1JOpHZ2tOG6l0J7v7UoFVlYwgaMpH86y2uO6kLZegJBWDQ5f6FH2gzUwjnbRDHCmfvVShqWtpzT9p9JhG/5s57t6l8floz/Q8cLMUUXXw+gWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXBtMdv8NwXltIx9vj5y8eurKIru6XaMTQEZN6D14bU=;
 b=pjLsvy/bzUQ1n9kSpK/2/riD/gSz9ekbSZJhzoMlRVtQidOAGAmHvBgWL9RNSKgbmP54lgisx5o/JCCgjBjdTKy4gqbX5ojO6PKbPFBSBqJD+3W++RLcKAYSg1UjAXP1zsaPeev/wc0SDWoDMi93peK2DqwVnuOgwRlhXJYzWfM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Tue, 20 Aug
 2024 15:45:12 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Tue, 20 Aug 2024
 15:45:12 +0000
Date: Tue, 20 Aug 2024 11:45:08 -0400
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
Subject: Re: [PATCH v6 2/4] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <ZsS6BNFRN58l9ppM@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
 <20240815150339.1564769-3-kris.van.hees@oracle.com>
 <CAK7LNARsJgcEsTdeKxe9MtBeCPp6dCNrOArJRBievo954p33LQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARsJgcEsTdeKxe9MtBeCPp6dCNrOArJRBievo954p33LQ@mail.gmail.com>
X-ClientProxiedBy: MN2PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:208:120::36) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM6PR10MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b9133a-edb2-4b3e-7d65-08dcc12f13ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9MRvN3mFKQrmWgJn8EIsvmgPk4mbhcDe47sargXM9fBX0c23DhdlpQwVZlCj?=
 =?us-ascii?Q?s7LYXQc4Pf8vdgFWtjiVNxhQxsmrmlkGtLbkqzSqNpVIoJK3g4CEBcrGX54y?=
 =?us-ascii?Q?o/Jag/KWrQeNkIamnC/zihIPacNPLSx0pd4wykvyuGJkAvJOGbTwnLtQ6hLL?=
 =?us-ascii?Q?cM7NaIIgiZM2tIeqELg1+n74CGY+L8Y/OnW28TOklBenMmtstjRKDYUXVYtV?=
 =?us-ascii?Q?wkbgboA4iwOczPLq78wufkB7JMjI0YfpEP5PdVpul4XCv8d1k3/vn2dK5EzE?=
 =?us-ascii?Q?bRKpTOEoDWbYFe0JiktObQci0cbypIKbFc+oHzuppW0BLJKA5zUr7oWwoc31?=
 =?us-ascii?Q?3T+pmL/FvTuTUBfezSMGSP8TwnOCLL6f43tG3W0hmODUKYvlF8WK5s5I9T5G?=
 =?us-ascii?Q?hQnypPq0Stu3S8s/EGh+3oiPMeM5bzCHivpJPfH4b6XkQUacNydQ5FpqD7E6?=
 =?us-ascii?Q?NfJ1Q8MqzzP9x12xfjdsjSff8dvVqsUs9KBkCtmRv7hhHHEIT56m7QL44KuE?=
 =?us-ascii?Q?Snpv3AEo2dy8HlMcfKhgTi2cudzF15h2oZRLkIHEw/VQPyVXzQCFRh/tCP60?=
 =?us-ascii?Q?T9DImHeR4FbifzC4Vh2da9OmqA2m/RNIZqpAAPM7uTqmcQHFFmeB9JvrsSCL?=
 =?us-ascii?Q?Vetbs/jrgzNM68USWCIpmtXgguCuSKrnV+IDXVBS3tRCLMmWqPrLFANqxXDr?=
 =?us-ascii?Q?mssbqNzkeIBG2b07gvFfpbijRJF4/E8ZRUiB1YboycLQTTMtWLYYekeJ15kf?=
 =?us-ascii?Q?OXM208yfiPXNiV1YAiTemDCunfK0QIofkWNdgegLWNAS52nD+/HnHjW4HMas?=
 =?us-ascii?Q?cxkEf7pozjTLGa4Af//Dvq3meIFwJgD+eJe1foQdk5mRy/f0EaTrvhjxHWJK?=
 =?us-ascii?Q?WiH1WqTz1F2Z4p7ZNnIOOZgvZ++n7HwieDCzhwSaNgfvWTh+b3CtH09tXj/L?=
 =?us-ascii?Q?vPlqrI1SBU/TVrVIQLCVo+lb3/Ej5NObNIFyjEu+E8ALNDwFJoOAP39PXF1k?=
 =?us-ascii?Q?SSj93oQQzlZUoA692atu23nJWgTk9NodvNPBK6gxvxfYQbTHz2RfAszgxFW0?=
 =?us-ascii?Q?FIvjeza5FgpeySLO3R7SEo8QjsU09m1wfsaCapYjM6Qv4bN3wBUlcDepNJpd?=
 =?us-ascii?Q?9CVc1unoayvFGT02LfYvnRXP1fOLBlM6LnaYMUgKXmxYxo5DbS1eW3gNQuZP?=
 =?us-ascii?Q?gS3ICOzxv7djyBOA16mbLMQA7B77K1itUsUf2XQBlA9Zl51q3KpIsGDu1BZw?=
 =?us-ascii?Q?zviIXyyCcAFLYk3f9eqTDkTW8uZg9w1uHQk32uMHTH+TaovTtaClmDg2HYew?=
 =?us-ascii?Q?bt7eBjrbB4WK7U2QZIl4sFVCZqFjaF8WqOhBDpioFObkQpB5/wp3X6OxbRzB?=
 =?us-ascii?Q?5x6CCm4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vIX5VqLVcpOr5eZMylxMwyg71quKguhbqd6+wwcHJ5w1hx90l+bY2ErXsPZn?=
 =?us-ascii?Q?QR4tFG6lmmDtkL0pYxSlV6QM1Bdr0dW8W3XtLgIC9gMthT1g76Gb3oTxLasc?=
 =?us-ascii?Q?ElqPUped4lGjAwhf3TuVs3lKQI0GA/2QhAw3FPsERqVmwHlVhJHoAoA4sy3v?=
 =?us-ascii?Q?nFaa8YLNhNIhPxeYFBobg9pDpXgD7RPgoG06ASwOLrV6eGTzYMoOUYjWNVdN?=
 =?us-ascii?Q?Hvg0jzTNAJSTaLKrHuPdFB3V4Mj8XEBIN5Mti2gGYFnbunKgtvCQyZNRtkY7?=
 =?us-ascii?Q?wLt44MK4t4QjnIqyU5KWU6MayO/1LqEU1D1ysEu3RuA0o72JJ7yb0QatWmaq?=
 =?us-ascii?Q?KGXD2PLquF2ZnrNUlV0g5mXQxTFD4la3rcGYbUQy93maHWcXJZkceEkpyKl3?=
 =?us-ascii?Q?qaUUYzKHhu9IfU8SmhoghPwyUBZ8Lo1OtCJZ75jvKZEXF0n6tIB/gwDK9DgF?=
 =?us-ascii?Q?+2vU96OU80lYbNdnUNsFU5VlAAFRmFj+qO0RuwzRI3CPhQrjqP70uM8FhpRO?=
 =?us-ascii?Q?p+iscJn2OuD0mnMxwriFApJcYOr3rlcu/IV6mFN9NEPuZOPZ8Ith8mGq6ljD?=
 =?us-ascii?Q?qc7/b03aqJjLAlqWSg7lknYmPpr/FK4FFwAjtUgPQ7PnEr5Uf452SJ2MChLn?=
 =?us-ascii?Q?StIQ9tnIT8wUnKiX/PPAAJg/9S7++xYUhlcMlumPMHl83i/MjmixmmoSxfWS?=
 =?us-ascii?Q?yqGwZZo71eU+dl4s7v444RwvFcgrNTVK9TxF59J/9OPA40c0y0Pk4bllfBCM?=
 =?us-ascii?Q?Lb5MYpmhGWv6QU4mQRa1P03enMroySubIMz4oDX1wReu8v3d7N1A7pLrWZO1?=
 =?us-ascii?Q?v3S2wyxy7kOp62+OlIj3ITXiDdCjT1jST9SBk/FquPaw4JnWHU8v4JnFeJYG?=
 =?us-ascii?Q?a859CSeaW5NIDxQV+w+w1kDFrsBRRP7wdvHJBVgmUB0i5Xk9UVRyfnWLtcih?=
 =?us-ascii?Q?cztDmpIJMXvYEthmjFTFYOtaPi/TRb67mQKlZKGw08LiFBir33Sz/ExRTE4C?=
 =?us-ascii?Q?aM4UmJYMvxhRih2TptpJKu5SeslEdneHYrQ2SkGxBiK+1kWvPajjZGif/5cv?=
 =?us-ascii?Q?S36FWwrQPp3gPyxu3udnEkDxgs7mMFHylCdj9YdHCBX/MgG6YfAWd89fBv4K?=
 =?us-ascii?Q?pFd1FwLSNyLdrHtkp0FM+ZpyJvDcWJalOEAM1+dxhKfndTAB1dCSlWpSSD0f?=
 =?us-ascii?Q?2wjTgdgZc7rCCKGqWPayMANmRyalT/QoS5FNBbeEK4njM29vbeK3XggufE0D?=
 =?us-ascii?Q?bi8G5AxbqlYo2Vrkhd4VUpn0rrLYpGs/fAQlhTzURNER7UK0aWcDTOSPJHug?=
 =?us-ascii?Q?WVEEVqkU8gr/sq3LqU5Zfz5sKtWm2Ebf7YenAg6Glt1ORLajEHDda333gF8I?=
 =?us-ascii?Q?76CR8mcp3AUC9QlwO4nxhVaKA4UY913BX0+88cpxCUceg3sthfo8FeYw/opX?=
 =?us-ascii?Q?jNpGcXLabaUb0XUYBKg99mHLaZk/MVI9O4LFxga5bixFTsLQzDQz9JKD42sa?=
 =?us-ascii?Q?IQU6coLxLoDW5xlqoHJTSOy/ADLM6KAVdZoYYGD/bHaaYLJDxYkUlJKHt3cO?=
 =?us-ascii?Q?Iq3g1tpBRhWP0JKnSl3hMllUVN9XvREwYg9+FdQQiD3spjgBnWu5wxDBNHfU?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5Pb+QDnjIktz+cjgZjdGI2PzcFTxXGipR/refvun0wGxrpjgc9141EW0m7PyaVIK0TkH1dMZ6BNNoq21ElqeaiYCDUVU6HXb+XVM8M5WQeWKn9FUb6z4uhmobLpFEFSHxUE9vGIqBpuHhES2bjs1k7b/c492r1xUZYgc2z40gx3Ls7aH3Gf0+Qr7MqFn6o1OkF17T65Lto1KMrV7kAx5t6FWxsPtPh9w2aiEi9JzuR6mlimuKEnxo7KHH9xuTygEeYq4Lign+NYjKbGn3s4DDJY33apMJHkn/fKlpKbQQ3SpMkkunWCdegJ2JDkMT/QhYnztKej8FhKJdocWvZwpSOvpIeq34U3Q+HXqpYbf2/kDnNE+a7gyaeinjTMFtnHcFXNZd/myKew+MRmEDnLGOQycn7IxjijwnFSnKukKau8j0UNW3qslkPYTyT+Udh6lGrUnpY3W4fx5gWXxi6Mm4CC/rxug1i/8760Fq5HllVG8vr3RJACkD6atBDVIqqj4kGh0OEQVVHAY5Vh+GXbfNU48d78HnUvxEvZrSKb2SC6QClgltUytPENnPr6qzNBktuAhbLpVIiODrl+vCCORIAtR/T7GBT0ucnxKav5hmb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b9133a-edb2-4b3e-7d65-08dcc12f13ba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:45:11.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdAkAXGySRPQe69GnhEqJzJYYtcV4mqRlxcEcafYaudba+z9Ubl5NO78zmTUO9kB/G5i5YjE5hTRZA4Qq+lbwpvgVrTxJnaFrMwkZb145II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408200117
X-Proofpoint-ORIG-GUID: YsHs8nh1rfwgIMHX2slfvrf3wltL_9Yx
X-Proofpoint-GUID: YsHs8nh1rfwgIMHX2slfvrf3wltL_9Yx

On Sun, Aug 18, 2024 at 03:19:36PM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 12:04???AM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> 
> The subject should be:
> "kbuild: generate offset range data for builtin modules"
> 
> 
> (Drop ", kconfig")

Thank you - applied.

> >
> > Create file module.builtin.ranges that can be used to find where
> > built-in modules are located by their addresses. This will be useful for
> > tracing tools to find what functions are for various built-in modules.
> >
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
> 
> 
> I do not see "KBUILD_MODNAME" in the code.
> It only checks "KUILD_MODFILE".

Ah yes, that was a leftover from the earlier implementation.  Updated.

> >
> > The generated data will look like:
> >
> > .text 00000000-00000000 = _text
> > .text 0000baf0-0000cb10 amd_uncore
> > .text 0009bd10-0009c8e0 iosf_mbi
> > ...
> > .text 008e6660-008e9630 snd_soc_wcd_mbhc
> > .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> 
> 
> 
> It is good to note that multiple module names appear
> in one line, but the instance (snd_soc_wcd933*) no longer
> occurs since 11b0b802f8e38d48ca74d520028add81263f003e.
> 
> 
> I recommend to replace the output snippet with:
> 
> 
> .text 00b9f080-00ba011a intel_skl_int3472_discrete
> .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> 
> 
> This still happens when CONFIG_INTEL_SKL_INT3472=y.

Applied.  Thanks for pointing this out - I didn't noticed that the original
case was no longer present.

> > .text 008ea610-008ea780 snd_soc_wcd9335
> > ...
> > .data 00000000-00000000 = _sdata
> > .data 0000f020-0000f680 amd_uncore
> >
> > For each ELF section, it lists the offset of the first symbol.  This can
> > be used to determine the base address of the section at runtime.
> >
> > Next, it lists (in strict ascending order) offset ranges in that section
> > that cover the symbols of one or more builtin modules.  Multiple ranges
> > can apply to a single module, and ranges can be shared between modules.
> >
> > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> > is generated for kernel modules that are built into the kernel image.
> >
> > How it works:
> >
> >   1. The modules.builtin file is parsed to obtain a list of built-in
> >      module names and their associated object names (the .ko file that
> >      the module would be in if it were a loadable module, hereafter
> >      referred to as <kmodfile>).  This object name can be used to
> >      identify objects in the kernel compile because any C or assembler
> >      code that ends up into a built-in module will have the option
> >      -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> >      can be found in the .<obj>.cmd file in the kernel build tree.
> >
> >      If an object is part of multiple modules, they will all be listed
> >      in the KBUILD_MODFILE option argument.
> >
> >      This allows us to conclusively determine whether an object in the
> >      kernel build belong to any modules, and which.
> >
> >  2. The vmlinux.map is parsed next to determine the base address of each
> >     top level section so that all addresses into the section can be
> >     turned into offsets.  This makes it possible to handle sections
> >     getting loaded at different addresses at system boot.
> >
> >     We also determine an 'anchor' symbol at the beginning of each
> >     section to make it possible to calculate the true base address of
> >     a section at runtime (i.e. symbol address - symbol offset).
> >
> >     We collect start addresses of sections that are included in the top
> >     level section.  This is used when vmlinux is linked using vmlinux.o,
> >     because in that case, we need to look at the vmlinux.o linker map to
> >     know what object a symbol is found in.
> >
> >     And finally, we process each symbol that is listed in vmlinux.map
> >     (or vmlinux.o.map) based on the following structure:
> >
> >     vmlinux linked from vmlinux.a:
> >
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> >
> >     vmlinux linked from vmlinux.o:
> >
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             vmlinux.o         -- need to use vmlinux.o.map
> >               <symbol>        -- ignored
> >               ...
> >
> >       vmlinux.o.map:
> >         <section>
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> >
> >  3. As sections, objects, and symbols are processed, offset ranges are
> >     constructed in a striaght-forward way:
> >
> >       - If the symbol belongs to one or more built-in modules:
> >           - If we were working on the same module(s), extend the range
> >             to include this object
> >           - If we were working on another module(s), close that range,
> >             and start the new one
> >       - If the symbol does not belong to any built-in modules:
> >           - If we were working on a module(s) range, close that range
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> >     Changes since v5:
> >      - Removed unnecessary compatibility info from option description.
> >
> >     Changes since v4:
> >      - Improved commit description to explain the why and how.
> >      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
> >      - Improved comments in generate_builtin_ranges.awk
> >      - Improved logic in generate_builtin_ranges.awk to handle incorrect
> >        object size information in linker maps
> >
> >     Changes since v3:
> >      - Consolidated patches 2 through 5 into a single patch
> >      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
> >      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
> >      - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
> >      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
> >      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
> >
> >     Changes since v2:
> >      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
> >      - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
> >      - Switched from using modules.builtin.objs to parsing .*.cmd files
> >      - Parse data from .*.cmd in generate_builtin_ranges.awk
> >      - Use $(real-prereqs) rather than $(filter-out ...)
> > ---
> 
> >  System utilities
> 
> > index a30c03a66172..dcdf14ffe031 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -571,6 +571,22 @@ config VMLINUX_MAP
> >           pieces of code get eliminated with
> >           CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> >
> > +config BUILTIN_MODULE_RANGES
> > +       bool "Generate address range information for builtin modules"
> > +       depends on !LTO_CLANG_FULL
> > +       depends on !LTO_CLANG_THIN
> > +       select VMLINUX_MAP
> 
> 
> I still got
> 
> "WARNING: unmet direct dependencies detected for VMLINUX_MAP"
> 
> 
> I suggested "depends on VMLINUX_MAP" instead of "select VMLINUX_MAP".
> 
> 
> 
> https://lore.kernel.org/linux-kbuild/202405150623.lmS5sVhM-lkp@intel.com/
> 
> https://lore.kernel.org/linux-kbuild/CAK7LNAST_SbaN9WQRM_k0xE1MUReJvn9AMSg4A1-9b9xotf67w@mail.gmail.com/

Updated.  Sorry about that - it should have been "depend on".

> > +       help
> > +        When modules are built into the kernel, there will be no module name
> > +        associated with its symbols in /proc/kallsyms.  Tracers may want to
> > +        identify symbols by module name and symbol name regardless of whether
> > +        the module is configured as loadable or not.
> > +
> > +        This option generates modules.builtin.ranges in the build tree with
> > +        offset ranges (per ELF section) for the module(s) they belong to.
> > +        It also records an anchor symbol to determine the load address of the
> > +        section.
> > +
> >  config DEBUG_FORCE_WEAK_PER_CPU
> >         bool "Force weak per-cpu definitions"
> >         depends on DEBUG_KERNEL
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index 49946cb96844..7e21162e9de1 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -33,6 +33,22 @@ targets += vmlinux
> >  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> >         +$(call if_changed_dep,link_vmlinux)
> >
> > +# module.builtin.ranges
> > +# ---------------------------------------------------------------------------
> > +ifdef CONFIG_BUILTIN_MODULE_RANGES
> > +__default: modules.builtin.ranges
> > +
> > +quiet_cmd_modules_builtin_ranges = GEN     $@
> > +      cmd_modules_builtin_ranges = \
> > +       $(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > $@
> > +
> > +vmlinux.map: vmlinux
> 
> 
> This should be:
> 
> 
> vmlinux.map: vmlinux
>         @:
> 
> 
> Otherwise, GNU Make would try to find a pattern rule
> to update vmlinux.map.

Ah, I didn't realize that.  Thanks!

> > +
> > +targets += modules.builtin.ranges
> > +modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> > +       $(call if_changed,modules_builtin_ranges)
> 
> 
> 
> Presumably, modules.builtin.ranges should be regenerated when
> scripts/generate_builtin_ranges.awk is changed.
> 
> 
> Maybe, you can do this:
> 
> 
> quiet_cmd_modules_builtin_ranges = GEN     $@
>       cmd_modules_builtin_ranges = $(real-prereqs) > $@
> 
> targets += modules.builtin.ranges
> modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
>                         modules.builtin vmlinux.map vmlinux.o.map FORCE
>         $(call if_changed,modules_builtin_ranges)

I had thought about that and didn't do it.  But I certainly agree that it
can be a good idea, so yes, let's do it.  It certainly helps while doing
more development work or debugging with the generator script.

> > +endif
> > +
> >  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
> >  # ---------------------------------------------------------------------------
> >
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index 6de297916ce6..252505505e0e 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> > @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
> >  # Link of vmlinux.o used for section mismatch analysis
> >  # ---------------------------------------------------------------------------
> >
> > +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)      += -Map=$@.map
> > +
> >  quiet_cmd_ld_vmlinux.o = LD      $@
> >        cmd_ld_vmlinux.o = \
> >         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> > +       $(vmlinux-o-ld-args-y) \
> >         $(addprefix -T , $(initcalls-lds)) \
> >         --whole-archive vmlinux.a --no-whole-archive \
> >         --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..9b647781d5fe
> > --- /dev/null
> > +++ b/scripts/generate_builtin_ranges.awk
> > @@ -0,0 +1,515 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> > +#              vmlinux.o.map > modules.builtin.ranges
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
> > +       fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > +       if (getline s <fn == 1) {
> > +               if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> > +                       mfn = substr(s, RSTART + 16, RLENGTH - 16);
> > +                       gsub(/['"]/, "", mfn);
> > +
> > +                       mod = mfn;
> > +                       gsub(/([^/ ]*\/)+/, "", mod);
> > +                       gsub(/-/, "_", mod);
> > +               }
> > +       }
> > +       close(fn);
> > +
> > +       # A single module (common case) also reflects objects that are not part
> > +       # of a module.  Some of those objects have names that are also a module
> > +       # name (e.g. core).  We check the associated module file name, and if
> > +       # they do not match, the object is not part of a module.
> > +       if (mod !~ / /) {
> > +               if (!(mod in mods))
> > +                       mod = "";
> > +               if (mods[mod] != mfn)
> > +                       mod = "";
> > +       }
> > +
> > +       # At this point, mod is a single (valid) module name, or a list of
> > +       # module names (that do not need validation).
> > +       omod[obj] = mod;
> > +       close(fn);
> 
> 
> Is this "close(fn)" necessary?
> I see it a few lines above too.

Good catch - not needed.

> The code became way simpler since my previous review, but
> I think this is still redundant.
> 
> You do not need to check both of modname and its path.
> 
> I attached a patch for code refactoring.

Thank you!  I didn't think of the approach to keep <dir>/<mod> as the key,
but that is indeed simpler.

I'll squash your patch into mine.  Thank you for the good suggestions.

	Kris

> From fcdc459ce4c7eb84549e45cf06a3a44f90aa3cf9 Mon Sep 17 00:00:00 2001
> From: Masahiro Yamada <masahiroy@kernel.org>
> Date: Fri, 16 Aug 2024 23:55:51 +0900
> Subject: [PATCH] fixup modules.builtin.ranges
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  lib/Kconfig.debug                   |  2 +-
>  scripts/Makefile.vmlinux            | 12 +++++++-----
>  scripts/generate_builtin_ranges.awk | 25 ++++++++-----------------
>  3 files changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index dcdf14ffe031..f087dc3da321 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -575,7 +575,7 @@ config BUILTIN_MODULE_RANGES
>  	bool "Generate address range information for builtin modules"
>  	depends on !LTO_CLANG_FULL
>  	depends on !LTO_CLANG_THIN
> -	select VMLINUX_MAP
> +	depends on VMLINUX_MAP
>  	help
>  	 When modules are built into the kernel, there will be no module name
>  	 associated with its symbols in /proc/kallsyms.  Tracers may want to
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 7e21162e9de1..7e8b703799c8 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -39,14 +39,16 @@ ifdef CONFIG_BUILTIN_MODULE_RANGES
>  __default: modules.builtin.ranges
>  
>  quiet_cmd_modules_builtin_ranges = GEN     $@
> -      cmd_modules_builtin_ranges = \
> -	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > $@
> -
> -vmlinux.map: vmlinux
> +      cmd_modules_builtin_ranges = $(real-prereqs) > $@
>  
>  targets += modules.builtin.ranges
> -modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> +modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
> +			modules.builtin vmlinux.map vmlinux.o.map FORCE
>  	$(call if_changed,modules_builtin_ranges)
> +
> +vmlinux.map: vmlinux
> +	@:
> +
>  endif
>  
>  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> index 9b647781d5fe..865cb7ac4970 100755
> --- a/scripts/generate_builtin_ranges.awk
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -12,7 +12,7 @@
>  # If we have seen this object before, return information from the cache.
>  # Otherwise, retrieve it from the corresponding .cmd file.
>  #
> -function get_module_info(fn, mod, obj, mfn, s) {
> +function get_module_info(fn, mod, obj, s) {
>  	if (fn in omod)
>  		return omod[fn];
>  
> @@ -21,16 +21,11 @@ function get_module_info(fn, mod, obj, mfn, s) {
>  
>  	obj = fn;
>  	mod = "";
> -	mfn = "";
>  	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
>  	if (getline s <fn == 1) {
>  		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> -			mfn = substr(s, RSTART + 16, RLENGTH - 16);
> -			gsub(/['"]/, "", mfn);
> -
> -			mod = mfn;
> -			gsub(/([^/ ]*\/)+/, "", mod);
> -			gsub(/-/, "_", mod);
> +			mod = substr(s, RSTART + 16, RLENGTH - 16);
> +			gsub(/['"]/, "", mod);
>  		}
>  	}
>  	close(fn);
> @@ -42,10 +37,11 @@ function get_module_info(fn, mod, obj, mfn, s) {
>  	if (mod !~ / /) {
>  		if (!(mod in mods))
>  			mod = "";
> -		if (mods[mod] != mfn)
> -			mod = "";
>  	}
>  
> +	gsub(/([^/ ]*\/)+/, "", mod);
> +	gsub(/-/, "_", mod);
> +
>  	# At this point, mod is a single (valid) module name, or a list of
>  	# module names (that do not need validation).
>  	omod[obj] = mod;
> @@ -76,18 +72,13 @@ function update_entry(osect, mod, soff, eoff, sect, idx) {
>  #
>  # Lines will be like:
>  #	kernel/crypto/lzo-rle.ko
> -# and we derive the built-in module name from this as "lzo_rle" and associate
> -# it with object name "crypto/lzo-rle".
> +# and we record the object name "crypto/lzo-rle".
>  #
>  ARGIND == 1 {
>  	sub(/kernel\//, "");			# strip off "kernel/" prefix
>  	sub(/\.ko$/, "");			# strip off .ko suffix
>  
> -	mod = $1;
> -	sub(/([^/]*\/)+/, "", mod);		# mod = basename($1)
> -	gsub(/-/, "_", mod);			# Convert - to _
> -
> -	mods[mod] = $1;
> +	mods[$1] = 1;
>  	next;
>  }
>  
> -- 
> 2.43.0
> 


