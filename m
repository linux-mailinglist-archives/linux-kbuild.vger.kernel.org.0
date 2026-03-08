Return-Path: <linux-kbuild+bounces-11681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EkOIzDcrWkj8gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11681-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 21:29:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8B2321FF
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 21:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A519300D92B
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 20:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367E7347FC0;
	Sun,  8 Mar 2026 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="gNC4ihzw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022090.outbound.protection.outlook.com [40.107.209.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7A275864;
	Sun,  8 Mar 2026 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773001771; cv=fail; b=BUi8dOPtws+rHPgDoojdUTlFJTqRoxGRprsKBe36e/8X5vD9Fop3ElD3+GENaNL/oQxjfM9EeoMndU0B8KFWU+JDuWXKOr1HvoY+31gdWQyX+vKPf8bBAsBj+5Nxnsz8fsB79b6W+NEyvw8uotN/UUtm8xXbZgVMwNXVobtTq48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773001771; c=relaxed/simple;
	bh=rwn0IDHk1KQ4qk+lCWodhVmF3dhL2tKie99zZbRniOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MmHymkiwwSUaW7ZBjyLjkXvqtBvGf+65tCoHaW1UyrRvFc2RdOTlZ3AP1WxPFPO2LJ6Y7qg2J3f6y+kNBwKDv4s+T17PlhJPtkzGFvQkYldcnt0kNZ3R3iG2zQ8H8d7D7FvxLTivAuETB3otq54hnLynHsHaRdKsq50XvCStfKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=gNC4ihzw; arc=fail smtp.client-ip=40.107.209.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXVRm2sAIQPkYWdlR8l3cCAe/oi/F4GHY8DoQE9aIWFShQEzjk2QMQAxyw/JJbS2tghWDEMHTSpAplhpYV63+ODYCrWAWr3oXBWwdCE1eczkrbZl6wnArXYukLtcphlpkAjI2pbOaHhB1OUvw5pRCE4PJYDZtn8D3SDn6WSJnAgesD45bE2Gunwxg9+JkulLbhkmEZSQohZNHnUcq3W7LQMfB/JKQWjABXi4qriH0byOsZI5Nyxm8R4PJVPNatoRXgrfU8+NDxkgznfuJqiMMfyzksF82zlClAS/FcAUuKsKPceYe/IBmrJDjh0lFBcYpuK97wHtKl6kzbXHfjPMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDemPd7okg87CjXPYtOMi4CNsaUvi1708HRRCOoMLhM=;
 b=JYkx1iIw3WjutUyEycjdlNYy6KLQYL/GnSd+AssQ+RlfG/mvfcFHiNQjw26hgOqYcRPVPWWoa/o69vEjtOe+Mqn+ZkGLMgdzeWZOOMGr27ArMZgcg9IvcHZ3Vn2OeaYPTQBT7vwOd8SyMJUK9afzkWbfqSrgXf2M452DByRI4slZL6M9ThUpxYkW0FPHB9VGqxk+esd01tmMelqfTwwdV5B12U2Xct63VATXFzWlBgbuD3PINK6hN0w5cqZn3p5HeECj9ZrLC1oDE7NfXcKGjmMKb1u2mPd+nz75PXveZPMN1Hj/qyWXa18iu2yCAEAJNTC/KWZblNKgBdCbKopCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDemPd7okg87CjXPYtOMi4CNsaUvi1708HRRCOoMLhM=;
 b=gNC4ihzwNCvap/edbzw7ZHBv17RVwT+4YZdEzG1GhfOgxx7YqCTNd6F8h+/kByku5IQ7Ca8rJ6c52OXGUMGt9q1t8iuRqNJYDTiEinxcc+C0JXN9vaFUA0TpjJ+qrPIl4j6J08cNE3neUgOws4xGU1I89JNP3TEJZ7RfwduABk4=
