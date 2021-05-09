Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58EF37776D
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 May 2021 17:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhEIPwh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 9 May 2021 11:52:37 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:5799
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229679AbhEIPwg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 May 2021 11:52:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBqFgXPZggu1yoGMMolaX5R7vOYdTtro5Cr3F0NnaIPSkZoEjcHkKSxEqGkrS4zl1kybLi2gHa66T7ruSCB6POcmUoNC11+rJctXqWyhIU0qrVjFULyaK5MfJjuGbewqFP/t676jJNh17cavOOOJdaOT3sfacxACORvWp6rTvdJaN1GdAcmkVPJ59gdoBcYy5YlDYC9i8DDQVEVhowKBlmy4afsx83/mL7TDypDbbfpI2k47Ti0sZARXO7aPYOuYTUNPTsc4s5dBZl2JX07rImv/WkvvhwL444dcmFueTNvGAonN9HzulRKr6zlVuBG7Fby5nNkoEdyHPd10Uk5wIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWedC1kmoQKO75u4ch3N5wlWd2r120/k2AbuiO1VeWc=;
 b=UxXi83JovyyVPQWe6art0sm/Z4u3+4lm9vaxaMYo8gY1Bi/aR0FZuSBUpoc+t5pVulvisTCAXnccv1whLvWJNnTMqgaS5F2acpkGBo4NAoPBZ0NxRlOKVmTmkqHT0Y9zhx4iTxkkm1/hj0H7RpKOSi0OrBTdcSIa+aDkGqvpeg64U4LR8F4IQHqhwWvHTQeYr/YcxNtmFfhQcov8bnKvrS2eBimYF1OAfha3KJeSsliNQFIHAr6XjjtL/tnZ964LBayKHyvJ24FEJMyEvH5LWirY9Z7hXf28mYBN2uXkRV/gEyqyPXgky2rVI90pQcT333sUY8jrdfMdRrTczBCIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=t2data.com; dmarc=pass action=none header.from=t2data.com;
 dkim=pass header.d=t2data.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=t2datacom.onmicrosoft.com; s=selector1-t2datacom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWedC1kmoQKO75u4ch3N5wlWd2r120/k2AbuiO1VeWc=;
 b=PpTs2PerOxbCdCrJKN5SjmNyzzWUEcd6L8KnH287JteYQPskkfbmIa3wjnvypfTJiEXtRbfYIu17KN99OxnKNqW1YBcdovWu8WHUSJ8Qgp0fbD0EPymfY1DsW3tJxwltScvPteC/VRaygE6vjQeso1AUvywXZgtqricyvyoU6Gw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=t2data.com;
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com (2603:10a6:3:da::10)
 by HE1PR0601MB2073.eurprd06.prod.outlook.com (2603:10a6:3:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Sun, 9 May
 2021 15:51:31 +0000
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e]) by HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e%8]) with mapi id 15.20.4108.031; Sun, 9 May 2021
 15:51:31 +0000
