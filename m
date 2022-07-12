Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540D8571F3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jul 2022 17:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbiGLPcP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jul 2022 11:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiGLPcO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jul 2022 11:32:14 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73054974AC;
        Tue, 12 Jul 2022 08:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQxdd4IlUEAIRBKV7L/mvW75EbdM/Oo/MzzcHKYKdI85wSi8UldnYg9y96c3h7WN+iWiWwYqCM7a7Lr3xauAdFF3Q376WLpFFTnRNDkZogRXfjzXFhhKKrHQLymtaCaltDF/QH2viPv2u7oWQblCBhl21r2hLsZhHXj5AMtASNrxQ7tk9S6Lglm/EGB3a6LPutKQ+lG/6ZD5fieHR95uuICPOBDU8AAxRaYG95VBL7r48rPkko2vpl73SRZqdNTILNTlK9oGxsR+prsxq6MZrtdt1Jqe+Vg0ZuGsVNKt+yruRhITISS3QF9so4R+SWmq9L6FfmhOawuQh8HTqB2Y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPyhs6uZUMmpXIsYj9iey2CVNa4Wy4jYFYo0uNzYHdc=;
 b=CG36z/LdBrhlA0qw5M2g213eOxDDd+tTZ6Yif7WOilmXCry7H+cZWauxU7JU5A8c0y6PrKcuJZ17nDr4FuliAPKdwfqOOf5fKaRnvsConewc13SXjX4f/836Q8NjBuKWKvrjTb96DHz35iylV605pwBWQROjF48q2bKJ5PeAwLb9yIjFASr8hcV9/k/+bP+FhW/imKb4Ldqwh+mCLjShLa5PYWvzwZyRrzrRGdKwALwmw0NnJT/rmCWeN43wL8tu/bCna2PzlPOuQ5J8Ep+u0HzsQjew4WRQxS3isuC73Ek19dV7JKe5vKGGsW+v2R6SwOD5KmqUzRXCoztRz7eUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPyhs6uZUMmpXIsYj9iey2CVNa4Wy4jYFYo0uNzYHdc=;
 b=n+ILLFYG4R3VjOAShCotLruHjTG2ekRt/GNUata4Lw05JaOO+dWhQ2fG1LslO3cs4wA2RxMwp+lv+JzgjP4WpctmZPm/nH7X+UmmegFaccu/5Uhea4Zhmit7aMGXYR58hM8bho2s4jdiAfBKHR0HSMKB3W9csK1Xz0SPEi85wQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM4PR1001MB1218.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 15:32:09 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:32:09 +0000
