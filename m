Return-Path: <linux-kbuild+bounces-3186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C416595D62D
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 21:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BAC3281DAF
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEB9186615;
	Fri, 23 Aug 2024 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ck8DtXYo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rPuMGScu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E56B1885B9;
	Fri, 23 Aug 2024 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724442131; cv=fail; b=iqNnElpDfnfD1XaN/sLBOUlmeLz9l6eE2UhzOTh0ZWDqJLKeiAA/3wIkfJCcpe4rDU1SCgqwazP2xN4Op6+ScIyfXT/qwvsNIJyJ7LSkvB9LQDu0yGmT2WIc3Kt33tXGhRsTdIwWNDeAnkIRG5y9poX2ZZNMLgyIsfadz21oYy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724442131; c=relaxed/simple;
	bh=i6RtGt+JGbiF1TOoIHzHWo0ElJEWM3WdEKuZXcoHS6g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bn6gdiMDU80s90tLBTumLhMVP2iHutaTtPOwdEo0CQq0jTywqMGms780x/PTETIDcKRQSuCVlVBO4ExlYNIvYKzVtMlUqz92m+2+9WMxps8sFF5ffZn1yv4ws+LAkPBZPvE8A6I3gZmHlCaZQ9xkRz4kRCR5SovFl4V/pgtPtk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ck8DtXYo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rPuMGScu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NH0Vrd028477;
	Fri, 23 Aug 2024 19:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=3ij2CbjiWc4eal
	90au8rRUjuodckwz+VWeD4NRLFAuc=; b=ck8DtXYoKy/ITcpaOmVmf/pTeDuQu1
	sNxviAHnGLPUlolOza3cLpbD5UHWtIzKkOEx8hXQ7zpbAxUl7AM4scWR/neaa+wZ
	a/yQ+ZerSyv88T+EDRFTBu9bL001x0Ar4bBxzTPhjEL1ipm/dr8k4anzDTs22EmZ
	WVPmTuAJBQnrpFkj+Gqu+LL42CXlr0od98vd5W5Gze4ZFw2waGfAMladU/9+hGk3
	z1fxqJ/tgBFzIq6gj9U0TCo0UBynhUN3yyRQdMgWOdapPbryOrkc5b+i2FEZqAJC
	Y0QMgjZqMlfkC7hilC8QN4B2kOWL8qli8UEQVUa/cugm9ZU9JOBvpMQQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2dn7nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2024 19:41:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47NJdCHD007459;
	Fri, 23 Aug 2024 19:41:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4170s5g32m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2024 19:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROBrxMaQJAR+K8VzTeK2G5OoP7aEuifSC7lhVxhypDWXzzxrVkIKUuAOKuzRWQR4SN2Dkvlr0p3S9aE4pUxzkfoC40U951koVUkLvyp+33b1faO7H1OYA+OmfGhN5auhj7zVPd75WSkqni88eGBQPk7iEuZN5PZggpI/CBpCBsOqC4aAvG7h4Xd6Cn9haxangZxYdgUQ6QMx6nVabO5+IaP+aRb9owLLszCzSmiT821EWJocogme4W6EKjUFLT6fVhT+9LGtZWQR708MMwoEyXN1VFZTM08QV92nUJEEN2mFYM8iUUP6zZTgBuZ8HGBMxh3QpEgOzVGZ57gGaG6ezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ij2CbjiWc4eal90au8rRUjuodckwz+VWeD4NRLFAuc=;
 b=Cf0De3OWIRZVezpdsAODdCPgN2WaQ9Smf0uqH0eg0wbet4EsH6FJ34cCXwnBKgMtbFCUo98Zw9eYhg/4NcDN2WcL3gBerkoism5Th4+ubtvC3No6k08Me9t35DUpQ2PAvaZIDNgTHl6i3Icva9r896sv2fvhyaGLZrlW9CaiEMyHxhNjX5Gox6iDUiCJKH8bEpLELl2afLYdlMQrDhBmhc2tZ2bdTvcKcUb6ARqS9t8S+vLrH5qZfmEn8Ncxif7i+uWQwsrc9hA2KdBa7GJ1cvAZ7YdzSjcokwcJ+ZI/O3YV0KfzFlED31wgrEN8UJ3xKOEB/vGGBP7NlSvHvJalmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ij2CbjiWc4eal90au8rRUjuodckwz+VWeD4NRLFAuc=;
 b=rPuMGScuak558OLqm+q1ZeAk+shAda9fa56tctTDQg5Ke4+hyG3MDmqoC086Jdc5GQ0jT8ilfuGVaHGCT8+jeovxhYXTAxsw3u7pr/VIYwdNKtcYZoXit6f8EQ6JQEldmZnUVj62pSCvYvU0mew8LQI8tYRYIQEaGStQvoofhIg=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH4PR10MB8074.namprd10.prod.outlook.com (2603:10b6:610:23d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Fri, 23 Aug
 2024 19:41:55 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.7897.010; Fri, 23 Aug 2024
 19:41:55 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] Documentation: kbuild: explicitly document missing prompt