From:   Christian Melki <christian.melki@t2data.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christian Melki <christian.melki@t2data.com>
Subject: [PATCH kconfig] Add annotation symbol to configuration handling.
Date:   Sun,  9 May 2021 17:51:38 +0200
Message-Id: <20210509155138.24670-1-christian.melki@t2data.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [81.234.39.46]
X-ClientProxiedBy: HE1PR05CA0139.eurprd05.prod.outlook.com
 (2603:10a6:7:28::26) To HE1PR0602MB2858.eurprd06.prod.outlook.com
 (2603:10a6:3:da::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from voodoomaster.example.org (81.234.39.46) by HE1PR05CA0139.eurprd05.prod.outlook.com (2603:10a6:7:28::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Sun, 9 May 2021 15:51:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d208617b-5238-486f-9059-08d913025091
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2073:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0601MB207363113EFDABF8476B3855DA559@HE1PR0601MB2073.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpYnIrhDf69JTcc6ijkraYd+0rhsbRcMLNFoQj97/kOIffXwgwyrprbG0MNg5Gq9x6PvFItiIFrVtM/xIP67yJ62YzIQykHf78qgKQjapGGaJRZC2/6dXdd2XIfqjW2ZF9pw7Iw5pgHawBGMEQ4kzHAIm49U/3EFjoLfcvm6sSTTlbwkpMhNea4wf3Mj7Bp6xbpcqzBf926JDWoMQ+ZpCbIknrJ8qyB/m1XuqRBDh8yOhAFDk/9AvXrScr/hc6luFv01HWldmGLD2uqgefjBdnlc/sk3NABrPIMYgJIiZ3nOTK8Q5mZ1lMsxS86HbeaPrQood6Zf0bKYwdSZrOexFfWiRCQGRu9XUMtE41hNYdvQaQMgGDnXHyvA8PG4JwVlQ0B1DbIDgPaMGBk5+lUphrqJxIBywNWsqygBSDfjJbS7JGe0EQiWtuThJrLlFTe89dwfD1i4cIRe8Gg5uf9mukcjhOzfrfTi1W/aBF2ho6hFl21WePP9g95xm1gg2ZDqS7vb6tYmw/7pdWyPd/IwqK6kDKM1dmKOZ50NDKF8pq2ZLfGRkdUcmX1leT7ATSLbIMbsNJtQlehKU9bXm1RO0gWf9Bzo9N5qFwPwpCiK5AlJczaPsf8zH0Gsi4tJj4u5tiCv+G53TSlxiGN4TuIqMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB2858.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39830400003)(376002)(366004)(396003)(42606007)(66946007)(5660300002)(8936002)(16526019)(186003)(2906002)(52116002)(66556008)(66476007)(107886003)(6506007)(4326008)(6916009)(44832011)(478600001)(8676002)(6486002)(86362001)(36756003)(316002)(83380400001)(38100700002)(26005)(1076003)(2616005)(6512007)(956004)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I2WnSAOhiUvk+B9PZvcUUmJspVveP2ls5O/f25KYz0t2hu2glPFN4sLqkx3B?=
 =?us-ascii?Q?6lDxiGUUuM0NA0pwH+UbiMjdXnv0A0DtKUu9kNtWaWRSz1oxp3HHME5YHUhj?=
 =?us-ascii?Q?lKiyVrkW5iCyiHio6FFqrsEwd6f60Y2Wgzy20NZ2XL+gyzDNVJysYD4A4Mqc?=
 =?us-ascii?Q?Xx0PfS5MfypDu9VUcPAZ4lC4mFOrQ/zo2j7dY5iYrmHZLXWySE8kdxCRm4dE?=
 =?us-ascii?Q?7pf5T54/C5Z8Zh9/oTPIvbSchO9t8GaLdKEGl52xcqv9aTmpvJcjxhJ5d22k?=
 =?us-ascii?Q?CRbuVNbD1mJTc91zKa3PvKxfbUcaWV+gJXPgrDs8M0kDhosC7qjvNxO3dHc9?=
 =?us-ascii?Q?ZjV7tihHQbFMEAw390+iuSHBG7x9ruZZfodOGJHzaaM6BZ3bAJYdR8NgwUrZ?=
 =?us-ascii?Q?VL2p2cW5w4Aw/8Zqh5DtK36lb9O9/CkzRua6C/jkDkGyHYb/0dao1rZf4Ody?=
 =?us-ascii?Q?h+/hh9w4v50o4X94SHmfcOzPphemcvFwFUjFP2fw8QpXbvh6gKwL9xT3q1v/?=
 =?us-ascii?Q?63z4OChaq68pqDldisqpq4I/hLtYfZgp1lIZSaW0wr4kiUzyFHzczehVLp0U?=
 =?us-ascii?Q?Wmx7+eSYB3YwhaR8W1YQGYHyp7+pRZv/dOYdvd/YUj0o112bFdZsgco10KiD?=
 =?us-ascii?Q?IAEKlsjqv2m9InAmH1H5Nu2tMNIZPTLC/k5W67G8fqdqiAZxbx8Kz3eagt1T?=
 =?us-ascii?Q?9tksvNmRv//1iJyJE2WciR/mabeMu8K/RKiJvAbOxGu23wJ+A4iLQzIFokqO?=
 =?us-ascii?Q?wA3x5ExLdms643FMsqP2CLaTWI7Ec2iv5CCUqCCuVpRsVL/2BsfqOOny9pfq?=
 =?us-ascii?Q?xWmThB6lTh9iVxZlIUW1zvNc+hjLjcS+oRbjW8Ch5sJYCUbTq8Tsgh7qYoXL?=
 =?us-ascii?Q?NWdVGiUZc0sRMrhVf8VlzmpkIoWbFVwP7ewTouInPaalYnR1nSW7kJtQp/EQ?=
 =?us-ascii?Q?+0L5bAt2UFOKJcLyueZyVU6BLRKLMhklLq1EOsbCRPfKt7NDy7I0PMleGK27?=
 =?us-ascii?Q?DiopsXx/Y037u0ILXGcbF7xJ/nzZKVW+fBzStnPYSKjO2hgZG03e41lEQRJe?=
 =?us-ascii?Q?seEfZ+A5HHGRIDyro6HMRizC3fYhYkDRErc3oBbcH8v3HSudjoibT90aZjBv?=
 =?us-ascii?Q?VygtgHgx/ua5NLy+R9Q47Ci0P+ROzYJH4M/q2IEmpccmNCzZU1PSLXQQN7Ha?=
 =?us-ascii?Q?G535ndBzIZCNxmtJOeQYSd2YSejy2j2NHh4262fmGkaxBtqyl4EXrgtrPv82?=
 =?us-ascii?Q?aLu+AQq4luFEXMl2fJthVOTs6jxJIfjZSRDEn8dpyEtUhBvE6gPJrSutu+3e?=
 =?us-ascii?Q?nWz00YpqTKvBKV7lLfEV7FOP?=
X-OriginatorOrg: t2data.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d208617b-5238-486f-9059-08d913025091
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB2858.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2021 15:51:31.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 27928da5-aacd-4ba1-9566-c748a6863e6c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFhear93kzp4jSstDcxVH0Qx+op/+eGKGgLwYmkKpeR0GJFgdza6ZGkbL4qucdomfBWyoMZ6kB89IBBqpDWeoMvVlA+40vWKRwiNPSinahM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2073
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While maintaining various projects and kernels, I've often found myself
thinking "Why is this selected / configured?".

Sometimes I'll find information in a disjunct documentation system or in
the head of somebody else. But most of the time that piece of
information is just lost. Configurations get moved from various
repositories, so that type of disconnected information also gets trashed.

It would be nice if the configuration supported some form of simple
annotation to variable mechanism. Ie, part of the actual config
(only during read / write) and not just a whashed-away comment.

$ grep ANNOTATE_ .config
ANNOTATE_CONFIG_TRANSPARENT_HUGEPAGE_MADVISE="Always was causing issues."
ANNOTATE_CONFIG_HID_SENSOR_HUB="Plus IIO for the Realsense camera support."
ANNOTATE_CONFIG_HID_SENSOR_ACCEL_3D="Used by Intel Realsense camera."
ANNOTATE_CONFIG_HID_SENSOR_GYRO_3D="Used by Intel Realsense camera."

Signed-off-by: Christian Melki <christian.melki@t2data.com>
---
 scripts/kconfig/confdata.c | 38 ++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.h     |  9 +++++++++
 scripts/kconfig/lkc.h      | 13 ++++++++++++-
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2568dbe16ed6..8fb198f297d7 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -167,6 +167,7 @@ static int conf_touch_dep(const char *name)
 struct conf_printer {
 	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
 	void (*print_comment)(FILE *, const char *, void *);
+	void (*print_annotation)(FILE *, struct symbol *, const char *);
 };
 
 static void conf_warning(const char *fmt, ...)
@@ -478,6 +479,30 @@ int conf_read_simple(const char *name, int def)
 			}
 			if (conf_set_sym_val(sym, def, def_flags, p))
 				continue;