Message-ID: <f02a41c3-a31d-b669-c4c5-3ea161a00924@kontron.de>
Date:   Tue, 12 Jul 2022 17:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against
 schema
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d10ab6c-eb51-4102-0a36-08da641baf3d
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2DAeSjzyMbMN1hLSwwV4IMwjZ59vxSc0x94eLd2CR4g1mZ+eyFg46kvVyl1g6Ii+X8phXnmTOVwUQ2MCIVUq7PFQEX2q2wqyxNbzwOHIWVqDsOkSxR2tSudh9LiRVAS+TSu7NtNxgP38cZ9t/vDKR7yXknebLVP3f0df68Z58mTx/sDKTWLiIsBrH/eEWigwgZrC0zW2gMC0wUhX+XGWICMHprKHlrZ6tENDxe2Q8YM6oiJo7+HNQL+ZhFumy1TtXwiQDvJa4NpCL3eASXxlVmGX1/mjQEAfdDHGnDM2jJYcujPgrwKM050JtHaM+0b6DDgFW964MWQEg8Mfn82oU6C+S6+OF147bZRF3peepqod84elf3TmgF1fl73tTzpmgBxUACGB+sJ5X3tjJPI2KUaF1YtESnZ8+UoJm84S6tAxpxAh/b/ch6/Cjd4Lfdrs2Kb5MPgrK3taJIEjOoNqimH+IZ+ktvVZu0LnBz2jtwNL745BLumf6LFGUNBIY1/UO98yQ+SDYHSLzw7ll1Tveh+KobzzJ3UQIDXx5e5r+e7Ca3AHsne+nX/ETQA7mNjOaJe2riNS+F8PASe/Vrv6OGdus9rQ1tznGxvsf19PwbYGhJzvlvQBOCDvPZWGHp+Ii7e3rfw8Yfen0QscpWmzeKBXvRzHDuxHNMFRog6YeQyFISXnRhek8Ev3LdqC3cb142R4yL53qbkXCP6Mlll14w5fyE0UjCkw8N+OwaGhGCZ+f8ij6znE6W9IJag+F+S2O0m+DH9MM0UZJe/jZo0dkG72D7vp24kKlpEkdory7jX/eizwfAKovYlRKsb/d+eqhe3lgEGaJ+DRmwRcriwHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(2906002)(66946007)(478600001)(6486002)(83380400001)(186003)(36756003)(110136005)(44832011)(31686004)(38100700002)(31696002)(4326008)(8676002)(66556008)(8936002)(7416002)(5660300002)(66476007)(54906003)(6512007)(316002)(2616005)(86362001)(41300700001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm4yajVRdGRzOGVqVENRRmtKRDlJckZBRnd3NXU2VmMxZU9SRzdzckJmRk1o?=
 =?utf-8?B?dXgxcDU4MGRGT0JGejFYRkVGRTVNeG5kYlFKYWprVTkyUjN4TVNDbnNkb1E0?=
 =?utf-8?B?OHY5emRvbU1jam51OEV6NHhHZmJmZDF4MTM4SUdWTzUvQnJjVGtmc1hSQjVh?=
 =?utf-8?B?VUZsRE5BWTNSNHZDM2ljTEQ4ZzgrZU1RVGdhenZTMXQvMDFjMFFGM3JqZnor?=
 =?utf-8?B?eHFDTC9INnY0aTJlSThnMHpBMW1YQlhZWHUxVTkvYWptYVJ2a1dsZmZzV0Yr?=
 =?utf-8?B?K1gxZU03YXFkRDBSMDFhb0ZkTlVGZlhPb1VabmcwWGxORXM1OUMzanVQR3FH?=
 =?utf-8?B?aGN1YTJ6SkVtVlZUSVdrdkFEWFQ0cm1sdGlFZE40MCsrUytWaktkTHJCdm1S?=
 =?utf-8?B?a2QydXZ5N2htTkJvUTdZNUdCTVU0b2tpcVAvQWpnQ0MwdnRqZGpBT1VEQ1E1?=
 =?utf-8?B?QjhLUURpWXpyamtiNGR0QUNVZjZOOWgxaFI5YTZjb2JheVZoVFN0NXNOL2hz?=
 =?utf-8?B?SlpnRXpUS2Y3SFFNQVRBak5tZ3ZCbGdvanlwckNRcjFMbXExbkxjYlhLOWQ5?=
 =?utf-8?B?TTUxNGpudEx0MGtKOFlEWEUzMlA3RnJybkFsSVpTL1F3aitVY1NEa1JwN0py?=
 =?utf-8?B?SXN5eHJ4TWE5RHd6Z2ZtUkNMWVpXOHQrUE4xK29BNTVYeVNNenVaMndlTlRv?=
 =?utf-8?B?N0ZOcjYva3NGQlpXUlViOWJab0JheEI3eEdIR2Y1V0lJajZRMDIwZjNGbm1O?=
 =?utf-8?B?S1phcWIxckpoaXkwVStNWGlxcmt6S09HM1Qwc3graTEwRjZzdjhySVNhNGg2?=
 =?utf-8?B?SVlSU0ZqdGNXNlNhUXJMV3hEVVdJQU1ldllrWkFlTU5SYXFkTldSTkg2aFFQ?=
 =?utf-8?B?N2tzT0N2Vy8zVWRpUEVoa3lnUDBrTnlVYXB0c3F3TWVPRlluSnZzUmxwUnRR?=
 =?utf-8?B?QmowTFQrT01YUVFNMzdNVFlPU0QyVGpUMzlVbGtqT0ZFcnYzUk9CaHozaW1X?=
 =?utf-8?B?YktNcGx1M3V6WWtkQ21PY2k0ek1aUU5laUpaRVZ6V09QbFJMZ2FDYzNHQ25X?=
 =?utf-8?B?TytnVVcvQVBOYTVKK3lCMnNQMzQwVUFmYmVON04yZlJsUEdqckFJKytNMFZ5?=
 =?utf-8?B?MjVDTWNESVlDUlhqMzFDOGlLazZZSWJudWs4Um9JRDVhVTRDUk1KZFBFL3Bs?=
 =?utf-8?B?amUvVlY5VTkyb0I0Rk0vQVh3L0pCdnhZRjhkUDB2SC9IUmhEMC9EdEFMdjg1?=
 =?utf-8?B?eTU1R3Z4SEJ0UjRzblRVaGdkRnRXRTAyVmt3L20xT053dTJoallHRHRmYVla?=
 =?utf-8?B?blM0TVYwK1VZdUIrcjVtM3ZOd3JJSnhab2tnZmZPS3dpYmFsdkhtZmpWNjZJ?=
 =?utf-8?B?QmpjczN2UzdRVjd1TFIyK1hrN0RUbW1oMlgvL0VVSlFMM2dMcmxpcWN5aktT?=
 =?utf-8?B?MEluL0J2bDZPOUlPZGNQTzZGcWVTQnZSSS9iZUZCTTJyTWVZL243c3R0YkpZ?=
 =?utf-8?B?eXNzYVlsRXpFVmFvdXRJNFNtWGNzVVlValNDNjhKdklHWkN5LzlVRFUvT1FI?=
 =?utf-8?B?Tis0L2l3YlpSd2FldUt3MEpKOTNLTHdQcklpaGZQQzhqOUg4cHJ2ckNxblZl?=
 =?utf-8?B?RmlUTVVuS2phYTFvSms5M0ZZNFQrZEhCTkpmeExFcHJhbWdSb1R4VFdrbHZm?=
 =?utf-8?B?UDJKSDVzaFp4akpPaWRrRUdlM3JLYVQrSDhVZ3dCRFhuN1EvVE9GYXh1Z1Nv?=
 =?utf-8?B?MUhZZmNlMTZpOVdpNzNZVnc4SVBkNnozNWVMTlU5cm84cTNmdVg0RGxVb2dY?=
 =?utf-8?B?YlBQUWM4bk1rNWl2OVNkQW5oZ3BhUGNhRGxUMGtKWW02cmVYV3FjaCtWZjIz?=
 =?utf-8?B?SVRSR1hWeUxxSDBYNmhQeFhPUVpxS0trVFlxTjg2NUY0UzVRVjFmcHlsMS9v?=
 =?utf-8?B?SUtKVTlqQndidUl6V1FlcUxxcmE1eHRQNDhLVGpEdU5jQ3U5dXpzUWtIRjh5?=
 =?utf-8?B?bWttZkFQY0ZuQzFXV2FpVlRiWTV1djJvMERUdkxrQ2I4K3cyY00vc2JMTjBj?=
 =?utf-8?B?K08rMGV2STdNZTJXN1hxNHVXc2JEcEdVc2NIUGFDaG5NZktuT0gxQ3BvT1E4?=
 =?utf-8?B?U1g4ajhHb24zQjBNanBNV3BFcWd1ZDI4T2oveEhlS0liQnN4YkpmSVBrYUNz?=
 =?utf-8?B?WlhLTCtVNGJ6SGdGNTBxWHJQSSttMmMwZEl4QitjTFQwaUlzZXo4S1k3Z1dR?=
 =?utf-8?B?QlZJZnhIZm1YVFBKeStmTzB1NE1RPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d10ab6c-eb51-4102-0a36-08da641baf3d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:32:09.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq1ZpbB6pjaPs2pa7yhjmLYGX8JBFyFm6A/Uvd70JrOGtf6DaooVNVQihjqQ71b5jyJyHpF9x5XZ7y2WyZ4ephe0ituzuzZ3JCqp2rsgdZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1218
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Am 06.07.22 um 13:44 schrieb Dmitry Baryshkov:
> While it is possible to validate all generated dtb files against the
> schema, it typically results in huge pile of warnings. While working on
> a platform it is quite useful to validate just a single file against
> schema.
> 
> Allow specifying CHECK_DTBS=1 on a make command line to enable
> validation while building dtb files. This reuses the infrastructure
> existing for `make dtbs_check`, making dtbs_check a shortcut for
> `make CHECK_DTBS=1 dt_binding_check dtbs`.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This is really useful, thanks! Exactly what I was looking for.

May I suggest to add a line about this new option to
Documentation/devicetree/bindings/writing-schema.rst?

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> 
> Changes since v1:
> - Added dependency to rebuild schema if `make dtbs` was used.
> 
> ---
>  Makefile | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9aa7de1ca58f..5a9858aa4934 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1464,14 +1464,18 @@ endif
>  
>  ifneq ($(dtstree),)
>  
> -%.dtb: include/config/kernel.release scripts_dtc
> +ifneq ($(CHECK_DTBS),)
> +DT_TMP_BINDING := dt_binding
> +endif
> +
> +%.dtb: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>  	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>  
> -%.dtbo: include/config/kernel.release scripts_dtc
> +%.dtbo: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>  	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>  
>  PHONY += dtbs dtbs_install dtbs_check
> -dtbs: include/config/kernel.release scripts_dtc
> +dtbs: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>  	$(Q)$(MAKE) $(build)=$(dtstree)
>  
>  ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
> @@ -1498,8 +1502,10 @@ ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
>  export CHECK_DT_BINDING=y
>  endif
>  
> -PHONY += dt_binding_check
> -dt_binding_check: scripts_dtc
> +dt_binding_check: dt_binding
> +
> +PHONY += dt_binding
> +dt_binding: scripts_dtc
>  	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
>  
>  # ---------------------------------------------------------------------------
> @@ -1774,6 +1780,10 @@ help:
>  	@echo  '		3: more obscure warnings, can most likely be ignored'
>  	@echo  '		e: warnings are being treated as errors'
>  	@echo  '		Multiple levels can be combined with W=12 or W=123'
> +	@$(if $(dtstree), \
> +		echo '  make CHECK_DTBS=1 [targets] Check all generated dtb files against schema'; \
> +		echo '         This can be applied both to "dtbs" and to individual "foo.dtb" targets' ; \
> +		)
>  	@echo  ''
>  	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
>  	@echo  'For further info see the ./README file'
> 
