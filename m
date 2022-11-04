Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C596192F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Nov 2022 09:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiKDIqd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Nov 2022 04:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKDIqc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2022 04:46:32 -0400
X-Greylist: delayed 313 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Nov 2022 01:46:31 PDT
Received: from mail.zoneproject.pl (mail.zoneproject.pl [151.236.28.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97088DFA3
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Nov 2022 01:46:31 -0700 (PDT)
Received: by mail.zoneproject.pl (Postfix, from userid 1001)
        id 2921021170; Fri,  4 Nov 2022 09:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zoneproject.pl;
        s=mail; t=1667551276;
        bh=+fG4vYlqG+yATJtf9z9OyBKAvvR3Bi1gb9tETg1imwI=;
        h=Date:From:To:Subject:From;
        b=H/e2nd0SX3RE/fPgUFUgyUt8PFN/rLBN5M9udykel0WhFrSX/W0qgPfgOU/KgUXWy
         NC3nhw476/+hyzxFs32cn9tlGBbHoLmGat64ixBFSIwyCfZzeTpW7iasw2no/ZglEJ
         7dtAuRaoQcD42BbsOKNh9wUf86WmvODWn2XbAc3RiuUmipJCj1FFHYGBwTF8XhiQxU
         y5SMH1cpb9Y7GrrbSnVFeGh0S92tyg4XaTTkW25UxuIxVKiRvrEO15FdwyqMCr8LJg
         oTi+Kr9e78qaqLho2zf9D2ifBnKwSqPupmI169KZ0FM05m6s/tk7P2b+QKth0jytTP
         /0CS6s751/v3Q==
Received: by mail.zoneproject.pl for <linux-kbuild@vger.kernel.org>; Fri,  4 Nov 2022 08:40:55 GMT
Message-ID: <20221104084500-0.1.2m.hq1u.0.1a5lssgyu3@zoneproject.pl>
Date:   Fri,  4 Nov 2022 08:40:55 GMT
From:   "Wiktor Nurek" <wiktor.nurek@zoneproject.pl>
To:     <linux-kbuild@vger.kernel.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.zoneproject.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,
        URIBL_DBL_SPAM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: zoneproject.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [151.236.28.32 listed in zen.spamhaus.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4853]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [151.236.28.32 listed in bl.score.senderscore.com]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: zoneproject.pl]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87 Pa=C5=84stwa o mo=C5=BCliwo=C5=9Bci pozy=
skania nowych zlece=C5=84 ze strony www.

Widzimy zainteresowanie potencjalnych Klient=C3=B3w Pa=C5=84stwa firm=C4=85=
, dlatego ch=C4=99tnie pomo=C5=BCemy Pa=C5=84stwu dotrze=C4=87 z ofert=C4=
=85 do wi=C4=99kszego grona odbiorc=C3=B3w poprzez efektywne metody pozyc=
jonowania strony w Google.

Czy m=C3=B3g=C5=82bym liczy=C4=87 na kontakt zwrotny?

Pozdrawiam
Wiktor Nurek
