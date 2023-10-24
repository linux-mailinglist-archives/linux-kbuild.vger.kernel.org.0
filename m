Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1357D45EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Oct 2023 05:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjJXD2e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Oct 2023 23:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJXD2d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Oct 2023 23:28:33 -0400
X-Greylist: delayed 4817 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Oct 2023 20:28:28 PDT
Received: from a3.inr.ru (b133.inr.ru [185.207.89.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E63798
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Oct 2023 20:28:28 -0700 (PDT)
Received: from al20.localdomain ([172.20.74.5] helo=al20.inr.ru)
        by a3.inr.ru with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <gusev@inr.ru>)
        id 1qv6pe-000rOt-26;
        Tue, 24 Oct 2023 05:04:11 +0300
Received: from localhost ([::1] helo=rcmail.inr.ru)
        by al20.inr.ru with esmtp (Exim 4.92)
        (envelope-from <gusev@inr.ru>)
        id 1qv6mB-00053l-Kl; Tue, 24 Oct 2023 05:04:11 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Oct 2023 03:04:11 +0100
From:   Rowell Hambrick <gusev@inr.ru>
To:     undisclosed-recipients:;
Reply-To: rowellhambrick67@gmail.com
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <44483b3b2ab3a018d441f2ad48a24634@inr.ru>
X-Sender: gusev@inr.ru
X-SA-Exim-Connect-IP: ::1
X-SA-Exim-Mail-From: gusev@inr.ru
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: ****
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,MISSING_SUBJECT,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on al20.inr.ru)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Do you get my last mail