+		} else if (!memcmp(line, ANNOTATE_, strlen(ANNOTATE_))) {
+			p = strchr(line + strlen(ANNOTATE_) + strlen(CONFIG_), '=');
+			if (!p)
+				continue;
+			*p++ = 0;
+			p2 = strchr(p, '\n');
+			if (p2) {
+				*p2-- = 0;
+				if (*p2 == '\r')
+					*p2 = 0;
+			}
+			sym = sym_find(line + strlen(ANNOTATE_));
+			if (!sym)
+				continue;
+			if (*p++ != '"')
+				continue;
+			for (p2 = p; (p2 = strpbrk(p2, "\"\\")); p2++) {
+				if (*p2 == '"') {
+					*p2 = 0;
+					break;
+				}
+				memmove(p2, p2 + 1, strlen(p2));
+			}
+			sym->annotation.val = xstrdup(p);
 		} else {
 			if (line[0] != '\r' && line[0] != '\n')
 				conf_warning("unexpected data: %.*s",
@@ -631,10 +656,17 @@ kconfig_print_comment(FILE *fp, const char *value, void *arg)
 	}
 }
 
+static void
+kconfig_print_annotation(FILE *fp, struct symbol *sym, const char *value)
+{
+	fprintf(fp, "%s%s=%s\n", ANNOTATE_, sym->name, value);
+}
+
 static struct conf_printer kconfig_printer_cb =
 {
 	.print_symbol = kconfig_print_symbol,
 	.print_comment = kconfig_print_comment,
+	.print_annotation = kconfig_print_annotation,
 };
 
 /*
@@ -729,6 +761,12 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 		str = sym_get_string_value(sym);
 		printer->print_symbol(fp, sym, str, printer_arg);
 	}
+
+	if (sym->annotation.val) {
+		str = sym_escape_string_value(sym->annotation.val);
+		printer->print_annotation(fp, sym, str);
+		free((void *)str);
+	}
 }
 
 static void
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 5c3443692f34..29e1419b51ef 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -74,6 +74,10 @@ enum {
 	S_DEF_COUNT
 };
 
+struct symbol_annotation {
+	char *val;
+};
+
 /*
  * Represents a configuration symbol.
  *
@@ -103,6 +107,11 @@ struct symbol {
 	 */
 	struct symbol_value def[S_DEF_COUNT];
 
+	/*
+	 * Annotation string for symbol.
+	 */
+	struct symbol_annotation annotation;
+
 	/*
 	 * An upper bound on the tristate value the user can set for the symbol
 	 * if it is a boolean or tristate. Calculated from prompt dependencies,
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bee2413bda63..8caf2fd04be5 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -27,12 +27,23 @@ extern "C" {
 #ifndef CONFIG_
 #define CONFIG_ "CONFIG_"
 #endif
+#ifndef ANNOTATE_
+#define ANNOTATE_ "ANNOTATE_CONFIG_"
+#endif
+
 static inline const char *CONFIG_prefix(void)
 {
-	return getenv( "CONFIG_" ) ?: CONFIG_;
+	return getenv("CONFIG_") ?: CONFIG_;
 }
 #undef CONFIG_
+
 #define CONFIG_ CONFIG_prefix()
+static inline const char *ANNOTATE_prefix(void)
+{
+	return getenv("ANNOTATE_") ?: ANNOTATE_;
+}
+#undef ANNOTATE_
+#define ANNOTATE_ ANNOTATE_prefix()
 
 enum conf_def_mode {
 	def_default,
-- 
2.31.1

