Return-Path: <linux-kbuild+bounces-10916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HGwRNtWueWnayQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10916-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:38:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1119D75E
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8001F3006685
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 06:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C542EC0AA;
	Wed, 28 Jan 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hkGM38GG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010074.outbound.protection.outlook.com [52.103.72.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF568221F1C;
	Wed, 28 Jan 2026 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582289; cv=fail; b=p/qxxj+G5aGFVTbpzB2hRVbDCQpVUEAucjaMmeECWVRgyz578oHHGXLwYLzsCaAq3+XUBE3KGaW8uL9Jh706o4/tnl6r1JgojbLtXadmszcfkKYvTYM2zz42x8Kv1MF2hwYB6r/FQLtYFVfsX2WmcJDX0RET8/SiuUJroaADdWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582289; c=relaxed/simple;
	bh=zT+G3us00YEBF6ZrDsCleIirMEHQO2s1DO6ejPDHEsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lco+byE9VX+cGhwIm0ldxhAzAtZjwqkpy6rTcXDwTjdJq6rqkFpnkowrSdWyssZczFocAWAAJ1OB2vKcOyxQWOxDZ+8Z3g7eyG7KKPiEa/wSoDZVuLQvgupWofyLe/HxgHgJ2n3eJargSW+j8T5v0iAQ502eRweruZ4s1+ZGoxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hkGM38GG; arc=fail smtp.client-ip=52.103.72.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZP80KG7XO/cYyFLiAxMtbYVyWRklw/eqYqGCAWkYrHaKD43ODIUuZQdelfaTNpHs7VvyBfZhgrfeOKwChHwxhajPjmDUPH8tM22kZEqRIL3icbgW5Gqh1zur9Kd0SMP6h5X0YWHc5Ko+EiuKi2A5xYls6R46TUxmNmXqorLCqu0cH4l+HGUpd0uB1RtWZKJvWgyqalGj8B7cf9iGkuQXsqjLUJ0TCwEHBItouPRAbuEnjCc9WkW9cw9iJekNK4ys7+bE9r+lOizEUbriUn6/0p9+BN8zxJruzFwDhlGuFS74EUk+vTYk/10xCLAfZp3o8YVh2xig/IoK513jEMteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPFEyAvxPV5Hwpwn0tFftBNGW1ev7QZ542gHUluHgEk=;
 b=YC/OjXF98TFmUGaQXU7xBn55c59hfoKNArPwsLw6q5m+1Z2pOkhTpy5/gYWHT1r4Di4EyjihYrFs0jHdcLvq2+nHiVjKvnJLR4r5RVKKxVKBXZUYm/iPjVn6UgWDUUFyethZV5YK5vg0moCgDE8ZptrWSxDVt7mggIks5I2Vm7EK3EZuGX7jZprgv3JaFWryqoeL/pHwEIxTG0WuHrUGq0/gRhGidwoqx8CrJ9ouUgg2Uru6/oS5NG6J+bhKArejdv+6ngjaqB1SNR4Spi0xc8gTzL5xXhRG/qtkwM+SZ14jF4AfhSbRmzltYhX/RCsBN7bpmQgFeLe8V2/bCLlgIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPFEyAvxPV5Hwpwn0tFftBNGW1ev7QZ542gHUluHgEk=;
 b=hkGM38GG+IyBW+dgvK84qEgYhYVLG8ytzjvFgGuWpXTBL0c3gRj51sr+l7AkVgwiCrNoOUobC+un2/bja0LL/mMV4g72xAaRQvA/whBtZL9jePEXifrn+PCnsTaeHcvWfH9S7eftZhw/6HUqwL5R0YfiMNrUQAlLEzLr76bpVbRmSAq7Lm98kzbBzSD2yiLP5npuKI2GI+XZUV56OQtlnBycdqq9/D86FjPr7VpJ4vuF8KpglgPUzZKAi8NpFy39Udd+3f2XCQMlpSgZx3MOwL2NlNzx7i4SCUrm1orXrFRvmhTNiuYaaxkeSckV74r9vjmxUuGtRx2esg42AKZ6Kg==
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:285::21)
 by ME0P300MB1440.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:245::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 06:38:03 +0000
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618]) by SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 06:38:03 +0000
From: Ethan Zuo <yuxuan.zuo@outlook.com>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Zuo <yuxuan.zuo@outlook.com>
Subject: [PATCH v2] kbuild: Fix permissions of modules.builtin.modinfo
Date: Wed, 28 Jan 2026 14:37:51 +0800
Message-ID:
 <SY0P300MB0609F6916B24ADF65502940B9C91A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127205915.GA3856796@ax162>
