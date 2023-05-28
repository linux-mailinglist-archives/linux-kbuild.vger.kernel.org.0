Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E287139B6
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 May 2023 15:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjE1Nua convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sun, 28 May 2023 09:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjE1Nu3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 May 2023 09:50:29 -0400
X-Greylist: delayed 66 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 28 May 2023 06:50:24 PDT
Received: from mail.act.buaa.edu.cn (unknown [219.239.227.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E74B6
        for <linux-kbuild@vger.kernel.org>; Sun, 28 May 2023 06:50:24 -0700 (PDT)
Received: from mail.lab.act.buaa.edu.cn ([fe80::223:7dff:fe59:c9ba]) by
 mail.lab.act.buaa.edu.cn ([fe80::223:7dff:fe59:c9ba%5]) with mapi; Sun, 28
 May 2023 21:49:11 +0800
From:   "GUO, Siyuan" <guosy@act.buaa.edu.cn>
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Date:   Sun, 28 May 2023 21:49:10 +0800
Subject: A question about the handling of invisible symbols in menuconfig
Thread-Topic: A question about the handling of invisible symbols in
 menuconfig
Thread-Index: AQHZkWst5GbJS9KRCU6mS8BLFrl5XQ==
Message-ID: <44BBBA3C987593479C2971697BF184F20AE8F78DA610@mail.lab.act.buaa.edu.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi

I found that Kconfig handles invisible symbols differently. 

For example, in oldconfig program, when a configuration item is invisible, it will force the assignment of newval, 
but in the menuconfig program’s load config, it will not handle it. 

Why is this?