Received: from SA3PR21MB3867.namprd21.prod.outlook.com (2603:10b6:806:2fc::15)
 by LV9PR21MB4975.namprd21.prod.outlook.com (2603:10b6:408:2f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Sun, 8 Mar
 2026 20:29:07 +0000
Received: from SA3PR21MB3867.namprd21.prod.outlook.com
 ([fe80::70ff:4d3:2cb6:92a3]) by SA3PR21MB3867.namprd21.prod.outlook.com
 ([fe80::70ff:4d3:2cb6:92a3%6]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 20:28:58 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian
 Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James Clark
	<james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet
	<qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
	<nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
	<rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia
	<xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
	<warthog618@gmail.com>, KY Srinivasan <kys@microsoft.com>, Wei Liu
	<wei.liu@kernel.org>, Dexuan Cui <DECUI@microsoft.com>, Long Li
	<longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>, =?iso-8859-1?Q?Thomas_Wei=DFschuh?=
	<linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore
	<robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
	<changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "bpf@vger.kernel.org"
	<bpf@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>
Subject: RE: [EXTERNAL] [PATCH v3 15/30] tools: hv: Append extra cflags
Thread-Topic: [EXTERNAL] [PATCH v3 15/30] tools: hv: Append extra cflags
Thread-Index: AQHcrxtcqhII8/trZUizp+l+eWHo3LWlFftA
Date: Sun, 8 Mar 2026 20:28:57 +0000
Message-ID:
 <SA3PR21MB38677651B6DDAE1DF3A0A026CA78A@SA3PR21MB3867.namprd21.prod.outlook.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=287acd7f-e766-451c-8997-2362be107c8b;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-03-08T20:28:18Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR21MB3867:EE_|LV9PR21MB4975:EE_
x-ms-office365-filtering-correlation-id: b8bf1b2a-8738-4e3b-b772-08de7d51537c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020|7053199007;
x-microsoft-antispam-message-info:
 dPkm0kDokGGL1E3SydwNiGPSnsJeveqg4q6kZglgmtkNFS33tWD9REscmF26kaiM62dpoAt6VH0yTinGGx7Idby7mbdbDHdvANAoqPHLjmGBAFOd/Gth/wjuwbApdJr2soaVcv+C09pQFCLqP4asyZ+KyEc1lEZSm9iOVWHepcjCAaHLIq8bhyK8oYICsYhKmtBAoM6V95EDzlIg9NYL2E5GUK5T2mJpAWrXfeEfugJuuNRvShKyXhDgVFsIrBzahof+3psy8R22D+0QJ6kNGZGGrBP/GpbQfhbN3K/xS1HdLI8ZsJy0DJOL9LBfjUsfYDdOfy2B6GDLZmsn+Cag8fcyfAxHRoaXS8Z+ONa0Qz/qLQsF5RZoKJkNyiKkoBmcX8XG+fa3FndCPMWsepmwldoG7UexcLmjzuEaMQkm4KbuAVVk5GVrIuajzMx8vNDHv1RQ/5nmhG4dGkB5mqAW+LD5E8g4ckGCyCfh2xvDubOOlY3jbdcnm/HFILdmnjP3oMKUXQwNWjPxhERzh0x0oK8EEHh/jAC9lbR4Tag3akw6dyvfHk6DdI+SPrKXraZLQ2+2WJh9xWaK17OJQ9AiFcZbhobXux3MJJKNazu+9dRNH7OpNJooLfUw1dTsIQu85Gvox5whytAdCIUpbzj4bFBPRpvLf3fG1osVCbPVgpvH1FB2pMI0eFkcYremXkSYvdlY/Af37PGLn1o5sz185liijvq+hpFgh4HHfe4JzbpiRyH+9mUiT7zjEe57F1ouUcBLS08o876NIF9cdY46zB7JnCvjPzZ9i6SM/8h+QeajzXwpzi4IeszhFLredxOG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR21MB3867.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aD7wuRbeMneBsAcBBx2x1oiMXJX666vvDvB9vWbIonav3EjNW6AQ+eY6Wz?=
 =?iso-8859-1?Q?f1HPmRFxiz+CTq7ahdr9EGEX3twEgUcVBsTzBAejDnbHOVAPft8B4w2QFh?=
 =?iso-8859-1?Q?Q/PumltF8stOkKK455nhXSAHKyJhCQD0rot4OfZ4kP/UQRRZXBEdsc1NnU?=
 =?iso-8859-1?Q?uujmESI2rVGj9r/TXC3HazyBRdxPGTXM/TStZFDJlfa8K1PaaCvE+TzL18?=
 =?iso-8859-1?Q?Yisp6uuSye7HsSvyCAjWtBgTkJSq0WWiD8Pa6jOvV70xrrJqhwtv4F2AoB?=
 =?iso-8859-1?Q?YlbeLdc0LVI5yUjBYIEyWcc5qsAmSxiA/zjoQmmgC2/a3ncEhQlmLRJAXe?=
 =?iso-8859-1?Q?0u+NeS4G3ItEtMuunKZqIkYB3Czbd+TV+tQk25Ggs8gmrqtDBHVrUIPkMZ?=
 =?iso-8859-1?Q?SzkE55aLBUBeAN3SIgrAsjKZT3gRKqcZiqrg6wnpJ4DHm4eWyZlJNwIOjL?=
 =?iso-8859-1?Q?2EWUqwB/a22GEmiBed85mYubH2CUKCK+ZA2WX5dWrDFRwLZhhTrkgII+40?=
 =?iso-8859-1?Q?LXf5CcN9GKC6F1bXhz0M6Mx+Jh6KVnpCylathnShj4xXb7V+DENiM2kSGk?=
 =?iso-8859-1?Q?sWSHoa0vFXE0vErOq+8sBkWSuOJ5Wa+6FqoXOOqYwcIzCHD9lyDjo9zwQs?=
 =?iso-8859-1?Q?Fo90nrDFCGr5qf+WBwdRqrRPhZ8Qxew4gbtdJCDaI5se62TInVVo9EV3My?=
 =?iso-8859-1?Q?YuilozaFzGJdVwBMIQqyS+S34x0p09w/7cPFrr9pTmpr8RASxs5l27TJHv?=
 =?iso-8859-1?Q?uNOkNQODEmeky3wXamFcWwfHHSHfbjmq+3w7SnClhsW239fUZyG/I8yPk6?=
 =?iso-8859-1?Q?nFwVplOAoqO+fgknrWV2s6jmz/LeyJUFKN0Xg4WT7N5D9X6SaW1wIGP4Hu?=
 =?iso-8859-1?Q?h1+3r3fdxEH1OooczTmv3ICPN4HFdk5OqoJqLKeZk9+zBnc4vIivppcooX?=
 =?iso-8859-1?Q?GnkQ8GCLkdZa5blc8eXq6Qk+60mUgqyuFnmqFNKqdIhizMO/QGurlBBNpj?=
 =?iso-8859-1?Q?kJHClPEnLQR2T1EGiB6jEI57WvfWC6fvnGjXqBhGWuyXjJ+QRNjA41a4ZB?=
 =?iso-8859-1?Q?mrdUWlWH+EUwW8tDN9OwyXHkYtqCZX/U/PJBONjPiDAoPrYfm7bnpePEoS?=
 =?iso-8859-1?Q?Wd+ANsKEr4Oi0JcIp607Wxcf8EMv2w1iEgkVMEwoDDqs9oeHqj4ohKVV1h?=
 =?iso-8859-1?Q?PYaDIUu+Zs5HZIcGCCv/rA1E1seuw7KaXaufzCcOb9khDtnNO1zO5TDBgx?=
 =?iso-8859-1?Q?MdJO7Ibeu/bGGHd/y1FLuMmMWqgAd7QV/uM/h+qynAYeM+TivTDhabJpzO?=
 =?iso-8859-1?Q?CkeTpNKHwTBTcc+j5Y8n/HZ9uuS9eq7qMNVKQrzIxE4ruakfjkRaE8Zdf+?=
 =?iso-8859-1?Q?30FlJjc6PWl+F3/YNmA2PIPpMspeFxYX4lNZlzyCKf6GEPVkMTmPnKrlOj?=
 =?iso-8859-1?Q?OTXzcUsVaWiG0U+0xCsDRc8gq+/cIzNXzclp7EAqwvraN+01FIGPtmImFG?=
 =?iso-8859-1?Q?3zP7ZZZIk7iVIip+j1Ku5IH6DdSGY41mWSAmvfKrr11VQDzPXddpKt4GU5?=
 =?iso-8859-1?Q?s64cmq2ChiBCz0rANCAF8dT7DVuN0KLNlVktqjnQqv6A/ZIgMbFWEsrMjv?=
 =?iso-8859-1?Q?V00qe2hgPMKbAbVLcR/tcOLswWdUCRWpHcO8/722Yx2qJsdz1qxnpKpOcX?=
 =?iso-8859-1?Q?nH8WFw4YttT+ZaZsX7k9A3LlaRDekUrCvX7tkOq31SxYLNbQe3TcAh0wVB?=
 =?iso-8859-1?Q?VAVguih//iyAeLNv1Yi/1yK04bSM7sfZLsxKEmWYPQs9e/BJD9VLR80uHy?=
 =?iso-8859-1?Q?RDtUxW1VDQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR21MB3867.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bf1b2a-8738-4e3b-b772-08de7d51537c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2026 20:28:57.9153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIyAN3Em7aEWw6StvNTfXuvcMEnxZeZ9tCXRmNUs3p1b1k+LPb8MOXoLbfVajyjWSUXwnFXhkWFvlqlTqfpZuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR21MB4975
X-Rspamd-Queue-Id: 0DB8B2321FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microsoft.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microsoft.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11681-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[microsoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haiyangz@microsoft.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action



> -----Original Message-----
> From: Leo Yan <leo.yan@arm.com>
> Sent: Sunday, March 8, 2026 12:46 PM
> To: Arnaldo Carvalho de Melo <acme@kernel.org>; Ian Rogers
> <irogers@google.com>; Namhyung Kim <namhyung@kernel.org>; James Clark
> <james.clark@linaro.org>; Kees Cook <kees@kernel.org>; Quentin Monnet
> <qmo@kernel.org>; Nathan Chancellor <nathan@kernel.org>; Nicolas Schier
> <nsc@kernel.org>; Nick Desaulniers <nick.desaulniers+lkml@gmail.com>; Bil=
l
> Wendling <morbo@google.com>; Justin Stitt <justinstitt@google.com>; Alexe=
i
> Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>;
> Andrii Nakryiko <andrii@kernel.org>; Martin KaFai Lau
> <martin.lau@linux.dev>; Eduard Zingerman <eddyz87@gmail.com>; Song Liu
> <song@kernel.org>; Yonghong Song <yonghong.song@linux.dev>; John Fastaben=
d
> <john.fastabend@gmail.com>; KP Singh <kpsingh@kernel.org>; Stanislav
> Fomichev <sdf@fomichev.me>; Hao Luo <haoluo@google.com>; Jiri Olsa
> <jolsa@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; Daniel Lezcano
> <daniel.lezcano@kernel.org>; Zhang Rui <rui.zhang@intel.com>; Lukasz Luba
> <lukasz.luba@arm.com>; Peter Zijlstra <peterz@infradead.org>; Ingo Molnar
> <mingo@redhat.com>; Mark Rutland <mark.rutland@arm.com>; Alexander
> Shishkin <alexander.shishkin@linux.intel.com>; Adrian Hunter
> <adrian.hunter@intel.com>; Masami Hiramatsu <mhiramat@kernel.org>; Willia=
m
> Breathitt Gray <wbg@kernel.org>; Barry Song <baohua@kernel.org>; Qinxin
> Xia <xiaqinxin@huawei.com>; Bartosz Golaszewski <brgl@kernel.org>; Kent
> Gibson <warthog618@gmail.com>; KY Srinivasan <kys@microsoft.com>; Haiyang
> Zhang <haiyangz@microsoft.com>; Wei Liu <wei.liu@kernel.org>; Dexuan Cui
> <DECUI@microsoft.com>; Long Li <longli@microsoft.com>; Jonathan Cameron
> <jic23@kernel.org>; David Lechner <dlechner@baylibre.com>; Nuno S=E1
> <nuno.sa@analog.com>; Andy Shevchenko <andy@kernel.org>; Andrew Morton
> <akpm@linux-foundation.org>; Willy Tarreau <w@1wt.eu>; Thomas Wei=DFschuh
> <linux@weissschuh.net>; Josh Poimboeuf <jpoimboe@kernel.org>; Robert Moor=
e
> <robert.moore@intel.com>; Len Brown <lenb@kernel.org>; Srinivas Pandruvad=
a
> <srinivas.pandruvada@linux.intel.com>; Tejun Heo <tj@kernel.org>; David
> Vernet <void@manifault.com>; Andrea Righi <arighi@nvidia.com>; Changwoo
> Min <changwoo@igalia.com>; Mark Brown <broonie@kernel.org>; Steven Rosted=
t
> <rostedt@goodmis.org>; Gabriele Monaco <gmonaco@redhat.com>; Shuah Khan
> <shuah@kernel.org>; Jiri Kosina <jikos@kernel.org>; Benjamin Tissoires
> <bentiss@kernel.org>
> Cc: linux-kbuild@vger.kernel.org; linux-kernel@vger.kernel.org;
> llvm@lists.linux.dev; bpf@vger.kernel.org; linux-perf-
> users@vger.kernel.org; Leo Yan <leo.yan@arm.com>
> Subject: [EXTERNAL] [PATCH v3 15/30] tools: hv: Append extra cflags
>=20
> [Some people who received this message don't often get email from
> leo.yan@arm.com. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>=20
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/hv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/hv/Makefile b/tools/hv/Makefile
> index
> 34ffcec264ab0fdf7075d25456ef012cb866796b..e39c16325b451ee7c2ddc581cc4d168=
9
> 15472ed6 100644
> --- a/tools/hv/Makefile
> +++ b/tools/hv/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>=20
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>  override CFLAGS +=3D -Wno-address-of-packed-member

Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>




