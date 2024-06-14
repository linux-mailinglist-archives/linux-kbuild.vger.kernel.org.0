Return-Path: <linux-kbuild+bounces-2126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5D909137
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 19:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF842815FC
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 17:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158741A2FD2;
	Fri, 14 Jun 2024 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jqAFZUOy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v2QoLbq8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553A217FADB;
	Fri, 14 Jun 2024 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385359; cv=fail; b=gAkN1AAqPOiun6n6SXsPDa9l1IzNaQPETkKj4AXO9b3cSC3wj2Za4ph1SALfMHt+ReyEMelpjQHqNE+dfD4s7RIvlFRh0dp7JBztEt67vhaeySQopohiH1ByXkVihO6rwhvhnjfHlRZXWJLp6RZJ6gTR//Ivc8C2z6RiaogelOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385359; c=relaxed/simple;
	bh=WdU5V2L8uT4AR3B+A5cI5ajW/H+Qgp0BPRjuA6k8tQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgruWvNw3EngCvDT96qiyCmVy0y/UUMk8LbRNjRQCcnszKB69gS3afX3EvOhJxs62l/oKyM7RTiyLQL726zwfZ6I3nptG78yAHzd5+uHWqQHoIRH3ApAYTuNuAtUtYOrbWBydEWMujwqVcs28mnSl23sWebKffJIqe/ELMxapEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jqAFZUOy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v2QoLbq8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDH0Kl028777;
	Fri, 14 Jun 2024 17:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=CTK5uummU8kivbhjOTVtyBG7+Z2HdxyHAAOMyo5Qb68=; b=
	jqAFZUOybJzQVarXDDPJt0V0Vr11DuwSwX2H7rdlQCLPtA/M7bL/rvScpe+lGDt5
	Grxuu+oCJ0ouj/mqAZB6ETObcrxNxyQaXdV6/L9a0//zutt5r04AE/fzwMnL7V+B
	q09KYbgL0NT55eLl5yvhFWRaAhRTeC6IhnaG5o2v89/SSsb29cFRGvvLKKqC0PII
	6b3/gAUhQvcsIg7Scr6SInHxmoBZsTF95bM1J68wxih737kjvnHCdyPmkVM+Vpsb
	kMQ4DSdMLiHwapj6fK23c14D5NzV5zJ9J11PaxBHbQMQaGnvEUlCIWwZOK7o6wP2
	/0bRXVpHqFYq+CGoB6iMwA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh3pc2by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:15:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EGd8sO036740;
	Fri, 14 Jun 2024 17:15:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ynce1ync4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:15:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft19erXQrn5DLZ88v7owWjA0B1QGGqRbx3jKpu2RWDoGydStNGiG1l0TRv8mBmDh4Px2tSHqnm8UoOqcjVztczSicIoufYbXHPzKywGHuNwU6TaeUKqE7G33UyWopkSKBWPvs40n58/O0HdD0mS9IpFRlYeBJ7sFBDxLFUAF5zn8EcPl3gbmDHdd4q1CDUOmWb5XFStkDGmy0i8iiG8j2jb3XPlM84giQzrH35V/7TF7Yprt1wT9xh790ZARQNspFG0Va5rY05TNNayPYZ58QRd07R0hKu22TQmz6d7M59M27m0AFsnVF3vVb4l2SP+peeiI0I/SjM3Afy7HaVp16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTK5uummU8kivbhjOTVtyBG7+Z2HdxyHAAOMyo5Qb68=;
 b=G1ULGFOcsWrtHr1z3Z6BjdNHl4Z3hFmuJqXa9xqL8O070KiDg6FrZV4fC4rF/GqkdP5BxYwi8AbveP70H792hTMIxDb9t8o2lEOMV92NrwfMkn7Di2CgrHeSQpA5iGB7eMe9pz19W7sx7vClK19/jUelcHAmzhdEiOvenQeFTvUxYMD80HxbVOwfVB6ZkCzfrDPkjgH4sffcNWnBGAZE53V/mVN8he/tW3MfFB6HIoSiJVX5Nfv/UX9592cp+0yDORfqocVY/h61C+ahhRMrglr4hb2e5q04jsGKThYaNQJjvdwYuhzcBxnRMu/n/J9bWpMWbuXQyPsraqF4sQzEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTK5uummU8kivbhjOTVtyBG7+Z2HdxyHAAOMyo5Qb68=;
 b=v2QoLbq8Wbt3IS73isGmJMLS4hGESiTYjoOmrhzbY2yAk8k7VxKuRaj1V72UTN8/kTDSVeKIM/d6K66lhwD/upMi39nD1DJS0CGRJjNLSUgtSzcmkrFL8yzawOpdrkFM3WDOf2hr0fJxsy5r3LVnf+/XManQiX+TNhogPpcHa4A=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV8PR10MB7847.namprd10.prod.outlook.com (2603:10b6:408:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 17:15:48 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 17:15:48 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v4 1/3] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Fri, 14 Jun 2024 13:14:26 -0400
