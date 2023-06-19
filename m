Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB69473500A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jun 2023 11:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjFSJ2y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jun 2023 05:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjFSJ2n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jun 2023 05:28:43 -0400
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0D03595;
        Mon, 19 Jun 2023 02:27:39 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 9030A5202D7;
        Mon, 19 Jun 2023 11:27:26 +0200 (CEST)
Received: from lxhi-065 (10.72.94.24) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.23; Mon, 19 Jun
 2023 11:27:26 +0200
Date:   Mon, 19 Jun 2023 11:27:21 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-kbuild@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <Matthias.Thomae@de.bosch.com>, <yyankovskyi@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make
 dt_binding_check'
Message-ID: <20230619092721.GA20014@lxhi-065>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-2-masahiroy@kernel.org>
 <20230616194505.GA27753@lxhi-065>
 <CAK7LNAR8G1PxsdUi6dnbrDcbCKixkARgbHm94xskgNgWJ7aMTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNAR8G1PxsdUi6dnbrDcbCKixkARgbHm94xskgNgWJ7aMTQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.72.94.24]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Yamada-san,

On Sun, Jun 18, 2023 at 03:09:56AM +0900, Masahiro Yamada wrote:

[snip]

> I sumitted a patch
> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.kernel.org_project_linux-2Dkbuild_patch_20230617153025.1653851-2D1-2Dmasahiroy-40kernel.org_&d=DwIFaQ&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=SAhjP5GOmrADp1v_EE5jWoSuMlYCIt9gKduw-DCBPLs&m=_gWZwnUVw05obX2g0v2G-rIQlozQoBMXSi-pktMqVpo&s=L4Kw5qaiY1cU27bKrjQce8uJhLXdeiQ96IyX7l6Ki3o&e=

Thank you very much. Provided my comments in the new thread.

-- 
Best regards,
Eugeniu Rosca
