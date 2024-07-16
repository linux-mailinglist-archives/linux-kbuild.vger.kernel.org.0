Return-Path: <linux-kbuild+bounces-2547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD913931F22
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 05:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C6C1C211D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 03:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABD9F9E8;
	Tue, 16 Jul 2024 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H6s7nTLp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bHZG77ye"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646015ACA;
	Tue, 16 Jul 2024 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099472; cv=fail; b=eZdqFrmqBpGXaukYPt5B0lznmTInQvEVQBrqeEgCoeKamMflj6TIUfFgtBomMOiiU5fokx/Kb2iRW+bXRdF+tzPhpjck+jPSgw2z4Rg73zwEvSB97XUnB8DvvXzbq/g9RN4xtN56wMPeu9oS8twRyHNciAj6dQGzxk5ik3lPtMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099472; c=relaxed/simple;
	bh=7uhZCFCRFVSd8Ct/tbcyWhPERtOpZgZ2gdRm8BPkR+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZDICLbWyytyTVig+5OmB1t0zUXfdsAX43g4AqsDN3Zah8dE3p/H8jaOZIQ7d9xlz/BLzEbB9xUzCw7WLne1l3o3SgYDvXeEs/ayriQpNVNmY3EalUjpp/1hUdhrKwCbJbYCpzfotsuqeJmaAtEUHmFG9vCpzt7LbnwEvk0MCeJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H6s7nTLp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bHZG77ye; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G2tVfW018715;
	Tue, 16 Jul 2024 03:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=AQXtBbKNvdXoSCPnygGjhR9EG9d2twPzg3GIczr3BNw=; b=
	H6s7nTLpQRajQwrBD6JJwUdpJMckn9XfpEgPm6ABcOsv6UliZGo7UEzH8CxrsvSG
	zPlxJdUTFQ0z9hTRjhNkqVPcWCCbBi7aNZXySCQkSt9ySRG+PKFrJi4JXh141yue
	BFl0wXfm3iGTPi5oldGPkz/Q0J7AEPosUWWGnjUF38n/d+isYH0ENiGPUJ4giRuJ
	O2YrSMFmJUGPqu51QJIUbOgTLdwHZPHDl3TIFctQLoDHIFw2HPyAl0TBFHjXaCpW
	NImTbTl71XuhBHhfL3TVkv7PyDSrVcCEAujaH0xQpfEbF17QJb+OK7hp9eZfcAMT
	LSfQDPk7OJo4lhYP437yYg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bg0cmtfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46G10Y7c040662;
	Tue, 16 Jul 2024 03:11:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40bg18qrw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3LZdG/HxVDL5N5i6h7uAdryIdFvvTCkRxAB4Tv8LQMhN/w5wmhGFRBfzEtR7VlUL/Q0ltAv7s8Bj1M3rTqBBsAUyTea6KywyfeFVdbpV7OEtXrYDWnUuG5sUxUy1O98TqWbCb72cCypI0bfkvbuc1Hhi9XmpdCXprhTtJBlmeKIugSdmsEkIklOdWCTKxmxaMAlsx0KjjB72vIsSksk8UnncmlkuVtiPUs5l4hqLresATsrQRRmmG0BhxPCMomsMqeR8yBvAETc4N27ImdiswqQyrcdP8A7dZqOFgFMie4wi6S3IJhjVFSMQswbo4Kg83e8YrUg9Rfpa7hmvUdQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQXtBbKNvdXoSCPnygGjhR9EG9d2twPzg3GIczr3BNw=;
 b=VkFpOLRk9qI2znVB+WCfcsJlQIrIePB0AAHkq6ObzjLgXEHlwgen+c/4LLVQRfz52qxWEMNP63HgbdlFrRAKu2SyC65N0XqOQHcE7lJbgff5Zzkkq/xpbbdc9W1OaNld22pUheQwsKXELKvdbb9xNzwEFb6RWSMFoBRVoaBcRZeDLT4Ab5MSB5d06WtuBaLdLotLpbCz568yeA4z/rsewq9aU/Dg29IJsmwiM2Css68M/TxQcBuW9gsEXUGgY1+QgOXijvWsqffxE/iOxPzZIjvzRXyVOAEA5DWuMiypi5flFVqM3RM4evU54NUMi3fErC0XmMkw3zMX1twjnZOlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQXtBbKNvdXoSCPnygGjhR9EG9d2twPzg3GIczr3BNw=;
 b=bHZG77ye4S/95teeHmdL8tLkkAgaOS+HeBH8MkISe2rB80HWBAMpCQRCc4/s6YwruMD7mqi9fpPn3qWr+hTmPtvBkw0SkGOFWttaxNPnT3a2fDsJQKy3bBiFUUTSQimUZ1MFWzqspb9c+46PCnHnHm1LHjo+aofHhT3hAlo0tsg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:11:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 03:11:00 +0000
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
Subject: [PATCH v5 3/4] scripts: add verifier script for builtin module range data
Date: Mon, 15 Jul 2024 23:10:44 -0400
Message-ID: <20240716031045.1781332-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240716031045.1781332-1-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0004.prod.exchangelabs.com (2603:10b6:208:10c::17)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 637ff27b-172c-49f2-f2be-08dca544eb42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?88pRiQ2kWFo8sALIpbVY5R1HDzFGub6aLIm4eaIuo49WyG6TRVTxyYYGDQQ0?=
 =?us-ascii?Q?jq6q8DkfIIKu0V7VTt1ixMLdCus/hGeW8sgdg+rNqrhNN7AFXU5GqdrIILMn?=
 =?us-ascii?Q?CugpNyNpMHZfUXQubCcbVtT1yEzM9034PrlYDvQ2LYtDRDMpt7CB/QWqovJy?=
 =?us-ascii?Q?6xJsnohgp9WtwBE0DB0PAzuSbPvHz6Iiypg3edPqeEJh9WwzbKvIcC4kFRUp?=
 =?us-ascii?Q?ZDwUL2iGC/mS6nqUdeA87kJhPMvbS/34hT6zafh6DbcVAL85519B5zqwVanN?=
 =?us-ascii?Q?+eyv+R0JC9ssIT1pUvHmeV9rgLUrd2cLP83Pn8oDHrvcf+QQNnkX4AdqH2cY?=
 =?us-ascii?Q?ccrVXUgDTrrddqJtbGQ6GAq85zsD6z8tA49WIg63gNhtGVIXVsDcr94YC+dV?=
 =?us-ascii?Q?v5aUuJzUtlUspnODd6zDmz3z5IZGYRu/uyoSGBZc9L0zR6F0WVDzd/OsVorG?=
 =?us-ascii?Q?BHr6sKfsmAEP4QEXq52EveHH5RHpMLJlT710vVYiZxwrOhBggbCSTOv0xeEW?=
 =?us-ascii?Q?7hq3fjQU26QguAbP6rFjEQf4lOOj5lRasafNUt6kaUiiUKM8lliLwUbYuZ8Z?=
 =?us-ascii?Q?8uRhm0Tf7cXXzOU87Zk8hTxSalCo+/oGgqnX3AS8/S5ku1bpfRck1NCXi4i0?=
 =?us-ascii?Q?qmgstYpttaiD+akJzeSr8eSdZbBAE6yVw3bG+m7wmmqOgxCXWsbbjFl45v8B?=
 =?us-ascii?Q?PKUhkNwsM/z0FTj3IFFQfdCKvW5CdjW9dCvdWSs5aUZPNaUTzIRP4/enOr3s?=
 =?us-ascii?Q?A8JCuGqqAY0LwGRfWtyDIEpfSicV4qdLxQqqAH06q4QqOG7SyNf5kdmH2dXd?=
 =?us-ascii?Q?1aW6YZAvyPsApEjnWV8cOOgoOIdN02m21jJBM5XcCYmTYJlPDpUrfdyv7T+J?=
 =?us-ascii?Q?4kZu76qAm2YrTMf0aFQWpgWZMtPOWvhy3cXrP47igT2/8lLuL+Y4MrCoV0Zl?=
 =?us-ascii?Q?v9rq7Zxii06LZZ4PLxYLgM/SPTd4hfNsYeQLpLii62MveTdsN8Cc0uC20Rbv?=
 =?us-ascii?Q?4G+1gmSE3Elj6QotThvF/HCWJP8e6Nl0ykYUR8ZqopI7lltL+fCPakjG7cOj?=
 =?us-ascii?Q?k7mZJF4txTFKa0I6YEyhBa6S6MPbGQ+WqXKHz84lzAsItF4qpqqaPeUIh9j8?=
 =?us-ascii?Q?3mLr9W9tiE+6YXP+rY1QMuB8fD2lYM1lPJEbtV8e1acPvKJmeTlVRcg0E5il?=
 =?us-ascii?Q?YL43aCE/y1N8KaFGjH36aE/kTOkRoBqOnCQjPaI88nPO30buShbZ4xaRLZSY?=
 =?us-ascii?Q?Hk4T0WpSpYcWDCqDk5R26MBOK6fUWndJwK3Ed8NjMv8F8OGx71tOqllYT5dB?=
 =?us-ascii?Q?0oREK296/qOyxSuxisfTGpF9unLCUIu2SsHmlmrQXCNSnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zpVn8gKXbKWEjyAltqbZ3VsRG71SVdCII5J3FPhv8jQ0LkAONswovBPdRUe6?=
 =?us-ascii?Q?0RCite8PtJzPFylUWpRutVDdBS+SHnWFHsYCSV7qGsTmNGmgTWtBRBNu52CV?=
 =?us-ascii?Q?ZvdIpEWjbHHwgZcz0RSuKZm/DgaiXimrsEE991Y1vohv3JWJhAMibfytcGzL?=
 =?us-ascii?Q?qLEZGIgzfkm2PJZok2WBXOx6lRHJzXP0jWbmA6jdZ6x8JmNCjH6G3TJp2BJd?=
 =?us-ascii?Q?PmbPLxi+iG1ITf7RTLV/L/gxgsEqGMSxRURdA9BZRaS1SYtqWHGK3EgI5CLH?=
 =?us-ascii?Q?Ju6FXPrsLi5mwlQRNn57Dc9JZ+Hf9VH8VQCSlngkBTFu4OD+zHYj9uZWvMzn?=
 =?us-ascii?Q?kdG3C9fSY6XmAS4bZtwxPf5f0YkTDd75a9ki8m8o/rcx4PtME8UuTpWioPVl?=
 =?us-ascii?Q?doz82MXIhSf8BHlPXMbYOPM/S9618llkDAgrG5t/ankI2vOyyNYxU4aOHXoF?=
 =?us-ascii?Q?iOpYokBfPn6zu1zxBFJtjAX346bxdxaxZYzOmtpxys+DFvW9bzfxiqt/JdQj?=
 =?us-ascii?Q?pWM2BPUWjTKrLp+xxAa2t5qFqWc0GtAv1GgJd4mzqklIXT0Ud84ipU8Iz2gp?=
 =?us-ascii?Q?G3gr6USI5y8V/CLvR0xR4m9VCgIomLlaKth3MjyoyRkhbD5MXWpzSlsS2DnK?=
 =?us-ascii?Q?nXhW7xD/ynUll0MEeUedjl3oODAxdkiT/CkCnjGnZLcjyn6PjckBppLq+VCv?=
 =?us-ascii?Q?oaihi6m7d3mQ6zKgeVWDScv5lLki6jZ2V5MDfWqHJhTMSftsOZRdH9G7GI3D?=
 =?us-ascii?Q?TlR7Abn2KEj1tuQ4SO4CYdEykGVWATTAkGJeYWl3LGcpNWLPLBERd3zKpoJt?=
 =?us-ascii?Q?DuXXEHL3Lw8rCytAoP0N93Z9herZ5ROOjQq1jlY124v6h5yfY7bYiI8hlV9r?=
 =?us-ascii?Q?ZA5G6l1R1xIljQkle7r/Fgd2HQm1fDmB9+t6O5MPVkp+sJMvvPieQSDEs7bf?=
 =?us-ascii?Q?Bm+0OlbK02JaUJcryWnI5twEYYvY9eoudFAtZ/45YwKoxgP2pDDVUPsr99o3?=
 =?us-ascii?Q?yXU9OFO6EWGkb/7TJI/Jfo+bkEuECgkay0poK8F0dF6SiD1AEx62eJoNrByl?=
 =?us-ascii?Q?r1szOZCkXVmzJCTc0QbNZIqikdtlYJuMB/U9+JHHrqkwB/DbBS7QIwh30x3r?=
 =?us-ascii?Q?jctMVR9Sa+TXQ7bfdNIN3mx0GEOw8mtK7mNV/yEEgLVaDpBiJ2RSWUNY8q2p?=
 =?us-ascii?Q?6ETYmELJBYtrKpOPk6xAthT+/dxpmchkPqm8h+CjcB5XJIaLpbVq8mfNTKGp?=
 =?us-ascii?Q?pLu5+zSRJzw1G4qCY832Au1jqDWOaWjWLVHF9kO3/y62UE6A32vcMPAVkCRX?=
 =?us-ascii?Q?W7xVayXe1JyN5nDMq5R9GII5uxHKJLR9gFOTckQHbx8VF3e29paj7u9wmJTL?=
 =?us-ascii?Q?pDXKSCyxUlNzeXdx//vPHJ8V5gqVKS1R9oeeIi/70qVP+kHw7TAjHc1PIJyM?=
 =?us-ascii?Q?qzJQ0u8sL2bdl086o1rLJdPs6qmxCRwMvWQUyeq4hA1ZfrH9u7zI2N7Q7kiU?=
 =?us-ascii?Q?8LCs/W7gJQN8DPUgbp3eE4GDBKJ/NIScsfvN3LyzUftomguMlSFSAX18APDO?=
 =?us-ascii?Q?YKdqzgLfsfPUSlvpCfeIUGRnw3qN8lKTs0yFA1k0ENLvPIO3IVzayo8n7EfD?=
 =?us-ascii?Q?yVW+vaq+tNwB+t6VMhw/9YU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yPmZ0T5ciCJ1lDQsJhslQJgpfCkHX9c/dkx70lKTHnqPlfmPPH1kYx9oxeGqAuGtBCU6hFyssMYpoYjD2vgpaXda+084pfOLnr/fpKzV5g0ajKEHsXzb5K942c3IJbbLeZOloNHzOpS6x1SZhAbIM8iGUlNReskKewNXy6XzMjlXJt1rT9BNM+5Bp3Dzc7epuqYJj5kHp4WLY+C4O+/3sYg2ybbIm+82dxN7YacpY6ZdbUfwIA10mfS6LlRx/0xN3YpfwFqxql/+PmbGvs1SiHmjHl7hSx5un0X4tFVCbrUOxJ2jITUpyPGZxpGPVb9z7u/e/Pw0H1JkcthAwB4h1ntM7rKrQemY7l1OyjKSdSpAFUPz/t3zNCBoCZUR2Js/mY9IjAAyFsrM2MNd6PNYYlS8bz/TpH2gMvWCYsNzfVxsbqo4TSHR+qQhHU0gRJkaoGIoXQESZIIwQbMR5CnP6Rrr6QDGaygbkX1QHEAnaVmsgQ0IJXIUIc7LeQ1CDS6kkFVgJ4vqk/iv1gtjuMvJr11wtnoaToGiZz+2PQcvcn3sD7/0iZYq364OZEfkb4AAKOOIhh6KCCDnGTcYDrqUOPnN2xTahJWtjPNOwG1ZvK0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637ff27b-172c-49f2-f2be-08dca544eb42
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 03:11:00.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZU0HnHPKdzqIs1PP9kcwy+81zorHg/3715CawyKXBfrjJmMSllTYhNGq7dp5DiOSQM9c55x8IPVvYBczawGPMFNy/jeBI+/v2/oJAO1jG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407160023
X-Proofpoint-GUID: RoFfhIr458m_Rod1YA6yvtoRaAz85h5Z
X-Proofpoint-ORIG-GUID: RoFfhIr458m_Rod1YA6yvtoRaAz85h5Z

