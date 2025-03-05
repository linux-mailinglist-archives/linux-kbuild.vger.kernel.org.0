Return-Path: <linux-kbuild+bounces-5974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A1A50B7F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 20:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9CD1888ED6
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 19:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65A4253F1C;
	Wed,  5 Mar 2025 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lccragft";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KDfNlU3X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27224C062;
	Wed,  5 Mar 2025 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741202938; cv=fail; b=NWOQTY5ln36M/7qWVFXO49ghVLZIhzgCwCzan0jEZUhOuZupmyWLmLfpmu4HP/ox8ezn3wNBDDZWB4QtIdA8dBzQoDoJAHmyMJAo1nWGn56Dk4BxXjQ7TprBojExaDKY+xoxxUHKOiWB8gpQ+3+KWPEin00uddnw/NenpsmWWcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741202938; c=relaxed/simple;
	bh=jlDwYzxZyqJR7SP+Xv+01pFTnJcvQV3i7Nfl9doeoNE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZMXFhR2WvC6OcT6FkEWELe7Ea3TdoDLy74XU0gTZrDeytric6e4WMucuQLw5XuGewVE6bvV55Qjk9F6r553U1Qr7SdI9EnbJy7oYX42edTeWXWvmSl1QTkJXTyjjmeglQXaB7gNSQQO0f/QJmA8tG1dbcFR5X96H3WxLeIRyMiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lccragft; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KDfNlU3X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525IMfxR019612;
	Wed, 5 Mar 2025 19:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=DjIJh9moaSyPMf1Y
	6Xnd6WQ0BXh4Lh0T+AVl6MP+dBw=; b=Lccragft7/q5s+ASYga/E3rmFixUtrN4
	GoONYxifz8HtugULE28f5pgCXHXtxrGj8Rk+gguv9JTOAKMr//y2e3Il84lpNyxP
	b+uznbbDz6eo/t92GnP5g7ga+4RKoqtRlKa3Fuv1bd4F/Mus3kVWZWMeoFlr1uCV
	Wqnwkj+DrsGgaACnqbkFbnuw6pAAWB9Ngie7Ydddh80oS0qJgBKVNBK0XDLzIgRc
	3AiTRWHPoeOKJ8EH4ebli+IbbFrlZ0zt3UG2fa5bKGDaDJEZpS18DiDXz9Qs9t8b
	kQ2BDS2h1EzRqXZxCpJTm92GivQEE8mDauNtAoSx94LkkDcBJD5Ekg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453ub78e34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 19:28:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 525I10TE013611;
	Wed, 5 Mar 2025 19:28:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpcdfgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 19:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBU/9iAZk9TNl9UsQZkRLBWT9akBvHBJLcn4ntT1Mq4HtCzf3XXxOJyDKgvkMD3nuYywIkxhfPgmFZw0P6RXtwu3jb86RohMmTcQOesKloXp7SLoNVjhJu8raG/9wsiIdHskjnmZBDgYmDKgjbB8zye0kH+O6JwXQ2/8J/4ehZMHmbOd8BDQuszB4IxOD1h2issro9EIdbfHCE6kmbwI0mUFnh2RuoA1vi6A/bNG1UpRfAg45WlXX6HQDw0+LIiNJ3loA4heBIFHF00WJVGPmWLyWt7eFgnAtfn1mbtiu19v+hgDQgqWnDtyGUF5VinUnqGq7RiAQ2ss8VDrgZjlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjIJh9moaSyPMf1Y6Xnd6WQ0BXh4Lh0T+AVl6MP+dBw=;
 b=fomiyo246JTgHugfa8PUIw6GK2meRTuX1mQkFyPFEh+nYnb0Pewds5uxwxtVBD1vQb2TTp49jy1UN4Cor5w1c0HyAew6+Nw5X5NA6bltc2Qa56fjDICYmduvlooINBtXkhmdQxibRvx3twT7kFQHDr7C310CPe5e2ZaHdNpzkwnJO0yccc8m/MnkxJjsWxxHazqKbR/I5gTJ4q0SosGZQ9+YPSfm+xLG3QV+kJYN/5YXKEwtQaXaZ/Bf+8kBrEvXhS2qMmUdo3rc/l+EE8F5b6ONkq581acHB3SWL1/8A6QS9rQlJyeU8K5PO+TEzticlryj1syb+WAH5O29jV6Q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjIJh9moaSyPMf1Y6Xnd6WQ0BXh4Lh0T+AVl6MP+dBw=;
 b=KDfNlU3XH0QtrYGkg80LSwXkA4qz/yj5gHUsp+LsRP0tFnnfi86xomx/y4nXRlHB9CfN7o3NaIEQdhAH+PmheTqbbaosONavrK2QEG9LsReYfivu8IrZDqgaWX4+TSiwjzaVPO/NbWYe4oWSml2Z+BJW/1HAvKgPySdvwE7+s/o=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB5214.namprd10.prod.outlook.com (2603:10b6:5:3a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 19:28:36 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 19:28:36 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>,
        Daniel Gomez <da.gomez@samsung.com>,
        Jack Vogel <jack.vogel@oracle.com>
Subject: [PATCH] kbuild: exclude .rodata.(cst|str)* when building ranges
Date: Wed,  5 Mar 2025 14:27:58 -0500
Message-ID: <20250305192808.2826336-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 127f5005-5a6d-4ca5-ffaa-08dd5c1beca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?liJ5LjeONvvM7LJVGIYoNE1qNWMKo7Rn1IeX8XCleVCa7MFszlkAGe3cIhU7?=
 =?us-ascii?Q?P1oFRH5KAYI1Dc003kmt9WNG+eewo1Gl/iSYPe+Tbs3Axu3IIPuNTv1F3siA?=
 =?us-ascii?Q?RKGHYw3XN+6t/Xr1oMmbX4WJs5WqFRN9nj3auYZ/XWuiVPRlrzPsjx316lvV?=
 =?us-ascii?Q?heoUsT5gBWFuS1eFlh21RW1MwEcvnzgN/Y7sgLDAiyVwC4eZogDCYUQ6Jl2I?=
 =?us-ascii?Q?aWBBm2KFaIlgRPUZmVQfQpE2cl5MLqEBWsVCY+lHsKvnC843GCLYSCRacCG2?=
 =?us-ascii?Q?tVmeHNlc7/9v7XIyroRiexG05V+wve+sQ/j3rI3vuLZe1Xlwj9hbdMgr3yN8?=
 =?us-ascii?Q?ZQ7jBvpJoeGzpJhGP6Q9dr+W5kmQ+EpgY5e49b2jNNqAOiplsB9PM+W/GLy7?=
 =?us-ascii?Q?PiqML5JsoSI+utdcpXErEGJY/oqTkc2dTmdYiuEwnlsGKq7njxvLTELJU3FW?=
 =?us-ascii?Q?orer4C6OsZfrpb5LfuuKX3F+q846RPAEF7Q3RDWvBFwxYzoXGdPAondq1ge+?=
 =?us-ascii?Q?B4fEFFoXhcVgcgAG4d6LBNQILH0ldj07tZGeASLlg4I+QDONEVvTCJZgGsr6?=
 =?us-ascii?Q?3o6Sc0jJWESLexJ82ivD+xHVeGnDROIiN6oZw608I/23/RLOd/3Fyc17kfAC?=
 =?us-ascii?Q?pSW2bBipviTmqLnjYNRL3YEtcCIRqLUkiLAhBKfFdkLQCJorn+7hwe0+ZDwh?=
 =?us-ascii?Q?DQu0v7SjDte8mc1eHl99KOyLjICsU2wMkgwuZIYuyyo5A8mlKcA9S9dJWqA/?=
 =?us-ascii?Q?jLgbtvcH67MtroKy2jMB23Pa0/Whcp5HcoMadCbk2m+mv2i7ICaaDur3cwlX?=
 =?us-ascii?Q?jbg5hC2t3Q4a5XcHYJdFG8eO90qk+g1qvm/VeLRND7oERKFXChBIaY76t0FB?=
 =?us-ascii?Q?8DwT1Awe/LSKdsp3b6DX+LfRlU5UgTdhVUVV3A2sQb4iwF7AfWnpfUwdzdUP?=
 =?us-ascii?Q?3G58xNO9yyVhQ9781xSyiTn1e0hE78LGQr4o9BclyOzXsCfVrid/Zo0x4JU5?=
 =?us-ascii?Q?bAw/bQBWH2Kh8ckjO5eZxs+BqojJ7Br7af/BxrXvm3A+d9psxu+RvxKcIrxo?=
 =?us-ascii?Q?CEdfeLUrDz7aYRquioS08LgL8+yhxoE7T57Xd+2czI11tCyTlP7jU9Q5skZm?=
 =?us-ascii?Q?ifuZUkVd3K/FVaLaqz1Qnve5VzeVVskH2dpufx7sTICDhZ5+yKwcRy5IXT/R?=
 =?us-ascii?Q?7SyykmX9l8+XByfEa5B8QgHmmYg/R1vpOVU6Yv9Yym8ZxG9dJXwpDP8ZIwk6?=
 =?us-ascii?Q?ISXUS4f1ivTw9DAYkvaCE84rrJ1gM7AWshO2Mvob+QSm85t36sJ9Jk421g4K?=
 =?us-ascii?Q?bUCx2+4uxaE+ZMTGwi+ceMSML2FRUs13nmj+fG9BA3sh+TX94TzAwi74BEL4?=
 =?us-ascii?Q?sSCYLK5a6z95ydZUy4S5NkC07S0i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7J1pleIV/Pq0wKoPQYn7tyfftQ6cB6E8rk2ye15Ata64DfV4BCj+ch42mJw?=
 =?us-ascii?Q?gpD4hI9tecGmbKeIdK2TJCnLWqzlxoaHMqRt55XSMERXZ2osBa/5yFHkWdrV?=
 =?us-ascii?Q?qW3USZFGsWRMERdsXiZhTdQBPDuJ2C9Rac0cJFrvZroUMU8TlC+c9ViUaJLa?=
 =?us-ascii?Q?TVplrMnbBEWFrQuy/npTSRnV1t3uYeWfEPd/hTKNDE7yTbRYbSgmanMCtnpn?=
 =?us-ascii?Q?3W1Uv0CWGgQMlCK2kWfrOxvnVt7sHqP48bAM7Ue3mAs0FWwYuuCCKz+Y6s3g?=
 =?us-ascii?Q?Nz1pabP9SDulIqy4uN9gaJAEvKXnsyVAyYF21dmo7D6N+49JzLcJbNha8BOs?=
 =?us-ascii?Q?sw/gMPyW6Lyc9j0e2PpDIgasZmfyxaJtXCbEGYFO9x78juiKik9NM2sWwMJE?=
 =?us-ascii?Q?tbB783N+gXk+h6t+bj71mqiaDJXyfFHuQcCA3cWkzZUdsog2vJKOpxitNwKG?=
 =?us-ascii?Q?qrnjOGrSuylPgeNVNo4tZDzh16+5tp06281PyaWlGx9z4/QyClLMKboWXHxH?=
 =?us-ascii?Q?P/htrKjduu9TsFZFO30ZmAboYSGjp9V29uzboCVXzgwjd69fM7b6lP3SfozK?=
 =?us-ascii?Q?yvxAYpOYEXTIQArYxoV6YWZbS55oXk03tB8O9yKuFuPc2tvsu0VpEgU9fgBr?=
 =?us-ascii?Q?8XxCqU5U4wQ/4gepJIY6w1aEUCLZerxEcrIV/wZgc+ZVDhaDQGvnY7IcDzmo?=
 =?us-ascii?Q?gnz158bXxo8Xt92DZY9caW1wXR2S0OUgYOcRYYJ3GNoWaG1eNJ06dBnPzUcv?=
 =?us-ascii?Q?C9hCbtm0r3xpcCnF7hq+OefkVuBOLWP2RMTXN3f2mKUBVCYQiEuoTeVTdI48?=
 =?us-ascii?Q?XOJVXx46WwL3+RUXst/7rLYpn2nHizFsQdOrJa6IygW7s5rlQWi4AFlF3qiO?=
 =?us-ascii?Q?Lgg4xIWF4BqLRUcXZdERz3zqqcvyNsZG5aPmzDYn0E4HBQ155toXa6GjpZm2?=
 =?us-ascii?Q?PFKvYdfbcUJGAfIaGpovsZHjm7zggb1PhO5hfTn/TYL7qmf3UFqP1QsetVOr?=
 =?us-ascii?Q?ajF1lBIoScOtg7zgNr7qDk+CHHdYhV5IA6R9BSk2vVug2S099uU3EEgycrf1?=
 =?us-ascii?Q?dEGdb5YPl10JUZ9OjUyIeWQSuhkaEQ39GayrFizpYnqqwPwpGY6UPJLzy/UZ?=
 =?us-ascii?Q?U/8kqaYjKMWWtixNgzWA7etZtFoY8KbSD2Vh+bkeKVujqxN1RJkkdS97ihA8?=
 =?us-ascii?Q?vNWCFqQgDEKj52BA21Milttk69S0DhaXG+b+Ofx+VUfNhm5pwnDXz8CEjRWu?=
 =?us-ascii?Q?AlktFRBFSG/tzRM3dW+sp2q8AiV7yKIN5UMRAKzSo0AeU1PJG5DUZFNJ148G?=
 =?us-ascii?Q?qzdGsVLRJKNCOdOvbgCbgMjLmQNXG1FCkhTWKjfz3g/pA1z9pHd2a/9OviFS?=
 =?us-ascii?Q?ULg4Ai+v0zUdgTZYIgvKL0IT8z39qYl27vT9X+oQhf5dJmzRjmOY0vOpXFzD?=
 =?us-ascii?Q?JDwRwtXkxfy1Pn/H3sbkuLya/CZDasn3tGAqEhwX3lpuvwNl639rLkiTfHz1?=
 =?us-ascii?Q?1H44l3ulrUtkPlx/y28M8NcmWxTxoTVR4/911xONOOTB0qIUK3waIabPd21Q?=
 =?us-ascii?Q?Zjyt6pIlDBrUGnIQYTyYrWecUXw5kqlU1JrOB2KoKGL+rPnZgYOuTeTrhNLb?=
 =?us-ascii?Q?L9v7/ES+ogDerJ/TxWz63fo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VfsdbJJS/LC2N0fYcI33/75Odi0QXsyhmDYoG/PS2XKBUAT2iPTKjXhdlw2Bwo+gwVwwIH9laoJstMftxXCknzlfnZm/0QCtknfT2PHAvEL+RDVicm9q0Ud/jduDfAYm2zeDF14Z09YP8uosUdwMXosBEisPnLFPUFfysTA/B4GgBxInJVtGyteLIWSzMaq6CHUdVd/JO87E3nLZaOpvNnXa3WKQ+pMjZ+1wFKsXMaw9q5HsIqf6pCDKZRy4tk0jz1ZoNexyzuZ83K9XC2kDCPnlqfE1KFNW7C++2a32SM8Fc5RjzEEwW+6aVLFqP+VNtyzF5YFfyjYMkQpuQJqsLbdKB0Z/CkbIwKvk+oKnzM3gVtnp85H/p54fYf5HfhCpuQD1Y4wy/7ZO0JjWgYghi1ol1IZ16PcwDLVXkSjCmHEvWqhdihn3aPg4bc39HaeIncDI9w56TW/MpCQVgAoBrMWi1IzTIZAFfasBh2cTDlEtmKLZoMJH1IjY7eIt4BDmvbevqPRnYOcD04UObBbSHU87G7uk3OaTtGWe62QZ7FlR9urDILV4fAFxqqeKU/li4VkT6n2e3nKCD+WU6Fouugi8139ljWaPI+Ulvc29WK0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127f5005-5a6d-4ca5-ffaa-08dd5c1beca6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 19:28:36.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fEMpR35UIgpCjifTgcw8nyf8JSxl1ZbM3lp6DARMXpmUTzmVf+zmb3lR3kOT4Avffx2hoCL5tbtth9f9yaZ9rSbrJ5pn25EpMSwZRSqEc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5214
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_08,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503050148
X-Proofpoint-GUID: LyqUD_oazARYRmab10hUKUYjzBiOW9CT
X-Proofpoint-ORIG-GUID: LyqUD_oazARYRmab10hUKUYjzBiOW9CT

The .rodata.(cst|str)* sections are often resized during the final
linking and since these sections do not cover actual symbols there is
no need to include them in the modules.builtin.ranges data.

When these sections were included in processing and resizing occurred,
modules were reported with ranges that extended beyond their true end,
causing subsequent symbols (in address order) to be associated with
the wrong module.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
---
 scripts/generate_builtin_ranges.awk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
index b9ec761b3bef..d4bd5c2b998c 100755
--- a/scripts/generate_builtin_ranges.awk
+++ b/scripts/generate_builtin_ranges.awk
@@ -282,6 +282,11 @@ ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
 # section.
 #
 ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
+	# There are a few sections with constant data (without symbols) that
+	# can get resized during linking, so it is best to ignore them.
+	if ($1 ~ /^\.rodata\.(cst|str)[0-9]/)
+		next;
+
 	if (!($1 in sect_base)) {
 		sect_base[$1] = base;
 
-- 
2.45.2


