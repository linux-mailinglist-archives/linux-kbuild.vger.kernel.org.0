Return-Path: <linux-kbuild+bounces-2991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C895275C
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 03:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DE9CB22247
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 01:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D7D15CB;
	Thu, 15 Aug 2024 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yo2sO9z/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zeFHicOr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A32A35;
	Thu, 15 Aug 2024 01:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723683787; cv=fail; b=ZYt7dYlue66IfdYC7rQgN8vDLJQsmU6BrHapZK6C95IOk03mmCaLQjttRAPzJXlARrehFC352AaPHIzgBfPw6pXAhSVhCUtFOrHuP5E6RNF6PZZX6vL+J77XjGkVuSwd2PdRST1yB7bBwq+24g81uudO34mgJn9xWTn0obJj+9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723683787; c=relaxed/simple;
	bh=yeiwbqr2po5TkY2kFqWYwugMZzKJx5ZTwxdv9KbVxEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZrSSxGUFJryn1BnW2hQJ9uKRM06I1h0BuQl58bcCiDuRM/Ep2Pp/+K+6IwXQ86RqJ3Xf/NayM2YBBVWc9k0UQjxQTvHDKHkt4kUu0ZelBGMuIO9BTyus7GsXr+e7gw18pSXRcguD95/I5EBmdDkigxfeZvy43RCV2wKTeCRDeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yo2sO9z/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zeFHicOr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIgInK008245;
	Thu, 15 Aug 2024 01:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=FoyDeKd+xf/5bgb
	efIsyho+kUOJbUgAsPV4UW7EqyMg=; b=Yo2sO9z/O7zisoKXtalIkZALVKfN9ZR
	GTibgb8HWRDXlD2Gbh9qKstUIW+g0OmivjWiQ9gypeGx0XsTNNDS5i0p6W7gF7mH
	+Sfjk9lHNO4JpJNmqIb2/YVnUDj4W8XiNzuQ49l2Y8b1cKp2NPl8t9xa/bLrML1O
	edJqbn/dHPQ4oD7J7JcpTryaMxbjN+DN/AzZeGs4a0BfAIyLwvdMzCB4L8tglWLZ
	mLQHZBrKjndk+ge4F6M2I+Nu5O/BpaWGaWdttSXIbf3TCf6UZexXmYTzqN4+/Aed
	4Hj04VMgvhYQH2GFhYDfJexHh8Oy+7eI8pUr/V+8e4uGrgKmNE+zD7Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0399en1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 01:02:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47F0rSLT017670;
	Thu, 15 Aug 2024 01:02:58 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnbmksv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 01:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLi9pvMIra4OODt0yBAvQOoVHqcDkosMxFBxma5iSi5B4Eb+BjddVdsYjsBDNQG5HridjJ/KyWd9lsMBUgZ7xwS64ql3dOUgV8qnS0iS6YkeUdMZaqNNSir98qE91rHfA+gs1K3ctddG/qBgJ36iughY5CY+N+rdJH2/smNXUrF6nRjm77QoEM2wGh0t9GEHuR1+wtlyNTVD3ZhIr1sly7JLxpCAd15RljlvqIcXxGVHmy6e9NFzB8Ze913sVYRc+cfAPE3DW/1sOQB28FVC9z3fWPZpzYPs3aLufyzVHp9lZmyw+89sJ9gHc3WbzAhum4VYYz0BHOwunUf7sBPyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoyDeKd+xf/5bgbefIsyho+kUOJbUgAsPV4UW7EqyMg=;
 b=nl0V5NjUs8jzrUei9wy4ECyuTJ4SSSvUwd+4GelkJbcKoj1lCLOJyWWLLwrpRJzL+ibb8/Xn46XqRNoBW/IG8vd8+qiRdWy4lQdgzKLtxtEC2H2UZKRlFfjdQUOoLtaAFyAiSqBZZU7/0ujX55XrlHuVjf/yGx2OHLZ5QdrUpUK4poO70XqbY7jEMvaRqAGq0fXPKsRKskrbMlsvRg3j8jA9juQ0AflW4polkNmi4zTr8mNO1uQ7xpLLYHjlcC5cFBzZTawp/BAHCgGmUArokQ8zrELg7R+K9u0WRu33ZhGtg82V9Z8upsAk1uPVX8qcbdwXoAqepwNlEL4U/pgjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoyDeKd+xf/5bgbefIsyho+kUOJbUgAsPV4UW7EqyMg=;
 b=zeFHicOrDk13PiQIueCLfxILshWtmxtMkn7jrQgeHwR4JJ45+xEXCXrAgGOLGfcM9pFY+3gJAxzyGlo+y5JFCU+O8S9zyC+KX1HU9N/x3mCEMoTnrvJrQ1G/G5+T7mG+4xYCycLyS2YPZlLgrI6p+ItXE2jrl6uUv48T5Q3jwUo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5560.namprd10.prod.outlook.com (2603:10b6:806:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.9; Thu, 15 Aug
 2024 01:02:55 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 01:02:55 +0000
Date: Wed, 14 Aug 2024 21:02:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 3/4] scripts: add verifier script for builtin module
 range data