The modules.builtin.ranges offset range data for builtin modules is
generated at compile time based on the list of built-in modules and
the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
to determine whether a symbol at a particular address belongs to
module code that was configured to be compiled into the kernel proper
as a built-in module (rather than as a standalone module).

This patch adds a script that uses the generated modules.builtin.ranges
data to annotate the symbols in the System.map with module names if
their address falls within a range that belongs to one or mre built-in
modules.

It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
verify the annotation:

  - For each top-level section:
     - For each object in the section:
        - Determine whether the object is part of a built-in module
          (using modules.builtin and the .*.cmd file used to compile
           the object as suggested in [0])
        - For each symbol in that object, verify that the built-in
          module association (or lack thereof) matches the annotation
          given to the symbol.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---

Notes:
    Changes since v4:
     - New patch in the series

 scripts/verify_builtin_ranges.awk | 348 ++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100755 scripts/verify_builtin_ranges.awk

diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
new file mode 100755
index 000000000000..a2475a38ba50
--- /dev/null
+++ b/scripts/verify_builtin_ranges.awk
@@ -0,0 +1,348 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# verify_builtin_ranges.awk: Verify address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
+#				   modules.builtin vmlinux.map vmlinux.o.map
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
+# Return a representative integer value for a given hexadecimal address.
+#
+# Since all kernel addresses fall within the same memory region, we can safely
+# strip off the first 6 hex digits before performing the hex-to-dec conversion,
+# thereby avoiding integer overflows.
+#
+function addr2val(val) {
+	sub(/^0x/, "", val);
+	if (length(val) == 16)
+		val = substr(val, 5);
+	return strtonum("0x" val);
+}
+
+# (1) Load the built-in module address range data.
+#
+ARGIND == 1 {
+	ranges[FNR] = $0;
+	rcnt++;
+	next;
+}
+
+# (2) Annotate System.map symbols with module names.
+#
+ARGIND == 2 {
+	addr = addr2val($1);
+	name = $3;
+
+	while (addr >= mod_eaddr) {
+		if (sect_symb) {
+			if (sect_symb != name)
+				next;
+
+			sect_base = addr - sect_off;
+			if (dbg)
+				printf "[%s] BASE (%s) %016x - %016x = %016x\n", sect_name, sect_symb, addr, sect_off, sect_base >"/dev/stderr";
+			sect_symb = 0;
+		}
+
+		if (++ridx > rcnt)
+			break;
+
+		$0 = ranges[ridx];
+		sub(/-/, " ");
+		if ($4 != "=") {
+			sub(/-/, " ");
+			mod_saddr = strtonum("0x" $2) + sect_base;
+			mod_eaddr = strtonum("0x" $3) + sect_base;
+			$1 = $2 = $3 = "";
+			sub(/^ +/, "");
+			mod_name = $0;
+
+			if (dbg)
+				printf "[%s] %s from %016x to %016x\n", sect_name, mod_name, mod_saddr, mod_eaddr >"/dev/stderr";
+		} else {
+			sect_name = $1;
+			sect_off = strtonum("0x" $2);
+			sect_symb = $5;
+		}
+	}
+
+	idx = addr"-"name;
+	if (addr >= mod_saddr && addr < mod_eaddr)
+		sym2mod[idx] = mod_name;
+
+	next;
+}
+
+# Once we are done annotating the System.map, we no longer need the ranges data.
+#
+FNR == 1 && ARGIND == 3 {
+	delete ranges;
+}
+
+# (3) Build a lookup map of built-in module names.
+#
+# Lines from modules.builtin will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we derive the built-in module name from this as "lzo_rle" and associate
+# it with object name "crypto/lzo-rle".
+#
+ARGIND == 3 {
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
+# (4) Get a list of symbols (per object).
+#
+# Symbols by object are read from vmlinux.map, with fallback to vmlinux.o.map
+# if vmlinux is found to have inked in vmlinux.o.
+#
+
+# If we were able to get the data we need from vmlinux.map, there is no need to
+# process vmlinux.o.map.
+#
+FNR == 1 && ARGIND == 5 && total > 0 {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
+#
+ARGIND >= 4 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && /[0-9] [^ ]/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /^[A-Za-z_][A-Za-z0-9_]*$/ {
+	$0 = "  0x" $1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND >= 4 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# Handle section records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Next section - previous one is done.
+#
+ARGIND >= 4 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Get the (top level) section name.
+#
+ARGIND >= 4 && /^[^ ]/ && $2 ~ /^0x/ && $3 ~ /^0x/ {
+	# Empty section or per-CPU section - ignore.
+	if (NF < 3 || $1 ~ /\.percpu/) {
+		sect = 0;
+		next;
+	}
+
+	sect = $1;
+
+	next;
+}
+
+# If we are not currently in a section we care about, ignore records.
+#
+!sect {
+	next;
+}
+
+# Handle object records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && /^ [^ \*]/ && NF == 1 {
+	# If the section name is long, the remainder of the entry is found on
+	# the next line.
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# If the object is vmlinux.o, we need to consult vmlinux.o.map for per-object
+# symbol information
+#
+ARGIND == 4 && /^ [^ ]/ && NF == 4 {
+	idx = sect":"$1;
+	if (!(idx in sect_addend)) {
+		sect_addend[idx] = addr2val($2);
+		if (dbg)
+			printf "ADDEND %s = %016x\n", idx, sect_addend[idx] >"/dev/stderr";
+	}
+	if ($4 == "vmlinux.o") {
+		need_o_map = 1;
+		next;
+	}
+}
+
+# If data from vmlinux.o.map is needed, we only process section and object
+# records from vmlinux.map to determine which section we need to pay attention
+# to in vmlinux.o.map.  So skip everything else from vmlinux.map.
+#
+ARGIND == 4 && need_o_map {
+	next;
+}
+
+# Get module information for the current object.
+#
+ARGIND >= 4 && /^ [^ ]/ && NF == 4 {
+	msect = $1;
+	mod_name = get_module_info($4);
+	mod_eaddr = addr2val($2) + addr2val($3);
+
+	next;
+}
+
+# Process a symbol record.
+#
+# Evaluate the module information obtained from vmlinux.map (or vmlinux.o.map)
+# as follows:
+#  - For all symbols in a given object:
+#     - If the symbol is annotated with the same module name(s) that the object
+#       belongs to, count it as a match.
+#     - Otherwise:
+#        - If the symbol is known to have duplicates of which at least one is
+#          in a built-in module, disregard it.
+#        - If the symbol us not annotated with any module name(s) AND the
+#          object belongs to built-in modules, count it as missing.
+#        - Otherwise, count it as a mismatch.
+#
+ARGIND >= 4 && /^ / && NF == 2 && $1 ~ /^0x/ {
+	idx = sect":"msect;
+	if (!(idx in sect_addend))
+		next;
+
+	addr = addr2val($1);
+
+	# Handle the rare but annoying case where a 0-size symbol is placed at
+	# the byte *after* the module range.  Based on vmlinux.map it will be
+	# considered part of the current object, but it falls just beyond the
+	# module address range.  Unfortunately, its address could be at the
+	# start of another built-in module, so the only safe thing to do is to
+	# ignore it.
+	if (mod_name && addr == mod_eaddr)
+		next;
+
+	# If we are processing vmlinux.o.map, we need to apply the base address
+	# of the section to the relative address on the record.
+	#
+	if (ARGIND == 5)
+		addr += sect_addend[idx];
+
+	idx = addr"-"$2;
+	mod = "";
+	if (idx in sym2mod) {
+		mod = sym2mod[idx];
+		if (sym2mod[idx] == mod_name) {
+			mod_matches++;
+			matches++;
+		} else if (mod_name == "") {
+			print $2 " in " sym2mod[idx] " (should NOT be)";
+			mismatches++;
+		} else {
+			print $2 " in " sym2mod[idx] " (should be " mod_name ")";
+			mismatches++;
+		}
+	} else if (mod_name != "") {
+		print $2 " should be in " mod_name;
+		missing++;
+	} else
+		matches++;
+
+	total++;
+
+	next;
+}
+
+# Issue the comparison report.
+#
+END {
+	if (total == 0)
+		total = 1;
+
+	printf "Verification of %s:\n", ARGV[1];
+	printf "  Correct matches:  %6d (%d%% of total)\n", matches, 100 * matches / total;
+	printf "    Module matches: %6d (%d%% of matches)\n", mod_matches, 100 * mod_matches / matches;
+	printf "  Mismatches:       %6d (%d%% of total)\n", mismatches, 100 * mismatches / total;
+	printf "  Missing:          %6d (%d%% of total)\n", missing, 100 * missing / total;
+}
-- 
2.45.1