References: <20260127205915.GA3856796@ax162>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:285::21)
X-Microsoft-Original-Message-ID:
 <20260128063751.6564-1-yuxuan.zuo@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB0609:EE_|ME0P300MB1440:EE_
X-MS-Office365-Filtering-Correlation-Id: b93770c9-bd24-4281-88ea-08de5e37c98b
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayGKAlIIivN7fIKgPET+ZtPogXP/vKzABuZ4bgeJgaCGfJ4rfihTeCNvgVI4sodGd2uZdLUaS/A2TLtPxWVlfyDOExB1Nhlmbce6yBxyXC0n95vriUrcNkZQsSZirP2NpoO+WRf2q4lp6iqbSeeApx+B9yVCbznxoATw8HOr6X7USYg+I5OHcahY5LCy/pfDiwvZgglpXs2vaGIi+ZwOWpvIeIgk5gQTXyO66ciZb6NZ0arsHQeQQ4vFJXm9XgL9aji+tC3a3lEhda/xAlH5fnOOgvklgvZI12AMs1ZIEIW3wJ3GdVbVC+6h40j2K0G+CWJ4eDaHJe85JxvYIs/CimJITxmsegnBbq8qsd/azTYIvplJwE/B6wpA/+xf1XKE6ArYojEBDhzw813lKyZue0IGFsXlzdOAiDwpxejNLf/hxwvdtsOyLm5LDMjtvom7jPwmLj8ZqsVXbS9ytuUmqtLtZ5PA0UzCFvssB3LLvMwev8Zw5QxAHzzZ9HAp4zixi9K0XVW5cpALQJazcNyEcY5cU8jwUjzLEMs0TEk3AFj8g5QSWugbZqhH0aOo1bOVCJ/I06LBEeEUnLUTzhx6XAPo3tBkhx6RY/1jJ+EKbsZXDCbJLBEsBfA5v+mr7/xY4ZY+CRl3VXRXeB8Z2Vq8AZUstVVjigPB4951xzY3Wwm2y6XRso/x2no9n55ef6toNVCSAhF6pi0Pwyr2mdkQNKYaK+434BF92IA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|5072599009|19110799012|8060799015|461199028|15080799012|23021999003|440099028|40105399003|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e3xjP+BKlJD6c5RAk075ie4MUzpO1nIh3Rn1lEd9WiOBqXmQ2kGt8xBXUD72?=
 =?us-ascii?Q?x/7ota+XIVTPjTnua38XIUZwvDjzhh0wKyisSEm9krnw8RQlNI6kKzK7LWE+?=
 =?us-ascii?Q?CCCUMpBjgBC+qN7vLibZBooJW/OXzCaoVAy2Gq5uj/V0amMkoW5R+aLY8xL3?=
 =?us-ascii?Q?xsIds5gBtB4Mt+GxgF+9vXchNLIn8xVwwV2OFN6yoOGMgfJQQ8+ZXy2n+ZA7?=
 =?us-ascii?Q?EyW74hjr5hd8dxsogoTANY5tTe1P4TrYeVm4Pc0qiUdj6Z6PCSuOC+0vaMaL?=
 =?us-ascii?Q?tWxFnSmGnRL4WFSFPSAApcpc4IKIXnBSnL2hLlXeWyC+9+T4AmD9fiNu/mWt?=
 =?us-ascii?Q?7qmfhyire1JEzStkWlPPWGcOgrWjYzelks2JCGTFjKTgol7hRtZwLi+fccZz?=
 =?us-ascii?Q?F90IM4qpFKSMTVisWAXanNxpxp2gGyob8P6/m3regOVNjKUj0b3Z13lERHi5?=
 =?us-ascii?Q?ZL2b9QZnWfWGXyMgNYRErPx8BYU1t4TgfifXQPwoKLFgifIagAZVDOQzGFpP?=
 =?us-ascii?Q?cdYLjwed/oEV4+zMzbFHmo518lqb2cFS7ef6Ut2MCt2No84eTHwTfyY6v2kN?=
 =?us-ascii?Q?Eqz/e2ibY2yvVg7kDSJTlUo7fG6iM37gkwKNzZGeWghyiQ/bWokCKWp1A/61?=
 =?us-ascii?Q?Me8Auha3+ItDyCCp7ykTxd0KtVMFTfq56mJuuNjJO0k2cG03PK0z1rNzvA4L?=
 =?us-ascii?Q?zisy/MnSYHVKwd32vMo02cFEkC3yxfaKNkU3QOp9l8fKldL1jafkr+1Z9u5d?=
 =?us-ascii?Q?xUDQlscveAiU/JA7cLZD48kEGp5UFAiqYgUoK4NI2Ny/KZKcgBzyHhvBEcQB?=
 =?us-ascii?Q?liiVyTdS8mF8kx3/AoeA8JfM7FPrel+WEdGbXOMK/9wu6c3yktvLJt5vvDpv?=
 =?us-ascii?Q?JY55KnsZZYNGKTpSfSJdqHQN3Cdh0xu81HowCJQwSxXTN25GXhF8sJ37XpjX?=
 =?us-ascii?Q?KlY80cVZ/ahv6bCV6s8gHsAnkgvY6mHl4/DA3Rbh1D9aL+z4O0VdE0gP2CXu?=
 =?us-ascii?Q?FThiG0MoylwMMabSYOteESoSY0tyT8EENLvzzs+1/y3ZFSVUCMLfv/FaYr0i?=
 =?us-ascii?Q?c93h8ra3RFQBZ2tBWLoDTx3IoGiYaxrUtzd+WSXtwrh1FPYW9+L/FcegGLTN?=
 =?us-ascii?Q?22j+5zBE+Q4/BA3GmJG4H2RDpwl/R0tYq6g93ewSj6py2UNIz/3vCaiWGuKN?=
 =?us-ascii?Q?HSd0NkhuSyCWRKjKy0qM15TUtIWbIpVq2xILRA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OO4gtGuNozNlcI9Xzs4rZZXDV7N251TbhQJtu1su95u8V0JnNGqa1cf9wW7u?=
 =?us-ascii?Q?/q2xhH5HDxHJ7tdGqsoe2h9wDvn2CivKrA3fzVgCzJUK9dq69pYn5iNbP04O?=
 =?us-ascii?Q?Jv68j00DAWNbQ6IWQiCYoVcwnw4n5/enCZZP9oq1hHPmZopPGqPgytCiGuWU?=
 =?us-ascii?Q?gZp3csvMQO/CdbIyYPI4ap1Vqn4Cxsq04OSu2UG1iXtyeOF3L7+2LYUcVh4o?=
 =?us-ascii?Q?BnAW4DjSmen6eXjH3ccsWZIQIBxXvCHGAL180CWdpeAjJ2wOzsc1AX+EL7pO?=
 =?us-ascii?Q?tiNhAWM1jZS0YadpUQIvRQEH6h25jwc2NgEjDZ8cAMsE0ZNCrQvW0ytKQFX1?=
 =?us-ascii?Q?lEAxQtuOmvC2rGHl141b4k8U/e+98qdFrujSe072B4AtuPHESMTMMzE9JyU0?=
 =?us-ascii?Q?OW2RqxgS2la+YYdSGX3F12U1NxKXqIXPzkP/hGaof5iU06fYPE2NabTe+01B?=
 =?us-ascii?Q?ygZaHRVnYDF/IAv7EkyBjLE4UI5gLsoao4yf35V+vqSDgQUm97IX8eHg1TlK?=
 =?us-ascii?Q?mRYZ4FT3cE/nfeuPmvVx7Oqq8g1yVC+QmCRtWJtYOk+Y6zfTkq4N8RkWPLyz?=
 =?us-ascii?Q?Dou8HmVMZxaSIDtcztE/mxY8mmQKKZHtVjFmYHhAdrGxjjqbAadoPixx/bN3?=
 =?us-ascii?Q?GyKflBv6DpQ8x1zay7yCbDVolBLyj2dmqAjYYzTOLsVbF7RPOA2Y+WBSNigl?=
 =?us-ascii?Q?5mmidyEsbiVShdUrOSlGZZXxLwMraUziW1/GIIgfx/5gm+4Ra/iDPi8eH+5W?=
 =?us-ascii?Q?6ALOjEGR3405V2Z7vV3bu6V6D8hcOzZ9/oTd1lAnqJkq/06On+uoWNRiDxK5?=
 =?us-ascii?Q?R7N2p7jOrnE6dpUpAeN2e6H75+9gGJj7vaTk/qFqKTifQ++M0i/6t2piXgRg?=
 =?us-ascii?Q?gWCE8KGqHq6BfN5x68Qo6BBMzovF1XBsm9+kNgyFymiNM/Ro8CNIQkhUhnL0?=
 =?us-ascii?Q?BseLJz519Hu5FYNZT5lrbCvkkOksMEHtIRgEIKx/NKEQMYmMRfchruReh25M?=
 =?us-ascii?Q?m+iGvGOEQkuSNnCxjKKdtl7NIKhC6VYkjfVmdFPw1IdS8BDPLvwhACp/+6HI?=
 =?us-ascii?Q?jfR4bvMVh4SKnIe7mi9clXGxNBWbf4vJGKf4hVeR7JjYH32Fa8oNgoI7NMdG?=
 =?us-ascii?Q?bGTmEPSuTDL/YZ/tssCUb3b++CcW9Uv+EONl9hq/C7Q0a8z1CCgABL97LdQE?=
 =?us-ascii?Q?+kCCebstYIkRfBzvZdR0Y/gZ3M4EVs4gA9MKDOiFtjMhciSP35TOUtVY23KG?=
 =?us-ascii?Q?OORm7zpHQ5sn82kZ3YTY3+dCsN52AeEho462ZjP7/npzzdZlXf2t8gQr5SVo?=
 =?us-ascii?Q?JQcdukuXnqwN4cX8tSCovQ7A9tcPmqal9UND0+7amZcdPegvrRCl46cuXrT1?=
 =?us-ascii?Q?xD1qszqtYxCu6lD9S2TNGsCPbFg3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93770c9-bd24-4281-88ea-08de5e37c98b
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 06:38:03.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB1440
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TAGGED_FROM(0.00)[bounces-10916-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuxuan.zuo@outlook.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D1119D75E
X-Rspamd-Action: no action

Currently, modules.builtin.modinfo is created with executable permissions
(0755). This is because after commit 39cfd5b12160 ("kbuild: extract
modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
is extracted from vmlinux.unstripped using objcopy. When extracting
sections, objcopy inherits attributes from the source ELF file.

Since modules.builtin.modinfo is a data file and not an executable,
it should have regular file permissions (0644). The executable bit
can trigger warnings in Debian's Lintian tool.

Explicitly remove the executable bit after generation.

Fixes: 39cfd5b12160 ("kbuild: extract modules.builtin.modinfo from vmlinux.unstripped")
Signed-off-by: Ethan Zuo <yuxuan.zuo@outlook.com>
---
 scripts/Makefile.vmlinux | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91..276c3134a563 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -113,7 +113,8 @@ vmlinux: vmlinux.unstripped FORCE
 # what kmod expects to parse.
 quiet_cmd_modules_builtin_modinfo = GEN     $@
       cmd_modules_builtin_modinfo = $(cmd_objcopy); \
-                                    sed -i 's/\x00\+$$/\x00/g' $@
+                                    sed -i 's/\x00\+$$/\x00/g' $@; \
+                                    chmod -x $@
 
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
 
-- 
2.51.0