Message-ID: <20240614171428.968174-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240614171428.968174-1-kris.van.hees@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0012.prod.exchangelabs.com (2603:10b6:208:10c::25)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV8PR10MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd8017a-f7f8-428a-ff09-08dc8c95a246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iRsG2jmALG8HhKtVZYPtHyK9PucXblaT/UY9uMFw9h7EgybaqPKzhL7OhHga?=
 =?us-ascii?Q?xsbSnflPzPzD0flBqRYUFZzpScjUQk8ztnCAOQmL15pcTKdvNGFfc3YMqdLj?=
 =?us-ascii?Q?YF3Bqv/afFOk/nmeY/7ehDUUjEsD4QZsHVsIEItmnTNPqqAuPz0i0GE+bB/2?=
 =?us-ascii?Q?rHHXGImQ0tH05uyQAjRGFYKtuO3iDTYOPMOyYgqcN4ir7HYsuRMa2xzGtwYH?=
 =?us-ascii?Q?nDvdwb/Iz9dl6QLX3+v73laH6Jt8o4qAmq98KNfO9xdCzQ6EFWXRpp5BJMpn?=
 =?us-ascii?Q?b0FJ84pIpNaoJh73jwmNfO39UDIy7iuNl0c3+tgBpgbHRoiE2zSXBvyOGNsh?=
 =?us-ascii?Q?jz9LUjnZwyIQtyRL/x0siATxzIMpdXlgBF8KmsiueiJ1rBEdmHhrqwE64VXX?=
 =?us-ascii?Q?J91CBhSX6Ex03qZu4nxhzX1vmwGFDqhNeUixiisSeGaWkvBpoaxyaUHne04l?=
 =?us-ascii?Q?69mL4xR7ObXqnKdD3DxSUVB6Sn40ObYl8NjOCqJwIEAqjXv31eAcO+jRGujQ?=
 =?us-ascii?Q?DeeOKqrwU57NFG8rQDhFM2NSPtdhUmBupBCRdtnr27Y6Uke4Pd7ViHACIOnr?=
 =?us-ascii?Q?nFZ10iNtzo7dXsRby7WBR/KUMIUkCYB36Khr75qOzDVRRBIgB1cdkq3wDDBl?=
 =?us-ascii?Q?UkX8vaEkSjFEumsUasRVGULJqzPxF5flMed3LYY+F/O4fq1xk2zhchSdbyuv?=
 =?us-ascii?Q?yKw9bLsEnW7j2WMjyGhlaVvbdqQbsFBApXdUrWxE09MtdAywHW+oxPPVMiMI?=
 =?us-ascii?Q?a975gcyovh7vdJ+JGsH06XojYBDbiULr7m2k3p4HZSrRzSSiaK3PxZHKAIuq?=
 =?us-ascii?Q?hhsUo8nFzQTtzozenkRxhc0RpilUZnmTfIIPzEWlyFfAkvVtMrAJh0ytfFmO?=
 =?us-ascii?Q?1Wzk+qNPR7q008wD4Rj5Ll2FHlCFHryRx86iPAYyec1+rngLNSJ5iFZMZcAE?=
 =?us-ascii?Q?tNINpELPkkcgYGNJrPwoux8V3f7DvYjMDTl9zWeIY3TIuOkQCq/toBIXJYlp?=
 =?us-ascii?Q?eWG7hHe5QzVNXj0jgQi8ZHV5G5KO4pGye+EmUzNxXxLEPlKEPOv6oQFRwVFA?=
 =?us-ascii?Q?R0J0MKZpu4uoHqGILUhZMQravj8FAJHHYrVMA3ssCA/EcEdSPVIGbZJuCBGP?=
 =?us-ascii?Q?U7K1lPfbsSq8o1W5eAwic/2vh0q7d/n1JJyejwK3vigaicn5P3IHxZSZF0n/?=
 =?us-ascii?Q?6XnBRgRPoWTRlzXO7mXZPgUtr8fNLPdPGe+seLIrHzwjQJi+W+rEm5O1aomy?=
 =?us-ascii?Q?l4R4HFaG/u8xI4bm8tpKEeEkDHwOA3uH0CoTCdsR4dKhZ9yqLrLo0Ht3rzmE?=
 =?us-ascii?Q?hBxkUzwgts6k8rAg5+eEZZfE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zk0x1s7kHtmwRHaiQypLGkGSqGDpIu//qr8Cqqhkgvd7DTPcv3UAmxZiKgRY?=
 =?us-ascii?Q?OpfrtQXLH0/i0cHVmdfnFJsCYtozWlqTPMu5ELgZ2VdrHMK+v/SviDsA/duY?=
 =?us-ascii?Q?DiehJKD3pbAraRYiYtVDTBmYxdAFTJ/JdSWxRl4BVMSx3N31nUyND1UzBIeu?=
 =?us-ascii?Q?QEGMtaAuZJmKZTKhEpsy44H/Y5MimdXWIhR8g3lKa7o4AMrqg5znDaVj/UZi?=
 =?us-ascii?Q?IFKZJlzprYi+mMcy9Fe0S/2goVVI/k11+TOkc9ccJ9xGLbqSABz+zji9G66W?=
 =?us-ascii?Q?4OPyy8iGBnkOZB/sNjtxDK/QuYqBLGchs6fJe7Nau/D2m9o21rL/tSOlu3Eq?=
 =?us-ascii?Q?gkUEFBx03setD9xJN1j0hMCrG78qHmgsdVqfAux5kBC4RXfV4QblJ3S89DX6?=
 =?us-ascii?Q?lIvjQXZ02ZQIN2T+eS8H6BmJm8zAP5eHks+1OPKT6pV0PJGq0hASo1Fj1HEF?=
 =?us-ascii?Q?7rvmCML1q1/RfmoU94bZ8eZoBcA+7dF1yvlGQKGPorFmYAZ3P1BQT1YHJGbJ?=
 =?us-ascii?Q?uMKVvpiPS/cRX94m2azqqjuUafbi+aDoMpR19698GVa2h1MJ7EaROmmjfvAS?=
 =?us-ascii?Q?QyrvtzdPXRmFMYmgVtAk/lCNv/eNIeSHGC8e82s3wZYHTuJzQRkI4enNitf3?=
 =?us-ascii?Q?Vp1mW6INYoPor7aXu5hGaP564Pcpnn/q5F1uNB+QFM5UeqUka2zdgw96Q6y6?=
 =?us-ascii?Q?U1FKD2B6rbOPukQEVoH12BWVLHoHulEZAWgDw7mZ8a0i/eZdHyrRKXB/vFK9?=
 =?us-ascii?Q?tq6IMtyFMglr5tbVzu6UxEwxHizjGovAnDbZMKscvNcXALW5C6uowEz6IQYG?=
 =?us-ascii?Q?3Js9U6CY7P+dRox3HTub5/bYPKEAMr9rG0NqaMO/eoJ2tezJ00cas6bSmM2u?=
 =?us-ascii?Q?mOYvPlbXD1BW0NBWQ6gd+g8aacb7pp2Bww+JToF83lFF8hpSDljRDis93YbY?=
 =?us-ascii?Q?t054ZpqDJ7nEb60zdaDXpMvs1Ccpuay250rLWMT13XHpSIdDpkdFQK6vassQ?=
 =?us-ascii?Q?crA847F870OHgKiWAMe5zpKHb1WG3YOdGtuWYh3Zt2wveqTLm4V9pX42Kq8P?=
 =?us-ascii?Q?MI3DxDTWwzTwOAGDWwc9QSHHfjEAI8dBnFch81HlEyNYq9MmEvJJe+FfSdIL?=
 =?us-ascii?Q?L0CBRFqzxZ/kQgQK4jN0V4op6w75Rc/Jmy4lkfpNpPhPXiaQ2YNT/3tN9QO/?=
 =?us-ascii?Q?0XHOa6N6Z3hnJxgyyjoXJ7i29hFBWQTkkMhYUOcs+EBOeMfyLKd/inaTzFyI?=
 =?us-ascii?Q?cy+1dVlnWHU75SSUnha0g5z3KoaV6ulnmkayUUKKQu8w0d3rM8tEl2S61eO8?=
 =?us-ascii?Q?3nhrTcy+RsJeCzJjkcyt2ycitGONiioVmsSdCX3aDM7KnE02u2qaphUmTdkb?=
 =?us-ascii?Q?zTs5njPyH460gBMkxIMiUABlD5Y3xvAziRi0wlqpquQOQdkOj3mw8zUS788r?=
 =?us-ascii?Q?XMK5O3FAzfz43M3gaRNt0lAUmpOoSHnFQOxNjgmlp35ak5IcqjfKbzpQDnUO?=
 =?us-ascii?Q?Q/f0QP5tMNMuHxEKDzlDCv5WP1/2fG95/yQ3EspfqjPmEFvEetqGBg/oJ2iG?=
 =?us-ascii?Q?V6YtygQX2nBt2U/tkhtvFXU9LN75/Hu6fY4mhWL6YnzRbwH1jqouI0+83oWm?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1RaO8RsgnC187vrgFj9K2+m38nqwb5P/WP1gb/M28JMjpiLmfYn/eVY4eA30DpuaeQoinhlROoujtwQd+hqYcZlN9nlfQTP+/lXJBzUmF1FPwUXOh1mG8iDrM7VQD3Xxgu3JVQQLs252Fj87Qk42W274LicXo4ZQAkvq7LedrmEmDKKmVpfs07lWPaTsJh7/DtyCi44DraSRtYfCnRUugbVgJY15Zia+1OJHun6W6+QkScHfFm/Ou+yyqJl9r5vDTVP/I2Rz9egCcfJ57AUUKFl+piMu1OzeIHb9oGyiH483mcIuOEE5QM+QpsECpDwpokhGS/OMAZ6nunLsEPdjtEXlqq65yUQXdYNU2hP/FPJP2X+vCK6rB3RuMX3FsDfGpX8wB58Nw9m4p3TTJHQ/m4tTGS2N+UdzgA6u3O2stt9xG37tUzTpyBWOS0xsY56r/LeniGNB95ugrAROiAVMMmiZXTqLfqUJ80hhEbUjgKY19LUOHgmyJJW9/pAPSWL0O9p92+r/STKxKVK1UoIdf1VTmEZJK0J/gn6RWwg/sPy9Dz3VQOWzmlqdBQ8tnSfNewvofCsMj9FwxbcRZRnzZVW06zW8EFtoDVQ0ohV2eUk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd8017a-f7f8-428a-ff09-08dc8c95a246
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 17:15:48.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfT/+l3mRre/FeoCiGFD0nvxpDW5XiLRsrxJGbaIlgq5jlqp3gVbVHLFmyxW0PE+yQ7CB9Z81h1LmtO8+HYSiu+N1CzgoNjOSyK/C4GTNGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7847
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=805 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406140118
X-Proofpoint-GUID: ztja67lz8PJYxdMRto5ozWDpnBDwy7D-
X-Proofpoint-ORIG-GUID: ztja67lz8PJYxdMRto5ozWDpnBDwy7D-

Module objects compiled from C source can be identified by the presence
of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
However, module objects from assembler source do not have this defines.

Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
add $(modname_flags) to a_flags (similar to c_flags).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3179747cbd2c..a2524ffd046f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -234,7 +234,7 @@ modkern_rustflags =                                              \
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
@@ -244,7 +244,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 $(_a_flags) $(modkern_aflags)
+		 $(_a_flags) $(modkern_aflags) $(modname_flags)
 
 cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
-- 
2.45.1


