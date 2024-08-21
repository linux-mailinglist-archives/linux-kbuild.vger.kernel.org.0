Return-Path: <linux-kbuild+bounces-3134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2D959390
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 06:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A4F1C21452
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 04:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EA515C155;
	Wed, 21 Aug 2024 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jS04WITR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ipxo7M6p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D21581FC;
	Wed, 21 Aug 2024 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724213482; cv=fail; b=hQv+KnEgDAkefB8Db8l4cyAvCDYB/NqaDWOiJ12w+df56lWGt40KvgSHP/V4Wox2w21X+PH8F9iFZuElXgAUCjslCaj7jzOETfQptnFSTmri89dejez5ZbHpPToPMuLJJvOtuliTHQniPbc0iBFu0mG+wAdH4MqRjy6CDYnRsXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724213482; c=relaxed/simple;
	bh=cEONTywy9PC2pn0ZQd0GmZMKSqurVf+mxXj7SbHYHng=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nwIXcW8Uc1jch4uOHG94dyziGvGVLBXZjebJreYKz9araI80RAO1nul4A0NzDz3jzUqrP3rtfMI5ZBd+n4NE+tc880apThdKzzI2IR8JUe4HBkIY4qAFpODcJpvRWyVzCVcQpYFU9y4tC/Zr4wrKFF3H+G67zchoo3rzAW2rPyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jS04WITR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ipxo7M6p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L0tU1I024216;
	Wed, 21 Aug 2024 04:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=YixqDMhab5Dwvj
	OPkCCMuSsunYvDC0NxdMbagT+VLjc=; b=jS04WITRZfO9fKUgdV/acHnhfgDPxL
	m/GRlgugYsZ+QzZK0gmnPfSFFR5sX4u3enz0xs8xDQ+O8Kdsj8OoXSoghL+Bc7Bc
	au8A/pVtozDPqLVMcZDb0Djp+xJaDNulr9kIhticSBKVKA8JGHOl2/DLyQLIB90Z
	QdmTit0w132rmP/RyuCmVJa7UsWVBj9X7MpcJFSIjuHmdsinNXmfVy27pcgWFowE
	/WxoExiKaayMNJpBFTuLxcVTIKvsiNwPrFH36nTf6H9r+6akiwKX6kgN1oxThBjZ
	d4sPFRoLuBEEfVP0Vl7QEa/tLEKEs+EDtxcOEjM02TsCPmgpq2e60XrA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2demwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47L3YCKO015698;
	Wed, 21 Aug 2024 04:07:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4158engray-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t32ZQverzVhCBzaLjsl/t2AE4b+4VLLrd+zzUQyo6ogVrh9XqCgj7smwMrgAyrjlwrSMrjUmRa731v1zkR4iy8586A0wS/LXCi1rGs2bNH8IxV/dQirxa+AGNgxtNbZQxltcoSIePD29HrfsWdnDWulcClZksIeRXkAfh13GJutkQkWrFaOy0i7K5iFF6l42n0n5BmNboqdcQXIdtvSdU4EbDQgI1P9eMW19GglVWuGJT2cL2Qss+39HBW9+Ymz3EW+RgOz/aZAl7cHCl7CaxkZH26+Zxr3u0vdw11RPuMM/dyOA2YLByse6zTyk7FzBxtlkait/aLWGvcrFaCBgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=NDKfShoSeOpg4mTd/Bhpspffse8GL2HevqX1u6YjrDU62HGw+zEjjyV3IMWqNiuEyP5IYTQIiGceDuw/ixcWUpp9xEpO0Zrp89uXugfqQJcSO4UddGvGemyR0WSqK39PKd4wKBqxJpqf9uWSM56sQrhPbJoSemvWaPvckgRiQlCzgyFxV51y8C1/OI8XVDjpY1Hy9l2WtFEQjbw7rcA+woJ4y2KCd4wA5kI/jqF/NC2+3RBUXF9KnVldpYR7TfX3TaBxenDbktcCSJMyrPucN3B027uH4xdiqCPQVHHmS8BJfCyp6yNhMFXHSHmQO+gEEfONby41XwH9t7/ASPQvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=Ipxo7M6pBoImPFBzale3OIr2HJ5lcqz6i4/PI9NSDvm6t+ekmeGFHDOTdMREJT5GdnptmTHfmWFr9XqjDDdUuaMDNmTsSyr6Z0ucBiWervrufjarqFrA3haq6sKY5tfTIEOY919feWiALeqGktDrhUmzSoEN9FayXAjFi23upbw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB7481.namprd10.prod.outlook.com (2603:10b6:610:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 04:07:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 04:07:16 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v7 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Wed, 21 Aug 2024 00:06:57 -0400
Message-ID: <20240821040700.1919317-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:408:ed::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: a32a9646-a0d0-4067-05c3-08dcc196be55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mizDV8+hYQ3Lt07zAZkgCX7tCTenOfF2anHn+1/sk4UA0jj1TdlopQ72UfO0?=
 =?us-ascii?Q?UTuJE8vmJQIUR5W2DSkkq7OYGWoDKmtZLIkxM4yllrxs5k5vf2tyGMjrULsn?=
 =?us-ascii?Q?kdQnvcFXHRRekpbz4+hvB8bd7YxVoXn/nJShIfMX+YlVO3YiKqKtULfRqaOn?=
 =?us-ascii?Q?XKBC3tjQMZj5TBwpHE1sGPAD7yuqOOvQHieKoh0bB82g1qgpm5APL8u++b1p?=
 =?us-ascii?Q?XMqAvX05oopN/jU2juFlczJpMLIh+MbaQ8dY3119JISZX1XDoDTlshSxzgKp?=
 =?us-ascii?Q?T9t+Koo66EDPBzwrHKj4xMLFXjqYeFsBVPDSMeqbxCYqReswZFkw4FspFJCN?=
 =?us-ascii?Q?NXxpuFr5QARhDAwQzPIrPoQxe2pw8LcCBRCyITrFByoe6ox4dv1PjHhYtYfc?=
 =?us-ascii?Q?pq1WJ8ajzXrvGe9LmaRYZDKwtpfCxqXLd0Cd9tYxOR04RxC+Bdem+LjHicvF?=
 =?us-ascii?Q?APodOouwstcrr/tyOVrHk69WUqYGoIiGgGa9dsr1t6lpim54o7fbtIVux6YR?=
 =?us-ascii?Q?pAkH5QEBjxORufGOi/pDhzeVAyTN8UC+jxjyYlzcD0H7dlfpW5jVYY4ZU0DJ?=
 =?us-ascii?Q?6XqpOhNG66s38zRkTbJDmMtE4fVzSVXfMyJ4fdfooxeKP2wO/c8uBBWOHQao?=
 =?us-ascii?Q?IspsrK08RFm9sxeWxcGFEDnobkRG6sibxtetcwKl8yFBAqsSmosyncwekb7l?=
 =?us-ascii?Q?CXUjSETdk20xI2VSHBKjMLeEaxcB8ZYLwcjgnnhJpJjWy4GPPAmhZvrLz9tI?=
 =?us-ascii?Q?9GZDlLQ9zvgnBSt66WA8oeCv7rQf6LvwjOTQjtDZ8g+IzwNEj1Lj8Twptoiv?=
 =?us-ascii?Q?V+SvAaiAxWc4+ZEV+oPvPbMcyGufbd2Wg/0FQRz4vi5WWfy9bCTUIMZAXjd7?=
 =?us-ascii?Q?SIAmI01ICD/hv+3N02CWNmQeXisC1Cv8hSbu1OKSssAAZ5AvSXp76RKaBL0i?=
 =?us-ascii?Q?x+toe5vaRXsjnUv7fTdwFK6ZRFJGVQ/lLHg5lPmf0Sxxg4yS5g+XL6ziAVbv?=
 =?us-ascii?Q?u/mvXha92ZEUd8IzGFdFMLjEf5P7hBk8e1NG3pDMQ/aXmmX/d8D5YFy9ESlB?=
 =?us-ascii?Q?bkZpUHPSTZQkKRe/TlyM69KCoxK4MuxIJCBEPUIsSQgtmcVTBCmIt1iR+87n?=
 =?us-ascii?Q?kssV3jRiJfjN4oFBOaextdtM0+KmkiwZlAcSnGRKJVsyTL/uRJHu+5a8LDX8?=
 =?us-ascii?Q?/bE1wOeDJtCrDZ7DoM1avAG+G1FBvozeILrCWVAGl5mXurEyzxFPSoNxr+bd?=
 =?us-ascii?Q?qZvA+0b7aIZ9cnNJvL8paanURH7S01VAIV/OcxEvtudyWguRMRtCeZ4XnzEk?=
 =?us-ascii?Q?0c7d0CC0BiAwr4C7vMJu55XT3zyM6Skeld3ggTCs19ZyPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1NC2jfrhZ1/cRs4lRmIoJCx9843VpvaLa5amJVxZHXYQ1wnCN7fd5udlZ7uQ?=
 =?us-ascii?Q?ybCSyisqFX1tQG5dpe9uLih5K2kVLq2g/HOY66em+JySTAoXxpCPiVLugWZW?=
 =?us-ascii?Q?LFs7m4ja/SQ4UqkPhrKg1WbSFWf5cQ+2BUo2+RRKtxtXKPTLL+1+21qM2eHD?=
 =?us-ascii?Q?Q/anW7BibL+MEfqAJAK/Edo5BdfNF6SQ7V4sOtgkaKS7pBixbO88+H0E/I9B?=
 =?us-ascii?Q?yRoHBTk6PKCnNAgueFww7jK9qsqgZ37UcvySLzUO2H3j1ZeX7hFFWCFwKWqG?=
 =?us-ascii?Q?wUGkNxpVYiINzJhASGM7B4v0pop5yMZl+9icC5I3IOYVsYgF5r/tWOQZPPJB?=
 =?us-ascii?Q?2jfwXWyjigEZ4YSWRybLfOCqMjVp8mfQvdbSyotVo43YmYvG+KP3rngYdYd/?=
 =?us-ascii?Q?GawDsH4sofFXaQsFONlL025llt+4hKIsFHC7Yqh4ZSRjgOANKs7bFMWqGRbH?=
 =?us-ascii?Q?5ZEJg9y/qXYULjdlV4M/0XGt0eNnD3H1/pLUC4Sqcs9bMxPS1IgEmJhqKmrO?=
 =?us-ascii?Q?QbV/w69/b88eiL2RRGm0n2sFLx5nydODsKGYuFytBx6XmislTYri7ggpMgwz?=
 =?us-ascii?Q?93eRp1LUJL12JOQRuDfifShINSn0ZxjAJQdRLiee29oP/zRBDZlkHVyv49em?=
 =?us-ascii?Q?dnhW5PS0HoF50IVIot0+dF0n6BuCG7LHB+okc6e0qe9XvIcs0IXogmMaOVwZ?=
 =?us-ascii?Q?dYoBVZHQO/BxM8Y3dtmM3PwLoVEYFELTQgvCNgGmqiR4BCmhrTYJ00G/emxA?=
 =?us-ascii?Q?PDPXMvFocJzpqnlw8E7NjRFDrArJk3WzK1W5stGsmjYKy9NVELSC/GTiNr1d?=
 =?us-ascii?Q?+wJX8mZQy/v+LemMj7YNYx/27fo8AJJN+vZAxrRb4BJlcSsj2B8/qHokPTgo?=
 =?us-ascii?Q?tgWuuzvJXojFyYVBn2zgB3SPiNYE5VoLJ8bG+v1XyfEXTPfh2bnEQOMFOolZ?=
 =?us-ascii?Q?EhVRPi/iZNcwO6Ojs0iRRDBvIQKmpyxhqBmeFNTBMiYCVENVemQ2nnQI4C25?=
 =?us-ascii?Q?tkxGdm1xjIbV2y/gmFb3rZdXMC/rVl7nzqNDsC4uhKjbTFh3I0dra2l89uWr?=
 =?us-ascii?Q?n1T2PpslPegdW7eYtUWZ+sK2LRZw2Kz4/PPIgKyClvZvEHev7OE7YWKYTEtN?=
 =?us-ascii?Q?1Gjl7unowb29IbePKqsoxi1/x623LJ4kyRneXvjhB9+rgdtIS2c+tTtQc6Ux?=
 =?us-ascii?Q?EErWMGo+8XMThh+yYuXOl4JjX7piuNMIE9ZFcS3bg3kGf4zL/HSG2QJVilZT?=
 =?us-ascii?Q?3o8SqFmMVy3KuxCEaMsegJ3t9s3exOpZZeba+/MAtYvgKDy7o2LlWIoqGmQl?=
 =?us-ascii?Q?DhwEyBG9KBR/0APqMM7wodYd7AMhRJjZHWtV8zQFNpSuH+cNghWmoEjb1rb7?=
 =?us-ascii?Q?mKHVP5MEQ+OydxBKoZcRq5W3PqPLkQu1eZROs0rr07TwnjyrN8pkQOozgRM8?=
 =?us-ascii?Q?/WBHIuFmRvQeWD3odfS0G+sfbV0dPj/ofOZtR5O8kAXoJaHNSDt1j8h0C3LR?=
 =?us-ascii?Q?hnXSryIT7tY5cjMS/ig42TaqbFlc7ULZu8ZtRP2BwM2+dEqWHlmZO5x3ABqn?=
 =?us-ascii?Q?UOxYv7AomotRukuyNuLMr+mA1Tpd7+nXNa3QZPixD/Mp3H/CUg6s8svNTwPv?=
 =?us-ascii?Q?57pCsIRsYJ/VlClmtcVn7OI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wKYhZ6/IrxEtREKRaLIw0w3/98Mg43JcBXhMOUSf3F23UOmPFX0jgRyZvzJHX/LQF9ZcaImbNZvhuffqLo9VxcL+TxPGf0uGHcXi3Pktd+lN3Hsb/Sz+oiFWmMDAYEjWzSxL6VDxRt98hj/Asm6R+r9IxqpOXpt1xpB6pitCE5hPVyYh14VCC7b9P45JkxO8P0oSSSYbzmsO7mNk6sL3Zmdw/MrVy0mthnF+FFLTW3wSMZm+JjTGKr1pdxb1ao1xxOP3xRukUtry7H4uCHF7/RbTWOkv/jMvlHpY2mPHyJEQDiNVfpaXKxIU6jROygQSP9Ev2pMMveQgjiYkBsBLuICwkmVYFA0VdSstNE2waCOELcEN386yiVLH2cl604WXqaSOWC8zKWUs5RmJfeRRtDd6gPsj4n+Pqq3mRGWIVoW3Am0doyF59hG04sGTKIJuqaAAyUTQKehkJ3eysx7qEo1eTsZKNLNmpjHRhUG9l6HySWTwv5yOQr7r05r76zreHLX9yrOybogu8c5G4mYKQG1wwD6UQ77lY1m9R5Z+gg+WfyKnldeJRLfyfXwbKby7D7YAJ6W6p06o7P05AjqgppVivXiYbxjdDu+lxCu0jdw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32a9646-a0d0-4067-05c3-08dcc196be55
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 04:07:16.3226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZdqdzY83k+4kZEuxLUNRRrap2l+bqTra3hX2mnWAPVc/V87Bjqb23Vek9t4DbZpEraaU+Cxic6tQXsMCcWpJOqzpKLowmwukukdyCWdXzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7481
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_04,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=877 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210028
X-Proofpoint-GUID: iHjsggHdtIoT3S35dJz4uEKmvBlAlEVt
X-Proofpoint-ORIG-GUID: iHjsggHdtIoT3S35dJz4uEKmvBlAlEVt

In order to create the file at build time, modules.builtin.ranges, that
contains the range of addresses for all built-in modules, there needs to
be a way to identify what code is compiled into modules.

To identify what code is compiled into modules during a kernel build,
one can look for the presence of the -DKBUILD_MODFILE and -DKBUILD_MODNAME
options in the compile command lines.  A simple grep in .*.cmd files for
those options is sufficient for this.

Unfortunately, these options are only passed when compiling C source files.
Various modules also include objects built from assembler source, and these
options are not passed in that case.

Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
to identify which objects are compiled into modules for both C and
assembler soure files.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fe3668dc4954..170f462537a8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -238,7 +238,7 @@ modkern_rustflags =                                              \
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
@@ -248,7 +248,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 $(_a_flags) $(modkern_aflags)
+		 $(_a_flags) $(modkern_aflags) $(modname_flags)
 
 cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
-- 
2.45.2