Date: Fri, 23 Aug 2024 12:41:51 -0700
Message-ID: <20240823194152.13881-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.43.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:610:20::15) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH4PR10MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d19895-479d-41a8-7376-08dcc3aba497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bx11JuP/cGlNTMZ0VqxJaTeYWEqrAsftRUdMURNeLrvRLdpAd9tHzvCBBgAE?=
 =?us-ascii?Q?abD3yhrbArJ2+W6fCT2wHqf2lhB4wGbIoLK96HT9ZM+TULI8+CwtScHl7qQd?=
 =?us-ascii?Q?5Ab4ZZrYKVK+esyzzjSr3DONqCeWCFN1ddW6lotaQoFPYSNwuP5JdK2QiB0L?=
 =?us-ascii?Q?YdiEiiqsS84U34OayGvAwYi1QjJZvN7S19IU/H5r6ZJBVYIEAN1wQypgaR9n?=
 =?us-ascii?Q?+zbkCVYZYh2UYJfRrlS7/+y/hpPOp3NpHEQXeSkd4Y82JcR+w3zltU1A9U1D?=
 =?us-ascii?Q?P3X8DUziHcpcVOhSizJZQWBPfABpYQD+/Uy+7sFTGQ0UTXjhHR0fCgetnns5?=
 =?us-ascii?Q?ZwMTApg3uEBoxSIpAAv1pTs5vWfIxBk/Nd5GQarSkplHdc3A2Mgu9QZc+5wv?=
 =?us-ascii?Q?tm3FprlWMM26DQmFk0O2bvZxWurt8kx8fu+y3RS+QLIFRjBh0ufpBAVcxJ01?=
 =?us-ascii?Q?Ji7AquzWmlLKr9/+JQVqFqZD0WSIRRKOb6v/ENCNY3Ua4pwHqxqj2pwgWxwt?=
 =?us-ascii?Q?KadunVqAmW2EtycaA2SC8bX7ww9/ztNwVn4FsJJ8KBmHBRM9nKH0MZRB6EIr?=
 =?us-ascii?Q?sQ4UyFlok2G5GcLiezC5ajjY8qpVjaZK+gjfBWN7g6suS55mptMumY98TUBO?=
 =?us-ascii?Q?D+60cswF7D7xCZ2S8H18fT8R/Xscm9g4z6KbtdG0S0ru3tJxWiFyiZ0uwp3H?=
 =?us-ascii?Q?A7s15yIYi/sEL9xSO3RcwV+GUbzjox4R5GEEIshx2rG5obvNHE/sh/7SgHlY?=
 =?us-ascii?Q?FuJvCcE12dBNlg/sVbfQhv42nLSE0byc0YIo/gbpX82l9f+Uos3EUy0IMYtr?=
 =?us-ascii?Q?7l5oreV+iNbq+Xw5AYkcGhVYai5ETw6QWEU918AWFmg/WfuRWanXyFKOv27V?=
 =?us-ascii?Q?pEXfseD63HaEweZjsHytAUGYqryIpxLyQzR8nAQk1+tRHOLYH3bYwbd6Cm/X?=
 =?us-ascii?Q?cQlxz4wlp1WlusjzVBIfreJMod5OJivTU08Bipaawhz1lbkCwaFa2DtUdsaC?=
 =?us-ascii?Q?SAOnRjxwRgdtt2v7/TxcvmNC6hWiGnOoXGBJhkoYD6++YHjTL+T6PrqYPUPR?=
 =?us-ascii?Q?6oys7ost/rpRPZJ+iFirQjnaV97ghUj0OmL9pvp1Fb04rPfBNw8fck7d9JWf?=
 =?us-ascii?Q?wpdziA/BRYe8+kjussSHGSfCJPFU8s9PBW5MTqaWCFLfI/qyR5uVONgofiDL?=
 =?us-ascii?Q?YHL1Ro7tY2WzeFg1fIWYT8otf7iUzc/Feg7H1a9xFAkHkRpyEXLr3h5HMl29?=
 =?us-ascii?Q?wKGlprFeHLhlFceSDOeMZeywriTgqy3vvUFWBO+IFtzgxX9OVdhU4m0aNZnn?=
 =?us-ascii?Q?98U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UZG2vpV12QvCw+MX3ajgx8knKtpYpGZHHGOyXxq0U1rW/SiiEFGLPp/prVii?=
 =?us-ascii?Q?eTaCRdqMBfRmopyvF/HhpRQT8OyoJdKjcFRBVD0NnDh+RdOgctCyOKkxa0TE?=
 =?us-ascii?Q?io5fio6BCZFQ/kSHRzeY6iwHPAfVcAZ3LjOD17BISsX+a4GgQbX6DoXNbkjG?=
 =?us-ascii?Q?dX3MA+OLPgOAS/nWAgy6Y+tOWBsnRakkbFVLga5BqBvXyxbitA2Ah4lU+WbM?=
 =?us-ascii?Q?TKMkePNkKKUqqfDB3CJlKiaBVHdJGRSswYf1fp8tdtwE0+n5Yc+gyjO2kTE0?=
 =?us-ascii?Q?yvwlTIf0qFtK6jTsGIUWw7nMXcNtPolRMaYyJOnS+LS/laBi5qolpKsOgdeU?=
 =?us-ascii?Q?8jA/8Asvr7x3Xz+Ollnj2yHpr7m/vTQVuzl/EYNpwkqVRL1wPM3m9Lrh1Qmj?=
 =?us-ascii?Q?X9Gg+kGV2D9sXJ7i45M/8GP+cW2zpcOaiOfgwfb4kKdeDPsd2T3fWS9cnJVb?=
 =?us-ascii?Q?HdDanJZNd/mIl0ZigCfWUJVRyWg6OiKWztX1HjksKfVCEO7zSVpe40igKwXi?=
 =?us-ascii?Q?blQiSRL+WRQVMWmRiViv4ixsbjpbODybCh+faIHBvXXn/3riceZkkQDdeaBy?=
 =?us-ascii?Q?w1DmDtNytkuVLegmrn/v8UHr7nqXXuJnnsRRdH/xwhNqYj1K7O2PovqxZN6k?=
 =?us-ascii?Q?LvwapPq6WocCSzwhV5AozfTvBfnaxdKhcsOO1LTQ+pOkrp7jmyhYU3L/f0W2?=
 =?us-ascii?Q?UIa2pGPilfdW3g6ke2PRgJzGqdwssDnNa6J2jUCF/JSc/FWXF+NVILiujQN1?=
 =?us-ascii?Q?LBKfm5gRwjdJkx+2cbjBubFZ9X/kpB+ThJKl02XHWcQ42ha+tqh6LugqW+8s?=
 =?us-ascii?Q?Ynlst9rlJQTSeVJEEWzt87w5Q0vymxxvX5v+spMNx7QOx1CpRYACm9J3LPEy?=
 =?us-ascii?Q?yGad+fPqH3MLQQS1X0CCdHv9rw9eN5/Jg8xyol7iZdmk9sOcgo7QWTVoRL5d?=
 =?us-ascii?Q?myd4+iDVuR8X+X3ksbSflNUuJ3qurvO3+jUJYI1y7VhPgJwXunH1f/2hSHHU?=
 =?us-ascii?Q?LRpyK+RhCHwRVGdaavTn0Zs83wofhlQjFbEfGSnumvUtLbB6GVir2mpPb7H5?=
 =?us-ascii?Q?F94ggc47C09EutlylE4zEcG4qubkj8Yo4YfuFcb/RviWyUd+TVHtZApJjKjo?=
 =?us-ascii?Q?7M6l+jPneJ0C3nRs2WqHTNWRd/XzrtPLfSAkNUt371j1Hq6iF8lMxqkT1tSc?=
 =?us-ascii?Q?XVGDSrJKMnbH6J1q20rTKWR6bO2zkIER7RbAGT0US7+UzocSWqAigcxminaO?=
 =?us-ascii?Q?+4X+0/1yxAY+2euvcaixfajosSuW+0/ptDzefUrLvfezlMihAr8AYYhhvj4i?=
 =?us-ascii?Q?l39AhpPdMYqK5EVsVWzYYUQGzgxM8kmQLKy4TGqfWpE53/RoLm6+A8y+Tc/3?=
 =?us-ascii?Q?ZDTMp6oBAIfN4fsRJT5+viEwha5wdxSc2qw01yOrU8KwXBaxkLSp163ltLr8?=
 =?us-ascii?Q?/Hrj2vhmAAbmi2HoKZwOR5HlA8L1AeG/LN27lQyR/fZlpHXSvjKsG6y7yqzy?=
 =?us-ascii?Q?9sy0pBpRdIMsQGuYULWM99VToCZ3FSBk3k/qAmZ4Lp1rlfxseGGS8SIBhqH0?=
 =?us-ascii?Q?4hjTjqppMz5rjT6k8M50ZLhfjdQTPJybGmZ7oY3PbiUr1vLzZgfJ+gdceGSX?=
 =?us-ascii?Q?UvmHtqDQ5zWmZ3y1YRr1KgspLyW8eDql89zFxnDB5asv1EhjjgPfRGDG3aAP?=
 =?us-ascii?Q?0tlTOQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0n/eV3LWD0BcBYlI7tVU4w/DuzaIvVK3Hd7Z1MkANxHs2Jfj1X2jyjMeinewDPbIKCs4yvO12Qkw7ZwhiiyWYjvSn6Hb/oMZ10ZapAvAW3PYZd1eBLKqiKh41J1t2nLo2ApPVsjqBVCFVCt2Z642VOE2GnPFEewmjxFl8AeE8jX/C1Oxo2uSQkoZjHwW4ZyTr1wprwNzTLYHcnBDc10TnVZgyAidMjFmIwWKtB1iIUY0xFMf4BTHoLsZXySBX0BcW0SDPjwJn0mNyrSZBn59uhW2q0nCykTUWtZ2/pbl082YeFltvmfUcEEhGPYX0rspnRB3R6AnEqSqFmkxNpdmxp34XDSm9h1XbXBjhYFm+223h6vUgN5zsbvz1lG3wvhTBUd6X6I0yNX+HrLhhkYsKJL77oaCsNyxdFQmIJUNYcnbuhNh1s8WztBE5vJz0UeOOyr2c5uTjqT6hVDh88U/645W1KruuXMHEiDbBFGCuy3C1P2Hp/CQeVn/o6vCgp2QP5SbtL8GMOKgPl0myBYKmuVfvQpYHBp+Q4N7/S7IG0mQv83x17PP0kcK9Gns5W+is6F+MJUZhGBpsDGjqFKWLY/WALcvVcLQvZf3Z6MG6K4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d19895-479d-41a8-7376-08dcc3aba497
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:41:54.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhxVNHOMIV9jLPrfymCqkpRT3U1JHy173He7/Laj2lw8bwT9Xo1HFF0pjCywMjWqC9VfLl+KjpASrGvQDbey8VroEN6jEVLTV3c3fllnMzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408230144
X-Proofpoint-GUID: SaBOHQ7k1iEtnc1xugGsjrah02A14yTl
X-Proofpoint-ORIG-GUID: SaBOHQ7k1iEtnc1xugGsjrah02A14yTl

There are a few lines in the kbuild-language.rst document which
obliquely reference the behavior of config options without prompts.
But there is nothing in the obvious location that explicitly calls
out that users cannot edit config options unless they have a prompt.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
v1: https://lore.kernel.org/linux-doc/20240820171000.1656021-1-stephen.s.brennan@oracle.com/

 Documentation/kbuild/kconfig-language.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 1fb3f5e6193c3..4650daaf5d365 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -70,7 +70,11 @@ applicable everywhere (see syntax).
 
   Every menu entry can have at most one prompt, which is used to display
   to the user. Optionally dependencies only for this prompt can be added
-  with "if".
+  with "if". If a prompt is not present, the config option is a non-visible
+  symbol, meaning its value cannot be directly changed by the user (such as
+  altering the value in ``.config``) and the option will not appear in any
+  config menus. Its value can only be set via "default" and "select" (see
+  below).
 
 - default value: "default" <expr> ["if" <expr>]
 
-- 
2.43.5


