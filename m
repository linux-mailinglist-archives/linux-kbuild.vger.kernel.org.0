Return-Path: <linux-kbuild+bounces-9961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14AC9EEEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 13:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC5B3A64DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 12:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ACC2BE059;
	Wed,  3 Dec 2025 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="XiEEshix"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010005.outbound.protection.outlook.com [52.103.13.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F114204E;
	Wed,  3 Dec 2025 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763670; cv=fail; b=uSGW2UyMCuyhHBGkjusJAX3/5NhcOZs3Ku77X4GIUJc1HKa3tPb4uUag/KGTWXR032f8qcNwp2afayIThJLT0USJonqz8nY1JWuqEkppct36QrY7jQedByBjglBzWV+upH9VsjRKiX4ljww2ePHXOfsSqD/KC0RmEkBJhE5HI38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763670; c=relaxed/simple;
	bh=4QOH/SB8t5I+Du8hiumpAI7J/gIzUrNvHfhZAGnVkoo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UixdlXGRdAFpImBsm0xnEav0Yzwf4f09KfgZE/zH28ZbBu78mtya9MACJO1BLSh0uPTCiMEpPBpfR1cfe6K77n2Uk+6uaHRujlHcY99CEAWzmT6jf1mJvrZRdGMHTm28cbJdyUDb9rheIzsdl2636nFVnbbOkZQHfBxtderx+mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=XiEEshix; arc=fail smtp.client-ip=52.103.13.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV89ylYrorTRsBNnnhjV/pBioQkfZplMU9omRB0pUaM0Gem+MemY4bVQs0Vk99+idt6Eg6eN7L3Z4kv5x/27Q89RwrEOPd9UBv9CDoklIAYhqglACAefoRmHaYD7ecuAemCHzbpFQ1Y3NXdEOKnQgJUJnssQFF+npOUTS+RfZpv7U1ucxegb2K0lZJ5EZMCqR0YFki7ZUWqY6jMdoMBQxilan2u/e1BR2CU/TKjrCQUJZYKQRkz+97pJAMoLPsxI8WBWSOb6kczXkOcHolZYL7EbPUCatABWRxCguVyLuBuNXH8grCenC5Td8aBi8T9FiMeB+5ZgwKW8oeegmzefEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QOH/SB8t5I+Du8hiumpAI7J/gIzUrNvHfhZAGnVkoo=;
 b=HCSPIHqgHSusqbo3DzwJPrs3wWky7L0ZtM9tNi7aQ0ZlEVA05WCTsSEJZybW5rdY8U69vQ9xDsLFBeTktl44FNUkE62Xb+ZUrr3/RJgVt0njBBCfp2ww/jtzCgJLUxnJx7XWWzTTEvGYGyabBPxFNHr6w5wpOpwZbCnQg74On0U8Ura17eM+61+1nbI/lQRzQ4jB+IHwlSdktfCM0OAK6mS8VfqW1DgLLIR+sv+Aw1h+io/EAd0ImA4LD1pwvqvR4lxDeZE9RMylLDgzL7UTyQvQqiXqbS5a8TBO77GQd8i1eyF6LjK8uSl7wimSpskqgejQ+lCm7CFgeqW/uRWLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QOH/SB8t5I+Du8hiumpAI7J/gIzUrNvHfhZAGnVkoo=;
 b=XiEEshixp1afc64A4y5xI9FwYorh278tLy8ARITNjzeiqi4v4H9+KpnxPncdqA7DoEg3EI/usIA+5TJ/lcvzgC4i9L58w2fOpEfsekMAeAJZK7eUirlg+64jCGeg+KAUipjeabW75wUjlW6oolUw1zN6YkJS7jjEM3K8XJcQdno2V8jbg2/axdJZepA2nfqxceE/BX7s2E3xneTW7criKclBcAMbGJW67GFoMGvG6XtAek9XYDLrV9FyJckpqyUr/J5VE9hVc9U7q+2ERnQJ9lIXQaytp4kVGEdV4pUdpoZiFWutrE+aff9Df2SfyHhoGVXJNnrWcz1Kasb0rqdjMg==
Received: from SA2PR10MB4460.namprd10.prod.outlook.com (2603:10b6:806:118::23)
 by BL3PR10MB6259.namprd10.prod.outlook.com (2603:10b6:208:38e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:07:46 +0000
Received: from SA2PR10MB4460.namprd10.prod.outlook.com
 ([fe80::59c5:5e37:ba2b:6bd4]) by SA2PR10MB4460.namprd10.prod.outlook.com
 ([fe80::59c5:5e37:ba2b:6bd4%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 12:07:46 +0000
From: Les Boys <lesboyspp43@outlook.com>
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [QUESTION] Why tristate look like bool?
Thread-Topic: [QUESTION] Why tristate look like bool?
Thread-Index: AQHcZEz/kEjcVbgqukincnrTN/jwyg==
Date: Wed, 3 Dec 2025 12:07:44 +0000
Message-ID:
 <SA2PR10MB4460C7DC4762FBD3065F0794A6D9A@SA2PR10MB4460.namprd10.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR10MB4460:EE_|BL3PR10MB6259:EE_
x-ms-office365-filtering-correlation-id: cfa93535-7b9b-488c-f140-08de3264914d
x-microsoft-antispam:
 BCL:0;ARA:14566002|7042599007|31061999003|461199028|8060799015|8062599012|19110799012|15080799012|15030799006|3412199025|440099028|53005399003|40105399003|26104999006|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q6jHzjECxSa8rvNOZsEj/GPcHF1qU8i29kgRzoWlMQWwukuOkaeCCy/SFu?=
 =?iso-8859-1?Q?3tmPTbzdaIeLSBN2SKkvGgDq6A9m33KjPQlQbcbDZx79MkbKENV8RJsbrG?=
 =?iso-8859-1?Q?pTAht38ywXlFrU/7tnnrG/lyYb4+KMO7I4QoRcCU/snzSglQTmFAlh3FAW?=
 =?iso-8859-1?Q?Foy6ArTvt+hsCE1wQzE91qeBx3GSat8hE4Sb0vgd+04WprbiCz1Ecn2m4f?=
 =?iso-8859-1?Q?BM66NK0IRr9U1LT+FqByMA0IF5yyUeEJ5DWfPtY6H159ILVW6lZiPICwqu?=
 =?iso-8859-1?Q?lMMyVj0mLvOED55SVaWP2bYPS1q6KkSKTUHAwR2o9d6QhSdK30F8CYNHwe?=
 =?iso-8859-1?Q?TfYvbBPW8K7PUvoZEcxHNEWwFs4/bfbCBXoAns012w0piyfVDylf5WWEgy?=
 =?iso-8859-1?Q?FYtVYSB6zr9vnqeAxVOYFNuPmJsyK84TsXecK9JV2Am7Ea0RwB6dvgmMLJ?=
 =?iso-8859-1?Q?ckdzQOYoJfTHyS0hip90bvqJVQKF5ozIgGnME5ZKOdmoEwKMEooVU+KrOJ?=
 =?iso-8859-1?Q?C26jlLRQKoLMz0CDr7n1pn6Fwk8QQP4mfYCG079HpOaVbRDrJjlpoAMylo?=
 =?iso-8859-1?Q?gxztxsr4okDbrbVMltNYWzTnuxatCCMY3dxQ5GxqvA9utC4Wem/xZVh8Vg?=
 =?iso-8859-1?Q?4TM2+ZG6YthoNlijtO/rIjn6R2DMfCClawT19Zem95rDLASw6x4ls/o4QM?=
 =?iso-8859-1?Q?vfue51sZZSnAVadpfIHYmLtOEeSXsXYQKHKBATBkFQDK80uMN1sKc1n0uu?=
 =?iso-8859-1?Q?YdQZN28+u2xfytPQDGZEuwlWg30qJZckEDhI0ca1RnRBPbT/cKQvjoG2hD?=
 =?iso-8859-1?Q?wjvtBg2kphTC4aYVsEKWBD/K5Va7YaTHT6tTBrXNZ2Pm+KwTXNbvLp+yas?=
 =?iso-8859-1?Q?SoLMKdDf54MZJpkHh49cVkbfOiUymnqkAx9HcAQTAh/Cn0FJTR/28fm0lS?=
 =?iso-8859-1?Q?7o1BLGnufgpegMpq6E+EVHzFn5+Va/mP0S1upt+wAsIs96iyh0u8TvjYBC?=
 =?iso-8859-1?Q?cIx7y6mcW+NQZRHaR8lVYoaLGcH0Uoi6WYyXHuP5bT/q7v03JiwK1foTOl?=
 =?iso-8859-1?Q?vTAbH+dUBvl6SOEg7PffoGz6AB7G4kj1xoEDbmZ7ePuEjN02L9WrVzWfWA?=
 =?iso-8859-1?Q?Mf6Ba0Js5FlgxgTsXKSH52axpS5BYAlBobAkLhVXrFUm84QLbErnNZtRqM?=
 =?iso-8859-1?Q?O3fc5vUceHtYAAZu9el3SyYD9fasE95g1nllQAImCMgiYfgON8XG0lsF1j?=
 =?iso-8859-1?Q?zA8LzF0VeKI8rVa67m7IoEvJtrfYePV2FteK17nfjc9whTbsr8i0yeJd8N?=
 =?iso-8859-1?Q?AL8e?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sdkTvLTqXgPD0qVEZz1ItIoWFYx5cxE7WntcAjpwdJoKrvltwJUmCfbRLw?=
 =?iso-8859-1?Q?6o0vzBiYTL+xC/XeWSh7+cYBlp77bTNORUJW6E/Ys+ScLXWwfo/v16FqgN?=
 =?iso-8859-1?Q?xzZDDxybAZ08yaWJCLy1rLYKgSAm3oxWzIGg0S+rP0qrd5iRrysHqRysLC?=
 =?iso-8859-1?Q?ED75Q37DgUNsrWI9OeRHfIgsqrZuNYUAO/cLXVhOccCSzArI4bSWH/zLBD?=
 =?iso-8859-1?Q?sUjWKcHMyTWcMx7+Bvw/YqRhApOGu6CMGCIAsuXBdWK0Xbygmgd++I79qS?=
 =?iso-8859-1?Q?EZxyWBw89dD0yAKgZIWiOTNsQ9QisZE1O01DVjHcPPl26Ocadl1EGedP3/?=
 =?iso-8859-1?Q?DVjUoDIwxBwYgjoUazXN0htL2hrd7u9fs7C60FPI7r5i7q41hjp3X7UM9b?=
 =?iso-8859-1?Q?LRS6eeYwdqcEtens/dnqRj0omHgqSL7iEFrsglgTvkmpbDVlODatpobL9F?=
 =?iso-8859-1?Q?krDHwWnPUK5uS1U0OrkbwRa6REV7bw9IESf0Z1xbQti8WrEXpfLy77Vew/?=
 =?iso-8859-1?Q?E5uWgHEl9YP34QlbwJW+5nbcPKs/AKCIzwDdH237X49tKAXFzzIkfWy5F+?=
 =?iso-8859-1?Q?yk9kyaz6kcuVH/Dkn/ob42punp+WlpLKNdH0LOCTdvI0GwWIfSoe6jMaLg?=
 =?iso-8859-1?Q?lQJCVCimmqQRoNRIJQ6uz+3zWhYJrzzvL4xCJaeXhQR9Ew769oGlqT3uhG?=
 =?iso-8859-1?Q?MRqf0ByfzrP8ZeytHxSmMDvYpNNQn9VhO0fKaTUbGY0KVTVSGVTjANpgLl?=
 =?iso-8859-1?Q?65xpz00i56MGNTVcScWnwyNddZrpFnYEesigWMl+WdH3g44ux6MwDuF0My?=
 =?iso-8859-1?Q?cEXAZTEUE9OLoEBuQoHWk0pJ6R6PNTNV8ONohguCeqaWQw6q/xSManMgx+?=
 =?iso-8859-1?Q?337dX2ptPB1+oajXj6l7Y13WFCbp1YEb1FmqBSWkRyGoOCgxO3UxHlHKML?=
 =?iso-8859-1?Q?Z/zDqEXJvvfCYTKeprsPpHHeSgYz969WJ5mYFyNFOpsQnNNtnlDaM3sd8g?=
 =?iso-8859-1?Q?6HkAEMbWzl5HEs01bdZ3AnS3VBvEQyiPNEzISdUTL2TTtjkCmGYb4sPOFE?=
 =?iso-8859-1?Q?W2p/k3j4Ql38a6gD3Gyn9V53RnE6JtYjEG5BTSEJ8Iq53kOfFV0lBpyF66?=
 =?iso-8859-1?Q?YaaliccZgPAcjNkVbwRX5QCkD2lmegaxXrJtFHvM+d2jurA4QteyAFxw73?=
 =?iso-8859-1?Q?3SZHdM1TnoOVPDN4hI1CxXBn9n6WzUtxKZYA+ofHW8xwgJmV4c0ocuaUK2?=
 =?iso-8859-1?Q?SFVeOciY6DOjOLA0Sktlri4IF2PauiKTDwp30Vc5A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4460.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa93535-7b9b-488c-f140-08de3264914d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 12:07:44.8892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6259

First, I wrote a minimal Kconfig:=0A=
```=0A=
config TRISTATE_TEST=0A=
=A0 =A0 tristate "Test"=0A=
```=0A=
Then, I ran:=0A=
```=0A=
./conf --oldaskconfig test.lbConfig=0A=
```=0A=
Finally, it showed:=0A=
```=0A=
Test (TRISTATE_TEST) [N/y] (NEW):=A0=0A=
```=0A=
This is not excepted, it should shows:=0A=
```=0A=
Test (TRISTATE_TEST) [N/y/m] (NEW):=A0=0A=
```=0A=
I am confused about this problem, no document talks about it, please explai=
n to me, thanks.=0A=
=0A=
-- Les Boys=

