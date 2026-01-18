Return-Path: <linux-kbuild+bounces-10631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05BD39289
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 093DB300D664
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B77D30C62D;
	Sun, 18 Jan 2026 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KXopV8ja"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB930B51E;
	Sun, 18 Jan 2026 03:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707590; cv=fail; b=fuxZ5PH/jGLuZc9Kni5nrKSo7cPKtTqIN3dRcOGXrpz3UbpoSTmEoij/8WEigBvxzHSHWvb0Z6OeHMDr7g5sVa8CSpQ0tP9HWnJmtTCinMaJyewH/KVdwgS810wjaxbmBTnlFIjgtqwrgAkTrttf+GyfJMBnyJO8tp6sO02mNTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707590; c=relaxed/simple;
	bh=oSI8rxV92A6YE2nxE1kAsoz0DgmIhyzWgTe+5tKoOXs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NqnpTMoT4FKgIRXATSBg0fNN1osxkgAC5YhREWdgqr5pzYYEzPQmJzSrMrFKnLjyUjGquTJWnt8/lQ22JTfZ2ykRLqfhWta28LI4sBqhM+2xEVM4Ni9j69rVj8ggf49rALwHX9ERO9Yes1BmwQ/aMW/f6ZM7Xj9aVquOag8jmV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KXopV8ja; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVkiielOOekzEhpZVl9Gnm7jFjL/uCo978RdT64tiQRNa1HnQf3rTDpUj0BEkAflkoqQoSeiFwsX+9Wny6Ca7XtlOHEBWQSvPLIqrjylxtQCGwxIcerz4MlMVcfZiJip8r9Hvi/ichn/7W2g34Pqzr0pS3KbuDlzdykG82JNdEqNrDeRFmEFldnZslLQT+w4jLZKcJTrxNxrwe4JMpW4B4bSRh7EYTiTvbLA8Ery+Sb+jCo+G5FJdSTrHfGMnzYMdxaFy16i51MjViHz/blSF/ud2gR7xtcn0LWLlLvUJthipxr3VyU9aKCBCSSg4G68D/K7upShML+F82I285heMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYuZbzh88WYCydGA8wZA1/SEin1B6wF2FKN2yxSzuMU=;
 b=S3y6eqexi4sjsZN5oL1wlsofmqwKljCsAK9/uHv5lx7Hnmzf4YwIsv/oPDTdsKQ7p34rdttKmNwWog0FP2n7m3ISV5/Mck4K0H517UBFxwmjzO0ED9a8+v2bwAX0TskAtvmSRbc35oq8Hcj4p9VTdDdsewPvp1D+V8YiseSm4nZZ7D46JaT27dLzu8VwUGnxa+wVPNe4KMWqPsMIV0PR24oAl5BEhmKshhFuu/mjAsXBMWD/+vDIFOuLvCiywpWLvjHc1d/+mRnoiDNoud5w3h5wHyBIP1XHf5cdzBnIrElFkrNqc8B8Se8faUYch3oDYiU06zW2yJ6BnageOoFLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYuZbzh88WYCydGA8wZA1/SEin1B6wF2FKN2yxSzuMU=;
 b=KXopV8jaMRYRKqnlAjD6emQDtO/b6ZIjVSRfTKY0Iqllt+Lik29fqm3nSLZ4EKDz1b1YwungxNLDfEgxImN98dXXjpJVWWJ+GmFb9ATVlJNFWxQt/cuLDV9oFvY3mjzTeL0kn5Vuce1wGdt3UPxR7e3ju5b7usLibx1rTzmUX+RzozHkUJ8OuHPIJTolq6e23IOL+XpYrwixPk/qiOHQanArBtLvB2URYUEbymbrzewMZx2zEUcXBdqWdieaqXMC8rWJSNqPz8mnDNgqtymsPYDT0yTPMcTMJsK1jmvhs8feD9Pb+KOpP5c4/08W3e1uROoct/GuVq3gAyh3p7SeAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:25 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:38 -0500