Message-ID: <Zr1TvFAu56dd+u8j@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
 <20240716031045.1781332-4-kris.van.hees@oracle.com>
 <20240814151945.122da7b6@gandalf.local.home>
 <Zr0MvswCE3VJBKhp@oracle.com>
 <20240814161606.1b514882@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814161606.1b514882@gandalf.local.home>
X-ClientProxiedBy: BLAPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:208:329::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5ddd28-f521-4835-f23e-08dcbcc5ff3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K6MyKdXtui6eCOuNgU3LqCAt5LtyqvK3rEMa8QocWg9pKWgV70eKbxIsyedc?=
 =?us-ascii?Q?Is4UDHBVXQUFANqtbjnppnhrymT8vslYj8C8N5iYhRVtSAttu/sEN+nQhw21?=
 =?us-ascii?Q?SmIy3YV6YlrxXJwEFKFp4Tn82BzZGQVFuBH4AaSZMkGzVO4Mo2d2Nc8zki1G?=
 =?us-ascii?Q?5om0A7EErvFvN7FdhxiPJNCjUXJFXgmOaPCVKhLkunDOsj8s/ojMjRInV6uX?=
 =?us-ascii?Q?t+J3ncMOkBEJ0uxWd0fJ+CmK3fhOLN0OktEpWn8WINNNR07KZvCt+gdEOCOV?=
 =?us-ascii?Q?MVbYycUJcj6WXzRBQPHg8B84rHtgTXUc87JmqY9WTnhSuggFKYKR1Ccd99ib?=
 =?us-ascii?Q?WhzSAUdK53jIxifqaJ2M7YeZFEYD6mQ/QxdLXO0cX8eOyec2RnocE1Ngejxy?=
 =?us-ascii?Q?Sw34aru0gKPfYjIcIsrvibDI45YoE1j4K5c6fTUbPaA6FOYuv/GrAierkrOF?=
 =?us-ascii?Q?ngjmeF+4zcXNHizOva/wl46eRGYz8AJppA/BOavNtR2xBapn1OBDjjhYYTZ/?=
 =?us-ascii?Q?71RkOCGZzAXzKOZmMtI6tq96rRvFuhWFLs8+UOgO1vevchhcVtMxBvpvUO5e?=
 =?us-ascii?Q?Jv0wqjT6FWiFscgJasRLqulanWNsEjlrCMQSFLzWkmVMo8GA1WnOBzgLD9or?=
 =?us-ascii?Q?YWnxFfJXntIAA8o+W8Ujrxyu90A5/OeHlHDtKhOJ49wSF9PKnVMGsC3MbRLE?=
 =?us-ascii?Q?iSNcJYnNW/DxmJJ+TdHrubI9i8NyNwSSzYDpyUiKq1L4hSt+xenOeXP0+YOn?=
 =?us-ascii?Q?hs24mpBn91HmUr7k8wCifrCpJFoS9NjQwQhRiYguKyWcfzpH86mdQlNV7+N8?=
 =?us-ascii?Q?ko/nEN5Igh65g+KXf9nSRRF5bXRVHIX+BdINX4Wj+k6auW09bsAFpzzKXlCZ?=
 =?us-ascii?Q?XgjRHC4alilaFvEe5KflAlQeROssN0FYK/ClpUnt+/IT169rZlQIyHjc/LcS?=
 =?us-ascii?Q?f5SsdJh9jAsAtDc5+TRXZtmDOgoCJrcPkYwSMq2nIX0OJh+SyT3ippCBDsxe?=
 =?us-ascii?Q?P0E5RBBkynY9gB8kdG8tHX19LQPg3wstNhozZL21JsQ92ihCHMeqoUN1ndGi?=
 =?us-ascii?Q?hIdVYSkj85qP+esG3XeZGdpttNsvWeobocE7XGKi6yUYx4tC1Ol4odEsenyO?=
 =?us-ascii?Q?qw3SnZ4ij+E47NTVCCtGLPuRJr/QeTY6gv7fyxH7JoWkHtTJfzyaX0RXr5oq?=
 =?us-ascii?Q?NK1E9zYNebUy3SGWbnMv6EB8V/zIidweB+g5qgFAlFtmu2i6rOi16eq6xjKA?=
 =?us-ascii?Q?WiwQoCkgELyej0KDCrtkqhP4A1cmCVFZ/MpP7Y0dkToE8igscvZ81Eo2sbZl?=
 =?us-ascii?Q?xQzHthbTPOJAc1QS5T0jMwGn+JTvONkFpA9tbsADVKxX/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hpWjW8VhAsYprLVViEVSKqzp6sAJc+pWW74K4DG/RRIdpsVJe4SoUYlZyt2e?=
 =?us-ascii?Q?OpPZLnO00zkzo+J0PK3VZg06Z1eKA9ppU573+USTaYosaBj0RbNLp46xbdCT?=
 =?us-ascii?Q?sr8JNMdBzyfgZzLFKcvJ0rjPiHxsVfIiIaBhq887AQ8+hWzgoRILx724mSnB?=
 =?us-ascii?Q?bRDbA/pq+4fGbeK8YfJwMZNvEXCT+u+9WSs5fUAcqS6n5S7kCWhp+UKBr/TR?=
 =?us-ascii?Q?IEFiK/Br2+CwQ6EIzI8eJ5nBbQW2uLvPj/BYMuGDgfC3DfZDYFK8z4igPtqF?=
 =?us-ascii?Q?VfmdKmBkrGP8SIlEFl7YkhxZHHNAQlBA/U0JEjt1h0E7YSP6zcCdYsumidam?=
 =?us-ascii?Q?3oYRGuzb3rrEUT8HXMU8Z6JWfPfGpTnZRnbfIiCHBK1NNNi6ZeNr5SprWGSB?=
 =?us-ascii?Q?sC+cZ2H/HDuQALW4cDKhjG04LBF/VxM2zgLicrSm/mJyykH0PxRvoGHZqF53?=
 =?us-ascii?Q?uDH7jnnQUCip6KOvKe8tPL4ECmhKKp2vMsNHuvDb4ydnxEYFibKQJKw0IVZ2?=
 =?us-ascii?Q?qeW3v9OYEXKffk50HR5Yi//7llA5XQ/eIWzmh5h4/aS/CebyEQFRuSAZgnZo?=
 =?us-ascii?Q?Gx/c/OVFH1ebHUJtRulyrm1SSvo0v6T3hLTn1yGLIImo5EhrunVjoGJO8+Ur?=
 =?us-ascii?Q?L4nPLeRzjrb3Cb4AuZ//mvWuBUy8B0iW0wmVILvSC6/tYtB8jtVXXWON041C?=
 =?us-ascii?Q?Xi5zLsEGPk3fEgDPSa4CBRJ+YnXWwj3kQNGdC+zyxmqmIB69JIFLCYbzzS7/?=
 =?us-ascii?Q?ADMcd4DRlwjJyz+O3OL7QbY6GbmxRFshV50Xh2APgx715n3qoN24MHyJy364?=
 =?us-ascii?Q?iykOri3gx9rc0cXTk01n5HGky44oYTVdoHvPMBoZElH/pGRGHWYFuhi4WwmU?=
 =?us-ascii?Q?vPYbIEmGkZeDEXYvd9L9Tm0nXfOE/uBV8GII5Wbo+QLLY5vRvTlhchji/XbO?=
 =?us-ascii?Q?qnsIfRPKpytQ1i38jk76J4YudrltbFDznJ2spUYCi0hiz5s0b/sOg4FZUyVK?=
 =?us-ascii?Q?lMYbk6C60JjS4BF+aGproeVB/y532LRSXWDhTeQ1Xb1PNQ1uHhNGMcCFgzel?=
 =?us-ascii?Q?vmR2/6pylfyr5Ln3rmkR8GcgGb1mc4Wr3Mik+y91JlbKgtLqrQY6082HJN2i?=
 =?us-ascii?Q?gUs1esCHLSZh+Icv0ITYiLYUNu1tGcysEEtlOzX1eIO1+l5YI6KY0sPX4f7Z?=
 =?us-ascii?Q?EdI/dcdrVUA3UGKlb5+XaeB5gKOKQJliM6VCI7Vam9ErKQ3awgSMREAsNpbW?=
 =?us-ascii?Q?S7IWrfbkQsAHncebphKdMQD4fHcMiJxNAWZfHD1WWvNXkHrqme4mBKnyZekW?=
 =?us-ascii?Q?EytJcrjo1lVhwIPe9pmTdriTIm8OODaRZtK052GPUTqPiSd2Vkgnzx1B1YtC?=
 =?us-ascii?Q?wDnxqj1g4vzTckpI5vTgv9+45fTGbkF/SvTlxJCnzPheiiOCb6E0MJl7wz6m?=
 =?us-ascii?Q?PmxIG2Y0YtAKyl/9Lz9eWhUed12Pg0sKxo5uh54sdogPtvgM7vEKM+Kscgf1?=
 =?us-ascii?Q?/JJUfnDnvjXT9NorX2TFUwBva7K0y04f05Hv32Ir4UOmuJHilFukgZxuQPbk?=
 =?us-ascii?Q?vSAZX5SX+YlN4b2IKk9NappoUVULxtn1bGDUEiuvqsyP5NrP6YW5oOyOtw0U?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YwG5LLSmCUr2IzasmzgoCyunjHSREX00v2HLbmRh8CSpXL31Xaat3HVpEVzXIFfJrPNYr216YG8VLF/YilQf2rEpP5Z1Q8zil2ZONQWNvEpn+974IUb3cPXAJel/vCy+BQvUEWbS3Dr4p7b13Yv/T/uc9cE0hLP2791W4DF3VNEwenI7uU9/vI2nd/oAliQGwM+H0ymqaBj9HyBigHMe14uWu+QNctwabRXKdwbUEV2PsoR1pt67ADcl/vHehvM1F1blVnwh0RbVsglG3lD9kQtWqzfu3qhpW/BqXvWdIH6Jip8rkzm9RIQYsPVlzyZ8OojwWLTs4UwdZ55x61yAXzcYw+orErF5uEXbkyKXCCdx/mcXEhAdBtsdswAuv0IdQdSSU/QWbPZe0thgaAtBTeSSsLCobSZ05hX9g+9hRajUcaG3lI84kn5dx8FvjuO1MDLj4ol/Y9WXMS4+Bx6eKmetgXrrsppPIbsTTRJk9fZn5bwqwgmeGuL8mzXo48V7CJPPO9qrroTLCUJKh8cgRA54wKbhLHWyWEO9wbDjwrDfKBRZfcfGA6aKbN6ph0iXsI/ardpdHZW732eNYJo6pX3PVpINY9cjB7hpaDxQad8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5ddd28-f521-4835-f23e-08dcbcc5ff3b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 01:02:55.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzwpWzCD2BkBDMPCFGTr9M2KNqO1yI0bF5WymqW3+aq//oZeEo51Iaq4OgkshdJm68DSTI2PyB1BjX7qrxm/tnl6IPmu5nUryDbpgA++89k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5560
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_21,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150006
X-Proofpoint-ORIG-GUID: op-a1cIfxgZ8s1KiMfUgTd2jOVn8s5Kl
X-Proofpoint-GUID: op-a1cIfxgZ8s1KiMfUgTd2jOVn8s5Kl

