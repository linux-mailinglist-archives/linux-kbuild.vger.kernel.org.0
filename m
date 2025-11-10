Return-Path: <linux-kbuild+bounces-9543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB35C49559
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5016E3B14F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B4A2F8BD0;
	Mon, 10 Nov 2025 20:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K11/i+Pd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48432F7ACF;
	Mon, 10 Nov 2025 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808144; cv=fail; b=B/Zl3h8q+mt9WsVlq2kZREujwwQ/VBU4EzMZLPjpJPldeZuxdGHV25AeCpI0cvSNIWAi70dcfeXfhWDUd6avObwOETbN2j/tbzJUWij4TLhB+6WrnGHJ8KGYVY1+bmiSkirZTf1iYJCXXfowDaR1n83p601mCMEPbDYNcSIg7yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808144; c=relaxed/simple;
	bh=EomdsXhAe0E0pi5BNTcy21fOMxliSpBbOJpcuhUYaRY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VampalDNAQLeCsmp3Pj6T+2yjWlO7IsCI3xYMJJWPS0NJ5H3Nu2gP4TfZz/lShmpyEQJUI1hHuqt8lXT6kZ52E9fxMH0IknowXjEmPmI2MQynpFb4NjuUweSD1BYIZzywOwAMkVcb1o9EzUeTF77ouh5NEoRx80R0bFZefM06Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K11/i+Pd; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbmhVTQ2wJT5gTg5cDXJFCp3Ca+DsdRfiBj9qhq/JnY1Fu1ZVxjxPvtDrdegqftKshTU2ERmo9B7Wb4Bba0ZP9Q7nxM5Jbom/KyVn9QTV0H+0trcaN2OMDQv7xfOPHFvsOwNcIto+EB5yADK2YR7si/+zCuNl/wf/Vf4I7GlHr/tSulWQhfKbj/yt4XLy2aMlKrHrSD7SZwpoNoa5Drnoc6fkzghw77tkR/zgsLxdQvFXRBbr6c0uWOqvm4zeM5G5/ibUTPBCsgtGEUdatTgSr0Q6QF7PQQnw4WjEz0bL2kbLZYKMWvW5G+D2fLdwRVAL3aaAeNA6CWzqLR3UySuUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouAXPuvvtzkSJumhiD4eafTnwuz8CYOrLXNGvJEBV1U=;
 b=mmxlSJI2QQqtmxgb24Q91p1HyLIVTcJmK/Ikpwuyo8JoCoq1HHL8P+hQlSr1zpMNCRViR8hugluNL+MhuxzKekPtR5FCyRLssWpyj/WMV3yCB4/fTRtFVYwAMjbsg7QhWQyOzzCt0d2RDyrl5vlDrtvCsemzsLxLTbXiJ8EuXtde/6udRgel2nHxm1pd2Ip8wDNi0acVw/G7ehkwi7jmHlFxh0kcykLmPfYb6+EG69xZEWcOL5hQAdWdiL2f39EkFs5nDLhGWnoyng1D7G6Uu0TJ3xoYmTSkIcqNlgxMX4rHE41O70aFOtrxO8h8ryMjgpBEPz5AKMbZ+GKwROcVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouAXPuvvtzkSJumhiD4eafTnwuz8CYOrLXNGvJEBV1U=;
 b=K11/i+PdbktBRgIDQ+e4ICbAdnNght6Lk9olGzG0wwRWkqBmJFBJUV0MiwsP9LEIUtCRJPKIpJSacje7qriSW3iR2GnHrUdwethgv5XOuZQwsmIhbGerw2B+gfAVN4j7wB7wkccHyaL0sNEK37YL23ONjHJCLcjpOn5L3EHfwpM4J8NB44Z0EScBXiyQ+UmyhzwLCsUhKOdktLizbOJL1FLSdvGias2lb7yAWxfuTkZMVZ9gIqHm46ThhfXCqFqw68RpY4HflrgBPmtjxqXe8KPT9eYfASMx6pD2o8eYwJXQBykpR2OTgRkPTbeqIolsxbW/BOqaYLH77sekmm5R0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9431.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 20:55:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:49 -0500
