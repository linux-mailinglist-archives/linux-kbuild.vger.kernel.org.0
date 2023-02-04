Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8506968ABA5
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 18:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjBDRac (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 12:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjBDRab (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 12:30:31 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F15623317
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Feb 2023 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=FmaB9wGVzKgv4NzbcyWLZghEkZJWFbWTGJ/aQuSwubg=; b=EP8/5r6WhreemW5wKjlg11SOGG
        twLmJZVw9U4pyd1XXvZ4OQCO6gS64umcu2mXWdQcrROs9Pbn5XYAckSkFYrJu3Eq4CID/i/KXO2lb
        ao+lvXCRLhDNTCD2vp+gbVYXJCpI9w0WGTcbhEqYsawNnqhMTUiSvF9PqMH5ZnZtgmI8SqYH0ttK+
        4Sul2QJK3Nkd/6Z+I7wgdta0sWKUsbsRg0NMoR3iGg/VNlzP77042PvTuQuvtrG9g6U9IqEGyAppV
        bb4SbV65DpeMmO9u6VGvF/PJKUlE6g3nJqGTcZvBgIPkUGmoTSKVG/dcov/MwGQMLQBd3KHGCmCLh
        3iAsqcag==;
Received: from [2601:1c2:d00:6a60::9526]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pOMMv-005RSp-Ce; Sat, 04 Feb 2023 17:30:29 +0000
Message-ID: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
Date:   Sat, 4 Feb 2023 09:30:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: PPC64 TOC. warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I'm seeing thousands of these warnings:
(gcc 12.2.0)


./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
    7 | #define __KSYM_TOC. 1
      |         ^~~~~~~~~~

In file included from ../include/asm-generic/export.h:57,
                 from ./arch/powerpc/include/generated/asm/export.h:1,
                 from ../arch/powerpc/kernel/misc.S:17:
./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
    7 | #define __KSYM_TOC. 1
      |         ^~~~~~~~~~


Can anything be done about them?

Thanks.
-- 
~Randy