Subject: [PATCH v2 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
In-Reply-To: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Li Jun <jun.li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=987;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NFxSw/nP/882cYIiBrgLrNoZRI4WXxZPhzC77WN0kLg=;
 b=s2Eza2aHI2IGSgYgK9KB6nldOFgTu8rZbD16fJchL4Om07N4YgOlcVhw/CwqwPj7PVMCRrDWm
 4el56ybfah3ArLHBHXpnvvuGy+cmw0d0kI/xPudSBLgnoYOrMDqaeHN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba6f6d1-f77a-453c-c220-08de5643095d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk5jYkZza0NZdnFRUXcvYlkwZWF2ZDBEc0M0Q3JRc28wUEFCc0U2OFlYZVhB?=
 =?utf-8?B?N0hTMGZwZHNsMjVpNmx3ZXlxckRHck4yWE54MjlORUdCQ3loZnV6emRXMG1S?=
 =?utf-8?B?ZXZXY0o2bVYvUHVTN0pyaWhsVDcybG8yazNJV1BXeTExSUV2N3Z3NS92Z1Zj?=
 =?utf-8?B?QjJkTXdYRmVhNVJJYTlETm5rWTVtOTcvektHb2RkS1JISmFTb2hQUTNTRDIz?=
 =?utf-8?B?Z0JGMmh2TkdiTXQxa0c5MUF5NmMrZ3BUNjFrRU1GQ2FYcTN1V1czMElmOHVL?=
 =?utf-8?B?RWVvcHBqLzlMSmc2RjZCdzNuQmE0b2kzRTR1TzVKbmxMOVpSa1RGR0xnUllD?=
 =?utf-8?B?RG1HdzJaSWRBaEFGZ01Fdisxb0FBUVhySXhVbU1QVWhQZTZKZ0FUcjBkdUd3?=
 =?utf-8?B?d2wyeTJiczlGdEtjd200dEJva2hralIweHNVQVQ3QlhkcWwwSXNrZ2t5NEJ3?=
 =?utf-8?B?VnI1dWhuR01sazE1WmJDb00yZHJGa2FsTnRQUkQ1L3kzNk8zZmV0YTZ2WmUx?=
 =?utf-8?B?Y0VuQWRVRWxIbmhmc0hiZnhOSTR3VVpZZW0xRGx4UUswOHFtKzFiSklUbW1V?=
 =?utf-8?B?QUZ1dFZ4K3ZHNkI4RDBRYW1PcVZUR3lsMmI2WHF3M2JaUElvUms0S1BPS2RD?=
 =?utf-8?B?NHRWTnNGVC9WZEUzQnVOZitWaC8wQjV5ekdzemFLTGhvbC9yNEhGelAwMWd2?=
 =?utf-8?B?NWs5UGp2R1VIWDR0WlduOGhXcmlzeHN5NHhuekQxQXQvMjhTTVJLVTh5SE1L?=
 =?utf-8?B?Z0lSVGRtVVozQjQrR2xhcVViN09zWGxtaEs5ZzQydElyRk02MXV5ZzNFWUE1?=
 =?utf-8?B?d2dJY2JrenhBdjdSTWdZSnhwajMzdCtJVFdaVWlHSmZLR0VSSEtUYis5SCtn?=
 =?utf-8?B?MzAxd0tzaEQ5cWxSa0RmT2JvOUoycTBHc2VQcjVGUUJ4cjZ2eDFxdWxaRnJj?=
 =?utf-8?B?cG5mU0g0WVlDN3FPa3grc1N6N0J1SkE2eEdZcHZyYkpoUUkxaFZvMWtKZVF1?=
 =?utf-8?B?V3FRMSsycENHVVlBUmtLcXdFQi9IZzUzcTlyZzFZNFV0Z1FFSjBRWVN2NUsy?=
 =?utf-8?B?L3p3NDV6L3V2TjBhU1B4SHd3dHNBb0h3MjA1ZFJwYTJiRmpzT1dJRVhnV2pU?=
 =?utf-8?B?VkZNbkZKU0RTcVFTTXJJVXlqZkJta1QvNUxlV0NMK2ZwMXI1UVNNbmh2clI2?=
 =?utf-8?B?RFFvRzJ6Z3JVRFNNMFNiTDhJOTBLYTc1b2RDeWhydDB6MzhWUzFuR1ZLRDJ2?=
 =?utf-8?B?R1ROZnZKWTNhTE5uN3l4YitId01QcGZVNFkybFYxcjNlamNUeHVrclU2Y0lY?=
 =?utf-8?B?YzdzMHlLZlFMTDhFMVRoQjhnK3FLQUptT3dRa0kybVo4clV6TG5PQnJyaHZ5?=
 =?utf-8?B?Y1pKT0NjZTNUNG1KQVc1R1BnNFlENEpmWDNJaytQZ3dvQi9ldzNIMkdLNEw5?=
 =?utf-8?B?R0lGNDFxaElEdkFxYTIvN0R4SUZlaXNaaHBYekdYMnRVNElBcnJsTVBFbmlm?=
 =?utf-8?B?QnhoaEFrN1NpdFZweUtTdENNMm1DTnJTaGRYMFZDSndraDVaUXBHRTVqRGNw?=
 =?utf-8?B?UDlhRWplL1NhWWdETkwvcnlPK09mYnRFOC9kbU1oTUtqdlR6YzRidm5ORXQx?=
 =?utf-8?B?bE9ubytxbkFRajJzcnBzZ0JRWE5VUjRaSGtFUDJKdzhhT2VxMHRGTm1pTVpw?=
 =?utf-8?B?QnBQOGxuc2tzWXZRUGNkZks5WFJlTGpZK01vWTNSQU5mczZkQ0IrYVlaeFJl?=
 =?utf-8?B?akQzWGlkaFJPN1ZzVWNqejRBakZTeUNYUjkzOVhIU25lWHhGbVQ4ZUJaSWxD?=
 =?utf-8?B?MzdNQWRjWVNzLzZnZ1dGbDZLTW1qS3ZqUWJKMVZudVhqUkY5Yytad2VuUXhU?=
 =?utf-8?B?WG9zQm5Pb1lQaTlHZjFKaEREQ2pWTWhDZk1qRFZIVjJpTS9yL2NRT1R2ZCt3?=
 =?utf-8?B?L1BzTi9QVHl3UlVJZkNrQmV2NGQ0dlZPWm1HRjdkNitLNjh5RjlDeUk4c25Q?=
 =?utf-8?B?Z01yVmFvV2JPMGYwWDQ4NEV6RUJFSlJrdGZIRTJ3QVJlQklvbTR3dlkyRDZn?=
 =?utf-8?B?WmVtUHZ0QjdMSFlscEExTW5aN1ZTOVhSdmdKNUhXWFhuOEd4RmEyQXpOSkwr?=
 =?utf-8?B?RFdlTHUrRjE0VUc4MlBjaGRLUThsenQ4amdHaFpIak1Cek5BZC81TGZDbHc4?=
 =?utf-8?Q?QS+L7GL7P95X2uazll9JGjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFmT0FqMzlSMWpoU1VxVmhzM0JSakVyS0k1QWd4OHVPNmEwaEczRzcxOEZq?=
 =?utf-8?B?Vi9jWXBZWUJ6NzJXV0FYMnA5bHVxSFBvMHcwSzZWNjlrc3NTenZTR1FoUDhq?=
 =?utf-8?B?S3M3S0EwVlZWSnlETDRwRXZSN00zdUZuUFhXOVhJZEtyQjJWZzN1Szhhc0Vh?=
 =?utf-8?B?Vlc4TFRlaWpLQ2hmbjNqUFkrNnFhSnRQUm1IZGdSTGJqeWNQRHhoQXVuMUpU?=
 =?utf-8?B?YWk1eVJtQWIzdGYvRlBUc3ovSVpvVTMwTEIwWm81Y1M1UG42TXZjMlN6MXZw?=
 =?utf-8?B?L29QanZLZUJhMWxwbVlPQmp6dUZxeCs3SWNiOVJVZTlPUXpBVmJjTndKVXdX?=
 =?utf-8?B?aVdPL3RVanJYNmkwZ1pqQnhQbnQwMEp2UVRKblFpT1g4dXF0NzVvYVZSajVQ?=
 =?utf-8?B?ejlJUmlsMzZ2R3VMdEY3U1RMa0dSa2Nvd1BUbFl6bTBYNzQ5VXdFZzRVS25k?=
 =?utf-8?B?bWovLysxaWJVZG5qaE5xN3RLbm1HT3J2VmpQMEwzbVRPbncvcm9GMVVRYjZw?=
 =?utf-8?B?ZUErUHVIVUJ2TThsaUc1TVh0OHowYmJ5bzNBR0xZY3RBUE9QUytXNDdoeVFm?=
 =?utf-8?B?MUIxMnArME92K1NsdUkzVkxzVWJRWFJtMW1RTWFXbGhMSkZzcmpKaDNDbWZR?=
 =?utf-8?B?RWx6UEhNaERQb1hSV2ZYZHo1RkFwMGhjNDFpenlud085S2xLOXB6d3ZNamlu?=
 =?utf-8?B?bWJTS2ZKaHJ2L0F1N3JENGExUlY0WWtOZzQ3WGVEN3F4NkR0RktrZE42Wk9H?=
 =?utf-8?B?MEJmbFhTSmE0N0lxa1VnQmY4VzNCT3hMUWQ0eVo2YngwQWRYZENXTVdNRGoy?=
 =?utf-8?B?Z3JHeDJWb28wUkhqUkViZ0FGTDgvUGFKQ0RqVGhnREZBSVpIYUtLQjZEeGo5?=
 =?utf-8?B?MmhMVnp6a0ppa0llZk9WSkJ2dXptak9rVDlKZm5xL3JtcHI5NmtiM1hOYU93?=
 =?utf-8?B?dlhhaVlKUVk3L3lMRExFeHprL2RTTUFkZGFYSStxWTJxVG1VRU4wbng1STFQ?=
 =?utf-8?B?Wi9XUzY0MGdwMDMzVWdtUyt0aGJiK1lOdWk3ZC8xZFArMWlZNkdsVEQzR1JO?=
 =?utf-8?B?ajdVS0J5RnlJcGRkeDF0ZmIzTzdwRFZtWHJ5UmpRVTVTcTVtRTRabkV0MEdN?=
 =?utf-8?B?RGNuVXlXQS9tbU9LWFZRYi9JbDYwZ292UGZwSWVTNnh4NlhsVHMrUit4ZEI2?=
 =?utf-8?B?VTJOTUo5RDl1ZXVyWWJaZkVNRHRiWHc2cnV6UEJ4dW8rQnlNZHJRM3dIVEVm?=
 =?utf-8?B?UGJwQlVFYUdMWENNc0NLYVZ1VWlidGZQVFhoNkFNbWlWOEFvdkd1NVJLajNY?=
 =?utf-8?B?aW96OU15REt0WDNudWtvSHRlSTZFaThqKzhVd0lwRnRkaFV5MVBPYjJHSUps?=
 =?utf-8?B?MkJ5b2dXVFh4MkwyaFozY0JvdklINEp5Qm5rV3ZxRFVyMTVxOVY0a0dsZE03?=
 =?utf-8?B?Y1VoNnNHdnd1SFY4YmMyTVRMRmhsZEYrUWc3WCswaklLZVlHWFo4TUN6dDkz?=
 =?utf-8?B?ZWVRSXNkSWxmM2xEMkJaYXJ1UnlvSUZTT05TMlYwTndzRHE0Nlk3TkRGcUxk?=
 =?utf-8?B?VStleUpxRXhTUjZlUkpZTVlncFBWaFlrazJncXY4UlJLUG0zS05yUUxjcWVV?=
 =?utf-8?B?TUUxMXA2ZmdBNGM2SnNiUmVqZUdHTUxTdGtNSU5qY0lFaC9OSStYdlBwZDg4?=
 =?utf-8?B?SUtOWjYyRmhQc09INkI4UmpFZzlYUGxYVFFNR0xUaFNTMmpFbXA0NzJDeTlV?=
 =?utf-8?B?RXVFZFhHZklqWEE4aUlFK0I1blk2cFdQTkQ4NE51UVRrUUJPMlQwenphK0dY?=
 =?utf-8?B?TFprUHhMTmVCK3ZDV0JLUmtEV1JOaWNGb0FLbFFsQWZLNE1tbGFuWTJJU2VB?=
 =?utf-8?B?R0poTlRmVnZkOS9nam1HZ1pNNVRPTkdLL2Voa0FjNkxlbjYyc0JXUEdxL05Q?=
 =?utf-8?B?M1VDbmY1U3lLbDR1dTZJMlZMMVpXSzZHUjdPVlJNcTVUczQ0V0p1SXRxTmU2?=
 =?utf-8?B?dklhRzE0Yk0xeEtqZlY1cVhqR25JTTNqeEFRdkVsR0RBQXgzV2RobTVkRFhX?=
 =?utf-8?B?ZDg4THFSNWIrbVd4NGs3aHVHRlNXSDJGZGZtUEs4SHhkOFg1L3U4cXFoRlBZ?=
 =?utf-8?B?R2pxd1pCYzNNYlIzaUx5cXQyWHBnZVhUM1VQZHF5S011OE5lYk1iOW9nekFB?=
 =?utf-8?B?RXlCN25vVXJCeGlwbjNwWkxpZzkxM05iQk5HWmhnbUpBaTFWMklLYTFDWHNM?=
 =?utf-8?B?S3lDY0FWcUpNa3J1c1B5alNnK3lVKytHZTZ5eXdiUkZJcEozclhrTmVhdG9U?=
 =?utf-8?Q?c/GzYNcECDEsZ+ARdU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba6f6d1-f77a-453c-c220-08de5643095d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:25.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d605v3LcGx9BL/ywTuG7hdlsKkT7WhJsY+SYxAO5FzI5mujGhUQElwlwMuCMLgH3jDdvyOI7yn8lLLP4Qdle+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f2e1854f38a0a83927f19d0f8630a9d0e5f81aa1..4b662fd7753755f513c172ce30105d4447bd96d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -274,6 +274,7 @@ usbphynop1: usbphynop1 {
 		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg1>;
+		wakeup-source;
 	};
 
 	usbphynop2: usbphynop2 {
@@ -284,6 +285,7 @@ usbphynop2: usbphynop2 {
 		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg2>;
+		wakeup-source;
 	};
 
 	soc: soc@0 {

-- 
2.34.1