On Wed, Aug 14, 2024 at 04:16:06PM -0400, Steven Rostedt wrote:
> On Wed, 14 Aug 2024 15:59:58 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> > > What does this mean?  
> > 
> > Hm, this is certainly why the validation script exists.  I am surprised, though
> > not entirely because kernel changes toward the 6.10 branching and such came
> > after I create this version.  Would you be willing to send me a copy of your
> > .config for this kernel build so I can investigate?  This output is typical
> > of a case where the script was not able to determine offse ranges correctly.
> 
> Attached.

So, looking back at your output it seems that the problem is that I did not
make it obvious that the verifier script is written to be executed from the
root of the kernel build tree, i.e. where the objects are stored.  I'll add
support for an optional extra argument to the script so that a path to the
actual object tree can be provided.  That was an important oversight on my
part - sorry about that.

So, if your kernel is built into an object directory, the script in its
current state would need to be executed with that object directory as current
working directory.

I.e. if the build directory is /work/build/nobackup/debiantesting-x86-64/ and
the kernel source tree is in /work/source/linux, change CWD to that build
directory and invoke the verifier as:

/work/source/linux/scripts/verify_builtin_ranges.awk modules.builtin.ranges System.map modules.builtin vmlinux.map vmlinux.o.map

Can you try that and verify that the output is correct in that case?  I expect
it will be.

v6 of the series (which I hope to post tomorrow) will allow you to specify
the path to the object tree so that this will be more user friendly.

	Kris