Subject: [PATCH 9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-9-7564b9f69a18@nxp.com>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
In-Reply-To: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=752;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5dtYwgLtzBkOoM7j5RUG7yP1NOD6+n5OAQIP+iZ5pVM=;
 b=OLRBaS+oKkNlSwB+w6C24/8cFVXOR0upJq9WsgJe7QWeLtxTMXXJ9/L/iRk49E2Z2NaUNDnod
 ig3WIQUAlqmANA/eWtsbcd4dJMzowNqIPR0kI9m+qGciqcaJzbjRn8Q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f9dd75-5450-433b-0c27-08de209b81f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmFhWFplNnZ6cE1kUWJZRGdJU1NROWhSc0xNYnlZSGN6RTVwV0t5ZHlmN1hR?=
 =?utf-8?B?ZHdnYUJFUEw5Rkk3eXRySFd0SmhaTXN6eXNiWlc0MzJKV21YVTdDcVlnQUZV?=
 =?utf-8?B?bVJEcE8xR0lvcktTRzRMbzNFSXBEM0dJUFAzZFJYVmpGb25vL0FOQ2FXRkhZ?=
 =?utf-8?B?WWhTS1gvcXhPR3B3YVZ5ZUk4MkZ6SnhZdUpZU1VBWDUyMmlMSk05WjFrdW5Y?=
 =?utf-8?B?d2hwQ0UyTitnZHhmQkY2a1BkTWFYRXhRU1FmNk4vZm9lQXFQRFJYNWhEUWpn?=
 =?utf-8?B?RnV4dFZwbUd1MDgyVnhuQ1FwMmt2c2RnV0pTUzhiY0wxN2EwSk9pa1UvY0Zr?=
 =?utf-8?B?T0dBNTZSbDJWbml1L2JJbmk1a2FDYWNZZEF3dkxNTXpZaTJiSmd5YzIrNWxz?=
 =?utf-8?B?SkM1a1Q1b2J4QVZiZUhyK1FLOFp5eVM1cG5kSS9ySFdYbkJaZlczdUhVSDdC?=
 =?utf-8?B?WGt0TzBaU3ovdG84eWltMHB3QmJ2OU1iM2pOUG1tbEh2TjZCclNMYlhBVjFw?=
 =?utf-8?B?ZkNzQWpWNm1sWlQ0bVlKUFNORElOM0dJWFRTTGJ4SEE5TFZENk9LUmZGcTht?=
 =?utf-8?B?bkdHNGc4TFR3aXlqZHpHVnZPSUh5cy9ab0JRcWJDQ1o2SmxSai9BMW5IcUpx?=
 =?utf-8?B?UEl3Z2M0SGdYcTV0b2VsakRVemZ6RFJRRllvd0lOUnBDN1FaNXZKN0JxOURJ?=
 =?utf-8?B?SDlybnJUOG1RODdpYnZLWEx0OVlrdEZCeGNvb1REZVdzakt0cnBqMlR6dFJ2?=
 =?utf-8?B?cGNBK2pPK2l5VnNBeVJkaVJ4czRySkFlUXpXNWowRTVCeUFJeW9IcWhhRkpS?=
 =?utf-8?B?VWRJNEl2ajNiUGl1dmZWTjBSaEtZazBFUWRQaHA4TGYzZjhCN1NWMnpVbGVk?=
 =?utf-8?B?RmN3REtFZG1tUGNCSit3TkRFelhSNHNKamcyOUtUOUdrOFdFM21CMjBSSjF2?=
 =?utf-8?B?N3d6dWNQK0ZGcURUc1ZwYS9BMTkvR1l0QWZCaklNeGZxS3BXcW5iSEtaOVpT?=
 =?utf-8?B?N0xSMjJMY1lsVEpSTVl2K1A1ZXBFVmNaZjRQQUFxTVlwOG4yRkMrSHp5dHJ3?=
 =?utf-8?B?K2RWaWFUWDZGdG5reUdmZitnMjlYTW1JRnduN3ZFTms1bDMyRERLT2s4K2Y5?=
 =?utf-8?B?WXdTbE50ZE1JMURaZVIrMkYxRnNHbTdCNytGUlVtVUFacW5wTUtyUFJEVkxz?=
 =?utf-8?B?eklYMmowRFFWYldiUkNTcy90VmJRQUllL0dtcmFFNXBwRnpVbFNTNnZQQW1U?=
 =?utf-8?B?V05oMUh6WS9vT3BoWS9Ob2E1dS9hVE81VFdrZWVJNUdUcnY1L2MzV0tlMUhs?=
 =?utf-8?B?dVJjSDczQkF2YTZGK3ZXQit6VVFEblZlSkNES2RUeXhSbVlwcnpRSEdBM3Vo?=
 =?utf-8?B?NzBVZ2lSaU1aZzA1UGh2QlpJdUJNSHp1clpIWHhrNWpBRlVxNGtXMGh5VjI2?=
 =?utf-8?B?cjEvQUI5ZTRyWWlxYStDVThpcnFOSVZoV3dXK3QrOHp0QWtLeTkwWEcxV2p1?=
 =?utf-8?B?S1krSnozZFR2WW04dzZVL1djZU1vV1p4VDRjNFVlRk80Vk1OWnBuOC96ak5X?=
 =?utf-8?B?NmlMQnl5MllFSWNiOHR6TDg3WWdxbDJEL05kNm43emlRSlE1V3V2aGdoUi9x?=
 =?utf-8?B?bHNCMElYMTVXZGkxa3hDaGF3YXB6aVQwUlB2MTFoUU5FYy9mMzZ6WXlsenNk?=
 =?utf-8?B?anIxRGt0YnBTZkpNcEVpV1NqZ0FlT2xwWnpHM3QvcUQzaTQxc0JnMnRnc1VU?=
 =?utf-8?B?ZDBlUEtxejFoY0tpRTB4U0p6bE0wdzdpTFUxc3JvdWkzZGhTb2lySzd3eU5M?=
 =?utf-8?B?RzdOeTBIMmxBNEFGd1E2ditCcnIwNGQzeW9xdFZRamRnOXRHQWhWajJITXh4?=
 =?utf-8?B?a1E4VE0vRmwxSERRVEtvWHVRWHlKVTkxbzF6ZjUyVUFmdGN3djhMczJNWnl0?=
 =?utf-8?B?NEY5dW5UOTJpKzdVNmZGRGdFemc4K05yZXR6OHNnZGY3YjVLby94c3lOUXNt?=
 =?utf-8?B?cVlvVUkzNkMvS2tZeDRnb3pJaW5BKy9BNzdTZk5RL1BWc0ZwM3YzMHo4dEdm?=
 =?utf-8?Q?zwgde/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJtaXBUNlN0eTg1VTFYTVR6bnAyUHZxdWVpSlRGK3pWbmVHRUhHWkc1bWsy?=
 =?utf-8?B?b0xWZnd6d1doQ0EwOGUxSEZXTHZTc281M1kzSmorOW1wMlZDNzdxYlNyWTNY?=
 =?utf-8?B?Q0pwTmd2dEw0dTcxZEdxQzNyYURvNTE3Tkp4Vk96VWR4bmRvL3RkUlFaS0Vi?=
 =?utf-8?B?dFUzcXgzTWlTb2pISWhNWUdyNkViUENmVlNlb0FXa0pnd1BBYmFkei85Q2R1?=
 =?utf-8?B?ZzlRN0dGRS9jZTE3NUFUckoxWHlsSmxBVWR1OTArZ1c1WkQwcFFvM1JPaWF0?=
 =?utf-8?B?T09vZmY1RU8xbFQ0S3o2ZWZyNVhWalpOQ3EvSnZLK2JJTWQydXhHanhZdW5j?=
 =?utf-8?B?NWNQZEVrZGo3N3cvNWp6Vk1GZWJEaVpyek9ibEhsYTZGRWpxbGtlakdIMHMv?=
 =?utf-8?B?Y1FEbVY3d1ZwYkFmVzMyKzdSWnRTZFQrZnN2elJtd3NJbU9XTUVFa21PM2xT?=
 =?utf-8?B?WGZBb3RQdVdjWkVEcW5PUFY5di9pMHNMSjNPQ2RreHhWK3gzQ0ZVdVlXRGRI?=
 =?utf-8?B?NWhEemJJQU5UekdYdHJwTGJuaThkZkdYOFRCWUx3TFdRVkxtc1YvWHdzMUlR?=
 =?utf-8?B?TjEzUWRZT29BVEoyMzF3cTYxNzBVSjBOZHRZVlpUa3NTaTFLRzFNZG5qV1Jx?=
 =?utf-8?B?bDF3am5QWjNwK0x1NTVrcHBQbFdXKzVLWGlnbnE2RWhCak5sTnhsdFRXbE1N?=
 =?utf-8?B?ZjdJL0FmQm9lc3hSNU9jdk1MdGMzQTk4ejFmZHVwNm1zQVhKODJ4dEZ1UGcr?=
 =?utf-8?B?WE9qMEU5SVJPdVlJa2dMczJuR1VGUEJCQUdFZldBRk5sUitIUlBpU0xHZWhm?=
 =?utf-8?B?STQrZGdVb0EyQkpGbTQzTWE4WVVjamtvTDl3YURqNTc2QTRkZkVLTlBXQVJJ?=
 =?utf-8?B?bjlnWmdTZEVZVENicjVHdkoyQWNnN29EUzhwRWpEY3JWVGt5MW9PMkhJdGlK?=
 =?utf-8?B?UjVIRTE1RUt5c0lONVppYzByTk5wb0pxY09YT29iMFhmcEFrWmRCM3pRSzFU?=
 =?utf-8?B?VVREYkNPQ2Roc0tuNUJ1YnNISGtETDVGem8rZUF5UGZuU3lJKytIdEFkN2Iv?=
 =?utf-8?B?eWVkcUF0cG0wMml3ZkZOeEVUZm1rNGhxYk0vRVROZVVCUVFpU2NzS3lkT0p1?=
 =?utf-8?B?Y1hZYVUzUmozd2lvQVpGZ0NTVzhhQktyTzlzcTRYVituU0ZmTGhmekZMejRt?=
 =?utf-8?B?WTR6aDBvQmhVRTEwQTJKTGlWclVjc3Z5Vm1KaVJ2Vng3cUt0Q08zQlVUMmpU?=
 =?utf-8?B?dC9rU2srK0ZBczlmS0paRGo1TS9PcVRDK0VDdEExRUY0aTArMFNlYkdWKzVa?=
 =?utf-8?B?WURsTkVrVmNLK2MvZlUwMXhJR0NwNHhNUzV0Z3g0bzd3Yi9RY2QzVWFVVGt1?=
 =?utf-8?B?Q0VxcmdVWGJlY3hrc1ZxMnRIZ1pEbzY1K3k4RW5WU2xyNUZhcDdiVmVSaVBO?=
 =?utf-8?B?VUdmOThlMUQxUnJlY1Fmc1VKcjFMcG0zYXcxdDNOMUgybU1DcVM2Tk1GeEJk?=
 =?utf-8?B?aTkzMnZjZkMzZ0tIRlcvOVQvUUdjVGlDeXFsYVdWQ3BCNkNnSzJQaTcvQURM?=
 =?utf-8?B?cTJocWplemdYbHZxbC9qdmZMTit2dTl4SzZlcXBSanBoNFQ4ZzQrUDdNWm5h?=
 =?utf-8?B?NEY5UTNERU95VHZTUml1OWZ4WitxRWJiSlE2NS80UjNBK2pnRWpJQWg5M0c0?=
 =?utf-8?B?TEtVZURrQndxM29mOTUvRWNmeWZrSDdaU01xVDAvRzJMa3VjRUk3SUxXcmxK?=
 =?utf-8?B?bkdMQko4aXpTUnV4VFVTZG9sdGR3YURMam5SVm56N3dzOTFta2hJa2EwQ0dl?=
 =?utf-8?B?aUxuK0s4b0psT0xScnNIUFVodFRDYnM5MHFpaVJsdU54eEFoNCtVSjlsVFJw?=
 =?utf-8?B?YjNxVDlDcUJnbGdkaThnQUlRNHpiblk5TVV2NjNEelBEcDdQKzVRbVQrb0Zn?=
 =?utf-8?B?VWdtNm90V2pPUy9KWFNFTkhpWHhRTEdjTHRsZS9OT1c0S1pKaGRPS3ppVm9p?=
 =?utf-8?B?d05MRnZjeWtNdzNKakVydDYxd0gxSUppTG9UcHZJem5ybmVTSzN2YkJDRUh4?=
 =?utf-8?B?clNnQ1lwYkFCNi82M2FOYml5NEhCVkEwMlJrNEZRWkZuT0ZZNUtJaFU3djBF?=
 =?utf-8?Q?4OMTQ9+7ab64KtuKqO57euyFi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f9dd75-5450-433b-0c27-08de209b81f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:40.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYeY7s+GsscP9wdOjXZa0uO1r103UWfwvfeDHnNLTuU2giKQzub+PgVmMJqdNZ2q8UNhin3XlogErjGgkdRoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9431

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b3272fffcde813f718ab7653eed6a68fcceca359..a5e59831b99d68d6de0d5a47e96fec15b096222c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,6 +769,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8997-bt";
+	};
 };
 
 &uart2 {

-- 
2.34.1


